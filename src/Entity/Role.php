<?php

namespace App\Entity;

use App\Repository\RoleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\JoinTable;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: RoleRepository::class)]
#[ORM\Table( name: 'tbl_roles')]
class Role
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column( type: Types::INTEGER )]
    private ?int $id = null;

    #[ORM\Column(length: 255, unique: true)]
    #[Assert\NotBlank]
    #[Assert\Length( min: 3, max: 255 )]
    private ?string $name = null;

    #[ORM\Column(
        name: 'created_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(
        name: 'updated_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\Column(
        name: 'is_enable',
        insertable: false,
        options: ['default' => false]
    )]
    #[Assert\NotNull]
    private ?bool $enable = null;

    public function __construct()
    {
        $this->enable = false;
    }

    public function getId(): ?int
    {
        return $this->id;
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

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function isEnable(): ?bool
    {
        return $this->enable;
    }

    public function setEnable( ?bool $enable): static
    {
        $this->enable = $enable;
        return $this;
    }

}
