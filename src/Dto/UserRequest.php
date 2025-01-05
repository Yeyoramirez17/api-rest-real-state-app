<?php

namespace App\Dto;


use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints as Assert;

class UserRequest
{
   #[Assert\NotBlank]
   #[Assert\NotNull]
   private ?string $name = null;

   #[Assert\NotBlank]
   #[Assert\NotNull]
   #[Assert\Email]
   #[Assert\Length( max: 180 )]
   private ?string $email = null;

   #[Assert\NotBlank]
   #[Assert\NotNull]
   #[Assert\Length( min: 6 )]
   private ?string $password = null;

   #[Assert\Image(
       maxSize: '1M',
       mimeTypes:['image/jpg', 'image/jpeg', 'image/png']
   )]
   private ?UploadedFile $photoProfile = null;

    /**
     * @param string|null $email
     * @param string|null $name
     * @param string|null $password
     * @param UploadedFile|null $photoProfile
     */
    public function __construct(?string $email, ?string $name, ?string $password, ?UploadedFile $photoProfile)
    {
        $this->email = $email;
        $this->name = $name;
        $this->password = $password;
        $this->photoProfile = $photoProfile;
    }

    public static function new( array $attributes ): UserRequest
    {
        return new static(
            email: $attributes['email'],
            name: $attributes['name'],
            password: $attributes['password'],
            photoProfile: $attributes['photoProfile']
        );
    }
    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): void
    {
        $this->email = $email;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): void
    {
        $this->name = $name;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(?string $password): void
    {
        $this->password = $password;
    }

    public function getPhotoProfile(): ?UploadedFile
    {
        return $this->photoProfile;
    }

    public function setPhotoProfile(?UploadedFile $photoProfile): void
    {
        $this->photoProfile = $photoProfile;
    }

}
