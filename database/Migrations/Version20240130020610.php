<?php

declare(strict_types=1);

namespace Database\Migrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240130020610 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE tbl_advertisements (id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', type_property_id INT DEFAULT NULL, user_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\', property_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', title VARCHAR(255) NOT NULL, description LONGTEXT DEFAULT NULL, price NUMERIC(10, 2) DEFAULT NULL, type_advertisement ENUM(\'Renting\', \'Selling\', \'Vacation\') NOT NULL COMMENT \'(DC2Type:advertisement_type)\', phone_contact VARCHAR(25) NOT NULL, email_contact VARCHAR(50) NOT NULL, is_published TINYINT(1) DEFAULT 0 NOT NULL, published_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, INDEX IDX_CBBE14F31F8BC47D (type_property_id), INDEX IDX_CBBE14F3A76ED395 (user_id), UNIQUE INDEX UNIQ_CBBE14F3549213EC (property_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_comments (id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', user_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\', post_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\', body LONGTEXT NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, INDEX IDX_8AD7007A76ED395 (user_id), INDEX IDX_8AD70074B89032C (post_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_images_posts (public_id VARCHAR(150) NOT NULL, post_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\', name VARCHAR(100) NOT NULL, image_url VARCHAR(255) NOT NULL, secure_url VARCHAR(255) DEFAULT NULL, INDEX IDX_5B3621D04B89032C (post_id), PRIMARY KEY(public_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_images_property (public_id VARCHAR(150) NOT NULL, property_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', name VARCHAR(100) NOT NULL, image_url VARCHAR(255) NOT NULL, secure_url VARCHAR(255) NOT NULL, INDEX IDX_F6FD343A549213EC (property_id), PRIMARY KEY(public_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_posts (id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', user_id BINARY(16) DEFAULT NULL COMMENT \'(DC2Type:uuid)\', title VARCHAR(255) NOT NULL, body LONGTEXT NOT NULL, is_published TINYINT(1) DEFAULT 0, published_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, INDEX IDX_2639F0E5A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_properties (id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', bathrooms INT NOT NULL, bedrooms INT NOT NULL, garage INT NOT NULL, area VARCHAR(100) NOT NULL, location VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_roles (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, is_enable TINYINT(1) DEFAULT 0 NOT NULL, UNIQUE INDEX UNIQ_185A64D85E237E06 (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_type_property (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) NOT NULL, enabled TINYINT(1) DEFAULT 1 NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_users (id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', name VARCHAR(255) NOT NULL, email VARCHAR(180) NOT NULL, password VARCHAR(255) NOT NULL, photo_profile VARCHAR(255) DEFAULT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, is_verified TINYINT(1) NOT NULL, UNIQUE INDEX UNIQ_BAE7EFF6E7927C74 (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_user_roles (user_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', role_id INT NOT NULL, INDEX IDX_3DBF9F0EA76ED395 (user_id), INDEX IDX_3DBF9F0ED60322AC (role_id), PRIMARY KEY(user_id, role_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tbl_verify_accounts (id INT AUTO_INCREMENT NOT NULL, user_id BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', token VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', verified_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', expiration DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', UNIQUE INDEX UNIQ_FA481B6EA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE tbl_advertisements ADD CONSTRAINT FK_CBBE14F31F8BC47D FOREIGN KEY (type_property_id) REFERENCES tbl_type_property (id)');
        $this->addSql('ALTER TABLE tbl_advertisements ADD CONSTRAINT FK_CBBE14F3A76ED395 FOREIGN KEY (user_id) REFERENCES tbl_users (id)');
        $this->addSql('ALTER TABLE tbl_advertisements ADD CONSTRAINT FK_CBBE14F3549213EC FOREIGN KEY (property_id) REFERENCES tbl_properties (id)');
        $this->addSql('ALTER TABLE tbl_comments ADD CONSTRAINT FK_8AD7007A76ED395 FOREIGN KEY (user_id) REFERENCES tbl_users (id)');
        $this->addSql('ALTER TABLE tbl_comments ADD CONSTRAINT FK_8AD70074B89032C FOREIGN KEY (post_id) REFERENCES tbl_posts (id)');
        $this->addSql('ALTER TABLE tbl_images_posts ADD CONSTRAINT FK_5B3621D04B89032C FOREIGN KEY (post_id) REFERENCES tbl_posts (id)');
        $this->addSql('ALTER TABLE tbl_images_property ADD CONSTRAINT FK_F6FD343A549213EC FOREIGN KEY (property_id) REFERENCES tbl_properties (id)');
        $this->addSql('ALTER TABLE tbl_posts ADD CONSTRAINT FK_2639F0E5A76ED395 FOREIGN KEY (user_id) REFERENCES tbl_users (id)');
        $this->addSql('ALTER TABLE tbl_user_roles ADD CONSTRAINT FK_3DBF9F0EA76ED395 FOREIGN KEY (user_id) REFERENCES tbl_users (id)');
        $this->addSql('ALTER TABLE tbl_user_roles ADD CONSTRAINT FK_3DBF9F0ED60322AC FOREIGN KEY (role_id) REFERENCES tbl_roles (id)');
        $this->addSql('ALTER TABLE tbl_verify_accounts ADD CONSTRAINT FK_FA481B6EA76ED395 FOREIGN KEY (user_id) REFERENCES tbl_users (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE tbl_advertisements DROP FOREIGN KEY FK_CBBE14F31F8BC47D');
        $this->addSql('ALTER TABLE tbl_advertisements DROP FOREIGN KEY FK_CBBE14F3A76ED395');
        $this->addSql('ALTER TABLE tbl_advertisements DROP FOREIGN KEY FK_CBBE14F3549213EC');
        $this->addSql('ALTER TABLE tbl_comments DROP FOREIGN KEY FK_8AD7007A76ED395');
        $this->addSql('ALTER TABLE tbl_comments DROP FOREIGN KEY FK_8AD70074B89032C');
        $this->addSql('ALTER TABLE tbl_images_posts DROP FOREIGN KEY FK_5B3621D04B89032C');
        $this->addSql('ALTER TABLE tbl_images_property DROP FOREIGN KEY FK_F6FD343A549213EC');
        $this->addSql('ALTER TABLE tbl_posts DROP FOREIGN KEY FK_2639F0E5A76ED395');
        $this->addSql('ALTER TABLE tbl_user_roles DROP FOREIGN KEY FK_3DBF9F0EA76ED395');
        $this->addSql('ALTER TABLE tbl_user_roles DROP FOREIGN KEY FK_3DBF9F0ED60322AC');
        $this->addSql('ALTER TABLE tbl_verify_accounts DROP FOREIGN KEY FK_FA481B6EA76ED395');
        $this->addSql('DROP TABLE tbl_advertisements');
        $this->addSql('DROP TABLE tbl_comments');
        $this->addSql('DROP TABLE tbl_images_posts');
        $this->addSql('DROP TABLE tbl_images_property');
        $this->addSql('DROP TABLE tbl_posts');
        $this->addSql('DROP TABLE tbl_properties');
        $this->addSql('DROP TABLE tbl_roles');
        $this->addSql('DROP TABLE tbl_type_property');
        $this->addSql('DROP TABLE tbl_users');
        $this->addSql('DROP TABLE tbl_user_roles');
        $this->addSql('DROP TABLE tbl_verify_accounts');
    }
}
