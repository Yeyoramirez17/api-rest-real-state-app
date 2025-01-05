<?php

namespace App\Dto;

use Symfony\Component\Validator\Constraints as Assert;

class CommentRequest
{
    #[Assert\NotBlank]
    #[Assert\NotNull]
    private ?string $body = null;

    #[Assert\NotBlank]
    #[Assert\Uuid]
    private ?string $postId = null;

    /**
     * @param string|null $body
     * @param string|null $postId
     */
    public function __construct(?string $body, ?string $postId)
    {
        $this->body = $body;
        $this->postId = $postId;
    }

    public static function new( array $attributes) : CommentRequest
    {
        return new static(
            body: $attributes['body'],
            postId: $attributes['postId'],
        );
    }

    public function getBody(): ?string
    {
        return $this->body;
    }

    public function setBody(?string $body): void
    {
        $this->body = $body;
    }

    public function getPostId(): ?string
    {
        return $this->postId;
    }

    public function setPostId(?string $postId): void
    {
        $this->postId = $postId;
    }


}