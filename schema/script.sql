-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-01-2025 a las 16:45:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_real_state`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('Database\\Migrations\\Version20240130020610', '2025-01-16 05:00:41', 1758);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_advertisements`
--

CREATE TABLE `tbl_advertisements` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `type_property_id` int(11) DEFAULT NULL,
  `user_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `property_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `type_advertisement` enum('Renting','Selling','Vacation') NOT NULL COMMENT '(DC2Type:advertisement_type)',
  `phone_contact` varchar(25) NOT NULL,
  `email_contact` varchar(50) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `published_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `user_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `post_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `body` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_comments`
--

INSERT INTO `tbl_comments` (`id`, `user_id`, `post_id`, `body`, `created_at`) VALUES
(0x01946d499bbf70fd98e84ab17d198f03, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496c037350ac2cefaa8b1e8df9, 'Ullam atque eum ea sed quia. Eligendi nisi dolor iusto quaerat repudiandae blanditiis et. Id voluptas magnam aliquam et. Delectus vitae est quia dolorem.', '2025-01-16 04:05:28'),
(0x01946d499bda7674aaa62d3e6ff32fe6, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d4972b274c6875c6496bba87878, 'Necessitatibus et nihil voluptatum soluta nam. Non rerum aliquid delectus nostrum laudantium et non ut. Dolores quae repudiandae delectus et tenetur numquam modi.', '2025-01-16 04:05:28'),
(0x01946d499d92768395710dcb5f6cfa61, 0x01946d49633f785da764361dea9a2f2e, 0x01946d497697739598296de99768c970, 'Amet voluptatem illo molestias aliquid magnam quam laborum. Voluptate dicta ratione et et. Veritatis quod odit itaque sequi. Mollitia minus modi autem sapiente aliquid porro aut.', '2025-01-16 04:05:28'),
(0x01946d499ecc78d39c9ab3824bc74443, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496c037350ac2cefaa8b1e8df9, 'Optio quo sequi facere itaque. Est aut saepe placeat dicta. Repellendus id eum nobis doloremque modi.', '2025-01-16 04:05:29'),
(0x01946d499ffd7664a74f5ced19d08ce1, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d4976ae7238bf0cc09fbf7d2756, 'Magni consequuntur et sit sequi dolores architecto. Velit sed accusantium corporis ut nobis qui neque. Commodi ea et sunt. Dolore ullam praesentium alias quisquam harum ex.', '2025-01-16 04:05:29'),
(0x01946d49a1ad7b35beba8998b14f617d, 0x01946d49604476628930f705e69e412e, 0x01946d49722c7513ab34c7b740e09ff4, 'Sed nihil qui ut voluptatem impedit. Architecto consequatur odio magni. Ea a perferendis blanditiis eum tempora qui. Beatae rerum sunt suscipit sequi aut repellat ullam.', '2025-01-16 04:05:29'),
(0x01946d49a31f7addb3917ebe3403f220, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496d0d77be8918fe43fa7b6833, 'Iusto autem eum quisquam corrupti voluptatem asperiores. Natus consequatur sint voluptatem autem animi ex enim minus. Non ad temporibus dolorem. Explicabo alias suscipit qui eaque alias.', '2025-01-16 04:05:30'),
(0x01946d49a34a7514a7170932558b69c3, 0x01946d495484741ca967e85e0aa211fe, 0x01946d4970257388ba404a7f262c9801, 'Et aut magni reprehenderit et vitae dolor. Iure eum incidunt iste est. Voluptas alias aliquid eveniet architecto molestias distinctio.', '2025-01-16 04:05:30'),
(0x01946d49a39575c6a0d53545e5beb874, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496c24769081029dd97bb0b26b, 'Culpa saepe laudantium qui iure nisi voluptatem. Odio nulla minima quo sed dignissimos. Vitae ducimus nobis aliquid ducimus.', '2025-01-16 04:05:30'),
(0x01946d49a47a765dae9ab569216976fc, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496fcf79f8a922414839d17dde, 'Nemo beatae eveniet dolor quaerat. Adipisci sint cum quaerat occaecati rem.', '2025-01-16 04:05:30'),
(0x01946d49a8627ce5a6464cbf23dba828, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496dcf751a94f06ed8a0a44703, 'Harum rerum enim facilis ipsam architecto. Adipisci debitis minima quia aut rerum culpa. Adipisci expedita ut voluptas laboriosam et vel accusamus aut.', '2025-01-16 04:05:31'),
(0x01946d49aa2975f98fcafcb5b635fa9a, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d4977867a26b5a077a5eaa7a44c, 'Aut repudiandae nobis nihil voluptas. Impedit voluptas non repudiandae velit non exercitationem neque. Maxime voluptas repellendus mollitia rem animi voluptatem dolorum.', '2025-01-16 04:05:31'),
(0x01946d49ac6d74f4bf8aa13ffb5cf9ab, 0x01946d49663574eb8545169ed3274c6e, 0x01946d4970537996948e0afe7b62897a, 'Aut quis voluptatem autem architecto velit dolor dolores. Natus veniam iusto voluptatem eligendi rerum non quia. Velit qui nobis placeat et molestiae id temporibus perferendis.', '2025-01-16 04:05:32'),
(0x01946d49ac9a7dee9841551a09ca8f9a, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496f1179ee8c7668650d4e7b59, 'Saepe debitis facilis ipsam beatae. Nihil animi repellendus amet aut. Voluptas similique et unde dolorem minima ut soluta.', '2025-01-16 04:05:32'),
(0x01946d49acf57b5b992ed822f346b1f9, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d4972a97fc4a022e52df7a54a41, 'Ut ipsum consequuntur aut alias et magnam laboriosam iste. Est recusandae autem et rerum officiis. Corporis non eveniet ex ea.', '2025-01-16 04:05:32'),
(0x01946d49ad2473469643fbabcabe2337, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496e327092868837f010be0a53, 'Id et ex pariatur minus natus recusandae quo. Hic voluptas maxime sed sint doloribus harum quia. Aut eum quia consequatur modi quasi. Quam voluptates ipsum dignissimos omnis aut eligendi.', '2025-01-16 04:05:32'),
(0x01946d49ad5c7652baad8fc3c26496b4, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d49723a78c09e7cb76ee3301adc, 'Voluptatem molestiae ex accusantium in repellat perspiciatis alias. Beatae ab officia corrupti quia accusamus quam. Possimus aut est occaecati tempora iusto sit. Ab voluptatum amet itaque voluptatem.', '2025-01-16 04:05:32'),
(0x01946d49ad6f7ac39a5036c7605948e6, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d4972d47c8f925a9516dcffb9df, 'Qui sint corrupti quaerat beatae labore. Natus dolor cupiditate ut cumque ad cumque. Officiis non nihil eos praesentium ipsa facere. Nobis veritatis perspiciatis ut repellendus dolores.', '2025-01-16 04:05:32'),
(0x01946d49ad86722283c4aa7441a596c5, 0x01946d49633f785da764361dea9a2f2e, 0x01946d496e4775a7845e8f40de48bbf1, 'Magnam cumque quia sunt voluptatem nihil perferendis culpa. Ex non sit at in. Magni culpa et et eos.', '2025-01-16 04:05:32'),
(0x01946d49ad9d7651bc689730d8c5f93a, 0x01946d495484741ca967e85e0aa211fe, 0x01946d4970137f7e89b0cf333f08d059, 'Quisquam in nemo accusantium excepturi et. Maiores neque ipsa ratione eos quos. Veniam tempora quo consequatur quidem porro. Praesentium deserunt corrupti molestiae est.', '2025-01-16 04:05:32'),
(0x01946d49adb57602805efb5a3950ef18, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496c2c7758bf244baf6b45c818, 'Labore est fuga in voluptatum minima. Alias adipisci accusamus dolores voluptas eos et. Iste quidem qui sed doloremque. Quia fugit ad quam.', '2025-01-16 04:05:32'),
(0x01946d49addd7c37bbc7fe4a7f5314b5, 0x01946d494af27f568b966579421d81e0, 0x01946d496c3a7c118bc6aba5c2c47fc5, 'Exercitationem nihil recusandae omnis in et itaque minima et. Dolores odio porro aut quis odit. Ab deserunt consequatur molestias minus sequi. Voluptas cum minima eius.', '2025-01-16 04:05:32'),
(0x01946d49adf77ee3a62257791d67c4cf, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496e6578b89f8544bf67ef30b3, 'Aliquam consequuntur ut nam nesciunt facilis. Praesentium cumque sequi ratione minus. Et repudiandae praesentium modi ut et deleniti.', '2025-01-16 04:05:32'),
(0x01946d49afd27a86acfa1109f23e594f, 0x01946d49663574eb8545169ed3274c6e, 0x01946d496c3374ac90ef30d98b594429, 'Accusamus ducimus est dolores assumenda. Accusantium perferendis repellat recusandae commodi. Laboriosam quia et non animi.', '2025-01-16 04:05:33'),
(0x01946d49b0ba7454985e69e2790c35ae, 0x01946d49663574eb8545169ed3274c6e, 0x01946d496e5d7612aeaa9825f74a22e9, 'Et aut consectetur est rerum cumque quia quisquam. Ea id nobis non tenetur mollitia. Non voluptatibus omnis quam. Dolorem et aliquam cupiditate earum quis blanditiis mollitia.', '2025-01-16 04:05:33'),
(0x01946d49b29277c7abad6993ba41823d, 0x01946d4956d0798fb4a5772c58512186, 0x01946d4970c17524acf200c6f21e2c5b, 'Pariatur doloribus quis blanditiis id. Rerum sit incidunt qui enim occaecati qui.', '2025-01-16 04:05:34'),
(0x01946d49b6427e72bba436ed7eb86d1e, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d4972df772e861463fd1fc32f11, 'Aut ullam quia et sit voluptates aut. Eum maxime repellendus ut fugit. Repellendus sed amet maiores ut perspiciatis voluptates.', '2025-01-16 04:05:35'),
(0x01946d49bb26793786fb37ebe21db732, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d496e5d7612aeaa9825f74a22e9, 'Quod debitis perferendis autem dolorem enim id ut quos. Ut saepe porro et numquam. Quae impedit assumenda distinctio id qui ut sapiente.', '2025-01-16 04:05:36'),
(0x01946d49bc987498af3e5a8b29698b7a, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d496be7778ca23bbaf0a08ee7c2, 'Architecto blanditiis quae quia perspiciatis consequatur. Et qui pariatur laboriosam. Cum voluptates temporibus magni consequuntur. Sed corrupti est fugit voluptas incidunt quia.', '2025-01-16 04:05:36'),
(0x01946d49be7070bf8071437ccd3ff3ce, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496e01756393299966f1638b27, 'Molestias est fuga cupiditate beatae et voluptates quia. Et ipsum ratione porro. Vel inventore architecto rerum sit.', '2025-01-16 04:05:37'),
(0x01946d49c195705cabecee9a55ef65f4, 0x01946d49604476628930f705e69e412e, 0x01946d496c7574b7b214af23c5fb6bb5, 'Quia quia illo unde fugiat sed cum nemo ratione. Cupiditate soluta ipsam esse saepe deserunt ipsum. Minus est officia a quasi blanditiis repellendus rerum eveniet. Sint nemo qui voluptas.', '2025-01-16 04:05:37'),
(0x01946d49c71173c2ba97a56ee0acbf96, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496e57721c898d65498ae630de, 'Perspiciatis architecto nobis repudiandae sed qui ut rem. Quis saepe voluptate doloribus dolores nisi. Suscipit porro magnam quod est similique.', '2025-01-16 04:05:39'),
(0x01946d49c92a7adaa719e98776012388, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496c85782aabc7073c112ee34a, 'Deserunt aspernatur et eligendi quod. Est amet dolorem esse illo esse et cupiditate. Assumenda non et libero sunt reiciendis. Excepturi molestiae eius molestiae labore dolor.', '2025-01-16 04:05:39'),
(0x01946d49cbad7aff9c2a56e1a6e19671, 0x01946d494af27f568b966579421d81e0, 0x01946d496c1677c88aab347efb560746, 'Est ducimus et facere in dolores dolore. Quidem accusamus architecto quod quos minus. Quia fugit provident quo cupiditate omnis accusamus. Tenetur in iusto consequuntur voluptatibus deserunt.', '2025-01-16 04:05:40'),
(0x01946d49cbc678bbafb2b35d3c294cf0, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496c4b73cdac4d717da6abc917, 'Ipsam sequi et quia esse molestiae eos. Et ipsum laborum sed non magni vel rerum. Voluptas in laborum asperiores consequatur eos quaerat. Dolores quia qui et. Quaerat dolore ad omnis modi voluptas.', '2025-01-16 04:05:40'),
(0x01946d49cbe175da8e6b841e7fbfe2c5, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496e01756393299966f1638b27, 'Est similique et illum velit odit accusamus voluptatem. Ipsam qui reprehenderit dolorem facilis nesciunt ducimus libero voluptatem. Voluptas accusantium at voluptas iure aut.', '2025-01-16 04:05:40'),
(0x01946d49cbf97fbbb808e34d21a90561, 0x01946d4956d0798fb4a5772c58512186, 0x01946d496c3a7c118bc6aba5c2c47fc5, 'Temporibus reprehenderit a facere nihil consequatur. Sint et repellat numquam vel possimus optio. Iste sed recusandae non itaque atque. Dolorem et nihil nihil est tempora distinctio.', '2025-01-16 04:05:40'),
(0x01946d49cc14766783300c59e3e43aa6, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496fcf79f8a922414839d17dde, 'Rerum omnis tempora inventore voluptatum ratione et. Fugiat perspiciatis corrupti dolorem dicta ducimus. Est cumque non quia illum excepturi sunt molestias.', '2025-01-16 04:05:40'),
(0x01946d49cc2c705eb979bf94b892a11e, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d496c0f773db98ccb22cd02c713, 'Facilis doloribus ut quidem odio unde. Rerum laboriosam id quaerat sed. Corrupti minima deserunt suscipit. Sunt nesciunt et aut sunt saepe.', '2025-01-16 04:05:40'),
(0x01946d49cc4576a3ad5e9c7634475872, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496f1179ee8c7668650d4e7b59, 'Inventore qui expedita recusandae eos est eveniet asperiores voluptatibus. Nostrum nemo ut cum nostrum architecto. Ipsa ipsam accusantium officia.', '2025-01-16 04:05:40'),
(0x01946d49cc5d70df9ff8f6696362fc78, 0x01946d49633f785da764361dea9a2f2e, 0x01946d49723a78c09e7cb76ee3301adc, 'Quia qui reprehenderit porro magni. Consequatur sunt eveniet qui expedita minima optio repellendus. Iste voluptas quo officia occaecati quae sapiente voluptate.', '2025-01-16 04:05:40'),
(0x01946d49d27a76398fa5ccb41e1d397d, 0x01946d49663574eb8545169ed3274c6e, 0x01946d496e6c7ec69b381b67b9443995, 'Minus blanditiis sint nobis modi nobis quis quis. Consequatur qui ut non omnis qui ex repellendus sunt. Iure repellat aperiam explicabo unde rerum. Ab eum accusantium omnis quae earum.', '2025-01-16 04:05:42'),
(0x01946d49d28e7cacabc2bb59d92e2de4, 0x01946d495241765d91f1fc71f4a04985, 0x01946d49728c7fc5afb926e9a6fbbb2d, 'Repellat consequuntur doloribus quo impedit iusto culpa. Maiores id saepe qui architecto sed. Delectus voluptas id assumenda sed magni nostrum.', '2025-01-16 04:05:42'),
(0x01946d49d2a5795992bd19d6bbe45cfd, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d49703279cdbd6ac01021f8095e, 'Totam cupiditate sit est est vitae. Fugiat quo velit sed aut voluptas. Veniam quibusdam voluptas odio autem et.', '2025-01-16 04:05:42'),
(0x01946d49d2bb7aba8933346db79db9bc, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d49703279cdbd6ac01021f8095e, 'Voluptatibus eligendi cumque dolorum eaque. Porro molestiae quae dolor vel natus. In nobis optio impedit velit quas rerum libero.', '2025-01-16 04:05:42'),
(0x01946d49d2d673388c6ac76de7e29ecf, 0x01946d49604476628930f705e69e412e, 0x01946d496e1a7a65b618f577f5b4d010, 'Consequatur qui minus culpa quaerat aut provident. Dolor voluptas debitis ut exercitationem laudantium. Tempore est quis ut ut eaque soluta. Odio incidunt nihil et ullam.', '2025-01-16 04:05:42'),
(0x01946d49d2fa73d5932927e682b025a8, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496c9e7c04afb19b9e0cf29a86, 'Repudiandae quas porro impedit illum voluptatum architecto. Aperiam fugiat officiis et commodi nisi repellendus sed. Sed vel illo repellendus velit illo consequatur fugit.', '2025-01-16 04:05:42'),
(0x01946d49d3127fef80865b6e0bc4b8f1, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496c1677c88aab347efb560746, 'Nesciunt et numquam nihil molestiae. Esse laboriosam qui modi quasi incidunt. Ut incidunt magni voluptate debitis.', '2025-01-16 04:05:42'),
(0x01946d49d33273df9cd349c89225fdb4, 0x01946d494af27f568b966579421d81e0, 0x01946d496be7778ca23bbaf0a08ee7c2, 'Provident sit dolore explicabo autem. Voluptatem exercitationem molestiae sunt. Officiis rerum rem dolores.', '2025-01-16 04:05:42'),
(0x01946d49d4e27a8abd406263c82af4a7, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d496e01756393299966f1638b27, 'Temporibus rerum deserunt consequuntur ipsa maxime qui. Assumenda aut ea odit debitis qui. Minus aut eveniet sed itaque consequuntur quis. Officiis eligendi quia qui nisi deserunt alias id.', '2025-01-16 04:05:42'),
(0x01946d49d6867ecd8b3428398509afdb, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d496e6c7ec69b381b67b9443995, 'Porro et aut sit et exercitationem pariatur porro. Eos qui inventore et cumque quos. Neque corporis omnis doloremque enim numquam qui. Voluptatibus nihil consequuntur repellendus deserunt.', '2025-01-16 04:05:43'),
(0x01946d49d7707b69b4814e16e9ae1feb, 0x01946d494af27f568b966579421d81e0, 0x01946d49721976f9bff2327f818be719, 'Quos qui eos dolorem quasi deserunt voluptatibus labore. Cum quae itaque in ut doloremque deleniti est. Maiores dicta dolorem esse tenetur ut quia quidem.', '2025-01-16 04:05:43'),
(0x01946d49d78a7605bd52e94e42430a3c, 0x01946d49633f785da764361dea9a2f2e, 0x01946d49779e7626a7931f9e2b773892, 'Pariatur voluptates quam est dignissimos amet tenetur sunt. Qui fugiat beatae minus iste. Est molestiae eum deserunt dolore optio.', '2025-01-16 04:05:43'),
(0x01946d49d7a77439bfe261994c23946c, 0x01946d49663574eb8545169ed3274c6e, 0x01946d4977867a26b5a077a5eaa7a44c, 'Eaque voluptatem sed dolores aut quibusdam recusandae quisquam. Quo corporis veniam sed quaerat porro temporibus.', '2025-01-16 04:05:43'),
(0x01946d49d7be7616b315bc96cb543c03, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d4970697f9d99b441be9d89bed5, 'Magni est sit modi inventore et nobis rerum. Maxime aperiam ut occaecati alias maiores tempore. Sit voluptatem sint aspernatur facere enim.', '2025-01-16 04:05:43'),
(0x01946d49d7d17c0fa4311debbd54b4e6, 0x01946d495241765d91f1fc71f4a04985, 0x01946d4976d67821b452ea566da8db3c, 'Autem voluptatem officia velit vel. Dolor est maxime ipsa quaerat sit quod. Delectus tempora corporis alias molestiae cumque alias.', '2025-01-16 04:05:43'),
(0x01946d49d7e5748e9fdf7ee6a387b8e7, 0x01946d49663574eb8545169ed3274c6e, 0x01946d4977317a1fbe2634801f3f042a, 'Voluptatibus eos eius dignissimos atque cumque ut et non. Laboriosam suscipit vero quam nihil harum cum animi. Ut reprehenderit molestiae id occaecati.', '2025-01-16 04:05:43'),
(0x01946d49d8017cb684a0777234bf67b4, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d4977317a1fbe2634801f3f042a, 'Vel est aut laboriosam aperiam. Impedit omnis consequatur exercitationem consequatur qui ea eveniet amet. Debitis ut quia molestias labore sunt deleniti eveniet dolor. Enim placeat et recusandae est.', '2025-01-16 04:05:43'),
(0x01946d49d8217904ae85c955ab9a84bc, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d496d0d77be8918fe43fa7b6833, 'Nostrum ut delectus et repellendus laudantium voluptas inventore. Atque harum perspiciatis tempora nam. Aliquid quisquam cum et autem ipsam.', '2025-01-16 04:05:43'),
(0x01946d49d847741aa4ce8b262c22a63b, 0x01946d49663574eb8545169ed3274c6e, 0x01946d4970b17ceba23b380eeeb3d739, 'Autem ut voluptas dignissimos nihil nobis. Harum quaerat qui nihil consectetur. Illum repellendus ducimus accusantium velit.', '2025-01-16 04:05:43'),
(0x01946d49d98b7cdeb876b46c70730888, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d497076789c98a3098e34ff5347, 'Dolores dolorem est alias ullam. Voluptatem recusandae velit nihil nobis rem. Voluptas autem porro non ipsam ut repellat. Dolores dignissimos nobis aliquam cumque dicta a et.', '2025-01-16 04:05:43'),
(0x01946d49dc497dffaf993539e455c097, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d4972df772e861463fd1fc32f11, 'Et ut minus dignissimos esse quia atque qui. Reiciendis consequatur accusamus et et hic laborum corporis. Eum sapiente nam quas numquam.', '2025-01-16 04:05:44'),
(0x01946d49dd447a8c870a93389c0adc85, 0x01946d49604476628930f705e69e412e, 0x01946d496e57721c898d65498ae630de, 'Sequi asperiores inventore delectus. Eveniet laborum cum et tenetur ratione fugit. Non optio at et labore.', '2025-01-16 04:05:44'),
(0x01946d49de6373c9af4e8067f2f4f17a, 0x01946d49633f785da764361dea9a2f2e, 0x01946d49723a78c09e7cb76ee3301adc, 'Voluptas odit eos quo minus dolore nisi. Et molestiae velit sit animi sed aperiam dolor. Nam et in aliquid minima hic et explicabo minima.', '2025-01-16 04:05:45'),
(0x01946d49de7c724ca1b99194ce209afe, 0x01946d49633f785da764361dea9a2f2e, 0x01946d4972967292a494aec0422cf96b, 'Cum aut veniam vel officiis. Odio maiores sunt quasi et rerum qui. Quisquam ex neque eos quisquam. Quibusdam dolorem ea voluptatibus sit consequatur unde.', '2025-01-16 04:05:45'),
(0x01946d49de91733eac54ae7e35efa785, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496e57721c898d65498ae630de, 'Autem commodi praesentium temporibus soluta quam. Voluptas et eum omnis iusto mollitia at. Et fugiat quaerat id aperiam.', '2025-01-16 04:05:45'),
(0x01946d49dea774f682daad1ad3ce0f5a, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d49709a7f83a7c510f7884d9c65, 'Exercitationem aperiam qui unde magni voluptas sit qui voluptatem. Qui voluptas placeat est reprehenderit. Dolores numquam voluptas minima natus.', '2025-01-16 04:05:45'),
(0x01946d49dec0747b9198f54146430e13, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d49725a70ef8d8a18395ba7e598, 'Excepturi similique labore unde quia. Voluptatem et cupiditate quibusdam laudantium aut cum et consequatur. Ipsum aut eius reprehenderit inventore at odit.', '2025-01-16 04:05:45'),
(0x01946d49ded87d1690f4e6c4205af7e4, 0x01946d495484741ca967e85e0aa211fe, 0x01946d49723a78c09e7cb76ee3301adc, 'Non occaecati qui labore dolor. Consequatur et quibusdam laborum eum eaque modi qui. Molestiae hic et qui odit a dolores quo. Eligendi asperiores reiciendis qui ipsa. Eius ut repellat quibusdam eum.', '2025-01-16 04:05:45'),
(0x01946d49def57a1fa084a9e216ce7dcf, 0x01946d4956d0798fb4a5772c58512186, 0x01946d496c607be8b2e90a37882e6c31, 'Quo ea et placeat occaecati. Eius et veritatis rerum. Inventore molestiae natus quibusdam sit. Et provident dicta laudantium animi quia voluptates.', '2025-01-16 04:05:45'),
(0x01946d49df0e74a1beee66d41c372df9, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496c1d7952ba610f72b5e4a4f7, 'Dolore rerum recusandae in dolores repudiandae quod velit. Iure dolore magnam consequuntur. Atque autem sit voluptas iste. Ullam dolorem itaque dicta voluptas.', '2025-01-16 04:05:45'),
(0x01946d49df247b30a9d36095dc95ab0d, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d496c037350ac2cefaa8b1e8df9, 'Consequatur distinctio ut alias ab laboriosam consequatur. Tempora aut cum qui. Possimus a facilis deserunt et. Minus pariatur officiis fugiat fugit sit. Et ipsam recusandae consequatur illum at.', '2025-01-16 04:05:45'),
(0x01946d49df3d7cc899938b7a918db6e4, 0x01946d495484741ca967e85e0aa211fe, 0x01946d496c0f773db98ccb22cd02c713, 'Autem ut et qui repellendus in non sed. Sequi tempore vero eius deserunt vel. Optio consequuntur possimus fugit hic ab nesciunt.', '2025-01-16 04:05:45'),
(0x01946d49df537156b1156b1d848c7561, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d496f1179ee8c7668650d4e7b59, 'Voluptatem maiores rerum laborum quam qui quis sint. Sit nihil corrupti ut ipsum sed velit quia. Doloribus quis earum molestiae nisi. Officiis occaecati sed nemo.', '2025-01-16 04:05:45'),
(0x01946d49df677acf9cf002944dda03d1, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d4977317a1fbe2634801f3f042a, 'Voluptatem occaecati voluptatibus aut consectetur. Aliquid velit consequuntur consequuntur ad vel porro maiores.', '2025-01-16 04:05:45'),
(0x01946d49df82786498724056fcf54fc1, 0x01946d495241765d91f1fc71f4a04985, 0x01946d4976eb7f44b136bfdc31329440, 'Perspiciatis qui consequatur qui distinctio nam distinctio facere. Hic rerum commodi consectetur et. Ea illum suscipit et et nihil quia dignissimos. Autem et occaecati accusantium et atque rerum.', '2025-01-16 04:05:45'),
(0x01946d49df987426a1b9b05d627de4eb, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496bf07847813e9678443b397f, 'Dolorem id quis rerum vero ut sit. Soluta voluptatem corrupti sint sint porro blanditiis ut. Aut neque alias voluptatem minus suscipit.', '2025-01-16 04:05:45'),
(0x01946d49dfb2749e914d2401d6bce8b4, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d4976fd75a6bf34a9720684336d, 'Rem soluta et aut neque ad. Commodi fugiat reiciendis iusto rem sequi. Consequuntur aut molestiae voluptatem nobis labore. Architecto illo dolore distinctio dolorem saepe odit maxime accusamus.', '2025-01-16 04:05:45'),
(0x01946d49dfc875fdb455471b63ce2180, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496e327092868837f010be0a53, 'Et labore voluptate non enim iure. Nam officiis accusantium ea. In ipsa laborum itaque repudiandae temporibus eius. Laudantium doloremque veritatis asperiores veritatis non sed.', '2025-01-16 04:05:45'),
(0x01946d49dfe870bc8b832cb5b537efcd, 0x01946d495241765d91f1fc71f4a04985, 0x01946d4972ca735b9be2f29982234455, 'Et est exercitationem odit necessitatibus explicabo ipsam fuga. Aut laboriosam a minima enim quae placeat unde. At est maiores laborum doloribus soluta molestias cupiditate ipsam.', '2025-01-16 04:05:45'),
(0x01946d49dfff7fe5b0687ced7c664cf9, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d4970c17524acf200c6f21e2c5b, 'Sed impedit et porro neque deleniti eos. Possimus omnis quis sint eos impedit dolore fugit. Asperiores aut necessitatibus ullam ut molestiae odit suscipit suscipit.', '2025-01-16 04:05:45'),
(0x01946d49e4dd7b6bae401bd1dafb6bef, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496c85782aabc7073c112ee34a, 'Et sapiente et commodi similique consequuntur ipsum. Iure soluta totam perspiciatis tempora incidunt soluta dolores perspiciatis. Pariatur error blanditiis quidem consectetur.', '2025-01-16 04:05:47'),
(0x01946d49e6e270b6a64960ecfa84b726, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496c1677c88aab347efb560746, 'Reprehenderit ex qui voluptate sint cumque unde. Laborum ducimus temporibus voluptatem quo qui aperiam esse. Totam numquam eos et omnis.', '2025-01-16 04:05:47'),
(0x01946d49e7cd7cc7bd9a9ccbcdca8c3b, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d4976fd75a6bf34a9720684336d, 'Ipsa veniam exercitationem aliquid aut amet et. Ex nesciunt et praesentium exercitationem. Aliquid sequi natus aut repudiandae quod.', '2025-01-16 04:05:47'),
(0x01946d49e9207730a7e70bb6d5e08f10, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496e1a7a65b618f577f5b4d010, 'Dolor autem quia impedit voluptatum ea excepturi saepe. Vel et quam ut facere. Adipisci quia voluptas pariatur. Ut dolorum quos enim necessitatibus id alias. Alias quia ab voluptas repellat eius.', '2025-01-16 04:05:47'),
(0x01946d49eb057502ad03007cd636183d, 0x01946d49604476628930f705e69e412e, 0x01946d4972b274c6875c6496bba87878, 'Dolore sint culpa ab natus eius ea dolores. Consequatur est harum non temporibus. Aut nihil dolor delectus dolor.', '2025-01-16 04:05:48'),
(0x01946d49eea87c318ac30723eb9faacd, 0x01946d495484741ca967e85e0aa211fe, 0x01946d4972d47c8f925a9516dcffb9df, 'Unde labore asperiores sunt fugiat maxime molestiae est. Atque officiis quos aut. Voluptatem officia alias velit amet reiciendis. Cupiditate in vel reprehenderit debitis debitis aperiam et.', '2025-01-16 04:05:49'),
(0x01946d49ef8a7e038e4d14b984280f3b, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d496c527d6583de6fd0bab48e98, 'Non alias enim dolores unde quisquam tempora. Perspiciatis aut non fugiat veritatis soluta id asperiores qui. Dolor consequatur numquam exercitationem molestias nihil vitae ab.', '2025-01-16 04:05:49'),
(0x01946d49f156772cbc1e0d72d4fdef5c, 0x01946d494ff072d3ae46049791e593dc, 0x01946d4976eb7f44b136bfdc31329440, 'Quia dolores est quod similique architecto illo perferendis. Voluptatem sunt dolor laborum dolorum. Suscipit non possimus repellat rerum molestias fuga.', '2025-01-16 04:05:50'),
(0x01946d49f2ff778b879c5073be67af5b, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d4972d47c8f925a9516dcffb9df, 'Itaque deleniti odit quidem fugiat omnis rerum. Et expedita ipsam nam. Pariatur explicabo et non iure velit ducimus laudantium. Possimus qui totam sint soluta ad.', '2025-01-16 04:05:50'),
(0x01946d49f4ab7b96904ed13163c20ef7, 0x01946d49604476628930f705e69e412e, 0x01946d496fed72169f6c54799911c26d, 'Reiciendis recusandae omnis eos aliquam sunt repellat modi. Illo nostrum repellendus distinctio. Sapiente atque dolore odit distinctio.', '2025-01-16 04:05:51'),
(0x01946d49f6cb7a24a250ee0d9ab51ef8, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d49723a78c09e7cb76ee3301adc, 'Ut id facilis eligendi voluptate occaecati quam ullam. Ut voluptatem blanditiis est. Rem molestiae unde iure rerum.', '2025-01-16 04:05:51'),
(0x01946d49f71b7eccbc88b010df101c6f, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496c8f7340954524d94c33e803, 'Aspernatur provident veniam tempore corporis alias. Ut omnis sit consequuntur nam fuga pariatur. Quasi in qui dolorem qui quia omnis. Sed dolorum non voluptas veritatis ipsam esse quis.', '2025-01-16 04:05:51'),
(0x01946d49f76e76f39c3b3871e1a723de, 0x01946d494af27f568b966579421d81e0, 0x01946d496fbe7c73acf3d435eb4b321d, 'Ducimus quo tenetur repellendus sequi sed. Aperiam cum architecto similique occaecati qui. Quo id omnis quisquam earum. Recusandae animi tenetur nemo odio quo ducimus eum.', '2025-01-16 04:05:51'),
(0x01946d49f78e7052a395aa5b7545122e, 0x01946d4956d0798fb4a5772c58512186, 0x01946d496ca57060a115be74664429ec, 'Deserunt atque architecto eius autem dignissimos. Placeat et sunt aut deleniti placeat. Nihil non ut dolorum enim voluptas beatae fugit.', '2025-01-16 04:05:51'),
(0x01946d49f7a371ab9db27fb6efad3703, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d49703279cdbd6ac01021f8095e, 'Dolor vel assumenda mollitia voluptatem sed magni. Adipisci id et rerum magnam. Esse commodi mollitia rem et ut vitae sapiente.', '2025-01-16 04:05:51'),
(0x01946d49fd1f7ff98df5bfbd146ccd72, 0x01946d49633f785da764361dea9a2f2e, 0x01946d4976eb7f44b136bfdc31329440, 'Id dolore exercitationem soluta velit. Sunt atque ratione doloremque. Amet voluptatem rerum est nihil. Vero labore similique est perferendis maxime.', '2025-01-16 04:05:53'),
(0x01946d49fd387271819c6e1e495e0957, 0x01946d494af27f568b966579421d81e0, 0x01946d4977177741bfbf5bf7afb2fc92, 'Cum eos dolores architecto consequatur similique. Accusantium et non non ducimus quasi. Quia id eos quia delectus.', '2025-01-16 04:05:53'),
(0x01946d49fd4c7311bd0a6ed90f24acc2, 0x01946d494ff072d3ae46049791e593dc, 0x01946d4977617fa6bd9307edf352d70c, 'Ad exercitationem ipsa laborum autem nam voluptatem dicta. Ea consectetur ut pariatur vel vero in. Doloribus maiores libero a et est pariatur omnis tempora.', '2025-01-16 04:05:53'),
(0x01946d49fd5e77389a10c41c8b69c9cb, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d49739974d98a34998537fe56bc, 'Tempore non rerum consequatur non optio. Nesciunt ut quaerat deleniti labore facilis et rem. Pariatur fugiat velit omnis vel quidem et sapiente.', '2025-01-16 04:05:53'),
(0x01946d49fec27248843b4a3a0d1674e2, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d49703279cdbd6ac01021f8095e, 'Esse sunt est neque dolorum. Dolore minima nobis cum aut voluptate ab. Vero incidunt quo voluptas.', '2025-01-16 04:05:54'),
(0x01946d4a014371d589862c8f6991efc9, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496c3374ac90ef30d98b594429, 'Et et eaque minima exercitationem. Possimus facilis repudiandae magni. Sint repellendus sit quia aspernatur nostrum dicta.', '2025-01-16 04:05:54'),
(0x01946d4a01a071d7925b6e4e27ffc24d, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d4970c17524acf200c6f21e2c5b, 'Vero adipisci ut voluptatem sint. Ea voluptatem pariatur voluptas qui. Et labore et consequatur delectus ea facilis.', '2025-01-16 04:05:54'),
(0x01946d4a0262767db077eb20bf250340, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d49739974d98a34998537fe56bc, 'Aut modi velit assumenda eum quisquam enim vel. Aliquid cum delectus commodi. Repellat saepe expedita molestiae rerum officiis.', '2025-01-16 04:05:54'),
(0x01946d4a03847dd3b54c254314f75d2a, 0x01946d495484741ca967e85e0aa211fe, 0x01946d49704474398779f7b43884639f, 'Beatae qui consequatur modi officiis quisquam id. Dolor repudiandae tenetur ut est optio. Dignissimos officiis et cum facilis quos. Sunt ipsa minus rerum aut.', '2025-01-16 04:05:54'),
(0x01946d4a03a87c50b59d170243c28a77, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d4970697f9d99b441be9d89bed5, 'Reprehenderit sed praesentium suscipit qui earum repellendus. Deleniti eos quam sed aut. Id voluptas aut laboriosam quas. Quasi omnis ut omnis quia fugit.', '2025-01-16 04:05:54'),
(0x01946d4a04bd73f29a4571e97e369dfb, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d497697739598296de99768c970, 'Rerum praesentium alias corporis autem impedit ut neque ut. Perspiciatis et praesentium optio quisquam optio veniam tenetur voluptatem. Nesciunt et in at et.', '2025-01-16 04:05:55'),
(0x01946d4a056f76e8bb97af6c7f189e0c, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496c3a7c118bc6aba5c2c47fc5, 'Consequatur accusamus et sint. Enim earum aperiam ea qui blanditiis consequatur. Nihil magni ratione iusto dolorem dolor excepturi recusandae. Odio magnam sit sed voluptatem consequatur.', '2025-01-16 04:05:55'),
(0x01946d4a05857a289671a4d2558511bc, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d4970857ef38fd31739a24326e8, 'Tempore earum voluptatem non. Illum minus qui dolor non.', '2025-01-16 04:05:55'),
(0x01946d4a059f7013947caa4c501fde7a, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d4977867a26b5a077a5eaa7a44c, 'Rerum consequuntur distinctio ea ut quos laboriosam esse. Voluptas id cupiditate et maiores. Voluptatem consequatur in ea cupiditate nihil nesciunt.', '2025-01-16 04:05:55'),
(0x01946d4a05b77202bf9c19bebe4d4cec, 0x01946d495241765d91f1fc71f4a04985, 0x01946d49725a70ef8d8a18395ba7e598, 'Ipsum quo commodi necessitatibus soluta voluptas pariatur consequatur. Sed sapiente veniam distinctio vero accusamus. Rem architecto reiciendis consequatur repellat consequatur exercitationem quam.', '2025-01-16 04:05:55'),
(0x01946d4a05e373fb94134e3fc962c96b, 0x01946d494ff072d3ae46049791e593dc, 0x01946d497076789c98a3098e34ff5347, 'A temporibus ut recusandae. Ab minima ea id molestiae sunt molestias. Rerum ex inventore omnis et aspernatur sed et dolore.', '2025-01-16 04:05:55'),
(0x01946d4a06047f7fa68d84bbc1b70e47, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496e4f712893e3bec84ffc02d1, 'Et qui eum est quis veniam animi aut. Unde omnis et deleniti architecto qui mollitia. Voluptas rerum mollitia debitis ea.', '2025-01-16 04:05:55'),
(0x01946d4a062972538d323a7fd95f5158, 0x01946d495484741ca967e85e0aa211fe, 0x01946d496e1a7a65b618f577f5b4d010, 'Fuga est molestiae minus tempore corporis facilis modi. Vel nihil fugit labore quia ut unde quo. Debitis hic sapiente velit aut.', '2025-01-16 04:05:55'),
(0x01946d4a0644709cbc9f6215a3a1b421, 0x01946d494ff072d3ae46049791e593dc, 0x01946d49704474398779f7b43884639f, 'Repellat voluptas accusantium voluptatem et eveniet incidunt. Mollitia mollitia nostrum laborum tempora accusantium quos accusantium in. Earum alias id voluptas.', '2025-01-16 04:05:55'),
(0x01946d4a065b71129cf496be85dfa40d, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496e267ad388b9ce3561c80f57, 'Quos accusantium repellendus veniam id magni veritatis et. Magnam rerum qui sit laudantium quia aut perferendis. Aut vel possimus quod.', '2025-01-16 04:05:55'),
(0x01946d4a067d7fd092d940a89f9856c4, 0x01946d4959267ad6b9c37f203a4f15a6, 0x01946d496e57721c898d65498ae630de, 'Consequuntur perspiciatis tempora ut ut maxime. Illo at voluptas ratione esse saepe quibusdam. Expedita animi ratione amet soluta cum omnis labore assumenda.', '2025-01-16 04:05:55'),
(0x01946d4a0769702abbef408c5a1a08c9, 0x01946d49604476628930f705e69e412e, 0x01946d4970537996948e0afe7b62897a, 'Dolorem omnis debitis illo ipsa quod. Accusamus aut sunt tempore veniam nostrum numquam ullam.', '2025-01-16 04:05:55'),
(0x01946d4a07857b50a72fca603a214508, 0x01946d495241765d91f1fc71f4a04985, 0x01946d496c7b7b739ccae9dac50fca18, 'Repudiandae natus ut quo et. Occaecati repellat corrupti nostrum repellat corporis est debitis repudiandae. Et ratione expedita animi dolorem enim labore. Et perferendis praesentium placeat quod et.', '2025-01-16 04:05:55'),
(0x01946d4a07fd790899dec6ef28e81106, 0x01946d49633f785da764361dea9a2f2e, 0x01946d496fbe7c73acf3d435eb4b321d, 'Perferendis nemo eaque eveniet laborum consequatur harum inventore. Sint recusandae laborum recusandae ullam aut culpa repudiandae. Et quis consequuntur iste exercitationem ad minima quaerat.', '2025-01-16 04:05:55'),
(0x01946d4a0813700f8faacd43bf68db58, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496fae7e518689ce35858d3d10, 'Vel aut animi culpa qui. Quam sed labore consequatur et necessitatibus sit sunt blanditiis. Quo rerum omnis ut autem.', '2025-01-16 04:05:55'),
(0x01946d4a082b7fbd850a99f5b6fec7e8, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d496fd97158af8d816ce8e95588, 'Aliquid aperiam sunt id provident. Quam iusto error recusandae ea. Voluptatem iusto velit alias voluptatem. Voluptatem corporis asperiores sed ut est eius totam incidunt.', '2025-01-16 04:05:55'),
(0x01946d4a08427a96a1a09b5e2a5bb871, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d496e6c7ec69b381b67b9443995, 'Totam quia molestias recusandae iure cupiditate dolorum animi. Ea maiores omnis modi iste consequuntur laboriosam et. Laboriosam eaque quo aliquid unde consectetur alias. Aut ut vero sit quia.', '2025-01-16 04:05:55'),
(0x01946d4a088e798ba9f63c3d89c63fc8, 0x01946d494af27f568b966579421d81e0, 0x01946d496e327092868837f010be0a53, 'Voluptatem eligendi error eaque minima. Et ratione atque laboriosam repudiandae fugit. Quo enim ex id.', '2025-01-16 04:05:55'),
(0x01946d4a08aa7ffe96d354e621be1508, 0x01946d49604476628930f705e69e412e, 0x01946d496c2c7758bf244baf6b45c818, 'Omnis perspiciatis sed ad rerum suscipit aut eaque dolores. Quod ut enim labore fugiat. Enim qui eum recusandae aut.', '2025-01-16 04:05:56'),
(0x01946d4a08dd70b0bfdb7dad9b454ba2, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d49705c7e5c82993c075e79553c, 'Repellendus exercitationem quae facilis in eum illo velit aut. Nostrum et quia omnis ut minima. Officiis dignissimos soluta alias maiores. Nam numquam id rerum laboriosam.', '2025-01-16 04:05:56'),
(0x01946d4a0b367b3181d5293f685e534a, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d49779e7626a7931f9e2b773892, 'Qui aperiam aut nihil quidem. Fuga quo ut quo et totam dolor. Sequi minima iste tempora dolor qui. Non et amet neque voluptatibus quo aspernatur.', '2025-01-16 04:05:56'),
(0x01946d4a0bb270c28d4b4dba6e51eadc, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 0x01946d496fe179a5b388c64d1f5c5d99, 'Rerum rerum nisi est cum fugiat. Aut omnis iusto natus asperiores esse. Quam quasi corporis qui nihil cupiditate.', '2025-01-16 04:05:56'),
(0x01946d4a0bc772f784ff9248078495ff, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d496be7778ca23bbaf0a08ee7c2, 'Et rerum debitis aut minima corporis. Ducimus ut ullam veritatis optio architecto quam. Sunt ut doloremque modi cupiditate odit autem occaecati.', '2025-01-16 04:05:57'),
(0x01946d4a0d467b32b6b3078d49564991, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d496c7574b7b214af23c5fb6bb5, 'Necessitatibus nemo ut libero veritatis. Ex sed hic vitae et numquam cum quod. Iure excepturi cupiditate fugiat eius nulla quo excepturi. Beatae in dolor commodi accusantium quo.', '2025-01-16 04:05:57'),
(0x01946d4a0d5c7641a938222edcb5663f, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d496c8f7340954524d94c33e803, 'Ad impedit harum aut aut. Sit suscipit consequuntur nostrum omnis itaque repellat cupiditate. Corrupti laboriosam alias iste voluptatem sed hic quasi dolorum.', '2025-01-16 04:05:57'),
(0x01946d4a0d7570ee9a5d7e6f528849ea, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d496e5d7612aeaa9825f74a22e9, 'Rerum nisi dolorum et omnis illum vel delectus. Consequatur temporibus qui est alias fugit et. Quaerat labore incidunt velit quaerat mollitia qui ut reiciendis.', '2025-01-16 04:05:57'),
(0x01946d4a0d9770fe80ffc0405d8931d7, 0x01946d494ff072d3ae46049791e593dc, 0x01946d4976eb7f44b136bfdc31329440, 'Suscipit ut doloremque nemo laborum itaque assumenda. Neque quod non dolor eaque neque. Repellendus quia hic ratione dolores accusamus culpa neque.', '2025-01-16 04:05:57'),
(0x01946d4a0dae72a6adb1cdbf1c1de348, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496c427a0fb28f5dc34bb6be71, 'Nobis veritatis ab dignissimos et fugit nulla. Sed repudiandae possimus modi et optio placeat. Voluptate ut omnis commodi sed.', '2025-01-16 04:05:57'),
(0x01946d4a0ddc7a798979eff74319cfe4, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 0x01946d49704b77bcb754c24e0eac557f, 'Perferendis quisquam rerum delectus blanditiis voluptatem pariatur. Animi qui perspiciatis hic ut quia. Ducimus voluptatem illo saepe. Sapiente aliquam perferendis dolore beatae.', '2025-01-16 04:05:57'),
(0x01946d4a0dfa73238c93a80c50caf64a, 0x01946d49488f7f2b80de358c8beb0f0c, 0x01946d4976c579019288da1e1855636b, 'Eos minima quaerat saepe aut error odit laborum. Est asperiores dolores non et. Velit aut eos perspiciatis quam. Adipisci quasi sint sed numquam.', '2025-01-16 04:05:57'),
(0x01946d4a0e1271c18d6de0b1c8bb62c6, 0x01946d49604476628930f705e69e412e, 0x01946d4976fd75a6bf34a9720684336d, 'Illo consequuntur quae quo consequatur. Sunt culpa nulla magni dignissimos unde. Quia consequatur aut beatae occaecati.', '2025-01-16 04:05:57'),
(0x01946d4a0e2c78f1bd8b062a089f37f8, 0x01946d4968ef7892a660ce9fa9ea51bc, 0x01946d496bf07847813e9678443b397f, 'A id velit labore. Dolore quibusdam hic minima. Temporibus quas dolor qui voluptas tenetur eaque necessitatibus. Animi ut consectetur quis quisquam.', '2025-01-16 04:05:57'),
(0x01946d4a10087b7d8020a6c7b39fa4bf, 0x01946d49663574eb8545169ed3274c6e, 0x01946d496c467d0d98f43a24bb064e5c, 'Ipsa beatae similique sit exercitationem sed distinctio. Rerum aut non minus aut. Nemo hic voluptas distinctio ipsum dolorem.', '2025-01-16 04:05:57'),
(0x01946d4a11a37d859fb9f0ea1c9aab56, 0x01946d49633f785da764361dea9a2f2e, 0x01946d496c3a7c118bc6aba5c2c47fc5, 'Quibusdam maxime sequi animi. Impedit expedita quia dicta dolores eum quas. Non id magnam quibusdam repellendus esse esse rerum.', '2025-01-16 04:05:58'),
(0x01946d4a11c47f4aa744b4525e9f1892, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d49722c7513ab34c7b740e09ff4, 'Iure quas soluta molestias ut nobis. Sed maiores autem ut. Omnis enim vitae aspernatur dolorem. Quo vel soluta provident velit. Numquam fugiat quam quam rerum. Unde totam porro labore culpa incidunt.', '2025-01-16 04:05:58'),
(0x01946d4a11fb7902afc853f65ca0d0ef, 0x01946d495b7976a9a3329507aa4779f1, 0x01946d4970c17524acf200c6f21e2c5b, 'Optio qui illo libero quia nostrum est. Quis rerum autem aut quo nam necessitatibus. Quae in aut alias iste. Minima veniam vel hic illo non id.', '2025-01-16 04:05:58'),
(0x01946d4a120f7c11b6c32274299a7029, 0x01946d494ff072d3ae46049791e593dc, 0x01946d496c67742da740bee7aea78cb1, 'Vero necessitatibus quam sunt alias atque. In aut aliquid sed culpa.', '2025-01-16 04:05:58'),
(0x01946d4a124a73a2b42e7b1e0155ab6a, 0x01946d49663574eb8545169ed3274c6e, 0x01946d4970137f7e89b0cf333f08d059, 'Quod dolores sit omnis maxime totam aspernatur. Accusamus rerum illo sed vel et. Dolor quaerat ipsa autem iure fuga magnam porro. Ex ad quia iste rerum quos eius dolorem.', '2025-01-16 04:05:58'),
(0x01946d4a12617cd299072296c6093752, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496fed72169f6c54799911c26d, 'Assumenda et ut natus ea doloremque. Consequatur quia ratione neque qui voluptas eius omnis adipisci. Unde in nemo rerum sit et et et reprehenderit. Quo voluptatem quaerat numquam suscipit.', '2025-01-16 04:05:58'),
(0x01946d4a128c7f5fb7ff6850ef71fd61, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496c1677c88aab347efb560746, 'Minus iure quos hic eligendi in nemo doloribus eum. Aut voluptas reiciendis facere animi at. Autem qui fugit eos cupiditate quia reiciendis assumenda.', '2025-01-16 04:05:58'),
(0x01946d4a12a87aed903cb91d1d0cdb5c, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d49728c7fc5afb926e9a6fbbb2d, 'Sit magnam sunt ipsa quia explicabo et consequatur. Eum ex eveniet eos dicta quam adipisci ad. Labore cum perspiciatis quia impedit et. Veritatis quis perferendis sint omnis.', '2025-01-16 04:05:58'),
(0x01946d4a12c27214ab3c38a277b97bc9, 0x01946d494dab7d1b82373ca7c0e90ba6, 0x01946d496c1677c88aab347efb560746, 'Enim facilis saepe voluptate facere dolores necessitatibus aut accusamus. Velit dolor facere voluptas ipsa. Quia occaecati necessitatibus similique sequi.', '2025-01-16 04:05:58'),
(0x01946d4a12d7759d8accc7656aebf5d3, 0x01946d49633f785da764361dea9a2f2e, 0x01946d496c037350ac2cefaa8b1e8df9, 'Natus quod vel quae nam velit odit. Qui numquam minima est eius et tempore. Voluptatem rerum deserunt tempore rem iste. Doloribus eos iure excepturi praesentium provident consectetur dolorem.', '2025-01-16 04:05:58'),
(0x01946d4a155d77dd914645bbdc2fcf52, 0x01946d496b7677cd9c88909e78f37f75, 0x01946d49728c7fc5afb926e9a6fbbb2d, 'Officia harum ut sunt qui quia qui aut. Ad odio velit et eveniet. In dolor deserunt repudiandae quos et et alias.', '2025-01-16 04:05:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_images_posts`
--

CREATE TABLE `tbl_images_posts` (
  `public_id` varchar(150) NOT NULL,
  `post_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `secure_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_images_posts`
--

INSERT INTO `tbl_images_posts` (`public_id`, `post_id`, `name`, `image_url`, `secure_url`) VALUES
('https://via.placeholder.com/640x480.png/000033?text=molestias', 0x01946d49701d7dbf951b6b34a0de47a8, 'https://via.placeholder.com/640x480.png/000033?text=molestias', 'https://via.placeholder.com/640x480.png/000033?text=molestias', NULL),
('https://via.placeholder.com/640x480.png/000055?text=sunt', 0x01946d496e267ad388b9ce3561c80f57, 'https://via.placeholder.com/640x480.png/000055?text=sunt', 'https://via.placeholder.com/640x480.png/000055?text=sunt', NULL),
('https://via.placeholder.com/640x480.png/0000aa?text=autem', 0x01946d496c527d6583de6fd0bab48e98, 'https://via.placeholder.com/640x480.png/0000aa?text=autem', 'https://via.placeholder.com/640x480.png/0000aa?text=autem', NULL),
('https://via.placeholder.com/640x480.png/0000aa?text=dolores', 0x01946d49704474398779f7b43884639f, 'https://via.placeholder.com/640x480.png/0000aa?text=dolores', 'https://via.placeholder.com/640x480.png/0000aa?text=dolores', NULL),
('https://via.placeholder.com/640x480.png/0000bb?text=maiores', 0x01946d49779e7626a7931f9e2b773892, 'https://via.placeholder.com/640x480.png/0000bb?text=maiores', 'https://via.placeholder.com/640x480.png/0000bb?text=maiores', NULL),
('https://via.placeholder.com/640x480.png/0000cc?text=iusto', 0x01946d496e267ad388b9ce3561c80f57, 'https://via.placeholder.com/640x480.png/0000cc?text=iusto', 'https://via.placeholder.com/640x480.png/0000cc?text=iusto', NULL),
('https://via.placeholder.com/640x480.png/0000cc?text=maiores', 0x01946d496bdd71eab6c844cd8e20926f, 'https://via.placeholder.com/640x480.png/0000cc?text=maiores', 'https://via.placeholder.com/640x480.png/0000cc?text=maiores', NULL),
('https://via.placeholder.com/640x480.png/0000ee?text=reprehenderit', 0x01946d49727070b9b2d95a1721a64153, 'https://via.placeholder.com/640x480.png/0000ee?text=reprehenderit', 'https://via.placeholder.com/640x480.png/0000ee?text=reprehenderit', NULL),
('https://via.placeholder.com/640x480.png/0000ff?text=qui', 0x01946d49723a78c09e7cb76ee3301adc, 'https://via.placeholder.com/640x480.png/0000ff?text=qui', 'https://via.placeholder.com/640x480.png/0000ff?text=qui', NULL),
('https://via.placeholder.com/640x480.png/001100?text=accusantium', 0x01946d496fd97158af8d816ce8e95588, 'https://via.placeholder.com/640x480.png/001100?text=accusantium', 'https://via.placeholder.com/640x480.png/001100?text=accusantium', NULL),
('https://via.placeholder.com/640x480.png/001100?text=voluptatem', 0x01946d496fe179a5b388c64d1f5c5d99, 'https://via.placeholder.com/640x480.png/001100?text=voluptatem', 'https://via.placeholder.com/640x480.png/001100?text=voluptatem', NULL),
('https://via.placeholder.com/640x480.png/001133?text=voluptatem', 0x01946d496c8f7340954524d94c33e803, 'https://via.placeholder.com/640x480.png/001133?text=voluptatem', 'https://via.placeholder.com/640x480.png/001133?text=voluptatem', NULL),
('https://via.placeholder.com/640x480.png/001144?text=aliquam', 0x01946d496c607be8b2e90a37882e6c31, 'https://via.placeholder.com/640x480.png/001144?text=aliquam', 'https://via.placeholder.com/640x480.png/001144?text=aliquam', NULL),
('https://via.placeholder.com/640x480.png/001166?text=assumenda', 0x01946d496bdd71eab6c844cd8e20926f, 'https://via.placeholder.com/640x480.png/001166?text=assumenda', 'https://via.placeholder.com/640x480.png/001166?text=assumenda', NULL),
('https://via.placeholder.com/640x480.png/001166?text=beatae', 0x01946d4976d67821b452ea566da8db3c, 'https://via.placeholder.com/640x480.png/001166?text=beatae', 'https://via.placeholder.com/640x480.png/001166?text=beatae', NULL),
('https://via.placeholder.com/640x480.png/0011bb?text=cumque', 0x01946d496e327092868837f010be0a53, 'https://via.placeholder.com/640x480.png/0011bb?text=cumque', 'https://via.placeholder.com/640x480.png/0011bb?text=cumque', NULL),
('https://via.placeholder.com/640x480.png/0011cc?text=tempora', 0x01946d4977617fa6bd9307edf352d70c, 'https://via.placeholder.com/640x480.png/0011cc?text=tempora', 'https://via.placeholder.com/640x480.png/0011cc?text=tempora', NULL),
('https://via.placeholder.com/640x480.png/0011ff?text=nihil', 0x01946d4976eb7f44b136bfdc31329440, 'https://via.placeholder.com/640x480.png/0011ff?text=nihil', 'https://via.placeholder.com/640x480.png/0011ff?text=nihil', NULL),
('https://via.placeholder.com/640x480.png/0011ff?text=quibusdam', 0x01946d496f9076be84e386eab7a07325, 'https://via.placeholder.com/640x480.png/0011ff?text=quibusdam', 'https://via.placeholder.com/640x480.png/0011ff?text=quibusdam', NULL),
('https://via.placeholder.com/640x480.png/002200?text=ducimus', 0x01946d49703b78088e8f6b70266f1604, 'https://via.placeholder.com/640x480.png/002200?text=ducimus', 'https://via.placeholder.com/640x480.png/002200?text=ducimus', NULL),
('https://via.placeholder.com/640x480.png/002200?text=quia', 0x01946d496d0d77be8918fe43fa7b6833, 'https://via.placeholder.com/640x480.png/002200?text=quia', 'https://via.placeholder.com/640x480.png/002200?text=quia', NULL),
('https://via.placeholder.com/640x480.png/002211?text=sit', 0x01946d496d0d77be8918fe43fa7b6833, 'https://via.placeholder.com/640x480.png/002211?text=sit', 'https://via.placeholder.com/640x480.png/002211?text=sit', NULL),
('https://via.placeholder.com/640x480.png/002233?text=numquam', 0x01946d49705c7e5c82993c075e79553c, 'https://via.placeholder.com/640x480.png/002233?text=numquam', 'https://via.placeholder.com/640x480.png/002233?text=numquam', NULL),
('https://via.placeholder.com/640x480.png/002288?text=ipsum', 0x01946d49727070b9b2d95a1721a64153, 'https://via.placeholder.com/640x480.png/002288?text=ipsum', 'https://via.placeholder.com/640x480.png/002288?text=ipsum', NULL),
('https://via.placeholder.com/640x480.png/0022dd?text=sapiente', 0x01946d49722c7513ab34c7b740e09ff4, 'https://via.placeholder.com/640x480.png/0022dd?text=sapiente', 'https://via.placeholder.com/640x480.png/0022dd?text=sapiente', NULL),
('https://via.placeholder.com/640x480.png/0022ff?text=consequatur', 0x01946d4970857ef38fd31739a24326e8, 'https://via.placeholder.com/640x480.png/0022ff?text=consequatur', 'https://via.placeholder.com/640x480.png/0022ff?text=consequatur', NULL),
('https://via.placeholder.com/640x480.png/003322?text=molestias', 0x01946d496c3374ac90ef30d98b594429, 'https://via.placeholder.com/640x480.png/003322?text=molestias', 'https://via.placeholder.com/640x480.png/003322?text=molestias', NULL),
('https://via.placeholder.com/640x480.png/003355?text=natus', 0x01946d49705c7e5c82993c075e79553c, 'https://via.placeholder.com/640x480.png/003355?text=natus', 'https://via.placeholder.com/640x480.png/003355?text=natus', NULL),
('https://via.placeholder.com/640x480.png/0033dd?text=eos', 0x01946d4970137f7e89b0cf333f08d059, 'https://via.placeholder.com/640x480.png/0033dd?text=eos', 'https://via.placeholder.com/640x480.png/0033dd?text=eos', NULL),
('https://via.placeholder.com/640x480.png/0033ff?text=ipsam', 0x01946d496c3a7c118bc6aba5c2c47fc5, 'https://via.placeholder.com/640x480.png/0033ff?text=ipsam', 'https://via.placeholder.com/640x480.png/0033ff?text=ipsam', NULL),
('https://via.placeholder.com/640x480.png/004433?text=rerum', 0x01946d49725a70ef8d8a18395ba7e598, 'https://via.placeholder.com/640x480.png/004433?text=rerum', 'https://via.placeholder.com/640x480.png/004433?text=rerum', NULL),
('https://via.placeholder.com/640x480.png/004444?text=quis', 0x01946d496fbe7c73acf3d435eb4b321d, 'https://via.placeholder.com/640x480.png/004444?text=quis', 'https://via.placeholder.com/640x480.png/004444?text=quis', NULL),
('https://via.placeholder.com/640x480.png/004455?text=omnis', 0x01946d49727e7b69875c7d061a23f715, 'https://via.placeholder.com/640x480.png/004455?text=omnis', 'https://via.placeholder.com/640x480.png/004455?text=omnis', NULL),
('https://via.placeholder.com/640x480.png/0044aa?text=exercitationem', 0x01946d496e6c7ec69b381b67b9443995, 'https://via.placeholder.com/640x480.png/0044aa?text=exercitationem', 'https://via.placeholder.com/640x480.png/0044aa?text=exercitationem', NULL),
('https://via.placeholder.com/640x480.png/0044ee?text=aut', 0x01946d4972677ce99d17d757f6519b93, 'https://via.placeholder.com/640x480.png/0044ee?text=aut', 'https://via.placeholder.com/640x480.png/0044ee?text=aut', NULL),
('https://via.placeholder.com/640x480.png/005500?text=consequatur', 0x01946d496c427a0fb28f5dc34bb6be71, 'https://via.placeholder.com/640x480.png/005500?text=consequatur', 'https://via.placeholder.com/640x480.png/005500?text=consequatur', NULL),
('https://via.placeholder.com/640x480.png/005511?text=deleniti', 0x01946d4976eb7f44b136bfdc31329440, 'https://via.placeholder.com/640x480.png/005511?text=deleniti', 'https://via.placeholder.com/640x480.png/005511?text=deleniti', NULL),
('https://via.placeholder.com/640x480.png/005511?text=occaecati', 0x01946d496c467d0d98f43a24bb064e5c, 'https://via.placeholder.com/640x480.png/005511?text=occaecati', 'https://via.placeholder.com/640x480.png/005511?text=occaecati', NULL),
('https://via.placeholder.com/640x480.png/005511?text=vero', 0x01946d496d0d77be8918fe43fa7b6833, 'https://via.placeholder.com/640x480.png/005511?text=vero', 'https://via.placeholder.com/640x480.png/005511?text=vero', NULL),
('https://via.placeholder.com/640x480.png/005544?text=odio', 0x01946d49727e7b69875c7d061a23f715, 'https://via.placeholder.com/640x480.png/005544?text=odio', 'https://via.placeholder.com/640x480.png/005544?text=odio', NULL),
('https://via.placeholder.com/640x480.png/0055cc?text=eos', 0x01946d496c8a779c95dfe6af8ee52d0e, 'https://via.placeholder.com/640x480.png/0055cc?text=eos', 'https://via.placeholder.com/640x480.png/0055cc?text=eos', NULL),
('https://via.placeholder.com/640x480.png/0055cc?text=voluptate', 0x01946d4976fd75a6bf34a9720684336d, 'https://via.placeholder.com/640x480.png/0055cc?text=voluptate', 'https://via.placeholder.com/640x480.png/0055cc?text=voluptate', NULL),
('https://via.placeholder.com/640x480.png/0055ee?text=cupiditate', 0x01946d4972d47c8f925a9516dcffb9df, 'https://via.placeholder.com/640x480.png/0055ee?text=cupiditate', 'https://via.placeholder.com/640x480.png/0055ee?text=cupiditate', NULL),
('https://via.placeholder.com/640x480.png/0055ff?text=assumenda', 0x01946d496fae7e518689ce35858d3d10, 'https://via.placeholder.com/640x480.png/0055ff?text=assumenda', 'https://via.placeholder.com/640x480.png/0055ff?text=assumenda', NULL),
('https://via.placeholder.com/640x480.png/006600?text=voluptatum', 0x01946d49727070b9b2d95a1721a64153, 'https://via.placeholder.com/640x480.png/006600?text=voluptatum', 'https://via.placeholder.com/640x480.png/006600?text=voluptatum', NULL),
('https://via.placeholder.com/640x480.png/006644?text=explicabo', 0x01946d496c6f70d8917e86dd2a1856f1, 'https://via.placeholder.com/640x480.png/006644?text=explicabo', 'https://via.placeholder.com/640x480.png/006644?text=explicabo', NULL),
('https://via.placeholder.com/640x480.png/006644?text=rem', 0x01946d496c3374ac90ef30d98b594429, 'https://via.placeholder.com/640x480.png/006644?text=rem', 'https://via.placeholder.com/640x480.png/006644?text=rem', NULL),
('https://via.placeholder.com/640x480.png/006655?text=odio', 0x01946d496bdd71eab6c844cd8e20926f, 'https://via.placeholder.com/640x480.png/006655?text=odio', 'https://via.placeholder.com/640x480.png/006655?text=odio', NULL),
('https://via.placeholder.com/640x480.png/006677?text=quasi', 0x01946d4972b274c6875c6496bba87878, 'https://via.placeholder.com/640x480.png/006677?text=quasi', 'https://via.placeholder.com/640x480.png/006677?text=quasi', NULL),
('https://via.placeholder.com/640x480.png/0066cc?text=laboriosam', 0x01946d4972b274c6875c6496bba87878, 'https://via.placeholder.com/640x480.png/0066cc?text=laboriosam', 'https://via.placeholder.com/640x480.png/0066cc?text=laboriosam', NULL),
('https://via.placeholder.com/640x480.png/0066ff?text=eius', 0x01946d497076789c98a3098e34ff5347, 'https://via.placeholder.com/640x480.png/0066ff?text=eius', 'https://via.placeholder.com/640x480.png/0066ff?text=eius', NULL),
('https://via.placeholder.com/640x480.png/007711?text=officia', 0x01946d4977317a1fbe2634801f3f042a, 'https://via.placeholder.com/640x480.png/007711?text=officia', 'https://via.placeholder.com/640x480.png/007711?text=officia', NULL),
('https://via.placeholder.com/640x480.png/007711?text=ullam', 0x01946d496bf77b3c80a4f1c92c99da12, 'https://via.placeholder.com/640x480.png/007711?text=ullam', 'https://via.placeholder.com/640x480.png/007711?text=ullam', NULL),
('https://via.placeholder.com/640x480.png/007722?text=deserunt', 0x01946d4976c579019288da1e1855636b, 'https://via.placeholder.com/640x480.png/007722?text=deserunt', 'https://via.placeholder.com/640x480.png/007722?text=deserunt', NULL),
('https://via.placeholder.com/640x480.png/0077aa?text=sint', 0x01946d4970537996948e0afe7b62897a, 'https://via.placeholder.com/640x480.png/0077aa?text=sint', 'https://via.placeholder.com/640x480.png/0077aa?text=sint', NULL),
('https://via.placeholder.com/640x480.png/0077bb?text=qui', 0x01946d496c577ecf9600cf343953e4c3, 'https://via.placeholder.com/640x480.png/0077bb?text=qui', 'https://via.placeholder.com/640x480.png/0077bb?text=qui', NULL),
('https://via.placeholder.com/640x480.png/0077cc?text=sit', 0x01946d497177705b8cc84b26a940a955, 'https://via.placeholder.com/640x480.png/0077cc?text=sit', 'https://via.placeholder.com/640x480.png/0077cc?text=sit', NULL),
('https://via.placeholder.com/640x480.png/0077dd?text=illo', 0x01946d496bfd7d9992f1df2cc5ec04a5, 'https://via.placeholder.com/640x480.png/0077dd?text=illo', 'https://via.placeholder.com/640x480.png/0077dd?text=illo', NULL),
('https://via.placeholder.com/640x480.png/0077dd?text=sequi', 0x01946d4970b17ceba23b380eeeb3d739, 'https://via.placeholder.com/640x480.png/0077dd?text=sequi', 'https://via.placeholder.com/640x480.png/0077dd?text=sequi', NULL),
('https://via.placeholder.com/640x480.png/0077ee?text=cumque', 0x01946d497660794cb78f23a0a3047175, 'https://via.placeholder.com/640x480.png/0077ee?text=cumque', 'https://via.placeholder.com/640x480.png/0077ee?text=cumque', NULL),
('https://via.placeholder.com/640x480.png/008822?text=quos', 0x01946d496c3e7e7a823ad19f44cf9646, 'https://via.placeholder.com/640x480.png/008822?text=quos', 'https://via.placeholder.com/640x480.png/008822?text=quos', NULL),
('https://via.placeholder.com/640x480.png/008888?text=repudiandae', 0x01946d49703b78088e8f6b70266f1604, 'https://via.placeholder.com/640x480.png/008888?text=repudiandae', 'https://via.placeholder.com/640x480.png/008888?text=repudiandae', NULL),
('https://via.placeholder.com/640x480.png/009900?text=iure', 0x01946d496c037350ac2cefaa8b1e8df9, 'https://via.placeholder.com/640x480.png/009900?text=iure', 'https://via.placeholder.com/640x480.png/009900?text=iure', NULL),
('https://via.placeholder.com/640x480.png/009911?text=quis', 0x01946d4970257388ba404a7f262c9801, 'https://via.placeholder.com/640x480.png/009911?text=quis', 'https://via.placeholder.com/640x480.png/009911?text=quis', NULL),
('https://via.placeholder.com/640x480.png/009955?text=enim', 0x01946d49779e7626a7931f9e2b773892, 'https://via.placeholder.com/640x480.png/009955?text=enim', 'https://via.placeholder.com/640x480.png/009955?text=enim', NULL),
('https://via.placeholder.com/640x480.png/0099cc?text=culpa', 0x01946d496ffe7970b9d7e7d61138ab58, 'https://via.placeholder.com/640x480.png/0099cc?text=culpa', 'https://via.placeholder.com/640x480.png/0099cc?text=culpa', NULL),
('https://via.placeholder.com/640x480.png/0099ff?text=suscipit', 0x01946d496c85782aabc7073c112ee34a, 'https://via.placeholder.com/640x480.png/0099ff?text=suscipit', 'https://via.placeholder.com/640x480.png/0099ff?text=suscipit', NULL),
('https://via.placeholder.com/640x480.png/00aa11?text=architecto', 0x01946d496e5d7612aeaa9825f74a22e9, 'https://via.placeholder.com/640x480.png/00aa11?text=architecto', 'https://via.placeholder.com/640x480.png/00aa11?text=architecto', NULL),
('https://via.placeholder.com/640x480.png/00aa11?text=ratione', 0x01946d496bdd71eab6c844cd8e20926f, 'https://via.placeholder.com/640x480.png/00aa11?text=ratione', 'https://via.placeholder.com/640x480.png/00aa11?text=ratione', NULL),
('https://via.placeholder.com/640x480.png/00aa55?text=necessitatibus', 0x01946d496e5d7612aeaa9825f74a22e9, 'https://via.placeholder.com/640x480.png/00aa55?text=necessitatibus', 'https://via.placeholder.com/640x480.png/00aa55?text=necessitatibus', NULL),
('https://via.placeholder.com/640x480.png/00aa77?text=autem', 0x01946d496c607be8b2e90a37882e6c31, 'https://via.placeholder.com/640x480.png/00aa77?text=autem', 'https://via.placeholder.com/640x480.png/00aa77?text=autem', NULL),
('https://via.placeholder.com/640x480.png/00aa77?text=et', 0x01946d4977867a26b5a077a5eaa7a44c, 'https://via.placeholder.com/640x480.png/00aa77?text=et', 'https://via.placeholder.com/640x480.png/00aa77?text=et', NULL),
('https://via.placeholder.com/640x480.png/00bb11?text=et', 0x01946d496c097d09945ad0ceac6f20e6, 'https://via.placeholder.com/640x480.png/00bb11?text=et', 'https://via.placeholder.com/640x480.png/00bb11?text=et', NULL),
('https://via.placeholder.com/640x480.png/00bb22?text=quas', 0x01946d4977617fa6bd9307edf352d70c, 'https://via.placeholder.com/640x480.png/00bb22?text=quas', 'https://via.placeholder.com/640x480.png/00bb22?text=quas', NULL),
('https://via.placeholder.com/640x480.png/00bb22?text=quia', 0x01946d496c6f70d8917e86dd2a1856f1, 'https://via.placeholder.com/640x480.png/00bb22?text=quia', 'https://via.placeholder.com/640x480.png/00bb22?text=quia', NULL),
('https://via.placeholder.com/640x480.png/00bb55?text=facere', 0x01946d4970257388ba404a7f262c9801, 'https://via.placeholder.com/640x480.png/00bb55?text=facere', 'https://via.placeholder.com/640x480.png/00bb55?text=facere', NULL),
('https://via.placeholder.com/640x480.png/00bb88?text=quaerat', 0x01946d496e7a78379afae2f0027b68e9, 'https://via.placeholder.com/640x480.png/00bb88?text=quaerat', 'https://via.placeholder.com/640x480.png/00bb88?text=quaerat', NULL),
('https://via.placeholder.com/640x480.png/00bb99?text=accusantium', 0x01946d496e57721c898d65498ae630de, 'https://via.placeholder.com/640x480.png/00bb99?text=accusantium', 'https://via.placeholder.com/640x480.png/00bb99?text=accusantium', NULL),
('https://via.placeholder.com/640x480.png/00bbdd?text=aut', 0x01946d496bdd71eab6c844cd8e20926f, 'https://via.placeholder.com/640x480.png/00bbdd?text=aut', 'https://via.placeholder.com/640x480.png/00bbdd?text=aut', NULL),
('https://via.placeholder.com/640x480.png/00bbdd?text=consequatur', 0x01946d496c3e7e7a823ad19f44cf9646, 'https://via.placeholder.com/640x480.png/00bbdd?text=consequatur', 'https://via.placeholder.com/640x480.png/00bbdd?text=consequatur', NULL),
('https://via.placeholder.com/640x480.png/00bbff?text=eum', 0x01946d4970137f7e89b0cf333f08d059, 'https://via.placeholder.com/640x480.png/00bbff?text=eum', 'https://via.placeholder.com/640x480.png/00bbff?text=eum', NULL),
('https://via.placeholder.com/640x480.png/00bbff?text=voluptate', 0x01946d49728c7fc5afb926e9a6fbbb2d, 'https://via.placeholder.com/640x480.png/00bbff?text=voluptate', 'https://via.placeholder.com/640x480.png/00bbff?text=voluptate', NULL),
('https://via.placeholder.com/640x480.png/00cc55?text=aut', 0x01946d49703279cdbd6ac01021f8095e, 'https://via.placeholder.com/640x480.png/00cc55?text=aut', 'https://via.placeholder.com/640x480.png/00cc55?text=aut', NULL),
('https://via.placeholder.com/640x480.png/00cc88?text=sed', 0x01946d496fae7e518689ce35858d3d10, 'https://via.placeholder.com/640x480.png/00cc88?text=sed', 'https://via.placeholder.com/640x480.png/00cc88?text=sed', NULL),
('https://via.placeholder.com/640x480.png/00ccbb?text=voluptas', 0x01946d497697739598296de99768c970, 'https://via.placeholder.com/640x480.png/00ccbb?text=voluptas', 'https://via.placeholder.com/640x480.png/00ccbb?text=voluptas', NULL),
('https://via.placeholder.com/640x480.png/00cccc?text=tempora', 0x01946d49703279cdbd6ac01021f8095e, 'https://via.placeholder.com/640x480.png/00cccc?text=tempora', 'https://via.placeholder.com/640x480.png/00cccc?text=tempora', NULL),
('https://via.placeholder.com/640x480.png/00dd00?text=nemo', 0x01946d49751e7f5c9debe8ad920df12c, 'https://via.placeholder.com/640x480.png/00dd00?text=nemo', 'https://via.placeholder.com/640x480.png/00dd00?text=nemo', NULL),
('https://via.placeholder.com/640x480.png/00dd00?text=tenetur', 0x01946d4970c17524acf200c6f21e2c5b, 'https://via.placeholder.com/640x480.png/00dd00?text=tenetur', 'https://via.placeholder.com/640x480.png/00dd00?text=tenetur', NULL),
('https://via.placeholder.com/640x480.png/00ddaa?text=numquam', 0x01946d496c607be8b2e90a37882e6c31, 'https://via.placeholder.com/640x480.png/00ddaa?text=numquam', 'https://via.placeholder.com/640x480.png/00ddaa?text=numquam', NULL),
('https://via.placeholder.com/640x480.png/00dddd?text=et', 0x01946d496fc579cdbe5a910017595f07, 'https://via.placeholder.com/640x480.png/00dddd?text=et', 'https://via.placeholder.com/640x480.png/00dddd?text=et', NULL),
('https://via.placeholder.com/640x480.png/00dddd?text=nihil', 0x01946d4977177741bfbf5bf7afb2fc92, 'https://via.placeholder.com/640x480.png/00dddd?text=nihil', 'https://via.placeholder.com/640x480.png/00dddd?text=nihil', NULL),
('https://via.placeholder.com/640x480.png/00ddee?text=repellat', 0x01946d4976c579019288da1e1855636b, 'https://via.placeholder.com/640x480.png/00ddee?text=repellat', 'https://via.placeholder.com/640x480.png/00ddee?text=repellat', NULL),
('https://via.placeholder.com/640x480.png/00ee00?text=maiores', 0x01946d496e01756393299966f1638b27, 'https://via.placeholder.com/640x480.png/00ee00?text=maiores', 'https://via.placeholder.com/640x480.png/00ee00?text=maiores', NULL),
('https://via.placeholder.com/640x480.png/00ee44?text=tempore', 0x01946d49704b77bcb754c24e0eac557f, 'https://via.placeholder.com/640x480.png/00ee44?text=tempore', 'https://via.placeholder.com/640x480.png/00ee44?text=tempore', NULL),
('https://via.placeholder.com/640x480.png/00ee55?text=corrupti', 0x01946d496c85782aabc7073c112ee34a, 'https://via.placeholder.com/640x480.png/00ee55?text=corrupti', 'https://via.placeholder.com/640x480.png/00ee55?text=corrupti', NULL),
('https://via.placeholder.com/640x480.png/00ee55?text=qui', 0x01946d49727070b9b2d95a1721a64153, 'https://via.placeholder.com/640x480.png/00ee55?text=qui', 'https://via.placeholder.com/640x480.png/00ee55?text=qui', NULL),
('https://via.placeholder.com/640x480.png/00ee88?text=dolorum', 0x01946d497076789c98a3098e34ff5347, 'https://via.placeholder.com/640x480.png/00ee88?text=dolorum', 'https://via.placeholder.com/640x480.png/00ee88?text=dolorum', NULL),
('https://via.placeholder.com/640x480.png/00eebb?text=porro', 0x01946d49725a70ef8d8a18395ba7e598, 'https://via.placeholder.com/640x480.png/00eebb?text=porro', 'https://via.placeholder.com/640x480.png/00eebb?text=porro', NULL),
('https://via.placeholder.com/640x480.png/00eeee?text=eius', 0x01946d4970b17ceba23b380eeeb3d739, 'https://via.placeholder.com/640x480.png/00eeee?text=eius', 'https://via.placeholder.com/640x480.png/00eeee?text=eius', NULL),
('https://via.placeholder.com/640x480.png/00eeff?text=id', 0x01946d4970257388ba404a7f262c9801, 'https://via.placeholder.com/640x480.png/00eeff?text=id', 'https://via.placeholder.com/640x480.png/00eeff?text=id', NULL),
('https://via.placeholder.com/640x480.png/00ff11?text=vel', 0x01946d496c1d7952ba610f72b5e4a4f7, 'https://via.placeholder.com/640x480.png/00ff11?text=vel', 'https://via.placeholder.com/640x480.png/00ff11?text=vel', NULL),
('https://via.placeholder.com/640x480.png/00ff22?text=dolore', 0x01946d49705c7e5c82993c075e79553c, 'https://via.placeholder.com/640x480.png/00ff22?text=dolore', 'https://via.placeholder.com/640x480.png/00ff22?text=dolore', NULL),
('https://via.placeholder.com/640x480.png/00ff22?text=placeat', 0x01946d496fbe7c73acf3d435eb4b321d, 'https://via.placeholder.com/640x480.png/00ff22?text=placeat', 'https://via.placeholder.com/640x480.png/00ff22?text=placeat', NULL),
('https://via.placeholder.com/640x480.png/00ff55?text=veniam', 0x01946d4972677ce99d17d757f6519b93, 'https://via.placeholder.com/640x480.png/00ff55?text=veniam', 'https://via.placeholder.com/640x480.png/00ff55?text=veniam', NULL),
('https://via.placeholder.com/640x480.png/00ff66?text=laborum', 0x01946d496c527d6583de6fd0bab48e98, 'https://via.placeholder.com/640x480.png/00ff66?text=laborum', 'https://via.placeholder.com/640x480.png/00ff66?text=laborum', NULL),
('https://via.placeholder.com/640x480.png/00ffaa?text=non', 0x01946d496fed72169f6c54799911c26d, 'https://via.placeholder.com/640x480.png/00ffaa?text=non', 'https://via.placeholder.com/640x480.png/00ffaa?text=non', NULL),
('https://via.placeholder.com/640x480.png/00ffbb?text=non', 0x01946d496fed72169f6c54799911c26d, 'https://via.placeholder.com/640x480.png/00ffbb?text=non', 'https://via.placeholder.com/640x480.png/00ffbb?text=non', NULL),
('https://via.placeholder.com/640x480.png/00ffbb?text=voluptatem', 0x01946d496c527d6583de6fd0bab48e98, 'https://via.placeholder.com/640x480.png/00ffbb?text=voluptatem', 'https://via.placeholder.com/640x480.png/00ffbb?text=voluptatem', NULL),
('https://via.placeholder.com/640x480.png/00ffdd?text=et', 0x01946d4976fd75a6bf34a9720684336d, 'https://via.placeholder.com/640x480.png/00ffdd?text=et', 'https://via.placeholder.com/640x480.png/00ffdd?text=et', NULL),
('https://via.placeholder.com/640x480.png/00ffee?text=officia', 0x01946d496fc579cdbe5a910017595f07, 'https://via.placeholder.com/640x480.png/00ffee?text=officia', 'https://via.placeholder.com/640x480.png/00ffee?text=officia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_images_property`
--

CREATE TABLE `tbl_images_property` (
  `public_id` varchar(150) NOT NULL,
  `property_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `secure_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_posts`
--

CREATE TABLE `tbl_posts` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `user_id` binary(16) DEFAULT NULL COMMENT '(DC2Type:uuid)',
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `published_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_posts`
--

INSERT INTO `tbl_posts` (`id`, `user_id`, `title`, `body`, `is_published`, `published_at`, `created_at`, `updated_at`) VALUES
(0x01946d496bdd71eab6c844cd8e20926f, 0x01946d4959267ad6b9c37f203a4f15a6, 'Dolor ad quibusdam officia.', 'Placeat quia occaecati veritatis necessitatibus. Consequatur ut rerum corporis. Autem suscipit ipsam quam non. Ipsum et ipsum delectus ad quaerat rem esse. Molestiae et culpa et ipsa aut laudantium. Velit est qui consequuntur odit voluptatum.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496be7778ca23bbaf0a08ee7c2, 0x01946d4959267ad6b9c37f203a4f15a6, 'Eius aspernatur explicabo sunt iure esse cupiditate perferendis.', 'Sapiente maiores ratione ut omnis officia. Eum enim necessitatibus dicta qui. Sint alias placeat facere adipisci. Sed eum et aut praesentium. Vitae voluptates sunt perspiciatis et nihil dicta. Repellendus repellendus quia voluptates.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496bf07847813e9678443b397f, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Aliquid quis beatae itaque in voluptas.', 'Praesentium qui atque asperiores asperiores quod voluptates voluptatem. Itaque ratione quas et est. Placeat aut dolor sit optio. Recusandae ut rerum iste blanditiis ipsam sint. Ut iste eveniet qui voluptates explicabo alias. Aut quae et quia autem aut. Nam animi laborum et tenetur non consequatur.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496bf77b3c80a4f1c92c99da12, 0x01946d49604476628930f705e69e412e, 'Consequatur cupiditate voluptates et nulla omnis.', 'Sit laboriosam iure quod est. Eum tempore laborum tempore ab facilis sapiente. Mollitia eligendi omnis quibusdam at soluta. Aliquid dolor praesentium optio asperiores eum magni.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496bfd7d9992f1df2cc5ec04a5, 0x01946d495241765d91f1fc71f4a04985, 'Beatae reiciendis eligendi quia minus quas odio.', 'Exercitationem sed sit enim sequi animi. Labore placeat aut animi est doloribus sunt alias. Consequatur amet quisquam ea quia aliquam.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c037350ac2cefaa8b1e8df9, 0x01946d49488f7f2b80de358c8beb0f0c, 'Voluptatem architecto iusto sit nulla consequuntur.', 'Similique iste qui minima nulla facere minima expedita. Non ut sed sequi. Cum sint sit ut qui qui. Et ducimus voluptate placeat qui. Qui dolores praesentium quas delectus eius. Quia est sit nisi.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c097d09945ad0ceac6f20e6, 0x01946d4956d0798fb4a5772c58512186, 'Ea est eius ea sit.', 'Nam similique modi repellendus vitae. Laboriosam est omnis voluptatem voluptate repellat aut ut. Modi qui voluptas sint debitis fugit veniam. Excepturi ipsa magnam qui reprehenderit rerum non molestiae eveniet.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c0f773db98ccb22cd02c713, 0x01946d494ff072d3ae46049791e593dc, 'Eum animi rerum nihil voluptas magni esse.', 'Qui exercitationem natus perferendis mollitia expedita. Quos officia veritatis voluptates veniam. Unde rem dolorum modi. Rerum culpa accusantium voluptatem fuga voluptatibus. Quia adipisci consequatur incidunt dolorem quia laudantium incidunt.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c1677c88aab347efb560746, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Non perferendis nostrum at.', 'Velit rerum voluptatum et qui. Voluptas ducimus minima eaque saepe laborum exercitationem. Doloremque non reiciendis eos minima.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c1d7952ba610f72b5e4a4f7, 0x01946d49633f785da764361dea9a2f2e, 'Quos omnis non quia vitae velit qui architecto.', 'Qui necessitatibus veritatis dicta corrupti quasi commodi at. Et necessitatibus eum reprehenderit eum placeat. Adipisci aliquam rem est. Nostrum veritatis officia necessitatibus ut corporis omnis fugiat aut. Commodi est et molestias esse. Quia rerum est et autem. Ut facilis soluta velit qui.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c24769081029dd97bb0b26b, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Libero quam adipisci tempora facere.', 'Tenetur sint expedita beatae aut aliquid. Corrupti cum dolor facere dolor eos quasi veniam. Ipsam libero aut sunt consectetur similique aut nisi itaque. Nemo repellendus officiis facilis. Ratione voluptas eaque ea laboriosam quasi voluptatem unde. Veritatis id nam quam perferendis.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c2c7758bf244baf6b45c818, 0x01946d49488f7f2b80de358c8beb0f0c, 'Recusandae quaerat rem saepe temporibus expedita perspiciatis.', 'Porro fugit dolor exercitationem enim excepturi fuga doloribus. Aspernatur reiciendis et cum velit voluptatem explicabo nisi alias.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c3374ac90ef30d98b594429, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Et qui excepturi officiis.', 'Velit quaerat ut perferendis aut soluta atque et illum. Quae molestias vero asperiores dolore consequatur corporis aut. Quisquam quis et dolores asperiores et id.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c3a7c118bc6aba5c2c47fc5, 0x01946d495241765d91f1fc71f4a04985, 'Labore dolores suscipit ducimus ratione et et ut.', 'In illo omnis ut incidunt ut aspernatur. Nemo quis incidunt nihil enim voluptas et sapiente et. Assumenda consequatur suscipit et. Tempore voluptas sed sunt doloremque natus. Sunt rem saepe iure. Rerum iste harum nostrum ab qui non facere.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c3e7e7a823ad19f44cf9646, 0x01946d495241765d91f1fc71f4a04985, 'Fuga quos et voluptatem delectus nemo voluptas culpa.', 'Cumque debitis quaerat necessitatibus. Voluptas quod odit minus temporibus neque asperiores possimus error. Molestiae nobis dolores voluptates rerum delectus repellendus eveniet. Quas quis odit rerum qui voluptas. Nesciunt neque aliquid aut maiores deserunt alias. Sint est similique animi quis.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c427a0fb28f5dc34bb6be71, 0x01946d494ff072d3ae46049791e593dc, 'Ad et et dolore porro corporis officia quos.', 'Magnam consectetur cupiditate sint explicabo. Molestiae earum nam commodi excepturi.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c467d0d98f43a24bb064e5c, 0x01946d496b7677cd9c88909e78f37f75, 'Architecto voluptatum nemo fugit ea sed.', 'Recusandae sunt eveniet magni est cum eum. Asperiores ut sed expedita aut suscipit. Soluta officia perferendis eos quis. Aut atque blanditiis asperiores aut.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c4b73cdac4d717da6abc917, 0x01946d495b7976a9a3329507aa4779f1, 'Ut ut quia eius repellat aut earum beatae.', 'Officia sed facere explicabo aut provident ut magnam. Enim est aut aut vero. Aliquam ad voluptatem provident ut nobis. Commodi eligendi neque maxime exercitationem quibusdam.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c527d6583de6fd0bab48e98, 0x01946d496b7677cd9c88909e78f37f75, 'Quo accusamus distinctio eligendi eveniet odit nam odio.', 'Id autem illo velit labore. Deserunt incidunt magni praesentium fuga excepturi suscipit ullam. Veniam delectus at alias nisi facilis sunt sunt labore.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c577ecf9600cf343953e4c3, 0x01946d494ff072d3ae46049791e593dc, 'Velit voluptatibus rerum ut omnis pariatur accusamus alias.', 'Fugiat reprehenderit est porro hic est pariatur quia. Sunt at ipsum velit magnam. Sed sed officia sed repellat dolorem sed excepturi perferendis. Nesciunt et ut eum est debitis nobis dolor. Itaque quo et deserunt beatae et. Doloribus dicta iure ea ea aut atque. Doloremque velit quos nisi magnam.', 0, NULL, '2025-01-16 04:05:15', '2025-01-16 04:05:15'),
(0x01946d496c607be8b2e90a37882e6c31, 0x01946d4968ef7892a660ce9fa9ea51bc, 'Facere magnam praesentium accusamus magni est ut qui molestiae.', 'Aut dicta facilis neque et nobis et cumque. Commodi ea tenetur id doloremque est ipsum. Iste veritatis ea et molestiae dolorem inventore.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c67742da740bee7aea78cb1, 0x01946d49604476628930f705e69e412e, 'Nobis minima sint sit rerum fugiat maiores atque.', 'Unde nobis suscipit consequatur. In incidunt rem esse est sint est voluptatem. Soluta delectus voluptatem earum. Iure exercitationem velit et eos. Sapiente provident officia iste odio eos veniam. Sequi totam ut voluptate. Dignissimos est atque doloremque ipsam aut quo.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c6f70d8917e86dd2a1856f1, 0x01946d4968ef7892a660ce9fa9ea51bc, 'Est maiores iste ut impedit non quae quod.', 'Quo officia adipisci eligendi sit consequatur. Aspernatur consequatur aut laudantium similique qui. Ipsum est sequi deleniti quibusdam officiis sapiente nostrum quia. Tenetur officiis dolor voluptatem sunt repellat qui sed.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c7574b7b214af23c5fb6bb5, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Dolorum magni eligendi quod ut alias rerum eveniet.', 'Ipsa repellat quo sed architecto ut sapiente quas. Inventore blanditiis mollitia iure. Odio sit fugiat enim magni. Rerum modi voluptatem consequuntur aspernatur commodi repellat. Quo et sequi veniam neque impedit.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c7b7b739ccae9dac50fca18, 0x01946d4968ef7892a660ce9fa9ea51bc, 'Corrupti accusamus aut modi quasi.', 'Aut quo quos illum nulla ipsa. Natus sed earum aliquid et laboriosam omnis pariatur. Totam blanditiis iste voluptates cumque doloremque omnis corrupti. Ea et quam unde magnam possimus assumenda. Consequatur sit doloribus quos enim. Minus cum dolor blanditiis et voluptatem qui.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c85782aabc7073c112ee34a, 0x01946d495b7976a9a3329507aa4779f1, 'Dolorem autem voluptate aut laudantium cum iste.', 'Qui sapiente quis saepe. Labore repudiandae laborum et incidunt. Et ea consequatur aliquam consequuntur error consequatur. Rerum perspiciatis repellendus et consectetur officia impedit. Laborum totam consequatur ad totam. Eaque explicabo et repellat ut praesentium vitae nesciunt.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c8a779c95dfe6af8ee52d0e, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Minus minus corrupti rerum sint temporibus quod vel.', 'Ut placeat ut fugit et. Repellat ea dolor enim ullam veritatis. Facilis nam molestiae id quis quas quo. Ut culpa facilis ratione recusandae qui.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c8f7340954524d94c33e803, 0x01946d494ff072d3ae46049791e593dc, 'Culpa rem nulla unde voluptas.', 'Labore voluptatibus veniam possimus nemo perferendis. Modi velit porro vel inventore. Hic est sunt blanditiis. Nemo saepe fugit exercitationem harum. Non ipsum quaerat quae praesentium expedita. Dolores aut cupiditate debitis delectus sunt facere et.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c9875a1b10f68c7287ea3b7, 0x01946d49633f785da764361dea9a2f2e, 'Consequatur quas pariatur labore ab.', 'Nihil voluptatem molestiae quae non. Dolorem accusantium quasi minus sit quis praesentium. Voluptas doloremque ipsum et quo consequatur molestiae rerum.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496c9e7c04afb19b9e0cf29a86, 0x01946d494af27f568b966579421d81e0, 'Saepe quia sed perspiciatis libero.', 'Maiores sint quo eos similique sint enim suscipit. Iste ut voluptates provident temporibus repellendus aut impedit. Beatae nemo rerum molestiae veritatis. Reprehenderit dignissimos alias perferendis ducimus eius quam.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496ca57060a115be74664429ec, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Ut est quisquam eveniet inventore nostrum.', 'Blanditiis quas suscipit ullam odit natus est. Veritatis aliquam dignissimos repellat expedita illum eos at. Ex aut optio debitis rerum nobis aut aut reiciendis. Nam est cupiditate eveniet et et voluptate tempore. Qui ipsa nemo distinctio ut corporis rerum.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496d0d77be8918fe43fa7b6833, 0x01946d495484741ca967e85e0aa211fe, 'Incidunt et voluptatem nobis quod sit iusto rerum.', 'Possimus et perspiciatis repudiandae veritatis voluptatem. Rerum eos quia quidem tenetur consequatur autem unde. Quia eos nihil soluta laudantium iste non qui. Ut aut tempore rerum aut doloremque occaecati. Inventore numquam sit et dolore qui.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496dcf751a94f06ed8a0a44703, 0x01946d494ff072d3ae46049791e593dc, 'Laborum nemo rerum corrupti sed omnis.', 'Nisi non incidunt autem et officia numquam. Nobis dolorem exercitationem perspiciatis esse ex quae occaecati. Quia voluptatibus quidem numquam quos iure ut. Tempora sed quisquam earum. Placeat quaerat consequatur omnis autem quae ut. Numquam neque eaque sit sit sit.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e01756393299966f1638b27, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Aspernatur et molestias ad inventore voluptas.', 'Doloremque ipsam architecto qui dolorum harum odio et. Natus commodi quo nihil aut. Quidem veritatis provident cumque numquam expedita facilis id. Consequuntur voluptatem ut laboriosam odit. Rerum non vel cumque aut nesciunt eligendi. Eos nihil nostrum quia. Voluptate vitae adipisci eos eum aut.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e1a7a65b618f577f5b4d010, 0x01946d4968ef7892a660ce9fa9ea51bc, 'Consequuntur sunt provident ut rem itaque maxime similique.', 'Sunt consequuntur illum in. Autem velit earum aliquid quo et eum. Officia fuga aperiam quaerat praesentium ducimus perspiciatis aut. Voluptates quia nesciunt omnis quaerat.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e267ad388b9ce3561c80f57, 0x01946d49663574eb8545169ed3274c6e, 'Quam repellat aut voluptatem delectus corporis.', 'Magnam consequatur tempore beatae modi dolorem nemo. Dolor voluptatem alias quod esse dignissimos quo voluptatem. Qui ratione vel occaecati aut dolor modi. Nostrum beatae sit illo quae aut. Molestiae nulla saepe ut molestiae aut quo praesentium deserunt.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e327092868837f010be0a53, 0x01946d495241765d91f1fc71f4a04985, 'Consequatur adipisci maxime esse iste et.', 'Corporis minima porro natus quam quae dolor. Aperiam aut itaque officiis totam placeat ipsa id. Maxime est molestias iure sint doloribus. Eaque aperiam dolores ut sapiente. Quis qui maxime amet illo sapiente dolorem exercitationem ipsam. Labore hic earum qui provident.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e4177ec80acc1d3e2ba59b9, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Cupiditate culpa vitae non repellat quis quas.', 'Non quia sed distinctio quasi et quaerat. Nihil at reprehenderit occaecati blanditiis. Esse labore animi et voluptate suscipit. Consequatur eveniet eum hic aliquam.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e4775a7845e8f40de48bbf1, 0x01946d494ff072d3ae46049791e593dc, 'Vel corporis ea fugit expedita dolorem provident aut.', 'Et ducimus est est fugit molestiae harum. Ullam consequuntur veniam sunt numquam sed est delectus. Tempore officiis vel quia voluptas voluptates. Repudiandae illum voluptas similique quia maxime illo ad. Distinctio numquam et beatae non rerum iure assumenda.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e4f712893e3bec84ffc02d1, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Sit quisquam iste perferendis dicta.', 'Corrupti repudiandae aut tempora esse nemo. Odit aut dolorem qui tempora fugit delectus quae. Blanditiis aliquid velit non consequuntur occaecati error corporis. Consequuntur facilis in ex. Maxime consequuntur ut aut. Sequi molestias omnis dolorum voluptatem.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e57721c898d65498ae630de, 0x01946d495241765d91f1fc71f4a04985, 'Quam similique magnam qui voluptatem nesciunt cum cum.', 'Ab harum ex culpa quia nostrum vel. Accusamus commodi minima ut dolorem cum. Consequuntur vel sed suscipit eum. Ad ipsum assumenda id earum eaque. Quam quis dolor sint eos aliquid. Cupiditate praesentium cum est et autem voluptate non. Sit dolore vel rerum.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e5d7612aeaa9825f74a22e9, 0x01946d494ff072d3ae46049791e593dc, 'Reiciendis labore nobis occaecati.', 'Et inventore numquam delectus eligendi eligendi id ab deserunt. Tempora iste assumenda deserunt deleniti. Et quia nam sed provident ipsa vel.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e6578b89f8544bf67ef30b3, 0x01946d49604476628930f705e69e412e, 'Numquam aperiam laboriosam ratione.', 'Soluta ex explicabo at necessitatibus dicta rerum. Suscipit enim facere quidem reiciendis id. Illum quae ut est consequatur fuga tempora. Natus voluptate ut autem vel debitis atque et. Et cupiditate enim minus et beatae. Inventore ex consequatur id nobis.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e6c7ec69b381b67b9443995, 0x01946d49633f785da764361dea9a2f2e, 'Blanditiis id non neque libero.', 'Esse quisquam sit nostrum qui. Consequatur aliquid odio corrupti voluptatem. Veritatis consequatur sint et nihil in ea. Quas consequatur quis voluptatibus. Molestiae magnam laudantium impedit rerum reprehenderit. Dolorem id vel nostrum qui.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496e7a78379afae2f0027b68e9, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Recusandae et quaerat quia excepturi dolores perferendis et.', 'At similique et laboriosam magni voluptatem illum. Unde rem maiores esse doloribus corporis officia. Asperiores ad id rerum sit. Ab et voluptatem et eaque eum et. Non omnis corrupti officia. Est qui quo dolorum nulla est. Molestiae exercitationem ut quia ex a.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496f1179ee8c7668650d4e7b59, 0x01946d4959267ad6b9c37f203a4f15a6, 'Ut consequatur voluptatem aut.', 'Et quis enim mollitia sit sint nihil nam aut. Inventore nesciunt omnis repellat sit. Adipisci vero accusantium ducimus quia iure culpa aliquid. Velit deleniti eligendi incidunt non et natus iste et.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496f9076be84e386eab7a07325, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Tempora qui nobis sint quasi.', 'Quo vitae aut quibusdam nobis ipsa iusto rerum. Delectus autem voluptatem dicta error.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fae7e518689ce35858d3d10, 0x01946d494ff072d3ae46049791e593dc, 'Impedit quam quo voluptatem ut delectus in quia.', 'Doloremque nihil asperiores error reiciendis consectetur pariatur optio. Esse nihil sint dolore expedita et consequatur. Nostrum quia et debitis cupiditate. Nisi possimus iure sunt autem.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fbe7c73acf3d435eb4b321d, 0x01946d494ff072d3ae46049791e593dc, 'Delectus est aspernatur consequatur eum optio reprehenderit.', 'Eos quis sed non at autem provident porro accusantium. Voluptas placeat assumenda qui. Et officia autem maxime rerum. Tempore et accusamus et debitis blanditiis.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fc579cdbe5a910017595f07, 0x01946d494af27f568b966579421d81e0, 'Perspiciatis omnis nisi suscipit ea aspernatur.', 'Distinctio cumque libero omnis praesentium excepturi id. Adipisci odit ut cumque nihil suscipit sed. Autem voluptatem culpa neque eos deserunt.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fcf79f8a922414839d17dde, 0x01946d494af27f568b966579421d81e0, 'Ut et veritatis aspernatur aut qui omnis et.', 'Et occaecati dolorum explicabo et aut nulla quae. Totam asperiores consequuntur provident harum impedit et ut. Ut sit nulla non distinctio sed nobis.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fd97158af8d816ce8e95588, 0x01946d496b7677cd9c88909e78f37f75, 'Ut sit quia quo amet facere laudantium voluptas.', 'Aut tempore omnis doloribus voluptatum atque. Neque ipsum ipsa voluptas quo voluptates iste laborum. Eos ut inventore commodi. Molestiae ab facere perspiciatis inventore mollitia maxime commodi.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fe179a5b388c64d1f5c5d99, 0x01946d495241765d91f1fc71f4a04985, 'Sint ut eos similique laborum quidem quidem nostrum.', 'Commodi et modi voluptas voluptas voluptates ducimus nesciunt. Ut ea sapiente est atque esse rerum eius. Quas aliquam doloremque eligendi quas ea maxime.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496fed72169f6c54799911c26d, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Esse eos nesciunt nulla omnis recusandae doloribus temporibus.', 'Consequatur sed et est ut quo aliquid et. Beatae sed rerum debitis delectus aliquid.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496ff5741f91e074130ff2c67c, 0x01946d49488f7f2b80de358c8beb0f0c, 'Exercitationem ipsa quas laudantium velit et.', 'Voluptates id sunt consequatur at ut sed. Itaque vel perspiciatis dolor aut dolores. Error odit voluptatem voluptas occaecati similique vel sequi. Quia qui autem ad enim non. Ullam vel et praesentium vel vel. Numquam et suscipit laudantium.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d496ffe7970b9d7e7d61138ab58, 0x01946d495484741ca967e85e0aa211fe, 'Et reiciendis consequatur earum est.', 'Excepturi quos porro officiis et. Molestiae aspernatur laudantium perspiciatis impedit qui dolorum perferendis. Doloribus ut dolore earum eum ut et. Eum quibusdam consectetur et consequatur.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d4970137f7e89b0cf333f08d059, 0x01946d495b7976a9a3329507aa4779f1, 'Dolor rerum aperiam nesciunt ducimus rerum earum.', 'Ipsam qui voluptatem optio repudiandae. Commodi autem quibusdam animi vel vero possimus ea. Ullam pariatur rem vel doloremque ut qui.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d49701d7dbf951b6b34a0de47a8, 0x01946d495b7976a9a3329507aa4779f1, 'Veniam ea mollitia rerum nihil illum magnam porro.', 'Voluptate quo tempora aliquid rem. Soluta et sed earum amet repellendus inventore quas. Ut ducimus reiciendis recusandae quia reiciendis et. Eligendi nisi voluptatem atque eius omnis.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d4970257388ba404a7f262c9801, 0x01946d496b7677cd9c88909e78f37f75, 'Assumenda perferendis dolorum maiores non molestiae.', 'Quo ducimus temporibus iusto quam explicabo ducimus ut. Aut illum eaque consequuntur est. Sit quas ut possimus cum. Blanditiis hic ex quis rerum. Deserunt vitae ipsum eligendi voluptas. Minima vitae sed voluptatum iusto.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d49703279cdbd6ac01021f8095e, 0x01946d49488f7f2b80de358c8beb0f0c, 'Labore totam est vel praesentium molestias quaerat cupiditate.', 'Consequuntur aperiam quam sed et alias vel. Laboriosam sint eaque nostrum consequuntur incidunt. Aut molestiae dolorem quis. Eaque sint rerum qui aperiam veniam. Enim dolorem rerum asperiores dolor repudiandae dolores eos. Magni fuga fugit qui error.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d49703b78088e8f6b70266f1604, 0x01946d496b7677cd9c88909e78f37f75, 'Harum qui maiores mollitia consequuntur et temporibus.', 'Perferendis est qui et aut aut quis. Tempora sed et fugiat sed minus. Et doloremque explicabo iusto quidem et. Temporibus et animi aliquid atque. Maxime sunt facilis vero. Qui nisi eaque ipsa totam. Nisi enim sint qui et. Sit provident qui repudiandae nihil consequuntur velit.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d49704474398779f7b43884639f, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Ducimus id ipsa autem minus.', 'Repudiandae voluptatem voluptatibus ea in distinctio. Placeat ipsam at voluptatum animi. Magnam omnis dolorum aut perferendis delectus. Eveniet ab aliquid est aut et voluptatum laborum. Ut aut a repudiandae deleniti est asperiores hic. Libero veniam nihil quia et quod.', 0, NULL, '2025-01-16 04:05:16', '2025-01-16 04:05:16'),
(0x01946d49704b77bcb754c24e0eac557f, 0x01946d4959267ad6b9c37f203a4f15a6, 'Illum asperiores et eos cumque perspiciatis ab nobis.', 'Aut quod ab dicta molestiae. Cupiditate porro inventore corrupti id necessitatibus vel qui pariatur. Perferendis saepe optio omnis facere accusantium soluta ex.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970537996948e0afe7b62897a, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Architecto modi quo harum totam adipisci nostrum harum dignissimos.', 'Illum quos omnis voluptatem laboriosam quia ullam quae suscipit. Ab id non veritatis expedita nihil sit iste qui. Saepe dicta et rerum rerum officiis perferendis facere soluta. Consequatur dicta quaerat reiciendis repudiandae voluptates.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49705c7e5c82993c075e79553c, 0x01946d495b7976a9a3329507aa4779f1, 'Repellat et quos asperiores qui magni quidem.', 'Id quisquam quia deleniti est nemo illo qui. Laborum maiores est perferendis nobis nam consectetur. Recusandae non corrupti quaerat sed dolorum impedit. Temporibus sed nisi consectetur sunt consectetur id quia. Recusandae minus vitae delectus necessitatibus doloremque quo expedita.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970697f9d99b441be9d89bed5, 0x01946d49633f785da764361dea9a2f2e, 'Saepe accusantium sit est ut reiciendis et.', 'Ducimus eveniet maxime et aut sed mollitia laudantium. Est voluptatem sed voluptates officiis repellendus corrupti. Nulla blanditiis mollitia molestiae in. Nobis deserunt consectetur corrupti nam. Sunt quas doloremque et eos doloribus in repellat ea.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d497076789c98a3098e34ff5347, 0x01946d494af27f568b966579421d81e0, 'Dolor enim dicta facilis magni voluptas amet.', 'Sed ea atque sit sit. Ut quibusdam impedit praesentium. Odio maiores et magnam pariatur nulla consequuntur alias error.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970857ef38fd31739a24326e8, 0x01946d4968ef7892a660ce9fa9ea51bc, 'Dolorum sit minus illum et totam quia delectus nihil.', 'Voluptas qui eligendi quis quae dicta laborum voluptatum. Qui enim praesentium eum dolore. Quos qui cum eligendi aut rerum repudiandae magnam aperiam. Voluptatem tempora ipsam deleniti numquam commodi.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970927eafa3ef444b4c901e64, 0x01946d49663574eb8545169ed3274c6e, 'Ut sit odio et asperiores explicabo.', 'Aut in eos dolores incidunt odit deleniti provident. Possimus sint praesentium enim quas. Enim inventore necessitatibus veniam magnam porro placeat.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49709a7f83a7c510f7884d9c65, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Est est sunt dolorum veniam est eligendi.', 'Ratione illo eum asperiores incidunt sed impedit velit. Excepturi accusantium veniam commodi ipsa aliquam quaerat tempore. Id magnam ea aut error eum necessitatibus quos. Dolores dolore pariatur autem qui ea. Repellat quam ratione quis voluptatem. Voluptas aspernatur reprehenderit in non quos.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970a7725da6407db128a5127e, 0x01946d4956d0798fb4a5772c58512186, 'Aut unde commodi necessitatibus est.', 'Voluptate perferendis in magni voluptatibus est et. Repellendus consequatur sequi magni aliquid veniam. Maiores dolores et velit.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970b17ceba23b380eeeb3d739, 0x01946d494ff072d3ae46049791e593dc, 'Neque eos qui voluptas et sit.', 'Facilis aliquid repudiandae pariatur qui. Quas est voluptatum ipsum aut. Est voluptas ipsam architecto vitae ad aspernatur nemo. Pariatur quis molestiae maiores distinctio voluptate et. Magni est sit eum rem earum. Est voluptatem ratione in itaque molestiae.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4970c17524acf200c6f21e2c5b, 0x01946d49488f7f2b80de358c8beb0f0c, 'Corporis ducimus dicta debitis saepe quasi quaerat.', 'Fuga itaque aut quasi et. Quod voluptate similique voluptas tenetur repellendus aliquam sapiente ipsum. Enim recusandae nulla et vero sed est sequi. Laudantium esse repellat consectetur vitae deleniti accusamus.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d497177705b8cc84b26a940a955, 0x01946d495484741ca967e85e0aa211fe, 'Illum facilis delectus ex nihil.', 'Pariatur qui ut saepe est rerum neque. Est blanditiis enim nam eaque. Cupiditate cum laboriosam a hic tenetur sit.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49721976f9bff2327f818be719, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Accusamus et perferendis et rerum quis.', 'A quia est quasi qui omnis dolorem qui. Qui quos sit harum ea harum non tenetur. Delectus est necessitatibus illo dolorem voluptatibus distinctio assumenda voluptas. Qui molestiae sit sit magni.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49722271588c547d68d0795b1e, 0x01946d495241765d91f1fc71f4a04985, 'Qui quia quam consectetur quaerat earum reprehenderit.', 'Pariatur commodi iure eius laudantium voluptas. In officia officiis et nisi aut. Ea sequi commodi molestiae dolor velit ad. Consequatur pariatur autem ipsam consequatur. Possimus eius doloremque quam ab illo illum. Quam eaque quia voluptatem porro nihil voluptatem ea.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49722c7513ab34c7b740e09ff4, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Nesciunt voluptas ea harum esse occaecati.', 'Aut rerum quam repellat aspernatur consequatur cumque soluta. Beatae voluptatibus reiciendis sit temporibus. Nisi rerum provident voluptatem. Quia praesentium sapiente deleniti cupiditate dolores. Esse illo sint voluptas omnis consectetur. Exercitationem autem ut nesciunt corporis.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49723a78c09e7cb76ee3301adc, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Consequuntur occaecati repellendus dolorem voluptates vitae in.', 'Delectus qui et id et. Neque voluptatem eveniet ipsa corrupti ut omnis. Rerum et sint mollitia ipsum. Quas maiores ipsam fugiat. Ipsum qui aperiam dolorem voluptatem laboriosam qui. Rem et sunt voluptatum beatae. Ducimus magnam et totam. Consequatur aliquid quisquam est quas repellat.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d497248725a8572036eeeb62fa4, 0x01946d49488f7f2b80de358c8beb0f0c, 'Eos voluptates sunt unde aut eius.', 'Occaecati aut laudantium atque iure repellat illo. Voluptate in est quia iste. Expedita temporibus vel commodi inventore et explicabo sed.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49725a70ef8d8a18395ba7e598, 0x01946d4956d0798fb4a5772c58512186, 'Aperiam magni architecto optio ipsa adipisci neque sit.', 'Omnis architecto in optio modi id provident. Non est perspiciatis minima eveniet et sed perspiciatis nemo. Impedit molestias reprehenderit autem neque. Hic facere dolor commodi ut in.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972677ce99d17d757f6519b93, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Repellat non consequatur voluptas ex modi itaque non voluptatibus.', 'Nisi neque officiis cumque quisquam dolores corporis molestias. Vel et qui fuga ullam quod est enim. Tenetur dolorum molestias architecto officiis voluptates blanditiis nobis.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49727070b9b2d95a1721a64153, 0x01946d494af27f568b966579421d81e0, 'Praesentium aspernatur ipsam voluptates asperiores enim impedit magni.', 'Ducimus aliquid quia tempore sit et. Natus iusto reiciendis et architecto sit sed reiciendis. Reiciendis repudiandae laborum optio officia impedit soluta. Iure at quam impedit minus animi. Corporis ad porro voluptas repellat iste at est. Rerum nisi eaque voluptatibus.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49727e7b69875c7d061a23f715, 0x01946d494dab7d1b82373ca7c0e90ba6, 'Eos facilis perferendis omnis qui ut.', 'Ut ex ea quisquam et cupiditate est esse est. Omnis nihil optio omnis ut aut consequatur officiis. Pariatur ut minima provident. Et rerum enim dolore et est iusto. Nihil est consequatur veniam sint illum ratione. Temporibus laudantium voluptatem eos. Sed asperiores recusandae quis nihil.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49728c7fc5afb926e9a6fbbb2d, 0x01946d495484741ca967e85e0aa211fe, 'Ut animi ad itaque et dignissimos modi sit.', 'Labore odit non sed laborum sit et. Culpa dolorum sunt veniam a quae occaecati. Molestiae ea nostrum nobis tempore. Optio ipsam asperiores blanditiis voluptas. Nulla numquam ut minus. Est repellendus totam ad et cupiditate.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972967292a494aec0422cf96b, 0x01946d494af27f568b966579421d81e0, 'A facere similique autem non illum enim nostrum.', 'Natus quia eum reiciendis distinctio similique est. Rerum quis incidunt dolore. Repudiandae sit reiciendis iure et. Id molestiae nihil magnam consequatur quo iure necessitatibus adipisci. Pariatur minus provident doloribus aspernatur voluptates occaecati. Cupiditate et debitis et ut aut.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972a97fc4a022e52df7a54a41, 0x01946d49663574eb8545169ed3274c6e, 'Quia earum et voluptatem magnam et qui cupiditate.', 'Sit cumque commodi porro aut. Quidem et culpa doloremque sint dicta enim quia. Iste et autem eligendi. Illum reprehenderit numquam aliquid et aut quo exercitationem.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972b274c6875c6496bba87878, 0x01946d495241765d91f1fc71f4a04985, 'Officiis ut accusantium voluptas ut nihil nesciunt.', 'Ut enim nesciunt vel aspernatur voluptates. Voluptates cum veniam accusantium dolorum hic aut. Quibusdam autem hic vero repellat. Debitis necessitatibus iure eius sit quo error.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972be71b58bba047a030ececa, 0x01946d49604476628930f705e69e412e, 'Aut animi vitae culpa voluptatum deleniti sunt eius.', 'Itaque et autem est tempore nisi voluptatum fugit enim. Magni et nisi voluptatem quisquam vero atque. Voluptatem qui neque molestiae. Aut quam vitae asperiores. Nihil mollitia iure nemo quo laborum.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972ca735b9be2f29982234455, 0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Pariatur libero perferendis sunt molestiae expedita.', 'Est voluptatem exercitationem voluptatum officiis sint. Quae autem distinctio quisquam nihil corporis autem nemo. Modi et vel in fuga occaecati magni quos. Et iusto dolorem atque in.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972d47c8f925a9516dcffb9df, 0x01946d496b7677cd9c88909e78f37f75, 'Repellat officiis nam dolor ipsam enim blanditiis ipsum.', 'Unde rem aut ea in in deleniti praesentium iusto. Illum explicabo modi est delectus consectetur mollitia. Ea earum sint dolor eum. Deleniti repellat sunt omnis facilis iste at.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d4972df772e861463fd1fc32f11, 0x01946d496b7677cd9c88909e78f37f75, 'Aut tenetur error molestiae non minus ut quo.', 'Laborum ea dicta tenetur molestiae alias qui. Tempore fugiat iste suscipit excepturi qui. Fugiat maxime minus omnis similique. Et voluptas maiores nobis quia.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49739974d98a34998537fe56bc, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Aut magni ex velit id voluptatem minima ut.', 'Ad est velit nulla hic ut et. Incidunt facere alias veritatis deleniti amet illo ut. Hic aut dolor omnis ut veritatis reprehenderit incidunt quo. Architecto quia aut sed excepturi aliquid eum.', 0, NULL, '2025-01-16 04:05:17', '2025-01-16 04:05:17'),
(0x01946d49751e7f5c9debe8ad920df12c, 0x01946d4959267ad6b9c37f203a4f15a6, 'Sed dolor ut nihil esse eum.', 'Reiciendis aspernatur quisquam adipisci dolorum blanditiis et. Voluptatem voluptatibus quaerat harum excepturi et nisi aspernatur. Fuga inventore quo soluta ipsam. Ut cum incidunt vero minus.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d497660794cb78f23a0a3047175, 0x01946d495484741ca967e85e0aa211fe, 'Fuga unde dicta et et asperiores nihil eos.', 'Facilis asperiores dolorem illo corporis odit laudantium. Et ipsa numquam rem architecto. Nulla ducimus mollitia nisi quia. Est dolores adipisci fuga ea.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d497697739598296de99768c970, 0x01946d496b7677cd9c88909e78f37f75, 'Sit dolorum illum magnam eligendi et.', 'Est fugiat inventore qui laboriosam expedita. Illum commodi quisquam facilis eos aspernatur omnis. Aut qui iusto accusantium voluptatum.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4976ae7238bf0cc09fbf7d2756, 0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Quia delectus ea magnam rem laboriosam.', 'Eligendi et quia minima. Atque illo et molestias et iste. Et nemo ex voluptas eum labore. Corrupti voluptas ea incidunt quia temporibus dolore.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4976c579019288da1e1855636b, 0x01946d49488f7f2b80de358c8beb0f0c, 'Debitis neque nisi ipsum nesciunt quia aut earum nihil.', 'Exercitationem ullam est perferendis optio repudiandae. Delectus ipsa expedita aut et deserunt provident rerum. Quis asperiores ex nihil omnis. Sit delectus sed dolor sapiente dolorem sint dolor. Qui animi accusantium praesentium eligendi quas. Sed vel sed voluptas corrupti adipisci fugit.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4976d67821b452ea566da8db3c, 0x01946d4959267ad6b9c37f203a4f15a6, 'Optio optio consequatur earum cum.', 'Qui iure nesciunt commodi. Qui voluptatem in incidunt. Nisi impedit quia quae voluptas maxime. Accusantium incidunt iusto provident quia iusto. Qui perferendis et quo ducimus magnam rerum provident.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4976eb7f44b136bfdc31329440, 0x01946d49633f785da764361dea9a2f2e, 'Sequi architecto dolore tempore eligendi velit magni laborum ullam.', 'Est possimus vel quia est sed corporis sunt. Necessitatibus totam ut officia et sequi sit delectus. Earum reiciendis itaque est ea est quia. Qui vel doloribus laboriosam ex consectetur quo nisi. Similique officia quae delectus placeat. Vel est culpa sequi voluptatem. Rerum minus nobis velit aut.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4976fd75a6bf34a9720684336d, 0x01946d496b7677cd9c88909e78f37f75, 'Voluptatem error qui voluptatibus soluta nisi.', 'Error aut eius neque sit libero. Mollitia nihil est dolorem vel vitae officia mollitia. Consequatur a error minima ad nisi. Molestiae omnis autem omnis ut deserunt.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4977177741bfbf5bf7afb2fc92, 0x01946d4959267ad6b9c37f203a4f15a6, 'Dolores eligendi nulla nam incidunt dolores eveniet.', 'Eaque voluptas vel deleniti nemo ratione. Aliquam cum voluptatem libero provident est. Tempora sit itaque repellendus. Optio voluptatibus fugiat expedita sint possimus sint. Quo quo in cumque dolorum.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4977317a1fbe2634801f3f042a, 0x01946d49633f785da764361dea9a2f2e, 'Possimus natus occaecati labore iste accusantium asperiores sed consequuntur.', 'Quisquam ab sit voluptates repudiandae. Quos delectus veniam ut id voluptas et eum id. Quod ipsa deserunt explicabo iste deleniti sint assumenda quasi. Aut incidunt pariatur iste mollitia rerum vero. Praesentium et et fugiat perferendis.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4977617fa6bd9307edf352d70c, 0x01946d49633f785da764361dea9a2f2e, 'Voluptatem et itaque cupiditate dignissimos consequatur aut incidunt.', 'Nobis beatae illo est voluptas doloremque vel. Voluptatibus nihil et rerum cumque quo. Omnis numquam quo nemo maiores error sequi dolor.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d4977867a26b5a077a5eaa7a44c, 0x01946d495241765d91f1fc71f4a04985, 'Sit totam voluptatum voluptatibus excepturi ut.', 'Voluptate voluptate qui ducimus quia qui est. Explicabo eaque sint et modi eos ratione qui. Reprehenderit natus maiores sapiente dolores non id. Necessitatibus dolor perferendis explicabo in ut at aliquam.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18'),
(0x01946d49779e7626a7931f9e2b773892, 0x01946d49663574eb8545169ed3274c6e, 'Quasi eligendi rerum explicabo et.', 'Quae impedit temporibus ut placeat dolore tempore. Cupiditate quo quia et qui corporis soluta sed. Quae autem sed et officia enim. Sapiente rerum ab autem modi nihil aliquid sit.', 0, NULL, '2025-01-16 04:05:18', '2025-01-16 04:05:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_properties`
--

CREATE TABLE `tbl_properties` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `bathrooms` int(11) NOT NULL,
  `bedrooms` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `area` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_enable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`id`, `name`, `created_at`, `updated_at`, `is_enable`) VALUES
(1, 'ROLE_SUPER_ADMIN', '2025-01-16 04:05:05', '2025-01-16 04:05:05', 0),
(2, 'ROLE_ADMIN', '2025-01-16 04:05:05', '2025-01-16 04:05:05', 0),
(3, 'ROLE_USER', '2025-01-16 04:05:05', '2025-01-16 04:05:05', 0),
(4, 'ROLE_WRITE', '2025-01-16 04:05:05', '2025-01-16 04:05:05', 0),
(5, 'ROLE_EDITOR', '2025-01-16 04:05:05', '2025-01-16 04:05:05', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_type_property`
--

CREATE TABLE `tbl_type_property` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_type_property`
--

INSERT INTO `tbl_type_property` (`id`, `name`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Apartamento', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(2, 'Casa', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(3, 'Casa Campestre', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(4, 'Apartaestudio', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(5, 'Local', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(6, 'Habitación', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(7, 'Cabaña', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(8, 'Edificio', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(9, 'Oficina', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05'),
(10, 'Lote', 1, '2025-01-16 04:05:05', '2025-01-16 04:05:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo_profile` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `name`, `email`, `password`, `photo_profile`, `created_at`, `updated_at`, `is_verified`) VALUES
(0x01946d4945ec72d5bc3dc4bb9b152dbb, 'Admin', 'admin@example.net', '$2y$13$jQ7oeDlf7pFBWwV3LpydAOj3QaPz1TQIeq.FsUuYaYhXb//JEgpeq', NULL, '2025-01-16 04:05:06', '2025-01-16 04:05:06', 0),
(0x01946d49488f7f2b80de358c8beb0f0c, 'Dr. Kiley Wilkinson', 'esta.harber@example.com', '$2y$13$b3zEg/FRHO6CPKEk4KOEKOFbs9lQI6OUbiZUQEAT0spgNGsNPwhcW', 'https://via.placeholder.com/640x480.png/00ee22?text=quas', '2025-01-16 04:05:06', '2025-01-16 04:05:06', 0),
(0x01946d494af27f568b966579421d81e0, 'Miss Destini Schinner Jr.', 'fritz13@example.com', '$2y$13$YlZQE7Kf9EAe0kTg8sICiexjSkdqUPEbtjaPcQ8QKiiwjhlL.NHay', 'https://via.placeholder.com/640x480.png/007755?text=tempora', '2025-01-16 04:05:07', '2025-01-16 04:05:07', 0),
(0x01946d494dab7d1b82373ca7c0e90ba6, 'Adella Keeling', 'zane.ohara@example.com', '$2y$13$pTtTvYB9JdjTW8dOOgBGcObYPW7vI8icEBp8yKQRhqODLy3bm/ynm', 'https://via.placeholder.com/640x480.png/005544?text=ab', '2025-01-16 04:05:08', '2025-01-16 04:05:08', 0),
(0x01946d494ff072d3ae46049791e593dc, 'Jolie Schumm', 'kavon42@example.net', '$2y$13$bsO3O1T.1y9fbxCgwHeew.Ts1U7DDvdmDxbUboNyeiq4WFf84YLku', 'https://via.placeholder.com/640x480.png/006600?text=dolores', '2025-01-16 04:05:08', '2025-01-16 04:05:08', 0),
(0x01946d495241765d91f1fc71f4a04985, 'Sienna Baumbach', 'odessa.wintheiser@example.org', '$2y$13$wDpP3Ibge3Vl6Mez2zeh5OuqLQH9/jZ2WUIh7DYfyOmBxiyqI30Du', 'https://via.placeholder.com/640x480.png/00dd77?text=magnam', '2025-01-16 04:05:09', '2025-01-16 04:05:09', 0),
(0x01946d495484741ca967e85e0aa211fe, 'Karine King', 'tianna.lebsack@example.org', '$2y$13$SAMi3SOpA9Tuvhu2FMYUyOmpfP7tAUlHiYKUijvUxyzVdwgs9Af.a', 'https://via.placeholder.com/640x480.png/0022ee?text=molestiae', '2025-01-16 04:05:09', '2025-01-16 04:05:09', 0),
(0x01946d4956d0798fb4a5772c58512186, 'Mr. Al Green II', 'muller.benton@example.org', '$2y$13$6xKKh0tBhVDCCh8hN8b9V.elon87a5j9JLe9Ap4eAxOVZCnhP1Eoe', 'https://via.placeholder.com/640x480.png/00ffff?text=dolor', '2025-01-16 04:05:10', '2025-01-16 04:05:10', 0),
(0x01946d4959267ad6b9c37f203a4f15a6, 'Eric Krajcik', 'danny57@example.com', '$2y$13$1JKVr/6oyugkQfCJjJJ8WuTPHB8HqBb1H.xDWj9GhBtFQeJicJwIe', 'https://via.placeholder.com/640x480.png/005500?text=vel', '2025-01-16 04:05:11', '2025-01-16 04:05:11', 0),
(0x01946d495b7976a9a3329507aa4779f1, 'Aliya Borer I', 'lakin.bart@example.org', '$2y$13$o7jUrpRrguYaKO4Cg2E6kOFG5i2cmpG9Va6EWFf2xdlCA.UZDf8pW', 'https://via.placeholder.com/640x480.png/00bb77?text=voluptas', '2025-01-16 04:05:11', '2025-01-16 04:05:11', 0),
(0x01946d495dce7fb1b13b7ebdb21d9cdb, 'Chad O\'Conner', 'llesch@example.com', '$2y$13$3NOqUdZJdwzFIgg3TEHj9uZKuwgVJfJCedlIYnXv/szDxMMzJCmkW', 'https://via.placeholder.com/640x480.png/00aa44?text=dolores', '2025-01-16 04:05:12', '2025-01-16 04:05:12', 0),
(0x01946d49604476628930f705e69e412e, 'Annette Welch', 'larmstrong@example.org', '$2y$13$t82cSnnzBZZgANbIjY5zZOq04v8x9gUUOhMteLOeFCzpe1XEpwiCO', 'https://via.placeholder.com/640x480.png/00bb55?text=excepturi', '2025-01-16 04:05:12', '2025-01-16 04:05:12', 0),
(0x01946d49633f785da764361dea9a2f2e, 'Austen Gislason', 'kiana69@example.com', '$2y$13$F3RItkilN3vJ2N3ICvLAx.WmXZ4NcsR8bwuYq/bbFGD.Q0FYZn9z.', 'https://via.placeholder.com/640x480.png/004422?text=suscipit', '2025-01-16 04:05:13', '2025-01-16 04:05:13', 0),
(0x01946d49663574eb8545169ed3274c6e, 'Aimee Cormier', 'raul.von@example.net', '$2y$13$Jfq7jGI3ov4t4DhkV2gBR.mJB9yBjfu91taFxf6ANWmOxYOm6VrFK', 'https://via.placeholder.com/640x480.png/00bbbb?text=eos', '2025-01-16 04:05:14', '2025-01-16 04:05:14', 0),
(0x01946d4968ef7892a660ce9fa9ea51bc, 'Dr. Icie Feest V', 'bhegmann@example.com', '$2y$13$gbcq1GMdEQe7F94qsHn3bu7UYIQdSBeCrlD75.6fTtEpkGSy23/uO', 'https://via.placeholder.com/640x480.png/007722?text=earum', '2025-01-16 04:05:15', '2025-01-16 04:05:15', 0),
(0x01946d496b7677cd9c88909e78f37f75, 'Jarod Volkman Sr.', 'krista.borer@example.org', '$2y$13$kCy2wEgDqHXkybXCy1CLTe1ZnHq7Z2qjcBE9mIN882UJXzAAtYtVG', 'https://via.placeholder.com/640x480.png/0000aa?text=quia', '2025-01-16 04:05:15', '2025-01-16 04:05:15', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user_roles`
--

CREATE TABLE `tbl_user_roles` (
  `user_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_user_roles`
--

INSERT INTO `tbl_user_roles` (`user_id`, `role_id`) VALUES
(0x01946d4945ec72d5bc3dc4bb9b152dbb, 2),
(0x01946d49488f7f2b80de358c8beb0f0c, 4),
(0x01946d494af27f568b966579421d81e0, 2),
(0x01946d494dab7d1b82373ca7c0e90ba6, 5),
(0x01946d494ff072d3ae46049791e593dc, 2),
(0x01946d495241765d91f1fc71f4a04985, 5),
(0x01946d495484741ca967e85e0aa211fe, 5),
(0x01946d4956d0798fb4a5772c58512186, 3),
(0x01946d4959267ad6b9c37f203a4f15a6, 5),
(0x01946d495b7976a9a3329507aa4779f1, 4),
(0x01946d495dce7fb1b13b7ebdb21d9cdb, 1),
(0x01946d49604476628930f705e69e412e, 1),
(0x01946d49633f785da764361dea9a2f2e, 4),
(0x01946d49663574eb8545169ed3274c6e, 1),
(0x01946d4968ef7892a660ce9fa9ea51bc, 4),
(0x01946d496b7677cd9c88909e78f37f75, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_verify_accounts`
--

CREATE TABLE `tbl_verify_accounts` (
  `id` int(11) NOT NULL,
  `user_id` binary(16) NOT NULL COMMENT '(DC2Type:uuid)',
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `verified_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expiration` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `tbl_advertisements`
--
ALTER TABLE `tbl_advertisements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CBBE14F3549213EC` (`property_id`),
  ADD KEY `IDX_CBBE14F31F8BC47D` (`type_property_id`),
  ADD KEY `IDX_CBBE14F3A76ED395` (`user_id`);

--
-- Indices de la tabla `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8AD7007A76ED395` (`user_id`),
  ADD KEY `IDX_8AD70074B89032C` (`post_id`);

--
-- Indices de la tabla `tbl_images_posts`
--
ALTER TABLE `tbl_images_posts`
  ADD PRIMARY KEY (`public_id`),
  ADD KEY `IDX_5B3621D04B89032C` (`post_id`);

--
-- Indices de la tabla `tbl_images_property`
--
ALTER TABLE `tbl_images_property`
  ADD PRIMARY KEY (`public_id`),
  ADD KEY `IDX_F6FD343A549213EC` (`property_id`);

--
-- Indices de la tabla `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2639F0E5A76ED395` (`user_id`);

--
-- Indices de la tabla `tbl_properties`
--
ALTER TABLE `tbl_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_185A64D85E237E06` (`name`);

--
-- Indices de la tabla `tbl_type_property`
--
ALTER TABLE `tbl_type_property`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BAE7EFF6E7927C74` (`email`);

--
-- Indices de la tabla `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `IDX_3DBF9F0EA76ED395` (`user_id`),
  ADD KEY `IDX_3DBF9F0ED60322AC` (`role_id`);

--
-- Indices de la tabla `tbl_verify_accounts`
--
ALTER TABLE `tbl_verify_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FA481B6EA76ED395` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_type_property`
--
ALTER TABLE `tbl_type_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_verify_accounts`
--
ALTER TABLE `tbl_verify_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_advertisements`
--
ALTER TABLE `tbl_advertisements`
  ADD CONSTRAINT `FK_CBBE14F31F8BC47D` FOREIGN KEY (`type_property_id`) REFERENCES `tbl_type_property` (`id`),
  ADD CONSTRAINT `FK_CBBE14F3549213EC` FOREIGN KEY (`property_id`) REFERENCES `tbl_properties` (`id`),
  ADD CONSTRAINT `FK_CBBE14F3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Filtros para la tabla `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD CONSTRAINT `FK_8AD70074B89032C` FOREIGN KEY (`post_id`) REFERENCES `tbl_posts` (`id`),
  ADD CONSTRAINT `FK_8AD7007A76ED395` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Filtros para la tabla `tbl_images_posts`
--
ALTER TABLE `tbl_images_posts`
  ADD CONSTRAINT `FK_5B3621D04B89032C` FOREIGN KEY (`post_id`) REFERENCES `tbl_posts` (`id`);

--
-- Filtros para la tabla `tbl_images_property`
--
ALTER TABLE `tbl_images_property`
  ADD CONSTRAINT `FK_F6FD343A549213EC` FOREIGN KEY (`property_id`) REFERENCES `tbl_properties` (`id`);

--
-- Filtros para la tabla `tbl_posts`
--
ALTER TABLE `tbl_posts`
  ADD CONSTRAINT `FK_2639F0E5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);

--
-- Filtros para la tabla `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD CONSTRAINT `FK_3DBF9F0EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`),
  ADD CONSTRAINT `FK_3DBF9F0ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`);

--
-- Filtros para la tabla `tbl_verify_accounts`
--
ALTER TABLE `tbl_verify_accounts`
  ADD CONSTRAINT `FK_FA481B6EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
