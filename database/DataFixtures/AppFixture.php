<?php

namespace Database\DataFixtures;

use App\Entity\TypeProperty;
use App\Entity\Role;
use Database\Factory\CommentFactory;
use Database\Factory\ImagePostFactory;
use Database\Factory\PostFactory;
use Database\Factory\UserFactory;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ObjectManager;

class AppFixture extends Fixture implements DependentFixtureInterface
{
    private EntityManagerInterface $entityManager;

    public function __construct() {}

    public function load(ObjectManager $manager): void
    {
        /** @var Role[] $roles */
        $roles = $manager->getRepository( Role::class )
            ->findAll();

        UserFactory::createMany( 15, function () use ($roles){
            return ['roles' => new ArrayCollection( [ $roles[array_rand( $roles)] ] )];
        });

        PostFactory::createMany( 105, function () {
            return [
                'user' => UserFactory::random(),
            ];
        });

        ImagePostFactory::createMany(110, function () {
            return ['post' => PostFactory::random()];
        });

        CommentFactory::createMany(150, function() {
            return [
                'post' => PostFactory::random(),
                'user' => UserFactory::random(),
            ];
        });
    }

    public function getDependencies(): array
    {
        return [
            RoleFixture::class,
            TypePropertyFixture::class,
            UserFixture::class
        ];
    }
}