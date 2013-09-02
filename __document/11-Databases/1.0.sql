/*
SQLyog Ultimate v9.50 
MySQL - 5.5.32-0ubuntu0.13.04.1 : Database - xgoon_dev_boombuddies
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `photos` */

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modifed` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT '1',
  `number_liked` int(11) DEFAULT NULL,
  `number_voted` int(11) DEFAULT NULL,
  `number_shared` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos` */

/*Table structure for table `photos_info` */

DROP TABLE IF EXISTS `photos_info`;

CREATE TABLE `photos_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `action` char(1) DEFAULT NULL COMMENT 'shared;voted;liked',
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos_info` */

/*Table structure for table `photos_tag` */

DROP TABLE IF EXISTS `photos_tag`;

CREATE TABLE `photos_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `photo_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `photos_tag` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `roleId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57698A6AB8C2FD88` (`roleId`),
  KEY `IDX_57698A6A727ACA70` (`parent_id`),
  CONSTRAINT `FK_57698A6A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `role` */

insert  into `role`(`id`,`parent_id`,`roleId`) values (1,NULL,'guest'),(2,1,'user'),(3,2,'moderator'),(4,3,'administrator');

/*Table structure for table `user_provider` */

DROP TABLE IF EXISTS `user_provider`;

CREATE TABLE `user_provider` (
  `user_id` int(11) NOT NULL,
  `provider_id` varchar(50) NOT NULL,
  `provider` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`provider_id`),
  UNIQUE KEY `provider_id` (`provider_id`,`provider`),
  CONSTRAINT `user_provider_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_provider` */

/*Table structure for table `user_role_linker` */

DROP TABLE IF EXISTS `user_role_linker`;

CREATE TABLE `user_role_linker` (
  `user_id` int(11) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role_linker` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `displayName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `avatarUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`),
  UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`email`,`displayName`,`password`,`avatarUrl`) values (3,NULL,'toana@xgoon.com',NULL,'$2y$14$jvxXD4yBefuRabFqbY7C7eDNMDSKqHYpIKnZiiHV79SgDObYcqfiK',NULL),(6,NULL,'toanaas@xgoon.com',NULL,'$2y$14$xDe0MwedXb9eLl0/leaVj.rtRgiBQdPgTUI8RQhRfby5V9Zf4XMn.',NULL);

/*Table structure for table `users_roles` */

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `IDX_51498A8EA76ED395` (`user_id`),
  KEY `IDX_51498A8ED60322AC` (`role_id`),
  CONSTRAINT `FK_51498A8EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_51498A8ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users_roles` */

insert  into `users_roles`(`user_id`,`role_id`) values (3,2),(6,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
