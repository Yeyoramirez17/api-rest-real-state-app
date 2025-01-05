<?php

namespace App\Controller;

use App\Service\IRoleService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[Route( path: '/api' )]
class RoleController extends AbstractController
{
    public function __construct( private readonly  IRoleService $roleService) {}

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/roles', name: 'app_role_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return $this->json([
            'data' => $this->roleService->findAll(),
        ]);
    }

    #[Route( path: '/roles/{id}', name: 'app_role_show', methods: ['GET', 'HEAD'])]
    public function findById( int $id ): JsonResponse
    {
        $role = $this->roleService->findById( $id );
        return $this->json( [ 'data' => $role ] );
    }

    #[Route('/roles', name: 'app_role_save', methods: ['POST'])]
    public function save( Request $request ): JsonResponse
    {
        $data = json_decode( $request->getContent(), true);

        return $this->json(
            [ 'data' => $this->roleService->save( $data )],
            status: Response::HTTP_CREATED
        );
    }

    #[Route('/roles/{id}', name: 'app_role_delete', methods: ['DELETE'])]
    public function delete( int $id ): JsonResponse
    {
        $this->roleService->delete( $id );
        return $this->json( null, Response::HTTP_NO_CONTENT );
    }

    #[Route('/roles/{roleId}/enable', name: 'app_role_enable_disable', methods: ['PATCH'])]
    public function enableOrDisableRole( $roleId ): JsonResponse
    {
        $role = $this->roleService->disableOrEnable( $roleId );
        return $this->json( $role );
    }
}
