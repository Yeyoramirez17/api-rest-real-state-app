<?php

namespace Database\DataFixtures;

use App\Entity\TypeProperty;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TypePropertyFixture extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $category1 = new TypeProperty();
        $category1->setName('Apartamento');
        $category1->setEnabled( true);
        $manager->persist( $category1 );

        $category2 = new TypeProperty();
        $category2->setName('Casa');
        $category2->setEnabled( true);
        $manager->persist( $category2 );

        $category3 = new TypeProperty();
        $category3->setName('Casa Campestre');
        $category3->setEnabled( true);
        $manager->persist( $category3 );

        $category4 = new TypeProperty();
        $category4->setName('Apartaestudio');
        $category4->setEnabled( true);
        $manager->persist( $category4 );

        $category5 = new TypeProperty();
        $category5->setName('Finca');
        $category5->setEnabled( true);

        $category6 = new TypeProperty();
        $category6->setName('Local');
        $category6->setEnabled( true);
        $manager->persist( $category6 );

        $category7 = new TypeProperty();
        $category7->setName('Habitación');
        $category7->setEnabled( true);
        $manager->persist( $category7 );

        $category8 = new TypeProperty();
        $category8->setName('Cabaña');
        $category8->setEnabled( true);
        $manager->persist( $category8 );

        $category9 = new TypeProperty();
        $category9->setName('Edificio');
        $category9->setEnabled( true);
        $manager->persist( $category9 );

        $category10 = new TypeProperty();
        $category10->setName('Oficina');
        $category10->setEnabled( true);
        $manager->persist( $category10 );

        $category11 = new TypeProperty();
        $category11->setName('Lote');
        $category11->setEnabled( true);
        $manager->persist( $category11 );

        $manager->flush();
    }
}
