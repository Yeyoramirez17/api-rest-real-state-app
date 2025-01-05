<?php

namespace App\Repository;

use App\Entity\ImageProperty;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ImageProperty>
 *
 * @method ImageProperty|null find($id, $lockMode = null, $lockVersion = null)
 * @method ImageProperty|null findOneBy(array $criteria, array $orderBy = null)
 * @method ImageProperty[]    findAll()
 * @method ImageProperty[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ImagePropertyRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ImageProperty::class);
    }

//    /**
//     * @return ImageProperty[] Returns an array of ImageProperty objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('i')
//            ->andWhere('i.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('i.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?ImageProperty
//    {
//        return $this->createQueryBuilder('i')
//            ->andWhere('i.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
