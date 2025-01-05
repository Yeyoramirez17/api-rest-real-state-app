<?php

namespace Database\DataFixtures;

use App\Entity\Role;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

;

class UserFixture extends Fixture
{
    public function __construct(
        private readonly UserPasswordHasherInterface $passwordHasher
    )
    {
    }

    public function load(ObjectManager $manager): void
    {
        $roleAdmin = $manager->getRepository(Role::class)
            ->findOneBy(['name' => 'ROLE_ADMIN']);

        $user = new User();
        $user->setName('Admin')
            ->setEmail('admin@example.net')
            ->setPassword( 'password');

        $user->setPassword($this->passwordHasher->hashPassword($user, $user->getPassword() ));
        $user->addRole( $roleAdmin );

        $manager->persist($user);
        $manager->flush();
    }
}
