<?php

namespace App\Service\Impl;

use App\Entity\Role;
use App\Entity\User;
use App\Exception\NotFoundException;
use App\Repository\UserRepository;
use App\Service\IUserService;
use Doctrine\ORM\EntityManagerInterface;

class UserServiceImpl implements IUserService
{

    public function __construct(
        private readonly UserRepository $userRepository,
        private readonly EntityManagerInterface $entityManager,
    ) {}

    public function findAll(): array
    {
        return $this->userRepository->findAll();
    }

    public function findById(string $uuid): ?User
    {
        $user = $this->userRepository->findOneBy(['id' => $uuid]);

        if( ! $user ) {
            throw new NotFoundException( errors: 'UserRequest with ID ' . $uuid . ' Not Found.');
        }

        return $user;
    }

    public function addRole(string $uuidUser, int $idRole): ?User
    {
        return $this->addOrRemoveRole($uuidUser, $idRole, 'add');
    }

    public function removeRole(string $uuidUser, int $idRole): ?User
    {
        return $this->addOrRemoveRole($uuidUser, $idRole, 'remove');
    }

    private function addOrRemoveRole(string $uuidUser, int $idRole, string $action ): ?User
    {
        $user = $this->findById( $uuidUser );
        $role = $this->entityManager->getRepository( Role::class )
            ->findOneBy(['id' => $idRole]);

        if( !$role ) {
            throw new NotFoundException( sprintf('Role with ID: %s Not Found', $idRole));
        }

        if( $action == 'add') {
            $user->addRole($role);
        } elseif ($action == 'remove') {
            $user->removeRole( $role );
        }

        $this->entityManager->persist( $user );
        $this->entityManager->flush();

        return $user;
    }
}