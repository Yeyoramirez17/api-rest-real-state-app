<?php

namespace App\Entity;

use App\Enums\AdvertisementEnum;
use App\Repository\AdvertisementRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: AdvertisementRepository::class)]
#[ORM\Table( name: 'tbl_advertisements')]
class Advertisement
{
    #[ORM\Id]
    #[ORM\GeneratedValue( strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator( class: 'doctrine.uuid_generator')]
    #[ORM\Column( type: UuidType::NAME, unique: true)]
    #[Groups(['advertisement'])]
    private ?Uuid $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['advertisement'])]
    private ?string $title = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    #[Groups(['advertisement'])]
    private ?string $description = null;

    #[ORM\ManyToOne( targetEntity: TypeProperty::class )]
    #[ORM\JoinColumn( name: 'type_property_id' )]
    #[Groups(['advertisement.typeProperty'])]
    private ?TypeProperty $typeProperty = null;

    #[ORM\Column(type: Types::DECIMAL, precision: 10, scale: 2, nullable: true)]
    #[Groups(['advertisement'])]
    private ?string $price = null;

    #[ORM\Column( type: 'advertisement_type' )]
    #[Groups(['advertisement'])]
    private  $typeAdvertisement = null;

    #[ORM\Column(length: 25)]
    #[Groups(['advertisement'])]
    private ?string $phoneContact = null;

    #[ORM\Column(length: 50)]
    #[Groups(['advertisement'])]
    private ?string $emailContact = null;

    #[ORM\Column( options: ['default' => false ])]
    #[Groups(['advertisement'])]
    private ?bool $isPublished = null;

    #[ORM\Column( nullable: true )]
    #[Groups(['advertisement'])]
    private ?\DateTimeImmutable $publishedAt = null;

    #[ORM\Column(
        insertable: false,
        updatable: false,
        columnDefinition: 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP',
        generated: 'ALWAYS'
    )]
    #[Groups(['advertisement'])]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
        generated: "ALWAYS"
    )]
    #[Groups(['advertisement'])]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\ManyToOne( inversedBy: 'announcements')]
    #[Groups('advertisement.user')]
    private ?User $user = null;

    #[ORM\OneToOne(inversedBy: 'advertisement', targetEntity: Property::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['advertisement.property'])]
    private ?Property $property = null;

    public function __construct()
    {
        $this->isPublished = false;
    }

    public function getId(): ?Uuid
    {
        return $this->id;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;
        return $this;
    }

    public function getTypeProperty(): ?TypeProperty
    {
        return $this->typeProperty;
    }

    public function setTypeProperty(?TypeProperty $typeProperty): static
    {
        $this->typeProperty = $typeProperty;
        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;
        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): static
    {
        $this->description = $description;
        return $this;
    }

    public function getPrice(): ?string
    {
        return $this->price;
    }

    public function setPrice(?string $price): static
    {
        $this->price = $price;
        return $this;
    }

    public function getTypeAdvertisement(): ?AdvertisementEnum
    {
        return $this->typeAdvertisement;
    }

    public function setTypeAdvertisement(?AdvertisementEnum $typeAdvertisement): static
    {
        $this->typeAdvertisement = $typeAdvertisement;
        return $this;
    }

    public function getPhoneContact(): ?string
    {
        return $this->phoneContact;
    }

    public function setPhoneContact(string $phoneContact): static
    {
        $this->phoneContact = $phoneContact;
        return $this;
    }

    public function getEmailContact(): ?string
    {
        return $this->emailContact;
    }

    public function setEmailContact(string $emailContact): static
    {
        $this->emailContact = $emailContact;
        return $this;
    }

    public function isPublished(): ?bool
    {
        return $this->isPublished;
    }

    public function setIsPublished(bool $isPublished): static
    {
        $this->isPublished = $isPublished;
        return $this;
    }

    public function getPublishedAt(): ?\DateTimeImmutable
    {
        return $this->publishedAt;
    }

    public function setPublishedAt(?\DateTimeImmutable $publishedAt): static
    {
        $this->publishedAt = $publishedAt;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function getProperty(): ?Property
    {
        return $this->property;
    }

    public function setProperty( ?Property $property): static
    {
        $this->property = $property;
        return $this;
    }

}
