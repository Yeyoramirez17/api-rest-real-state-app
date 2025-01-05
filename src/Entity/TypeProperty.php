<?php

namespace App\Entity;

use App\Repository\TypePropertyRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: TypePropertyRepository::class)]
#[ORM\Table(name: 'tbl_type_property')]
class TypeProperty
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['typeProperty', 'advertisement.typeProperty'])]
    private ?int $id = null;

    #[ORM\Column(length: 50)]
    #[Groups(['typeProperty', 'advertisement.typeProperty'])]
    private ?string $name = null;

    #[ORM\Column( options: ['default' => true])]
    #[Groups(['typeProperty'])]
    private ?bool $enabled = null;

    #[ORM\Column(
        name: 'created_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    #[Groups(['typeProperty'])]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(
        name: 'updated_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    #[Groups(['typeProperty'])]
    private ?\DateTimeImmutable $updatedAt = null;

    public function __construct()
    {
        $this->enabled = true;
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

    public function isEnabled(): ?bool
    {
        return $this->enabled;
    }

    public function setEnabled(bool $enabled): static
    {
        $this->enabled = $enabled;
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

}
