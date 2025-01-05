<?php

namespace App\Service;

use App\Entity\User;

interface IUserService
{
  public function findAll(): array;
  public function  findById( string $uuid ): ?User;
  public function addRole( string $uuidUser, int $idRole ): ?User;
  public function removeRole( string $uuidUser, int $idRole ): ?User;
}