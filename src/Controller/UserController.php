<?php

namespace App\Controller;

use App\Service\IUserService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route(path: '/api')]
class UserController extends AbstractController
{
    public function __construct( private readonly IUserService $userService) {}

    #[Route( path: '/users', name: 'app_user_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->userService->findAll() ],
            status: Response::HTTP_OK,
            context: ['groups' => 'user']
        );
    }

    #[Route( path: '/users/{uuid}', name: 'app_user_show', methods: ['GET'])]
    public function findById( string $uuid ): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->userService->findById($uuid) ],
            status: Response::HTTP_OK,
            context: ['groups' => ['user']]
        );
    }

    #[Route(path: '/users/{uuid}/add-role/{idRole}', name: 'app_add_role_user', methods: ['PATCH', 'PUT'])]
    public function addRole( string $uuid, int $idRole ): JsonResponse
    {
        $user = $this->userService->addRole($uuid, $idRole);
        return $this->json(
            data: ['data' => $user ],
            status: Response::HTTP_OK,
            context: ['groups' => ['user']]
        );
    }

    #[Route(path: '/users/{uuid}/remove-role/{idRole}', name: 'app_remove_role_user', methods: ['PATCH', 'PUT'])]
    public function removeRole( string $uuid, int $idRole ): JsonResponse
    {
        $user = $this->userService->removeRole($uuid, $idRole);
        return $this->json(
            data: ['data' => $user ],
            status: Response::HTTP_OK,
            context: ['groups' => ['user']]
        );
    }
}