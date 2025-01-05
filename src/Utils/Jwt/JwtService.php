<?php

namespace App\Utils\Jwt;

use App\Entity\User;
use App\Exception\BadRequestException;
use Doctrine\ORM\EntityManagerInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Encoder\JWTEncoderInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\JWTDecodeFailureException;
use Lexik\Bundle\JWTAuthenticationBundle\Exception\JWTEncodeFailureException;
use Psr\Log\LoggerInterface;

class JwtService
{
    private static JWTEncoderInterface $JWTEncoder;
    private static LoggerInterface $logger;
    private static EntityManagerInterface $entityManager;

    public function __construct(
        JWTEncoderInterface $JWTEncoder,
        LoggerInterface $logger,
        EntityManagerInterface $entityManager
    ) {
        self::$JWTEncoder = $JWTEncoder;
        self::$entityManager = $entityManager;
        self::$logger = $logger;
    }

    public function getUserFromToken( string $token ): ?User
    {
        try {
            $payload = self::$JWTEncoder->decode( $token );
        } catch (JWTDecodeFailureException $exception ) {
            throw new \InvalidArgumentException( $exception->getMessage() );
        }

        $user = self::$entityManager->getRepository( User::class )
            ->findOneBy(['email' => $payload['email']]);

        if( ! $user ) {
            throw new BadRequestException( errors: 'UserRequest not found with email: ' . $payload['email'] );
        }

        return $user;
    }
    public static function generateToken( User $user ): string
    {
        try {
            $token = self::$JWTEncoder->encode([
                'email' => $user->getEmail(),
                'roles' => $user->getRoles()
            ]);
        } catch ( JWTEncodeFailureException $exception ) {
            self::$logger->error( JwtService::class . ' : ', [ 'message' => $exception->getMessage() ]);
            throw new \RuntimeException( $exception->getMessage() );
        }

        return $token;
    }
}