<?php

namespace App\Entity;

use App\Repository\PostRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: PostRepository::class)]
#[ORM\Table( name: 'tbl_posts' )]
class Post
{
    #[ORM\Id]
    #[ORM\Column( type: UuidType::NAME, unique: true )]
    #[ORM\GeneratedValue( strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator( class: 'doctrine.uuid_generator' )]
    #[Groups(['post', 'post.comments'])]
    private ?Uuid $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['post'])]
    private ?string $title = null;

    #[ORM\Column(type: Types::TEXT)]
    #[Groups(['post'])]
    private ?string $body = null;

    #[ORM\Column( type: Types::BOOLEAN, nullable: true, options: ['default' => false ] )]
    #[Groups(['post'])]
    private ?bool $isPublished = null;

    #[ORM\Column(nullable: true)]
    #[Groups(['post'])]
    private ?\DateTimeImmutable $publishedAt = null;

    #[ORM\Column(
        insertable: false,
        updatable: false,
        columnDefinition: 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP',
        generated: 'ALWAYS'
    )]
    #[Groups(['post'])]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(
        insertable: false,
        updatable: false,
        columnDefinition: 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
        generated: 'ALWAYS'
    )]
    #[Groups(['post'])]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\ManyToOne( targetEntity: User::class ,inversedBy: 'posts')]
    #[Groups(['post.user'])]
    private ?User $user = null;

    #[Groups('post.comments')]
    #[ORM\OneToMany(mappedBy: 'post', targetEntity: Comment::class)]
    private Collection $comments;

    #[ORM\OneToMany(mappedBy: 'post', targetEntity: ImagePost::class, cascade: ['persist'], orphanRemoval: false)]
    #[Groups(['post.images'])]
    private Collection $images;

    public function __construct()
    {
        $this->comments = new ArrayCollection();
        $this->isPublished = false;
        $this->images = new ArrayCollection();
    }

    public function getId(): ?Uuid
    {
        return $this->id;
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
    public function getIsPublished(): ?bool
    {
        return $this->isPublished;
    }

    public function setIsPublished(?bool $isPublished): void
    {
        $this->isPublished = $isPublished;
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

    /**
     * @return Collection<int, Comment> $comments.
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): static
    {
        if (!$this->comments->contains($comment)) {
            $this->comments->add($comment);
            $comment->setPost($this);
        }
        return $this;
    }

    public function removeComment(Comment $comment): static
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getPost() === $this) {
                $comment->setPost(null);
            }
        }
        return $this;
    }

    /**
     * @return Collection<int, ImagePost> $images
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(ImagePost $image): static
    {
        if (!$this->images->contains($image)) {
            $this->images->add($image);
            $image->setPost($this);
        }

        return $this;
    }

    public function removeImage(ImagePost $image): static
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getPost() === $this) {
                $image->setPost(null);
            }
        }
        return $this;
    }

}
