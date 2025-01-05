<?php

namespace App\Entity;

use App\Repository\ConfirmAccountRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ConfirmAccountRepository::class)]
#[ORM\Table( name: 'tbl_verify_accounts')]
class ConfirmAccount
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $token = null;

    #[ORM\OneToOne(inversedBy: 'confirmAccount', targetEntity: User::class )]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column( nullable: true )]
    private ?\DateTimeImmutable $verifiedAt = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $expiration = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(string $token): static
    {
        $this->token = $token;
        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(User $user): static
    {
        $this->user = $user;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeImmutable $createdAt): static
    {
        $this->createdAt = $createdAt;
        return $this;
    }

    public function getVerifiedAt(): ?\DateTimeImmutable
    {
        return $this->verifiedAt;
    }

    public function setVerifiedAt(\DateTimeImmutable $verifiedAt): static
    {
        $this->verifiedAt = $verifiedAt;
        return $this;
    }

    public function getExpiration(): ?\DateTimeImmutable
    {
        return $this->expiration;
    }

    public function setExpiration(\DateTimeImmutable $expiration): static
    {
        $this->expiration = $expiration;
        return $this;
    }
}
