<?php

namespace App\Service;

use App\Entity\Role;

interface IRoleService
{
    public function findAll(): array;
    public function findById( int $id ): ?Role;
    public function save( array $data ): ?Role;
    public function delete( int $id ): void;
    public function disableOrEnable( int $roleId ) : ?Role;
}