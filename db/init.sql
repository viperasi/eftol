/*
SQLyog Community v10.2 Beta1
MySQL - 5.5.8-log : Database - eftol_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eftol_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `eftol_db`;

/*Table structure for table `eft` */

DROP TABLE IF EXISTS `eft`;

CREATE TABLE `eft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `ship` int(11) NOT NULL COMMENT '船ID',
  `sender` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `pubtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `good` int(11) NOT NULL DEFAULT '0' COMMENT '感谢',
  `bad` int(11) NOT NULL DEFAULT '0' COMMENT '坑爹',
  `normal` int(11) NOT NULL DEFAULT '0' COMMENT '无聊',
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  `url` varchar(500) DEFAULT NULL COMMENT '分享地址',
  `home` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否推荐首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `eft` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `passwd` varchar(200) NOT NULL,
  `regtime` datetime NOT NULL,
  `enabled` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`name`,`passwd`,`regtime`,`enabled`) values (1,'a@a.com','a','a','2013-01-22 22:08:07',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
