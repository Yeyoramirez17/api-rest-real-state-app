<?php

namespace App\Entity;

use App\Repository\ImagePropertyRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: ImagePropertyRepository::class)]
#[ORM\Table( name: 'tbl_images_property')]
class ImageProperty
{
    #[ORM\Id]
    #[ORM\Column(length: 150, unique: true)]
    #[Groups(['property.images'])]
    private ?string $publicId = null;

    #[Groups(['property.images'])]
    #[ORM\Column(length: 100)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    #[Groups(['property.images'])]
    private ?string $imageUrl = null;

    #[ORM\Column(length: 255)]
    #[Groups(['property.images'])]
    private ?string $secureUrl = null;

    #[ORM\ManyToOne( targetEntity: Property::class, inversedBy: 'images')]
    #[ORM\JoinColumn( name: 'property_id', nullable: false)]
    private ?Property $property = null;

    public function __construct() {}

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

    public function setImageUrl(string $imageUrl): static
    {
        $this->imageUrl = $imageUrl;
        return $this;
    }
    public function getSecureUrl(): ?string
    {
        return $this->secureUrl;
    }
    public function setSecureUrl(string $secureUrl): static
    {
        $this->secureUrl = $secureUrl;
        return $this;
    }
    public function getProperty(): ?Property
    {
        return $this->property;
    }

    public function setProperty(?Property $property): static
    {
        $this->property = $property;
        return $this;
    }

}
