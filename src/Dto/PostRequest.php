<?php
namespace App\Dto;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\UploadedFile;

final class PostRequest
{
    #[Assert\NotBlank( groups: ['create', 'update'] )]
    private ?string $title = null;

    #[Assert\NotBlank( groups: ['create', 'update'] )]
    private ?string $body = null;

    /** @var UploadedFile[] $images */
    #[Assert\All(
        constraints: [
            new Assert\Image(
                maxSize: '1024k',
                mimeTypes:['image/jpg', 'image/jpeg', 'image/png']
            ),
        ],
        groups: ['create', 'update']
    )]
    #[Assert\Count( min: 1, max: 10, groups: ['create'] )]
    private array $images;

    public function __construct( string $title, string $body, array $images )
    {
        $this->title = $title;
        $this->body = $body;
        $this->images = $images;
    }

    public static function make( array $attributes ): PostRequest
    {
        return new self(
            title:  $attributes['title'],
            body:   $attributes['body'],
            images: $attributes['images']
        );
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $title): void
    {
        $this->title = $title;
    }

    public function getBody(): string
    {
        return $this->body;
    }

    public function setBody(string $body): void
    {
        $this->body = $body;
    }

    public function getImages(): array
    {
        return $this->images;
    }

    public function setImages(array $images): void
    {
        $this->images = $images;
    }
}