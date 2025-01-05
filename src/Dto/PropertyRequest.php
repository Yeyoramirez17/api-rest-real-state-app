<?php

namespace App\Dto;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints as Assert;

class PropertyRequest
{
    #[Assert\Positive]
    private ?int $bathrooms = null;
    #[Assert\Positive]
    private ?int $bedrooms = null;
    #[Assert\PositiveOrZero]
    private ?int $garage = null;
    #[Assert\NotBlank]
    private ?string $area = null;
    #[Assert\NotBlank]
    private ?string $location = null;

    private function __construct(?int $bathrooms, ?int $bedrooms, ?int $garage,?string $area, ?string $location ) {
        $this->bathrooms = $bathrooms;
        $this->bedrooms = $bedrooms;
        $this->garage = $garage;
        $this->area = $area;
        $this->location = $location;
    }

    public static function new( array $attributes ): PropertyRequest
    {
        return new static(
            bathrooms: (int) $attributes['bathrooms'],
            bedrooms: (int) $attributes['bedrooms'],
            garage: (int) $attributes['garage'],
            area: $attributes['area'],
            location: $attributes['location'],
        );
    }

    /**
     * Get the value of bathrooms.
     *
     * @return null|int
     */ 
    public function getBathrooms(): ?int
    {
        return $this->bathrooms;
    }

    /**
     * Set the value of bathrooms.
     *
     * @param null|int $bathrooms
     * @return  self
     */ 
    public function setBathrooms( ?int $bathrooms): self
    {
        $this->bathrooms = $bathrooms;
        return $this;
    }

    /**
     * Get the value of bedrooms.
     *
     * @return int
     */ 
    public function getBedrooms(): int
    {
        return $this->bedrooms;
    }

    /**
     * Set the value of bedrooms
     *
     * @param null|int $bedrooms
     * @return  self
     */ 
    public function setBedrooms( ?int $bedrooms): self
    {
        $this->bedrooms = $bedrooms;
        return $this;
    }

    /**
     * Get the value of garage.
     *
     * @return null|int
     */ 
    public function getGarage(): ?int
    {
        return $this->garage;
    }

    /**
     * Set the value of garage
     *
     * @param null|int $garage
     * @return  self
     */ 
    public function setGarage( ?int $garage): self
    {
        $this->garage = $garage;
        return $this;
    }

    /**
     * Get the value of area.
     * 
     * @return null|string
     */ 
    public function getArea(): ?string
    {
        return $this->area;
    }

    /**
     * Set the value of area
     *
     * @param null|string $area
     * @return  self
     */ 
    public function setArea( ?string $area): self
    {
        $this->area = $area;
        return $this;
    }

    /**
     * Get the value of location
     */ 
    public function getLocation(): ?string
    {
        return $this->location;
    }

    /**
     * Set the value of location
     *
     * @param string|null $location
     * @return  self
     */
    public function setLocation( ?string $location): self
    {
        $this->location = $location;
        return $this;
    }

}
