<?php

namespace App\Service\Auth;

use App\Entity\ConfirmAccount;
use App\Entity\User;
use App\Repository\ConfirmAccountRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Uid\Uuid;

class ConfirmAccountService implements ConfirmAccountInterface
{
    private readonly EntityManagerInterface $entityManager;
    private readonly ConfirmAccountRepository $accountRepository;

    public function __construct( EntityManagerInterface $entityManager, ConfirmAccountRepository $accountRepository )
    {
        $this->entityManager = $entityManager;
        $this->accountRepository = $accountRepository;
    }

    public function createConfirmation( User $user ): ConfirmAccount
    {
        $date = new \DateTimeImmutable();
        $token = Uuid::v5( $user->getId(), $user->getName());

        $confirm = new ConfirmAccount();
        $confirm->setUser( $user );
        $confirm->setCreatedAt( $date );
        $confirm->setExpiration( $date->add( new \DateInterval('PT10M') ) );
        $confirm->setToken( $token->toRfc4122() );

        $this->entityManager->persist( $confirm );
        $this->entityManager->flush();

        return $confirm;
    }

    public function verifyAccount( string $token ): ?User
    {
        $user = $this->accountRepository->findUserByTokenConfirmation( $token );

        if( !$user ) return null;

        $expiration = $user->getConfirmation()->getExpiration();
        $now = new \DateTimeImmutable();

        if( $now < $expiration ) {
            $user->setVerified( true );
            $user->getConfirmation()->setVerifiedAt( new \DateTimeImmutable() );

            $this->entityManager->persist( $user );
            $this->entityManager->flush();
            return $user;
        }

        return null;
    }
}
