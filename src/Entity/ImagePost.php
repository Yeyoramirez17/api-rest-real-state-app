<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity]
#[ORM\Table( name: 'tbl_images_posts')]
class ImagePost
{
    #[ORM\Id]
    #[ORM\Column(length: 150, unique: true)]
    private ?string $publicId = null;
    #[ORM\Column(length: 100)]
    #[Groups(['post.images'])]
    private ?string $name = null;

    #[ORM\Column( length: 255)]
    #[Groups(['post.images'])]
    private ?string $imageUrl = null;

    #[ORM\Column(length: 255, nullable: true)]
    #[Groups(['post.images'])]
    private ?string $secureUrl = null;

    #[ORM\ManyToOne( targetEntity: Post::class, inversedBy: 'images')]
    private ?Post $post = null;

    public function getPublicId(): ?string
    {
        return $this->publicId;
    }
    public function setPublicId(string $publicId): static
    {
        $this->publicId = $publicId;
        return $this;
    }
    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;
        return $this;
    }
    public function getImageUrl(): ?string
    {
        return $this->imageUrl;
    }

    public function setImageUrl(?string $imageUrl): static
    {
        $this->imageUrl = $imageUrl;
        return $this;
    }

    public function getSecureUrl(): ?string
    {
        return $this->secureUrl;
    }
    public function setSecureUrl(?string $secureUrl): static
    {
        $this->secureUrl = $secureUrl;
        return $this;
    }
    public function getPost(): ?Post
    {
        return $this->post;
    }

    public function setPost(?Post $post): static
    {
        $this->post = $post;
        return $this;
    }

}