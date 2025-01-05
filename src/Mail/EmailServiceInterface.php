<?php

namespace App\Mail;

use App\Entity\User;
use Symfony\Component\Mailer\Exception\TransportExceptionInterface;

interface EmailServiceInterface
{
    public function sendEmail(  string $from, string $to, string $subject, string $body, array $options = [] ): bool;

    /**
     * @param User $user
     * @return bool
     * @throws TransportExceptionInterface
     */
    public function sendEmailVerify( User $user ): bool;
}
