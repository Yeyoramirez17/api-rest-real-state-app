<?php
namespace App\Service\Impl;

use App\Dto\AdvertisementRequest;
use App\Dto\PropertyRequest;
use App\Entity\Advertisement;
use App\Entity\ImageProperty;
use App\Entity\Property;
use App\Entity\TypeProperty;
use App\Enums\AdvertisementEnum;
use App\Exception\BadRequestException;
use App\Exception\NotFoundException;
use App\Repository\AdvertisementRepository;
use App\Service\IAdvertisementService;
use App\Utils\FileStorage\Upload\Assets\UploadAssetInterface;
use App\Utils\Validators\IValidatorService;
use Cloudinary\Api\ApiResponse;
use Doctrine\DBAL\Exception;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class AdvertisementServiceImpl implements IAdvertisementService
{
    public function __construct(
        private readonly EntityManagerInterface  $entityManager,
        private readonly AdvertisementRepository $repository,
        private readonly UploadAssetInterface    $uploadAsset,
        private readonly IValidatorService       $validatorService,
        private readonly Security                $security
    ) {}

    /**
     * @param string $id
     * @return Advertisement
     */
    public function findByID( $id ): Advertisement
    {
        $announcement = $this->repository->findOneBy(['id' => $id]);

        if( !$announcement ) {
            throw new BadRequestException( message: 'Advertisement with ID \"' . $id . '\" Not Fount.');
        }

        return $announcement;
    }

    /**
     * @param AdvertisementRequest $request
     * @return Advertisement|null
     * @throws Exception
     */
    public function create( $request ) : ?Advertisement
    {
        $this->validatorService->validate( $request )
            ->throwBadRequestException();

        $advertisement = new Advertisement();
        $advertisement = $this->setAttributesAdvertisement( $advertisement, $request );
        $advertisement->setUser( $this->security->getUser() );

        $connexion = $this->entityManager->getConnection();
        $connexion->beginTransaction();

        try {
            $this->entityManager->persist( $advertisement );
            $this->entityManager->flush();
            $connexion->commit();

        } catch ( \Doctrine\DBAL\Exception $ex ) {
            $connexion->rollBack();
            throw new \RuntimeException( $ex->getMessage() );
        }

        return $advertisement;
    }

    /**
     * @param string $id
     * @param AdvertisementRequest $request
     * @return Advertisement
     * @throws Exception
     */
    public function edit( $id,  $request ): Advertisement
    {
        $advertisement = $this->findById( $id );

        if( $advertisement->getUser() !== $this->security->getUser()) {
            throw new AccessDeniedException();
        }

        $advertisement = $this->setAttributesAdvertisement( $advertisement, $request );

        $connexion = $this->entityManager->getConnection();
        $connexion->beginTransaction();

        try {

            $this->entityManager->persist( $advertisement );
            $this->entityManager->flush();
            $connexion->commit();

        } catch ( \Doctrine\DBAL\Exception $ex ) {
            $connexion->rollBack();
            throw new \RuntimeException( $ex->getMessage() );
        }

        return $advertisement;
    }

    /**
     * @param string $id
     * @return void
     * @throws Exception
     */
    public function delete( $id ): void
    {
        $advertisement = $this->findByID($id);

        if( $advertisement->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $connection = $this->entityManager->getConnection();

        try {
            $connection->beginTransaction();

            $this->entityManager->remove( $advertisement );
            $this->entityManager->flush();

            $connection->commit();

        } catch ( \Doctrine\DBAL\Exception $exception ) {
            $connection->rollBack();
        }
    }

    /**
     * Set the ad attributes.
     *
     * @param Advertisement|null $advertisement
     * @param AdvertisementRequest $request
     * @return Advertisement
     */
    public function setAttributesAdvertisement(?Advertisement $advertisement, AdvertisementRequest $request ): Advertisement
    {
        $advertisement->setTitle( $request->getTitle() );
        $advertisement->setDescription( $request->getDescription() );
        $advertisement->setTypeProperty( $this->getTypePropertyById($request->getTypeProperty()) );
        $advertisement->setPrice( $request->getPrice() );
        $advertisement->setTypeAdvertisement( AdvertisementEnum::getAnnouncementFromString( $request->getTypeAnnouncement() ));
        $advertisement->setEmailContact( $request->getEmailContact() );
        $advertisement->setPhoneContact( $request->getPhoneContact() );

        $property = $this->setAttributesProperty( $advertisement->getProperty(), $request->getProperty() );
        $property->setAdvertisement( $advertisement );
        $advertisement->setProperty( $property );

        return $advertisement;
    }

    /**
     * Sets the attributes of the ad property.
     *
     * @param null|Property $property
     * @param PropertyRequest $request
     * @return Property
     */
    public function setAttributesProperty( ?Property $property, PropertyRequest $request ): Property
    {
        if( !$property ) {
            $property = new Property();
        }
        $property->setBathrooms($request->getBathrooms());
        $property->setBedrooms( $request->getBedrooms() );
        $property->setGarage( $request->getGarage() );
        $property->setArea( $request->getArea() );
        $property->setLocation( $request->getLocation() );

        return $property;
    }

    /**
     * Add images to the advertisement property.
     *
     * @param string $id ID Advertisement.
     * @param UploadedFile[] $images
     * @return Advertisement Updated Advertisement.
     * @throws Exception
     */
    public function addImages( string $id, array $images ): Advertisement
    {
        $advertisement = $this->findById( $id );

        if( $advertisement->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $this->uploadedImages( $images, $advertisement->getProperty() );

        $connexion = $this->entityManager->getConnection();
        $connexion->beginTransaction();

        try {

            $this->entityManager->persist( $advertisement );
            $this->entityManager->flush();
            $connexion->commit();

        } catch ( \Doctrine\DBAL\Exception $ex ) {
            $connexion->rollBack();
            throw new \RuntimeException( $ex->getMessage() );
        }

        return $advertisement;
    }

    /**
     * Delete images associated with the property.
     *
     * @param string $id
     * @param string[] $images
     * @return void
     */
    public function removeImages( string $id, array $images ): void
    {
        $advertisement = $this->repository->findOneBy(['id' => $id]);

        if( $advertisement->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $imageRepository = $this->entityManager->getRepository( ImageProperty::class );

        if( count($images) === 0 ) return;

        foreach ($images as $image) {
            $imageProperty = $imageRepository->findOneBy(['publicId' => $image]);

            if( $advertisement->getProperty()->getImages()->contains( $imageProperty )) {
                $advertisement->getProperty()->removeImage($imageProperty);
                $this->uploadAsset->remove( $imageProperty->getPublicId(), 'image');
                $this->entityManager->remove( $imageProperty );
                $this->entityManager->flush();
            }
        }
    }

    /**
     * Set an ad as published.
     *
     * @param string $id
     * @return bool
     */
    public function publishAdvertisement( string $id ): bool
    {
        $advertisement = $this->findByID( $id );
        $advertisement->setIsPublished( !$advertisement->isPublished() );
        $advertisement->setPublishedAt( new \DateTimeImmutable() );

        try {
            $this->entityManager->persist( $advertisement );
            $this->entityManager->flush();
        } catch ( \Exception $ex ) {
            return false;
        }
        return true;
    }

    /**
     * Retrieves the property type, using an ID, and returns an App\Entity\TypeProperty object.
     *
     * @param int $id
     * @return TypeProperty
     */
    private function getTypePropertyById( int $id ): TypeProperty
    {
        $type = $this->repository->findTypePropertyById( $id );

        if( !$type ){
            throw new NotFoundException( message: 'Type Property Not Found ID:' . $id );
        }

        return $type;
    }

    /**
     * Upload images to the File-Storage system.
     *
     * @param UploadedFile[] $images
     * @param Property $property
     * @return Void
     */
    public function uploadedImages( array $images, Property $property ): void
    {
        if( count($images) > 0 ) {
            foreach ($images as $image ) {
                /** @var ApiResponse $response */
                $response = $this->uploadAsset->upload(asset: $image, type: 'image', folder: 'images_properties');

                $imageProperty = new ImageProperty();
                $imageProperty->setPublicId($response->offsetGet('public_id'));
                $imageProperty->setName(sprintf('%s.%s', $response->offsetGet('original_filename'), $response->offsetGet('format')));
                $imageProperty->setImageUrl($response->offsetGet('url'));
                $imageProperty->setSecureUrl($response->offsetGet('secure_url'));

                $property->addImage( $imageProperty );
            }
        }
    }
}
