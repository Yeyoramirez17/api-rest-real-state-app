<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Doctrine\DBAL\Types\Types;
use Symfony\Bridge\Doctrine\Types\UuidType;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Uid\Uuid;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[ORM\Table( name: 'tbl_users' )]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\Column( type: UuidType::NAME, unique: true )]
    #[ORM\GeneratedValue(strategy: 'CUSTOM')]
    #[ORM\CustomIdGenerator(class: 'doctrine.uuid_generator')]
    #[Groups(['user', 'post.user', 'comment.user', 'advertisement.user'])]
    private ?Uuid $id = null;

    #[ORM\Column( type: Types::STRING, length: 255 )]
    #[Groups(['user', 'post.user', 'advertisement.user'])]
    private ?string $name = null;

    #[ORM\Column( type: Types::STRING, length: 180, unique: true )]
    #[Groups(['user', 'post.user', 'comment.user', 'advertisement.user'])]
    private ?string $email = null;

    /**
     * @var ?string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    #[ORM\Column(name: 'photo_profile', length: 255, nullable: true)]
    #[Groups(['user', 'post.user', 'comment.user', 'advertisement.user'])]
    private ?string $photoProfile = null;

    #[ORM\Column(
        name: 'created_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    #[Groups(['user'])]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(
        name: 'updated_at',
        type: Types::DATETIME_IMMUTABLE,
        insertable: false,
        updatable: false,
        columnDefinition: "TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP",
        generated: 'ALWAYS'
    )]
    #[Groups(['user'])]
    private ?\DateTimeImmutable $updatedAt = null;

    #[ORM\ManyToMany( targetEntity: Role::class)]
    #[ORM\JoinTable( name: 'tbl_user_roles')]
    #[ORM\JoinColumn( name: 'user_id', referencedColumnName: 'id')]
    #[ORM\InverseJoinColumn( name: 'role_id', referencedColumnName: 'id')]
    #[Groups(['user.roles'])]
    private Collection $roles;

    #[Groups(['user.comments'])]
    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Comment::class)]
    private Collection $comments;

    #[Groups(['user.posts'])]
    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Post::class)]
    private Collection $posts;

    #[Groups(['user.advertisements'])]
    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Advertisement::class)]
    private Collection $announcements;

    #[ORM\OneToOne( mappedBy: 'user', targetEntity: ConfirmAccount::class, cascade: ['persist', 'remove'])]
    private ?ConfirmAccount $confirmAccount = null;

    #[ORM\Column]
    private ?bool $isVerified = null;

    
    public function __construct()
    {
        $this->roles = new ArrayCollection();
        $this->comments = new ArrayCollection();
        $this->posts = new ArrayCollection();
        $this->announcements = new ArrayCollection();
        $this->isVerified = false;
    }

    public function getId(): ?Uuid
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;
        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles
            ->map( fn( Role $role ): string => $role->getName() )
            ->toArray();

        return array_unique( $roles );
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;
        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
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

    public function getPhotoProfile(): ?string
    {
        return $this->photoProfile;
    }

    public function setPhotoProfile(?string $photoProfile): static
    {
        $this->photoProfile = $photoProfile;
        return $this;
    }

    public function addRole(Role $role): static
    {
        if (!$this->roles->contains($role)) {
            $this->roles->add($role);
        }
        return $this;
    }

    public function removeRole( Role $role): static
    {
        $this->roles->removeElement($role);
        return $this;
    }

    /**
     * @return Collection<int, Comment>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): static
    {
        if (!$this->comments->contains($comment)) {
            $this->comments->add($comment);
            $comment->setUser($this);
        }
        return $this;
    }

    public function removeComment(Comment $comment): static
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getUser() === $this) {
                $comment->setUser(null);
            }
        }
        return $this;
    }

    /**
     * @return Collection<int, Post>
     */
    public function getPosts(): Collection
    {
        return $this->posts;
    }

    public function addPost(Post $post): static
    {
        if (!$this->posts->contains($post)) {
            $this->posts->add($post);
            $post->setUser($this);
        }

        return $this;
    }

    public function removePost(Post $post): static
    {
        if ($this->posts->removeElement($post)) {
            // set the owning side to null (unless already changed)
            if ($post->getUser() === $this) {
                $post->setUser(null);
            }
        }
        return $this;
    }

    /**
     * @return Collection<int, Advertisement>
     */
    public function getAnnouncements(): Collection
    {
        return $this->announcements;
    }

    public function addAnnouncement(Advertisement $announcement): static
    {
        if (!$this->announcements->contains($announcement)) {
            $this->announcements->add($announcement);
            $announcement->setUser($this);
        }
        return $this;
    }

    public function removeAnnouncement(Advertisement $announcement): static
    {
        if ($this->announcements->removeElement($announcement)) {
            // set the owning side to null (unless already changed)
            if ($announcement->getUser() === $this) {
                $announcement->setUser(null);
            }
        }
        return $this;
    }

    public function getConfirmation(): ?ConfirmAccount
    {
        return $this->confirmAccount;
    }

    public function setConfirmation(ConfirmAccount $confirmAccount): static
    {
        // set the owning side of the relation if necessary
        if ($confirmAccount->getUser() !== $this) {
            $confirmAccount->setUser($this);
        }

        $this->confirmAccount = $confirmAccount;

        return $this;
    }

    public function isVerified(): ?bool
    {
        return $this->isVerified;
    }

    public function setVerified(bool $isVerified): static
    {
        $this->isVerified = $isVerified;
        return $this;
    }

}
