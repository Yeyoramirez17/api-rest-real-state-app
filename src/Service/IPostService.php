<?php

namespace App\Service;

use App\Dto\PostRequest;
use App\Entity\Post;
use App\Utils\Paginator;
use Symfony\Component\HttpFoundation\File\UploadedFile;

interface IPostService
{
    /**
     * Get all paginated posts.
     *
     * @param int $page
     * @param int $limit
     * @param int $offset
     * @return Paginator
     */
    public function findAll( int $page, int $limit, int $offset ): Paginator;

    /**
     * Retrieve a post by its ID.
     *
     * @param string $uuid
     * @return Post
     */
    public function findById( string $uuid ): Post;

    /**
     * Save a new Post a Database.
     *
     * @param PostRequest $postRequest
     * @return null|Post
     */
    public function save(PostRequest $postRequest ): ?Post;

    /**
     * Update a Post.
     *
     * @param string $uuid ID Post.
     * @param PostRequest $postRequest Data to be updated.
     * @return null|Post Updated Post.
     */
    public function update( string $uuid, PostRequest $postRequest ): ?Post;

    /**
     * Find a Post by its ID and remove it from the database.
     *
     * @param string $uuid
     * @return void
     */
    public function delete( string $uuid ): void;
    /**
     * Change the "Published" status of a post.
     *
     * @param string $uuid
     * @return Post|null
     */
    public function publishPost( string $uuid ): ?Post;

    /**
     * Remove an image related to the Post.
     *
     * @param string $idPost ID Post.
     * @param string[] $images Image Names.
     * @return bool
     */
    public function removeImages( string $idPost, array $images ): bool;

    /**
     * Upload images to a Post.
     * @param string $idPost ID Post
     * @param UploadedFile[] $images Uploaded Images.
     * @return Post|null
     */
    public function addImages( string $idPost, array $images ): ?Post;
}