<?php

namespace App\Service\Impl;

use App\Dto\PostRequest;
use App\Entity\ImagePost;
use App\Entity\Post;
use App\Exception\NotFoundException;
use App\Repository\PostRepository;
use App\Service\IPostService;
use App\Utils\FileStorage\Upload\Assets\UploadAssetInterface;
use App\Utils\Paginator;
use App\Utils\Validators\IValidatorService;
use Cloudinary\Api\ApiResponse;
use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class PostServiceImpl implements IPostService
{
    public function __construct(
        private readonly PostRepository         $postRepository,
        private readonly EntityManagerInterface $entityManager,
        private readonly IValidatorService      $validatorService,
        private readonly UploadAssetInterface   $assetService,
        private readonly Security               $security
    ) {}

    /**
     * @inheritDoc
     *
     * @param int $page
     * @param int $limit
     * @param int $offset
     * @return Paginator
     */
    public function findAll( int $page, int $limit, int $offset ): Paginator
    {
        return $this->postRepository->findAllWithPaginate( $page, $limit, $offset );
    }

    /**
     * @inheritDoc
     *
     * @param string $uuid
     * @return Post
     */
    public function findById(string $uuid): Post
    {
        $post = $this->postRepository->findOneBy(['id' => $uuid ]);

        if( !$post ) {
            throw new NotFoundException(sprintf('Post With ID %s Not Found', $uuid));
        }

        return $post;
    }

    /**
     * Save a new Post.
     *
     * @param PostRequest $postRequest
     * @return null|Post
     */
    public function save(PostRequest $postRequest ): ?Post
    {
        $post = new Post();
        $this->setPostAttributes( $post, $postRequest );
        $post->setUser( $this->security->getUser() );

        $this->entityManager->persist( $post );
        $this->entityManager->flush();

        return $post;
    }

    /**
     * @inheritDoc
     */
    public function update( string $uuid, PostRequest $postRequest  ): ?Post
    {
        $post = $this->findById( $uuid );

        if( $post->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $this->setPostAttributes( $post, $postRequest );

        $this->entityManager->persist( $post );
        $this->entityManager->flush();

        return $post;
    }

    /**
     * @inheritDoc
     */
    public function delete( string $uuid ): void
    {
        $post = $this->findById( $uuid );

        if( $post->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        foreach ( $post->getImages() as $image ) {
            $post->removeImage( $image );
            $this->assetService->remove( $image->getPublicId(), 'image');

            $this->entityManager->remove( $image );
            $this->entityManager->flush();
        }

        $this->entityManager->remove( $post );
        $this->entityManager->flush();
    }

    /**
     * @inheritDoc
     */
    public function publishPost( string $uuid ): ?Post
    {
        $post = $this->findById( $uuid );
        $post->setIsPublished( !$post->getIsPublished() );
        $post->setPublishedAt( new \DateTimeImmutable() );

        $this->entityManager->persist($post);
        $this->entityManager->flush();

        return $post;
    }

    /**
     * Remove an image related to the Post.
     *
     * @param string $idPost ID Post.
     * @param string[] $images Image Names.
     * @return bool
     */
    public function removeImages( string $idPost, array $images ): bool
    {
        $post = $this->findById( $idPost );

        if( $post->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException('You are allowed to do this.');
        }
        $imageRepository = $this->entityManager
            ->getRepository( ImagePost::class );

        foreach ( $images as $image )
        {
            $imagePost = $imageRepository->findOneBy(['name' => $image ]);

            if( $imagePost && $post->getImages()->contains( $imagePost) )
            {
                $post->removeImage( $imagePost );
                /** @var ApiResponse $response */
                $response = $this->assetService
                    ->remove( $imagePost->getPublicId(), type: 'image');

                if( $response->offsetGet('result') !== 'ok' ) return false;

                $this->entityManager->remove( $imagePost );
                $this->entityManager->flush();
            }
        }

        return true;
    }

    /**
     * @inheritDoc
     */
    public function addImages( string $idPost, array $images ): ?Post
    {
        if( !count( $images ) > 0 ) return null;

        $post = $this->findById( $idPost );

        if( $post->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $this->validatorService->validate( $images, [
            new Assert\All([
                new Assert\Image(
                    maxSize: '1024k',
                    mimeTypes:['image/jpg', 'image/jpeg', 'image/png']
                )
            ]),
        ])->throwBadRequestException();

        foreach ( $images as $image ) {
            $image = $this->uploadImage( $image );
            $image->setPost( $post );
            $post->addImage( $image );

            $this->validatorService->validate( $post->getImages(), [
                new Assert\Count( max: 10 )
            ])->throwBadRequestException();
        }

        $this->entityManager->persist( $post );
        $this->entityManager->flush();

        return $post;
    }

    /**
     * Set and validate the attributes of the App/Entity/Post, obtained from App/Dto/PostRequest.
     *
     * @param Post $post
     * @param PostRequest $postRequest
     * @return void
     */
    private function setPostAttributes( Post $post, PostRequest $postRequest ): void
    {
        $group = ( !$post->getId() ) ? "create" : "update";

        $this->validatorService->validate( $postRequest, groups: [$group] )
            ->throwBadRequestException();

        $post->setTitle( $postRequest->getTitle() );
        $post->setBody( $postRequest->getBody() );

        if (count($postRequest->getImages()) > 0)
        {
            foreach ($postRequest->getImages() as $file)
            {
                $image = $this->uploadImage($file);
                $post->addImage($image);
            }
        }
    }

    /**
     * Upload Image an Cloudinary.
     *
     * @param UploadedFile $image
     * @return ImagePost
     */
    private function uploadImage( UploadedFile $image ): ImagePost
    {
        /** @var ApiResponse $response */
        $response = $this->assetService->upload( $image, 'image','images' );

        $image = new ImagePost();
        $image->setImageUrl( $response->offsetGet('url') );
        $image->setSecureUrl( $response->offsetGet('secure_url'));
        $image->setName(
            sprintf(
                '%s.%s',
                $response->offsetGet('original_filename'),
                $response->offsetGet('format'),
            )
        );
        $image->setPublicId( $response->offsetGet('public_id'));

        return $image;
    }

}