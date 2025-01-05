<?php

namespace App\Entity;

use App\Repository\CommentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: CommentRepository::class)]
#[ORM\Table( name: 'tbl_comments')]
class Comment
{
    #[ORM\Id]
    #[ORM\Column( type: UuidType::NAME, unique: true)]
    #[ORM\GeneratedValue(strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator(class: 'doctrine.uuid_generator')]
    #[Groups(['post.comments'])]
    private ?Uuid $id = null;

    #[Groups(['post.comments'])]
    #[ORM\Column(type: Types::TEXT)]
    private ?string $body = null;

    #[ORM\ManyToOne(inversedBy: 'comments')]
    #[ORM\JoinColumn(name: 'user_id')]
    #[Groups('comment.user')]
    private ?User $user = null;

    #[ORM\ManyToOne(inversedBy: 'comments')]
    #[ORM\JoinColumn(name: 'post_id')]
    private ?Post $post = null;

    #[Groups(['post.comments'])]
    #[ORM\Column(
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    private ?\DateTimeImmutable $createdAt = null;

    public function __construct() {}

    public function getId(): ?Uuid
    {
        return $this->id;
    }

    public function setId(Uuid $id): static
    {
        $this->id = $id;
        return $this;
    }

    public function getBody(): ?string
    {
        return $this->body;
    }

    public function setBody(string $body): static
    {
        $this->body = $body;
        return $this;
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

    public function getPost(): ?Post
    {
        return $this->post;
    }

    public function setPost(?Post $post): static
    {
        $this->post = $post;
        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

}
