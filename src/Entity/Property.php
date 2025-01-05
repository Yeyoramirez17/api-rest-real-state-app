<?php

namespace App\Entity;

use App\Repository\PropertyRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: PropertyRepository::class)]
#[ORM\Table( name: 'tbl_properties' )]
class Property
{
    #[ORM\Id]
    #[ORM\GeneratedValue( strategy: 'CUSTOM' )]
    #[ORM\Column( type: UuidType::NAME, unique: true )]
    #[ORM\CustomIdGenerator( class: 'doctrine.uuid_generator')]
    #[Groups(['property', 'advertisement.property'])]
    private ?Uuid $id = null;

    #[ORM\Column]
    #[Groups(['property', 'advertisement.property'])]
    private ?int $bathrooms = null;

    #[ORM\Column]
    #[Groups(['property', 'advertisement.property'])]
    private ?int $bedrooms = null;

    #[ORM\Column]
    #[Groups(['property', 'advertisement.property'])]
    private ?int $garage = null;

    #[ORM\Column(length: 100)]
    #[Groups(['property', 'advertisement.property'])]
    private ?string $area = null;

    #[ORM\Column(length: 255)]
    #[Groups(['property', 'advertisement.property'])]
    private ?string $location = null;

    #[ORM\OneToOne(mappedBy: 'property', targetEntity: Advertisement::class, cascade: ['persist', 'remove'])]
    private ?Advertisement $advertisement = null;

    #[ORM\OneToMany(mappedBy: 'property', targetEntity: ImageProperty::class, cascade: ['persist', 'remove'])]
    #[Groups(['property.images'])]
    private Collection $images;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }

    public function getId(): ?Uuid
    {
        return $this->id;
    }

    public function getBathrooms(): ?int
    {
        return $this->bathrooms;
    }

    public function setBathrooms(int $bathrooms): static
    {
        $this->bathrooms = $bathrooms;
        return $this;
    }

    public function getBedrooms(): ?int
    {
        return $this->bedrooms;
    }

    public function setBedrooms(int $bedrooms): static
    {
        $this->bedrooms = $bedrooms;
        return $this;
    }

    public function getGarage(): ?int
    {
        return $this->garage;
    }

    public function setGarage(int $garage): static
    {
        $this->garage = $garage;
        return $this;
    }

    public function getArea(): ?string
    {
        return $this->area;
    }

    public function setArea(string $area): static
    {
        $this->area = $area;
        return $this;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation(string $location): static
    {
        $this->location = $location;
        return $this;
    }

    public function getAnnouncement(): ?Advertisement
    {
        return $this->advertisement;
    }

    public function setAdvertisement(Advertisement $advertisement ): static
    {
        // set the owning side of the relation if necessary
        if ($advertisement->getProperty() !== $this) {
            $advertisement->setProperty($this);
        }
        $this->advertisement = $advertisement;
        return $this;
    }

    /**
     * @return Collection<int, ImageProperty>
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(ImageProperty $image): static
    {
        if (!$this->images->contains($image)) {
            $this->images->add($image);
            $image->setProperty($this);
        }
        return $this;
    }

    public function removeImage(ImageProperty $image): static
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getProperty() === $this) {
                $image->setProperty(null);
            }
        }
        return $this;
    }

}
