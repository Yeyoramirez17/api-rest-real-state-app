<?php

namespace App\Service\Auth;

use App\Entity\ConfirmAccount;
use App\Entity\User;

interface ConfirmAccountInterface
{
    public function createConfirmation( User $user ): ConfirmAccount;

    public function verifyAccount( string $token ): ?User;
}
