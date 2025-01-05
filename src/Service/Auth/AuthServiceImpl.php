<?php

namespace App\Service\Auth;

use App\Dto\ResponseDto;
use App\Dto\UserRequest;
use App\Entity\Role;
use App\Entity\User;
use App\Exception\BadRequestException;
use App\Exception\NotFoundException;
use App\Mail\EmailServiceInterface;
use App\Repository\UserRepository;
use App\Utils\FileStorage\Upload\Assets\UploadAssetInterface;
use App\Utils\Jwt\JwtService;
use App\Utils\Validators\IValidatorService;
use Cloudinary\Api\ApiResponse;
use Doctrine\DBAL\Exception;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\User\UserInterface;

class AuthServiceImpl implements IAuthService
{
    private const USER_DEFAULT = 'ROLE_USER';

    public function __construct(
        private readonly EntityManagerInterface      $entityManager,
        private readonly UserPasswordHasherInterface $passwordHasher,
        private readonly UserRepository              $userRepository,
        private readonly IValidatorService           $validatorService,
        private readonly Security                    $security,
        private readonly UploadAssetInterface        $assetService,
        private readonly EmailServiceInterface       $emailService,
        private readonly ConfirmAccountInterface     $confirmAccount,
        private readonly JwtService                  $jwtService
    ) {}

    public function register( UserRequest $request ): ResponseDto
    {
        $exists = $this->userRepository->existsUserByEmail( $request->getEmail() );

        if( $exists ) {
            throw new BadRequestException(
                message: sprintf('UserRequest with email %s already exists', $request->getEmail() )
            );
        }

        $this->validatorService->validate( $request )
            ->throwBadRequestException();

        $user = new User();
        $user->setName( $request->getName() );
        $user->setEmail( $request->getEmail() );
        $user->setPassword( $request->getPassword() );

        if ( $request->getPhotoProfile() ) {
            $photo = $this->uploadPhotoProfile( $request->getPhotoProfile() );
            $user->setPhotoProfile( $photo );
        }

        /** @var Role $role */
        $role = $this->entityManager->getRepository( Role::class)
            ->findOneBy(['name' => self::USER_DEFAULT ]);

        if( !$role ) {
            throw new NotFoundException(errors: 'Role Not Found');
        }

        $user->addRole( $role );
        $user->setPassword( $this->passwordHasher->hashPassword( $user, $user->getPassword() ));

        $connection = $this->entityManager->getConnection();

        try {
            $connection->beginTransaction();

            $this->entityManager->persist( $user );
            $this->entityManager->flush();

            $confirm = $this->confirmAccount->createConfirmation( $user );
            $user->setConfirmation( $confirm );

            $this->emailService->sendEmailVerify( $user );

            $connection->commit();
        } catch ( \Exception|TransportExceptionInterface|Exception $ex ) {
            $connection->rollBack();

            return ResponseDto::make()
                ->status(Response::HTTP_INTERNAL_SERVER_ERROR )
                ->message( 'An unspecified internal server error' )
                ->errors( [ $ex->getMessage()] );
        }

        return ResponseDto::make()
            ->status( Response::HTTP_CREATED )
            ->message('Account created successfully. Please check your email to finalize your registration.');
    }

    public function profile(): ?UserInterface
    {
        return $this->security->getUser();
    }

    private function uploadPhotoProfile( UploadedFile $photo ): string
    {
        /** @var ApiResponse $response */
        $response = $this->assetService->upload( asset: $photo, type: 'image', folder: 'photos_users');
        return $response->offsetGet('secure_url');
    }

    public function confirmAccount( string $token ): ResponseDto
    {
        $verify = $this->confirmAccount->verifyAccount( $token );

        if( !$verify ) {
            return ResponseDto::make()
                ->status(Response::HTTP_BAD_REQUEST)
                ->message('You could not perform your verification, try again.');
        }

        return ResponseDto::make([
                'token' => $this->jwtService::generateToken( $verify )
            ])
            ->status(Response::HTTP_OK )
            ->message('Your account is confirmed correctly.');
    }
}