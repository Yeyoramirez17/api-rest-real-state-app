<?php

namespace Database\DataFixtures;

use App\Entity\Role;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use function Zenstruck\Foundry\faker;

;

class RoleFixture extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $roleSuperAdmin = new Role();
        $roleSuperAdmin->setName('ROLE_SUPER_ADMIN');
        $roleSuperAdmin->setEnable( true );
        $manager->persist($roleSuperAdmin);

        $roleAdmin = new Role();
        $roleAdmin->setName('ROLE_ADMIN');
        $roleAdmin->setEnable( true );
        $manager->persist($roleAdmin);

        $roleUser = new Role();
        $roleUser->setName('ROLE_USER');
        $roleUser->setEnable( true );
        $manager->persist($roleUser);

        $roleWrite = new Role();
        $roleWrite->setName('ROLE_WRITE');
        $roleWrite->setEnable( true );
        $manager->persist($roleWrite);

        $roleEditor = new Role();
        $roleEditor->setName('ROLE_EDITOR');
        $roleEditor->setEnable( true );
        $manager->persist($roleEditor);

        $manager->flush();
    }
}
