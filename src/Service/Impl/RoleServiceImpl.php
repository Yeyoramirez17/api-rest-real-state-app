<?php

namespace App\Service\Impl;

use App\Entity\Role;
use App\Exception\BadRequestException;
use App\Exception\NotFoundException;
use App\Repository\RoleRepository;
use App\Service\IRoleService;
use App\Utils\Validators\IValidatorService;
use Doctrine\ORM\EntityManagerInterface;

class RoleServiceImpl implements IRoleService
{
    public function __construct(
        private readonly EntityManagerInterface $entityManager,
        private readonly RoleRepository $roleRepository,
        private readonly IValidatorService $validatorService
    )
    {}

    public function findAll(): array
    {
        return $this->roleRepository->findAll();
    }

    public function findById(int $id): ?Role
    {
        $role = $this->roleRepository->findById($id);

        if( !$role ) {
            throw new NotFoundException( errors: sprintf("Role with ID %d Not Found", $id));
        }

        return $role;
    }

    public function save(array $data): ?Role
    {
        $exists = $this->roleRepository->findOneByName($data['name']);

        if (!is_null($exists)) {
            throw new BadRequestException(errors: "Role already with name " . $data['name']);
        }

        $role = new Role();
        $role->setName($data['name']);
        $role->setEnable( false );

        $errors = $this->validatorService->validate($role)
            ->getViolationsToArray();

        if (count($errors) > 0) {
            throw new BadRequestException(
                message: "It seems that you have validation problems",
                errors: $errors
            );
        }

        $this->entityManager->persist($role);
        $this->entityManager->flush();

        return $role;
    }

    public function delete(int $id): void
    {
        $role = $this->findById( $id);
        $this->entityManager->remove( $role );
        $this->entityManager->flush();
    }

    public function disableOrEnable( int $roleId ) : ?Role
    {
        $role = $this->findById( $roleId );
        $role->setEnable( !$role->isEnable() );

        $this->entityManager->persist( $role );
        $this->entityManager->flush();

        return $role;
    }

}