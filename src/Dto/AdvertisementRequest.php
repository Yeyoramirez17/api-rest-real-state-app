<?php
declare(strict_types=1);

namespace App\Dto;

use App\Enums\AdvertisementEnum;
use Symfony\Component\Validator\Constraints as Assert;

class AdvertisementRequest
{

    #[Assert\NotBlank]
    #[Assert\NotNull]
    private ?string $title = null;

    #[Assert\NotBlank]
    #[Assert\NotNull]
    private ?string $description = null;

    #[Assert\Positive]
    private ?int $typeProperty = null;

    #[Assert\Positive]
    private ?float $price = null;

    #[Assert\NotBlank]
    #[Assert\Choice( callback: [ AdvertisementEnum::class ,'valuesToArray'] )]
    private ?string $typeAnnouncement = null;

    #[Assert\NotBlank]
    private ?string $phoneContact = null;

    #[Assert\NotBlank]
    #[Assert\Email]
    private ?string $emailContact = null;

    #[Assert\Valid]
    private ?PropertyRequest $property;

    private function __construct(
        ?string $title, 
        ?string $description,
        ?int $typeProperty, 
        ?float $price, 
        ?string $typeAnnouncement, 
        ?string $phoneContact, 
        ?string $emailContact,
        ?PropertyRequest $property,
    ) {
        $this->title = $title;
        $this->description = $description;
        $this->typeProperty = $typeProperty;
        $this->price = $price;
        $this->typeAnnouncement = $typeAnnouncement;
        $this->phoneContact = $phoneContact;
        $this->emailContact = $emailContact;
        $this->property = $property;
    }

    public static function new( array $data ): ?AdvertisementRequest
    {
        return new static(
            title: $data['title'],
            description: $data['description'],
            typeProperty: (int) $data['typeProperty'],
            price: (float) $data['price'],
            typeAnnouncement: $data['typeAdvertisement'],
            phoneContact: $data['phoneContact'],
            emailContact: $data['emailContact'],
            property: PropertyRequest::new( $data['property'] )
        );
    }

    /**
     * Get the value of title.
     * 
     * @return string
     */ 
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Set the value of title.
     *
     * @param null|string $title
     * @return  self
     */ 
    public function setTitle( ?string $title): self
    {
        $this->title = $title;
        return $this;
    }

    /**
     * Get the value of description
     */ 
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @param string|null $description
     * @return  self
     */
    public function setDescription( ?string $description ): self
    {
        $this->description = $description;
        return $this;
    }

    /**
     * Get the value of typeProperty
     */ 
    public function getTypeProperty(): int
    {
        return $this->typeProperty;
    }

    /**
     * Set the value of Type-Property.
     *
     * @param int|null $typeProperty
     * @return  self
     */
    public function setTypeProperty( ?int $typeProperty): self
    {
        $this->typeProperty = $typeProperty;
        return $this;
    }

    /**
     * Get the value of price.
     * 
     * @return null|float
     */ 
    public function getPrice(): ?float
    {
        return $this->price;
    }

    /**
     * Set the value of price.
     *
     * @param null|float $price
     * @return  self
     */ 
    public function setPrice( ?float $price): self
    {
        $this->price = $price;
        return $this;
    }

    /**
     * Get the value of typeAnnouncement.
     */ 
    public function getTypeAnnouncement(): ?string
    {
        return $this->typeAnnouncement;
    }

    /**
     * Set the value of typeAnnouncement
     *
     * @return  self
     */ 
    public function setTypeAnnouncement($typeAnnouncement)
    {
        $this->typeAnnouncement = $typeAnnouncement;
        return $this;
    }

    /**
     * Get the value of Phone Contact.
     * 
     * @return null|string
     */ 
    public function getPhoneContact(): ?string
    {
        return $this->phoneContact;
    }

    /**
     * Set the value of Phone Contact.
     * 
     * @param null|string $phoneContact
     * @return  self
     */ 
    public function setPhoneContact( ?string $phoneContact)
    {
        $this->phoneContact = $phoneContact;
        return $this;
    }

    /**
     * Get the value of Email Contact.
     * 
     * @return null|string
     */ 
    public function getEmailContact(): ?string
    {
        return $this->emailContact;
    }

    /**
     * Set the value of emailContact.
     *
     * @param null|string $emailContact
     * @return  self
     */ 
    public function setEmailContact( ?string $emailContact)
    {
        $this->emailContact = $emailContact;
        return $this;
    }

    /**
     * Get the value of property.
     * 
     * @return null|PropertyRequest
     */ 
    public function getProperty(): ?PropertyRequest
    {
        return $this->property;
    }

    /**
     * Set the value of property.
     *
     * @param PropertyRequest|null $property
     * @return  self
     */
    public function setProperty( ?PropertyRequest $property): self
    {
        $this->property = $property;
        return $this;
    }
}
