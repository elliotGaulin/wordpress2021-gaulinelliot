DROP DATABASE IF EXISTS wordpress2021_gaulinelliot;
CREATE DATABASE wordpress2021_gaulinelliot;
USE wordpress2021_gaulinelliot;

-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: wordpress2021_gaulinelliot
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cegepvicto_actionscheduler_actions`
--

DROP TABLE IF EXISTS `cegepvicto_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_actionscheduler_actions`
--

LOCK TABLES `cegepvicto_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `cegepvicto_actionscheduler_actions` VALUES (51,'aioseo_admin_notifications_update','pending','2021-09-14 01:00:00','2021-09-14 01:00:00','[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1631581200;s:18:\"\0*\0first_timestamp\";i:1631581200;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1631581200;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),(53,'action_scheduler/migration_hook','pending','2021-09-13 19:34:38','2021-09-13 19:34:38','[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1631561678;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1631561678;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),(54,'aioseo_cleanup_action_scheduler','pending','2021-09-14 19:33:38','2021-09-14 19:33:38','[]','O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1631648018;s:18:\"\0*\0first_timestamp\";i:1631648018;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1631648018;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),(55,'aioseo_cleanup_action_scheduler','complete','0000-00-00 00:00:00','0000-00-00 00:00:00','[]','O:28:\"ActionScheduler_NullSchedule\":0:{}',1,1,'2021-09-13 19:33:39','2021-09-13 19:33:39',0,NULL);
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_actionscheduler_claims`
--

DROP TABLE IF EXISTS `cegepvicto_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_actionscheduler_claims`
--

LOCK TABLES `cegepvicto_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_actionscheduler_groups`
--

DROP TABLE IF EXISTS `cegepvicto_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_actionscheduler_groups`
--

LOCK TABLES `cegepvicto_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `cegepvicto_actionscheduler_groups` VALUES (1,'aioseo'),(2,'action-scheduler-migration');
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_actionscheduler_logs`
--

DROP TABLE IF EXISTS `cegepvicto_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_actionscheduler_logs`
--

LOCK TABLES `cegepvicto_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `cegepvicto_actionscheduler_logs` VALUES (1,51,'action created','2021-09-13 19:33:38','2021-09-13 19:33:38'),(3,53,'action created','2021-09-13 19:33:38','2021-09-13 19:33:38'),(4,54,'action created','2021-09-13 19:33:38','2021-09-13 19:33:38'),(5,55,'action created','2021-09-13 19:33:38','2021-09-13 19:33:38'),(8,55,'action started via WP Cron','2021-09-13 19:33:39','2021-09-13 19:33:39'),(9,55,'action complete via WP Cron','2021-09-13 19:33:39','2021-09-13 19:33:39');
/*!40000 ALTER TABLE `cegepvicto_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_aioseo_notifications`
--

DROP TABLE IF EXISTS `cegepvicto_aioseo_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_aioseo_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(13) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `level` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `notification_id` bigint(20) unsigned DEFAULT NULL,
  `notification_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `button1_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button1_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button2_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `button2_action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dismissed` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_notifications_slug` (`slug`),
  KEY `ndx_aioseo_notifications_dates` (`start`,`end`),
  KEY `ndx_aioseo_notifications_type` (`type`),
  KEY `ndx_aioseo_notifications_dismissed` (`dismissed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_aioseo_notifications`
--

LOCK TABLES `cegepvicto_aioseo_notifications` WRITE;
/*!40000 ALTER TABLE `cegepvicto_aioseo_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_aioseo_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_aioseo_posts`
--

DROP TABLE IF EXISTS `cegepvicto_aioseo_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_aioseo_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_520_ci,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `keywords` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `keyphrases` longtext COLLATE utf8mb4_unicode_520_ci,
  `page_analysis` longtext COLLATE utf8mb4_unicode_520_ci,
  `canonical_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_title` text COLLATE utf8mb4_unicode_520_ci,
  `og_description` text COLLATE utf8mb4_unicode_520_ci,
  `og_object_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `og_image_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `og_image_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_image_custom_fields` text COLLATE utf8mb4_unicode_520_ci,
  `og_custom_image_width` int(11) DEFAULT NULL,
  `og_custom_image_height` int(11) DEFAULT NULL,
  `og_video` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `og_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `og_article_section` text COLLATE utf8mb4_unicode_520_ci,
  `og_article_tags` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_use_og` tinyint(1) DEFAULT '1',
  `twitter_card` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `twitter_image_type` varchar(64) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `twitter_image_custom_url` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_image_custom_fields` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_title` text COLLATE utf8mb4_unicode_520_ci,
  `twitter_description` text COLLATE utf8mb4_unicode_520_ci,
  `seo_score` int(11) NOT NULL DEFAULT '0',
  `schema_type` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schema_type_options` longtext COLLATE utf8mb4_unicode_520_ci,
  `pillar_content` tinyint(1) DEFAULT NULL,
  `robots_default` tinyint(1) NOT NULL DEFAULT '1',
  `robots_noindex` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noarchive` tinyint(1) NOT NULL DEFAULT '0',
  `robots_nosnippet` tinyint(1) NOT NULL DEFAULT '0',
  `robots_nofollow` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noimageindex` tinyint(1) NOT NULL DEFAULT '0',
  `robots_noodp` tinyint(1) NOT NULL DEFAULT '0',
  `robots_notranslate` tinyint(1) NOT NULL DEFAULT '0',
  `robots_max_snippet` int(11) DEFAULT NULL,
  `robots_max_videopreview` int(11) DEFAULT NULL,
  `robots_max_imagepreview` varchar(20) COLLATE utf8mb4_unicode_520_ci DEFAULT 'none',
  `tabs` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `images` longtext COLLATE utf8mb4_unicode_520_ci,
  `priority` tinytext COLLATE utf8mb4_unicode_520_ci,
  `frequency` tinytext COLLATE utf8mb4_unicode_520_ci,
  `videos` longtext COLLATE utf8mb4_unicode_520_ci,
  `video_thumbnail` text COLLATE utf8mb4_unicode_520_ci,
  `video_scan_date` datetime DEFAULT NULL,
  `local_seo` longtext COLLATE utf8mb4_unicode_520_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_aioseo_posts_post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_aioseo_posts`
--

LOCK TABLES `cegepvicto_aioseo_posts` WRITE;
/*!40000 ALTER TABLE `cegepvicto_aioseo_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_aioseo_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_commentmeta`
--

DROP TABLE IF EXISTS `cegepvicto_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_commentmeta`
--

LOCK TABLES `cegepvicto_commentmeta` WRITE;
/*!40000 ALTER TABLE `cegepvicto_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_comments`
--

DROP TABLE IF EXISTS `cegepvicto_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_comments`
--

LOCK TABLES `cegepvicto_comments` WRITE;
/*!40000 ALTER TABLE `cegepvicto_comments` DISABLE KEYS */;
INSERT INTO `cegepvicto_comments` VALUES (1,1,'Un commentateur WordPress','wapuu@wordpress.example','https://wordpress.org/','','2021-08-26 19:07:42','2021-08-26 19:07:42','Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://gravatar.com\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `cegepvicto_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_links`
--

DROP TABLE IF EXISTS `cegepvicto_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_links`
--

LOCK TABLES `cegepvicto_links` WRITE;
/*!40000 ALTER TABLE `cegepvicto_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_options`
--

DROP TABLE IF EXISTS `cegepvicto_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_options`
--

LOCK TABLES `cegepvicto_options` WRITE;
/*!40000 ALTER TABLE `cegepvicto_options` DISABLE KEYS */;
INSERT INTO `cegepvicto_options` VALUES (423,'_transient_feed_c2c41a1983fe61b478621b3a27fe7d1e','a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:55:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"SEOPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://www.seopress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"WordPress SEO Plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 09 Sep 2021 10:08:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"https://wordpress.org/?v=5.7.3\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:12:{i:0;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"Introduction to On-Page SEO with WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"https://www.seopress.org/blog/introduction-to-on-page-seo-with-wordpress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://www.seopress.org/blog/introduction-to-on-page-seo-with-wordpress/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 09 Sep 2021 09:23:00 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"How-to\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=312465\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"On-page SEO refers to optimizations that you can perform on your website to improve...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"https://www.seopress.org/blog/introduction-to-on-page-seo-with-wordpress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:23:\"Google News August 2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://www.seopress.org/blog/google-news-august-2021/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://www.seopress.org/blog/google-news-august-2021/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 31 Aug 2021 09:08:23 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=311746\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:85:\"We keep an eye on Google’s algorithm updates because Google remains, by far, the...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://www.seopress.org/blog/google-news-august-2021/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"Universal SEO metabox (part 2) &amp; Internal linking suggestions – SEOPress 5.1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"https://www.seopress.org/blog/seopress-5-1/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://www.seopress.org/blog/seopress-5-1/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 24 Aug 2021 07:46:20 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=311551\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"SEOPress 5.1 is now available. We encourage you to update your site as soon as...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://www.seopress.org/blog/seopress-5-1/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"Selling Sunglasses with WooCommerce and SEOPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:70:\"https://www.seopress.org/blog/selling-sunglasses-woocommerce-seopress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:78:\"https://www.seopress.org/blog/selling-sunglasses-woocommerce-seopress/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 12 Aug 2021 08:00:23 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Case study\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=306866\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"Imagine that you are a freelance web designer who uses WordPress to make sites...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"https://www.seopress.org/blog/selling-sunglasses-woocommerce-seopress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Google News July 2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://www.seopress.org/blog/google-news-july-2021/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://www.seopress.org/blog/google-news-july-2021/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 05 Aug 2021 08:28:41 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=305631\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"After a busy month of June with 4 official updates, Google announced two new...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://www.seopress.org/blog/google-news-july-2021/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:61:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n\n\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:8:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"Universal SEO metabox, new UI and more – SEOPress 5.0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:43:\"https://www.seopress.org/blog/seopress-5-0/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://www.seopress.org/blog/seopress-5-0/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 29 Jul 2021 12:04:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=300223\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:82:\"SEOPress 5.0 is now available. We encourage you to update your site as soon as...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"enclosure\";a:2:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:86:\"https://www.seopress.org/wp-content/uploads/2021/07/SEOPress-universal-SEO-metabox.mp4\";s:6:\"length\";s:8:\"16509387\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:74:\"https://www.seopress.org/wp-content/uploads/2021/07/SEOPress-new-UI-v5.mp4\";s:6:\"length\";s:7:\"2894530\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"https://www.seopress.org/blog/seopress-5-0/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"11\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"Getting started with ecommerce SEO using WooCommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:83:\"https://www.seopress.org/blog/getting-started-with-ecommerce-seo-using-woocommerce/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:91:\"https://www.seopress.org/blog/getting-started-with-ecommerce-seo-using-woocommerce/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 22 Jul 2021 12:09:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"How-to\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=301005\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"If you run or are thinking about starting an ecommerce site, you will be...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"https://www.seopress.org/blog/getting-started-with-ecommerce-seo-using-woocommerce/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Google News June 2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://www.seopress.org/blog/google-news-june-2021/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://www.seopress.org/blog/google-news-june-2021/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Jul 2021 10:01:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=295822\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:98:\"After months without any official updates to the search algorithm worldwide, Google announced 4...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://www.seopress.org/blog/google-news-june-2021/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"Brewing Up SEO Success With SEOPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:67:\"https://www.seopress.org/blog/brewing-up-seo-success-with-seopress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"https://www.seopress.org/blog/brewing-up-seo-success-with-seopress/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 25 Jun 2021 08:00:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Case study\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=294547\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"Imagine that you run a small craft brewery in England producing gluten-free beer. How...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"https://www.seopress.org/blog/brewing-up-seo-success-with-seopress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:41:\"Page Speed, Google, Ranking and WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"https://www.seopress.org/blog/page-speed-google-ranking-wordpress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:74:\"https://www.seopress.org/blog/page-speed-google-ranking-wordpress/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 10 Jun 2021 08:16:50 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Tips and tricks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=291160\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"It is generally agreed that users do not like to wait for pages to...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://www.seopress.org/blog/page-speed-google-ranking-wordpress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:10;a:6:{s:4:\"data\";s:60:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:8:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:20:\"Google News May 2021\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://www.seopress.org/blog/google-news-may-2021/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://www.seopress.org/blog/google-news-may-2021/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 03 Jun 2021 16:00:06 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"News\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=289196\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:90:\"There was no official update of Google’s algorithm in May 2021, but continued reports...\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"enclosure\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:3:\"url\";s:77:\"https://www.seopress.org/wp-content/uploads/2021/06/1-illustration-google.mp4\";s:6:\"length\";s:7:\"1649715\";s:4:\"type\";s:9:\"video/mp4\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://www.seopress.org/blog/google-news-may-2021/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:11;a:6:{s:4:\"data\";s:59:\"\n		\n		\n					\n		\n		\n		\n				\n		\n\n					\n		\n					\n			\n		\n		\n			\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:4:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:48:\"10 Tips to Get the Most Out of SEOPress Insights\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"https://www.seopress.org/blog/10-tips-to-get-the-most-out-of-seopress-insights/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:87:\"https://www.seopress.org/blog/10-tips-to-get-the-most-out-of-seopress-insights/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 27 May 2021 16:00:16 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:15:\"Tips and tricks\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"https://www.seopress.org/?p=287403\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:79:\"SEOPress Insights is a plugin that can be installed on top of SEOPress Free....\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Benjamin Denis\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"https://www.seopress.org/blog/10-tips-to-get-the-most-out-of-seopress-insights/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:30:\"https://www.seopress.org/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:21:{s:4:\"date\";s:29:\"Mon, 13 Sep 2021 19:40:48 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:14:\"content-length\";s:4:\"2051\";s:4:\"link\";s:61:\"<https://www.seopress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:16:\"x-xss-protection\";s:13:\"1; mode=block\";s:22:\"x-content-type-options\";s:7:\"nosniff\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:15:\"referrer-policy\";s:24:\"origin-when-cross-origin\";s:13:\"last-modified\";s:29:\"Thu, 09 Sep 2021 10:08:20 GMT\";s:13:\"cache-control\";s:12:\"max-age=3600\";s:7:\"expires\";s:29:\"Mon, 13 Sep 2021 20:40:48 GMT\";s:4:\"vary\";s:15:\"Accept-Encoding\";s:16:\"content-encoding\";s:4:\"gzip\";s:25:\"strict-transport-security\";s:16:\"max-age=31536000\";s:15:\"cf-cache-status\";s:7:\"DYNAMIC\";s:9:\"expect-ct\";s:87:\"max-age=604800, report-uri=\"https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct\"\";s:9:\"report-to\";s:245:\"{\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report\\/v3?s=MS3sgDyErFo9MNekX%2B3Le2FToTKBA2LawdcgQ8QsaBPr7otAWsU3DFuwcRLd6pSHzcNVUjmNVHRuJpKgkr8qZkaN5APIIMor%2B0NoAZPQA7NBHytSF9gsKnYz%2Bc7%2BwhY80e7l\"}],\"group\":\"cf-nel\",\"max_age\":604800}\";s:3:\"nel\";s:60:\"{\"success_fraction\":0,\"report_to\":\"cf-nel\",\"max_age\":604800}\";s:6:\"server\";s:10:\"cloudflare\";s:6:\"cf-ray\";s:20:\"68e3d9728cc44bcb-YUL\";s:7:\"alt-svc\";s:91:\"h3=\":443\"; ma=86400, h3-29=\":443\"; ma=86400, h3-28=\":443\"; ma=86400, h3-27=\":443\"; ma=86400\";}}s:5:\"build\";s:14:\"20201016172006\";}','no'),(424,'_transient_timeout_feed_mod_c2c41a1983fe61b478621b3a27fe7d1e','1631605249','no'),(425,'_transient_feed_mod_c2c41a1983fe61b478621b3a27fe7d1e','1631562049','no'),(426,'_transient_timeout_settings_errors','1631563818','no'),(427,'_transient_settings_errors','a:1:{i:0;a:4:{s:7:\"setting\";s:7:\"general\";s:4:\"code\";s:16:\"settings_updated\";s:7:\"message\";s:23:\"Réglages enregistrés.\";s:4:\"type\";s:7:\"success\";}}','no'),(431,'_transient_is_multi_author','0','yes');
/*!40000 ALTER TABLE `cegepvicto_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_postmeta`
--

DROP TABLE IF EXISTS `cegepvicto_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_postmeta`
--

LOCK TABLES `cegepvicto_postmeta` WRITE;
/*!40000 ALTER TABLE `cegepvicto_postmeta` DISABLE KEYS */;
INSERT INTO `cegepvicto_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,3,'_wp_page_template','default'),(49,30,'_edit_lock','1631563053:2'),(50,31,'_wp_attached_file','2021/08/PXL_20210627_220059225_exported_850-2.jpg'),(51,31,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:922;s:6:\"height\";i:978;s:4:\"file\";s:49:\"2021/08/PXL_20210627_220059225_exported_850-2.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:49:\"PXL_20210627_220059225_exported_850-2-283x300.jpg\";s:5:\"width\";i:283;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:49:\"PXL_20210627_220059225_exported_850-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:49:\"PXL_20210627_220059225_exported_850-2-768x815.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:815;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1630178289\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),(52,32,'_wp_attached_file','2021/08/PXL_20210627_220059225_exported_850-2-1.jpg'),(53,32,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:922;s:6:\"height\";i:978;s:4:\"file\";s:51:\"2021/08/PXL_20210627_220059225_exported_850-2-1.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:51:\"PXL_20210627_220059225_exported_850-2-1-283x300.jpg\";s:5:\"width\";i:283;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:51:\"PXL_20210627_220059225_exported_850-2-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:51:\"PXL_20210627_220059225_exported_850-2-1-768x815.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:815;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1630178289\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),(54,30,'_thumbnail_id','32'),(55,35,'_edit_lock','1630193272:1'),(56,37,'_menu_item_type','custom'),(57,37,'_menu_item_menu_item_parent','0'),(58,37,'_menu_item_object_id','37'),(59,37,'_menu_item_object','custom'),(60,37,'_menu_item_target',''),(61,37,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(62,37,'_menu_item_xfn',''),(63,37,'_menu_item_url','http://localhost/wordpress2021-gaulinelliot/'),(65,38,'_menu_item_type','post_type'),(66,38,'_menu_item_menu_item_parent','0'),(67,38,'_menu_item_object_id','30'),(68,38,'_menu_item_object','page'),(69,38,'_menu_item_target',''),(70,38,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(71,38,'_menu_item_xfn',''),(72,38,'_menu_item_url',''),(74,39,'_menu_item_type','post_type'),(75,39,'_menu_item_menu_item_parent','0'),(76,39,'_menu_item_object_id','35'),(77,39,'_menu_item_object','page'),(78,39,'_menu_item_target',''),(79,39,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(80,39,'_menu_item_xfn',''),(81,39,'_menu_item_url',''),(83,40,'_menu_item_type','post_type'),(84,40,'_menu_item_menu_item_parent','0'),(85,40,'_menu_item_object_id','2'),(86,40,'_menu_item_object','page'),(87,40,'_menu_item_target',''),(88,40,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(89,40,'_menu_item_xfn',''),(90,40,'_menu_item_url',''),(91,40,'_menu_item_orphaned','1630193313'),(92,2,'_edit_lock','1631559648:2'),(93,1,'_edit_lock','1631560613:2'),(98,47,'_edit_lock','1631563020:2'),(99,49,'_menu_item_type','post_type'),(100,49,'_menu_item_menu_item_parent','0'),(101,49,'_menu_item_object_id','47'),(102,49,'_menu_item_object','page'),(103,49,'_menu_item_target',''),(104,49,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),(105,49,'_menu_item_xfn',''),(106,49,'_menu_item_url',''),(108,37,'_wp_old_date','2021-08-28'),(109,38,'_wp_old_date','2021-08-28'),(110,39,'_wp_old_date','2021-08-28'),(112,47,'_seopress_analysis_data','a:19:{s:5:\"title\";s:23:\"Contact - Elliot Gaulin\";s:9:\"meta_desc\";s:979:\"Contacte Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3  Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3\";s:8:\"og_title\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:23:\"Contact - Elliot Gaulin\";}}s:7:\"og_desc\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:979:\"Contacte Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3  Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3\";}}s:6:\"og_img\";a:1:{s:5:\"count\";i:0;}s:6:\"og_url\";a:3:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:52:\"http://localhost/wordpress2021-gaulinelliot/contact/\";}s:4:\"host\";s:9:\"localhost\";}s:12:\"og_site_name\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:26:\"wordpress2021-gaulinelliot\";}}s:8:\"tw_title\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:23:\"Contact - Elliot Gaulin\";}}s:7:\"tw_desc\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:979:\"Contacte Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3 Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3  Vous pouvez me contacter aux coordonnées suivantes en tout temps : Nom : Elliot Gaulin email : 2039854@carrefour.cegepvicto.ca Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3\";}}s:6:\"tw_img\";a:1:{s:5:\"count\";i:0;}s:9:\"canonical\";s:52:\"http://localhost/wordpress2021-gaulinelliot/contact/\";s:13:\"all_canonical\";a:1:{i:0;s:52:\"http://localhost/wordpress2021-gaulinelliot/contact/\";}s:2:\"h1\";a:1:{s:9:\"nomatches\";a:1:{s:5:\"count\";i:1;}}s:11:\"meta_robots\";a:1:{i:0;a:1:{i:0;s:13:\"index, follow\";}}s:14:\"outbound_links\";a:1:{i:3;a:1:{s:47:\"https://www.mypreview.one/hypermarket-plus.html\";s:11:\"Hypermarket\";}}s:13:\"words_counter\";i:28;s:20:\"words_counter_unique\";i:28;s:4:\"json\";a:1:{i:0;s:6:\"Person\";}s:5:\"score\";b:0;}'),(114,47,'_edit_last','2'),(115,47,'_seopress_titles_title','Contact - Elliot Gaulin'),(116,47,'_seopress_titles_desc','Contacte %%post_excerpt%% %%post_excerpt%% %%post_excerpt%% %%post_excerpt%%  %%post_excerpt%%'),(117,47,'_seopress_robots_canonical',''),(118,47,'_seopress_social_fb_title',''),(119,47,'_seopress_social_fb_desc',''),(120,47,'_seopress_social_fb_img',''),(121,47,'_seopress_social_twitter_title',''),(122,47,'_seopress_social_twitter_desc',''),(123,47,'_seopress_social_twitter_img',''),(124,47,'_seopress_redirections_type','301'),(125,47,'_seopress_redirections_value',''),(129,30,'_seopress_analysis_data','a:20:{s:5:\"title\";s:45:\"À propos de moi - wordpress2021-gaulinelliot\";s:9:\"meta_desc\";s:224:\"Amateur de sport de planche depuis toujours, j&#039;ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasin en ligne d&#039;équipement de planche à roulette et de planche à neige.\";s:8:\"og_title\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:45:\"À propos de moi - wordpress2021-gaulinelliot\";}}s:7:\"og_desc\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:224:\"Amateur de sport de planche depuis toujours, j&#039;ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasin en ligne d&#039;équipement de planche à roulette et de planche à neige.\";}}s:6:\"og_img\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:114:\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2-1.jpg\";}}s:6:\"og_url\";a:3:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:60:\"http://localhost/wordpress2021-gaulinelliot/a-propos-de-moi/\";}s:4:\"host\";s:9:\"localhost\";}s:12:\"og_site_name\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:26:\"wordpress2021-gaulinelliot\";}}s:8:\"tw_title\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:45:\"À propos de moi - wordpress2021-gaulinelliot\";}}s:7:\"tw_desc\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:224:\"Amateur de sport de planche depuis toujours, j&#039;ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasin en ligne d&#039;équipement de planche à roulette et de planche à neige.\";}}s:6:\"tw_img\";a:2:{s:5:\"count\";i:1;s:6:\"values\";a:1:{i:0;s:114:\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2-1.jpg\";}}s:9:\"canonical\";s:60:\"http://localhost/wordpress2021-gaulinelliot/a-propos-de-moi/\";s:13:\"all_canonical\";a:1:{i:0;s:60:\"http://localhost/wordpress2021-gaulinelliot/a-propos-de-moi/\";}s:2:\"h1\";a:1:{s:9:\"nomatches\";a:1:{s:5:\"count\";i:1;}}s:3:\"img\";a:1:{s:6:\"images\";a:1:{i:0;s:112:\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2.jpg\";}}s:11:\"meta_robots\";a:1:{i:0;a:1:{i:0;s:13:\"index, follow\";}}s:14:\"outbound_links\";a:1:{i:4;a:1:{s:47:\"https://www.mypreview.one/hypermarket-plus.html\";s:11:\"Hypermarket\";}}s:13:\"words_counter\";i:38;s:20:\"words_counter_unique\";i:29;s:4:\"json\";a:1:{i:0;s:6:\"Person\";}s:5:\"score\";b:0;}'),(130,47,'_seopress_analysis_target_kw',''),(132,30,'_seopress_analysis_target_kw',''),(133,30,'_edit_last','2'),(134,30,'_seopress_titles_title',''),(135,30,'_seopress_titles_desc',''),(136,30,'_seopress_robots_canonical',''),(137,30,'_seopress_social_fb_title',''),(138,30,'_seopress_social_fb_desc',''),(139,30,'_seopress_social_fb_img',''),(140,30,'_seopress_social_twitter_title',''),(141,30,'_seopress_social_twitter_desc',''),(142,30,'_seopress_social_twitter_img',''),(143,30,'_seopress_redirections_type','301'),(144,30,'_seopress_redirections_value','');
/*!40000 ALTER TABLE `cegepvicto_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_posts`
--

DROP TABLE IF EXISTS `cegepvicto_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_posts`
--

LOCK TABLES `cegepvicto_posts` WRITE;
/*!40000 ALTER TABLE `cegepvicto_posts` DISABLE KEYS */;
INSERT INTO `cegepvicto_posts` VALUES (1,2,'2021-08-26 19:07:42','2021-08-26 19:07:42','<!-- wp:paragraph -->\n<p>Ceci est un superbe magasin en ligne de skateboard et de snowboard. Vous pouvez obtenir tous ce que vous avez besoin pour votre prochaine session de planche : planches à roulette, \"trucks\", roues, \"griptape\", \"bearings\", etc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Keep on shredding my guys!</p>\n<!-- /wp:paragraph -->','Bonjour tout le monde !','','publish','open','open','','bonjour-tout-le-monde','','','2021-09-13 19:08:44','2021-09-13 19:08:44','',0,'http://localhost/wordpress2021-gaulinelliot/?p=1',0,'post','',1),(2,2,'2021-08-26 19:07:42','2021-08-26 19:07:42','<!-- wp:paragraph -->\n<p>Ceci est une page d’exemple. C’est différent d’un article de blogue parce qu’elle restera au même endroit et apparaîtra dans la navigation de votre site (dans la plupart des thèmes). La plupart des gens commencent par une page « À propos » qui les présente aux visiteurs du site. Cela pourrait ressembler à quelque chose comme ceci :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Bonjour! Je suis un mécanicien qui aspire à devenir acteur, et voici mon site. J’habite à Montréal, j’ai un super chien baptisé Fido, et j’aime le rhum-citron (ainsi qu’être surpris par la pluie soudaine lors de longues balades en forêt au coucher du soleil).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>... ou quelque chose comme ceci :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La société 123 Patente Chose a été créée en 1971 et n’a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Glinglin-des-Meumeu, 123 Patente Chose emploie 2 000 personnes et fabrique toutes sortes de choses intéressantes pour la communauté glinglinoise.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>En tant que nouvel·le utilisateur·trice de WordPress, vous devriez consulter <a href=\"http://localhost/wordpress2021-gaulinelliot/wp-admin/\">votre tableau de bord</a> pour supprimer cette page et créer de nouvelles pages pour votre contenu. Amusez-vous bien!</p>\n<!-- /wp:paragraph -->','Page d’exemple','','publish','closed','open','','page-d-exemple','','','2021-08-26 19:07:42','2021-08-26 19:07:42','',0,'http://localhost/wordpress2021-gaulinelliot/?page_id=2',0,'page','',0),(3,2,'2021-08-26 19:07:42','2021-08-26 19:07:42','<!-- wp:heading --><h2>Qui sommes-nous</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>L\'adresse de notre site web est : http://localhost/wordpress2021-gaulinelliot.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Commentaires</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Une chaîne anonymisée créée à partir de votre adresse courriel (également appelée \"hash\") peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les politiques de confidentialité du service Gravatar sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Média</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF contenant des coordonnées GPS. Les visiteurs de ce site web peuvent télécharger et extraire des données de localisation depuis ces images.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Témoins</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous laissez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse courriel et site web dans des témoins. C’est uniquement pour vous simplifier la vie afin de ne pas avoir à saisir ces informations si vous laissez un autre commentaire plus tard. Ces témoins expirent au bout d’un an.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si vous vous rendez sur la page de connexion, un témoin temporaire sera créé afin de déterminer si votre navigateur accepte les témoins. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de témoins pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un témoin de connexion est de deux jours, celle d’un témoin d’option d’écran est d’un an. Si vous cochez « Se souvenir de moi », votre témoin de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le témoin de connexion sera effacé.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>En modifiant ou en publiant un article, un témoin supplémentaire sera enregistré dans votre navigateur. Ce témoin ne comprend aucune donnée personnelle. Il indique simplement l’identifiant de l’article que vous venez de modifier. Il expire au bout d’une journée.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Contenu imbriqué d\'autres sites web</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles, etc). Le contenu intégré à partir d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Ces sites web pourraient recueillir des données sur vous, utiliser des témoins, installer des outils de suivi tierce-partie ou suivre vos interactions avec ces contenus intégrés si vous disposez d’un compte et êtes connecté leur site web.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Avec qui partageons-nous vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous demandez une réinitialisation de votre mot de passe, votre adresse IP sera incluse dans le courriel de réinitialisation.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Pendant combien de temps vos données sont-elles conservées ?</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Ceci permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Pour les utilisateurs qui s’enregistrent sur notre site (si cela est possible), nous conservons également les données personnelles indiquées dans leur profil. Tous les utilisateurs peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Quels sont vos droits sur vos données ?</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Si vous avez un compte ou si vous avez laissé des commentaires sur ce site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Ceci ne prend pas en compte les données conservées à des fins administratives, légales ou pour des raisons de sécurité.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Texte suggéré : </strong>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p><!-- /wp:paragraph -->','Politique de confidentialité','','draft','closed','open','','politique-de-confidentialite','','','2021-08-26 19:07:42','2021-08-26 19:07:42','',0,'http://localhost/wordpress2021-gaulinelliot/?page_id=3',0,'page','',0),(30,2,'2021-08-28 23:24:14','2021-08-28 23:24:14','<!-- wp:paragraph -->\n<p>Amateur de sport de planche depuis toujours, j\'ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasin en ligne d\'équipement de planche à roulette et  de planche à neige.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"align\":\"center\",\"id\":31,\"width\":564,\"height\":597,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<div class=\"wp-block-image is-style-default\"><figure class=\"aligncenter size-full is-resized\"><img src=\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2.jpg\" alt=\"\" class=\"wp-image-31\" width=\"564\" height=\"597\"/></figure></div>\n<!-- /wp:image -->','À propos de moi','','publish','open','closed','','a-propos-de-moi','','','2021-09-13 19:57:32','2021-09-13 19:57:32','',0,'http://localhost/wordpress2021-gaulinelliot/?page_id=30',0,'page','',0),(31,2,'2021-08-28 23:20:45','2021-08-28 23:20:45','','PXL_20210627_220059225_exported_850-2','','inherit','open','closed','','pxl_20210627_220059225_exported_850-2','','','2021-08-28 23:20:45','2021-08-28 23:20:45','',30,'http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2.jpg',0,'attachment','image/jpeg',0),(32,2,'2021-08-28 23:23:48','2021-08-28 23:23:48','','PXL_20210627_220059225_exported_850 (2)','','inherit','open','closed','','pxl_20210627_220059225_exported_850-2-2','','','2021-08-28 23:23:48','2021-08-28 23:23:48','',30,'http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2-1.jpg',0,'attachment','image/jpeg',0),(33,2,'2021-08-28 23:24:14','2021-08-28 23:24:14','<!-- wp:paragraph -->\n<p>Amateur de sport de planche depuis toujours, j\'ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasion en ligne d\'équipement de planche à roulette et  de planche à neige.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"align\":\"center\",\"id\":31,\"width\":564,\"height\":597,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<div class=\"wp-block-image is-style-default\"><figure class=\"aligncenter size-full is-resized\"><img src=\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2.jpg\" alt=\"\" class=\"wp-image-31\" width=\"564\" height=\"597\"/></figure></div>\n<!-- /wp:image -->','À propos de moi','','inherit','closed','closed','','30-revision-v1','','','2021-08-28 23:24:14','2021-08-28 23:24:14','',30,'http://localhost/wordpress2021-gaulinelliot/?p=33',0,'revision','',0),(34,2,'2021-08-28 23:24:43','2021-08-28 23:24:43','<!-- wp:paragraph -->\n<p>Amateur de sport de planche depuis toujours, j\'ai décidé de mettre ensemble ma passion et mon travail afin de développer pour vous ce magasin en ligne d\'équipement de planche à roulette et  de planche à neige.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"align\":\"center\",\"id\":31,\"width\":564,\"height\":597,\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"className\":\"is-style-default\"} -->\n<div class=\"wp-block-image is-style-default\"><figure class=\"aligncenter size-full is-resized\"><img src=\"http://localhost/wordpress2021-gaulinelliot/wp-content/uploads/2021/08/PXL_20210627_220059225_exported_850-2.jpg\" alt=\"\" class=\"wp-image-31\" width=\"564\" height=\"597\"/></figure></div>\n<!-- /wp:image -->','À propos de moi','','inherit','closed','closed','','30-revision-v1','','','2021-08-28 23:24:43','2021-08-28 23:24:43','',30,'http://localhost/wordpress2021-gaulinelliot/?p=34',0,'revision','',0),(35,2,'2021-08-28 23:28:13','2021-08-28 23:28:13','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator\"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare nulla tortor, sit amet volutpat mauris cursus in. Vivamus eget erat suscipit, egestas risus a, malesuada quam. Curabitur id urna a massa aliquet mollis non quis arcu. Quisque augue eros, dapibus a augue sit amet, elementum lacinia enim. Fusce ut turpis libero. Phasellus pharetra sit amet erat egestas blandit. Proin consectetur venenatis nisi in aliquet. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Morbi nulla tellus, congue quis feugiat sed, tincidunt in ipsum. Morbi dictum viverra auctor. Nullam rhoncus neque in sapien sagittis, vitae feugiat mauris aliquam. Sed at egestas ex, eu tempus diam. Nullam non quam turpis. Sed congue venenatis vehicula. Donec vitae mi nisl. Donec auctor tincidunt faucibus. Cras scelerisque ligula nunc, in laoreet ligula elementum sed. Phasellus quis dictum massa. Vestibulum fermentum non nisi eget eleifend. Nullam pharetra semper ex, quis posuere velit rutrum eu. Sed aliquam diam et orci auctor, et rutrum enim rutrum. Praesent ac ultricies diam. Nulla vitae lacinia nisi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aliquam hendrerit turpis risus, quis vulputate mi posuere ut. Mauris ullamcorper leo eget massa tristique, vel tempor libero pharetra. Etiam in nisl tincidunt, malesuada orci a, posuere orci. Proin sit amet enim nisi. Fusce malesuada volutpat rhoncus. Etiam sollicitudin mauris rutrum erat tempor feugiat. Curabitur scelerisque magna eros, ut commodo neque auctor et. Donec in arcu cursus, venenatis libero vel, sagittis risus. Duis aliquet velit massa, vel porttitor velit egestas ac. Cras vehicula faucibus venenatis. Sed mollis orci at ante imperdiet, eget blandit arcu congue. Donec sit amet lectus mollis, faucibus orci quis, mollis elit. Quisque libero erat, vulputate ac nisl non, sodales convallis nunc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aliquam dignissim nunc tortor, sed efficitur enim rhoncus blandit. Donec neque enim, tincidunt quis auctor vitae, volutpat sit amet magna. In luctus, risus a euismod mattis, tortor risus vestibulum felis, vel blandit sapien libero vehicula lorem. Vestibulum at vulputate turpis, a vestibulum mi. Fusce massa nisi, laoreet nec pellentesque vitae, consequat a ligula. Pellentesque non nisl sed ex cursus venenatis. Ut nec elit at elit fermentum sodales ut sed sapien. Nam tincidunt nulla non nibh lacinia, sed condimentum erat feugiat. Maecenas ante diam, semper id mi nec, sollicitudin eleifend massa. In sit amet aliquam ex, vitae ultricies nunc. Phasellus sagittis cursus venenatis. Vivamus condimentum, eros ac tincidunt tempus, arcu dolor facilisis dolor, ut eleifend lorem est eu magna. Nunc dignissim risus sed ligula consectetur, ut tempor arcu scelerisque. Nullam gravida lectus ac nisl volutpat maximus. Mauris sit amet ante quis mi viverra fermentum. Maecenas posuere non mauris id tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Praesent tristique, lectus a condimentum faucibus, mi lectus sodales dui, non venenatis erat justo ac sapien. Praesent lacinia laoreet aliquet. Donec iaculis erat ut elit malesuada, eu semper dolor commodo. Sed dignissim, ligula et malesuada elementum, mauris tortor mollis orci, in sodales quam elit ut leo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam venenatis in velit sed porta. Proin varius pellentesque mattis. Suspendisse pharetra eros quis ornare pretium. Fusce faucibus pharetra nunc, id tristique risus tristique sit amet. Pellentesque viverra consectetur lorem, eget pulvinar tortor tempor et. Maecenas neque dolor, aliquet vel imperdiet eu, viverra id libero. Duis pulvinar nulla quis tempor rutrum.</p>\n<!-- /wp:paragraph -->','Items','','publish','open','closed','','items','','','2021-08-28 23:28:13','2021-08-28 23:28:13','',0,'http://localhost/wordpress2021-gaulinelliot/?page_id=35',0,'page','',0),(36,2,'2021-08-28 23:28:13','2021-08-28 23:28:13','<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna al</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:separator -->\n<hr class=\"wp-block-separator\"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ornare nulla tortor, sit amet volutpat mauris cursus in. Vivamus eget erat suscipit, egestas risus a, malesuada quam. Curabitur id urna a massa aliquet mollis non quis arcu. Quisque augue eros, dapibus a augue sit amet, elementum lacinia enim. Fusce ut turpis libero. Phasellus pharetra sit amet erat egestas blandit. Proin consectetur venenatis nisi in aliquet. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Morbi nulla tellus, congue quis feugiat sed, tincidunt in ipsum. Morbi dictum viverra auctor. Nullam rhoncus neque in sapien sagittis, vitae feugiat mauris aliquam. Sed at egestas ex, eu tempus diam. Nullam non quam turpis. Sed congue venenatis vehicula. Donec vitae mi nisl. Donec auctor tincidunt faucibus. Cras scelerisque ligula nunc, in laoreet ligula elementum sed. Phasellus quis dictum massa. Vestibulum fermentum non nisi eget eleifend. Nullam pharetra semper ex, quis posuere velit rutrum eu. Sed aliquam diam et orci auctor, et rutrum enim rutrum. Praesent ac ultricies diam. Nulla vitae lacinia nisi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aliquam hendrerit turpis risus, quis vulputate mi posuere ut. Mauris ullamcorper leo eget massa tristique, vel tempor libero pharetra. Etiam in nisl tincidunt, malesuada orci a, posuere orci. Proin sit amet enim nisi. Fusce malesuada volutpat rhoncus. Etiam sollicitudin mauris rutrum erat tempor feugiat. Curabitur scelerisque magna eros, ut commodo neque auctor et. Donec in arcu cursus, venenatis libero vel, sagittis risus. Duis aliquet velit massa, vel porttitor velit egestas ac. Cras vehicula faucibus venenatis. Sed mollis orci at ante imperdiet, eget blandit arcu congue. Donec sit amet lectus mollis, faucibus orci quis, mollis elit. Quisque libero erat, vulputate ac nisl non, sodales convallis nunc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Aliquam dignissim nunc tortor, sed efficitur enim rhoncus blandit. Donec neque enim, tincidunt quis auctor vitae, volutpat sit amet magna. In luctus, risus a euismod mattis, tortor risus vestibulum felis, vel blandit sapien libero vehicula lorem. Vestibulum at vulputate turpis, a vestibulum mi. Fusce massa nisi, laoreet nec pellentesque vitae, consequat a ligula. Pellentesque non nisl sed ex cursus venenatis. Ut nec elit at elit fermentum sodales ut sed sapien. Nam tincidunt nulla non nibh lacinia, sed condimentum erat feugiat. Maecenas ante diam, semper id mi nec, sollicitudin eleifend massa. In sit amet aliquam ex, vitae ultricies nunc. Phasellus sagittis cursus venenatis. Vivamus condimentum, eros ac tincidunt tempus, arcu dolor facilisis dolor, ut eleifend lorem est eu magna. Nunc dignissim risus sed ligula consectetur, ut tempor arcu scelerisque. Nullam gravida lectus ac nisl volutpat maximus. Mauris sit amet ante quis mi viverra fermentum. Maecenas posuere non mauris id tristique.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Praesent tristique, lectus a condimentum faucibus, mi lectus sodales dui, non venenatis erat justo ac sapien. Praesent lacinia laoreet aliquet. Donec iaculis erat ut elit malesuada, eu semper dolor commodo. Sed dignissim, ligula et malesuada elementum, mauris tortor mollis orci, in sodales quam elit ut leo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam venenatis in velit sed porta. Proin varius pellentesque mattis. Suspendisse pharetra eros quis ornare pretium. Fusce faucibus pharetra nunc, id tristique risus tristique sit amet. Pellentesque viverra consectetur lorem, eget pulvinar tortor tempor et. Maecenas neque dolor, aliquet vel imperdiet eu, viverra id libero. Duis pulvinar nulla quis tempor rutrum.</p>\n<!-- /wp:paragraph -->','Items','','inherit','closed','closed','','35-revision-v1','','','2021-08-28 23:28:13','2021-08-28 23:28:13','',35,'http://localhost/wordpress2021-gaulinelliot/?p=36',0,'revision','',0),(37,2,'2021-09-13 19:19:44','2021-08-28 23:28:53','','Accueil','','publish','closed','closed','','accueil','','','2021-09-13 19:19:44','2021-09-13 19:19:44','',0,'http://localhost/wordpress2021-gaulinelliot/?p=37',1,'nav_menu_item','',0),(38,2,'2021-09-13 19:19:44','2021-08-28 23:28:53',' ','','','publish','closed','closed','','38','','','2021-09-13 19:19:44','2021-09-13 19:19:44','',0,'http://localhost/wordpress2021-gaulinelliot/?p=38',2,'nav_menu_item','',0),(39,2,'2021-09-13 19:19:44','2021-08-28 23:28:53',' ','','','publish','closed','closed','','39','','','2021-09-13 19:19:44','2021-09-13 19:19:44','',0,'http://localhost/wordpress2021-gaulinelliot/?p=39',3,'nav_menu_item','',0),(40,2,'2021-08-28 23:28:32','0000-00-00 00:00:00',' ','','','draft','closed','closed','','','','','2021-08-28 23:28:32','0000-00-00 00:00:00','',0,'http://localhost/wordpress2021-gaulinelliot/?p=40',1,'nav_menu_item','',0),(42,2,'2021-09-09 17:24:56','0000-00-00 00:00:00','','Brouillon auto','','auto-draft','open','open','','','','','2021-09-09 17:24:56','0000-00-00 00:00:00','',0,'http://localhost/wordpress2021-gaulinelliot/?p=42',0,'post','',0),(44,2,'2021-09-13 19:05:59','2021-09-13 19:05:59','<!-- wp:paragraph -->\n<p>Ceci est un superbe magasin en ligne de planche à roulette et de planche à neige. Vous pouvez obtenir tous ce que vous avez besoin pour votre prochaine session. Keep on shredding bros!</p>\n<!-- /wp:paragraph -->','Bonjour tout le monde !','','inherit','closed','closed','','1-revision-v1','','','2021-09-13 19:05:59','2021-09-13 19:05:59','',1,'http://localhost/wordpress2021-gaulinelliot/?p=44',0,'revision','',0),(46,2,'2021-09-13 19:08:44','2021-09-13 19:08:44','<!-- wp:paragraph -->\n<p>Ceci est un superbe magasin en ligne de skateboard et de snowboard. Vous pouvez obtenir tous ce que vous avez besoin pour votre prochaine session de planche : planches à roulette, \"trucks\", roues, \"griptape\", \"bearings\", etc.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Keep on shredding my guys!</p>\n<!-- /wp:paragraph -->','Bonjour tout le monde !','','inherit','closed','closed','','1-revision-v1','','','2021-09-13 19:08:44','2021-09-13 19:08:44','',1,'http://localhost/wordpress2021-gaulinelliot/?p=46',0,'revision','',0),(47,2,'2021-09-13 19:17:06','2021-09-13 19:17:06','<!-- wp:paragraph -->\n<p>Vous pouvez me contacter aux coordonnées suivantes en tout temps :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nom : Elliot Gaulin</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>email : 2039854@carrefour.cegepvicto.ca</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3</p>\n<!-- /wp:paragraph -->','Contact','','publish','closed','closed','','contact','','','2021-09-13 19:44:11','2021-09-13 19:44:11','',0,'http://localhost/wordpress2021-gaulinelliot/?page_id=47',0,'page','',0),(48,2,'2021-09-13 19:17:06','2021-09-13 19:17:06','<!-- wp:paragraph -->\n<p>Vous pouvez me contacter aux coordonnées suivantes en tout temps :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nom : Elliot Gaulin</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>email : 2039854@carrefour.cegepvicto.ca</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Adresse postale : 475 Rue Notre Dame E, Victoriaville, QC G6P 4B3</p>\n<!-- /wp:paragraph -->','Contact','','inherit','closed','closed','','47-revision-v1','','','2021-09-13 19:17:06','2021-09-13 19:17:06','',47,'http://localhost/wordpress2021-gaulinelliot/?p=48',0,'revision','',0),(49,2,'2021-09-13 19:19:44','2021-09-13 19:19:44',' ','','','publish','closed','closed','','49','','','2021-09-13 19:19:44','2021-09-13 19:19:44','',0,'http://localhost/wordpress2021-gaulinelliot/?p=49',4,'nav_menu_item','',0);
/*!40000 ALTER TABLE `cegepvicto_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_term_relationships`
--

DROP TABLE IF EXISTS `cegepvicto_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_term_relationships`
--

LOCK TABLES `cegepvicto_term_relationships` WRITE;
/*!40000 ALTER TABLE `cegepvicto_term_relationships` DISABLE KEYS */;
INSERT INTO `cegepvicto_term_relationships` VALUES (1,1,0),(37,2,0),(38,2,0),(39,2,0),(49,2,0);
/*!40000 ALTER TABLE `cegepvicto_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_term_taxonomy`
--

DROP TABLE IF EXISTS `cegepvicto_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_term_taxonomy`
--

LOCK TABLES `cegepvicto_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `cegepvicto_term_taxonomy` DISABLE KEYS */;
INSERT INTO `cegepvicto_term_taxonomy` VALUES (1,1,'category','',0,1),(2,2,'nav_menu','',0,4);
/*!40000 ALTER TABLE `cegepvicto_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_termmeta`
--

DROP TABLE IF EXISTS `cegepvicto_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_termmeta`
--

LOCK TABLES `cegepvicto_termmeta` WRITE;
/*!40000 ALTER TABLE `cegepvicto_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_terms`
--

DROP TABLE IF EXISTS `cegepvicto_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_terms`
--

LOCK TABLES `cegepvicto_terms` WRITE;
/*!40000 ALTER TABLE `cegepvicto_terms` DISABLE KEYS */;
INSERT INTO `cegepvicto_terms` VALUES (1,'Non classé','non-classe',0),(2,'Menu 1','menu-1',0);
/*!40000 ALTER TABLE `cegepvicto_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_usermeta`
--

DROP TABLE IF EXISTS `cegepvicto_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_usermeta`
--

LOCK TABLES `cegepvicto_usermeta` WRITE;
/*!40000 ALTER TABLE `cegepvicto_usermeta` DISABLE KEYS */;
INSERT INTO `cegepvicto_usermeta` VALUES (24,2,'nickname','patatefrite'),(25,2,'first_name','Patate'),(26,2,'last_name','Frite'),(27,2,'description',''),(28,2,'rich_editing','true'),(29,2,'syntax_highlighting','true'),(30,2,'comment_shortcuts','false'),(31,2,'admin_color','fresh'),(32,2,'use_ssl','0'),(33,2,'show_admin_bar_front','true'),(34,2,'locale','fr_CA'),(35,2,'cegepvicto_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(36,2,'cegepvicto_user_level','10'),(37,2,'dismissed_wp_pointers',''),(38,2,'session_tokens','a:2:{s:64:\"cbbb9dd1572c79a4e7786536b235773aaa6395e30b034befb473c5c0c5595797\";a:4:{s:10:\"expiration\";i:1631381095;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0\";s:5:\"login\";i:1631208295;}s:64:\"1cb1f8511441a39031124bae0dbef3347e532394721bf56305639668e43b1654\";a:4:{s:10:\"expiration\";i:1632422177;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:78:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0\";s:5:\"login\";i:1631212577;}}'),(39,2,'cegepvicto_dashboard_quick_press_last_post_id','42'),(40,2,'community-events-location','a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),(41,2,'nav_menu_recently_edited','2'),(42,2,'managenav-menuscolumnshidden','a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),(43,2,'metaboxhidden_nav-menus','a:1:{i:0;s:12:\"add-post_tag\";}');
/*!40000 ALTER TABLE `cegepvicto_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_users`
--

DROP TABLE IF EXISTS `cegepvicto_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_users`
--

LOCK TABLES `cegepvicto_users` WRITE;
/*!40000 ALTER TABLE `cegepvicto_users` DISABLE KEYS */;
INSERT INTO `cegepvicto_users` VALUES (2,'patatefrite','$P$Bbe0EICdQ/VMCI.vQe/75POgyBl9T./','patatefrite','2039854@carrefour.cegepvicto.ca','','2021-08-30 20:43:45','1630356227:$P$Bz/VbeEtVXguQ1zt1ynA5njniT1GNq0',0,'Patate Frite');
/*!40000 ALTER TABLE `cegepvicto_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_yoast_indexable`
--

DROP TABLE IF EXISTS `cegepvicto_yoast_indexable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_yoast_indexable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` mediumtext,
  `permalink_hash` varchar(191) DEFAULT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` varchar(32) NOT NULL,
  `object_sub_type` varchar(32) DEFAULT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  `post_parent` int(11) unsigned DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` text,
  `breadcrumb_title` varchar(191) DEFAULT NULL,
  `post_status` varchar(191) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `is_protected` tinyint(1) DEFAULT '0',
  `has_public_posts` tinyint(1) DEFAULT NULL,
  `number_of_pages` int(11) unsigned DEFAULT NULL,
  `canonical` mediumtext,
  `primary_focus_keyword` varchar(191) DEFAULT NULL,
  `primary_focus_keyword_score` int(3) DEFAULT NULL,
  `readability_score` int(3) DEFAULT NULL,
  `is_cornerstone` tinyint(1) DEFAULT '0',
  `is_robots_noindex` tinyint(1) DEFAULT '0',
  `is_robots_nofollow` tinyint(1) DEFAULT '0',
  `is_robots_noarchive` tinyint(1) DEFAULT '0',
  `is_robots_noimageindex` tinyint(1) DEFAULT '0',
  `is_robots_nosnippet` tinyint(1) DEFAULT '0',
  `twitter_title` varchar(191) DEFAULT NULL,
  `twitter_image` mediumtext,
  `twitter_description` mediumtext,
  `twitter_image_id` varchar(191) DEFAULT NULL,
  `twitter_image_source` varchar(191) DEFAULT NULL,
  `open_graph_title` varchar(191) DEFAULT NULL,
  `open_graph_description` mediumtext,
  `open_graph_image` mediumtext,
  `open_graph_image_id` varchar(191) DEFAULT NULL,
  `open_graph_image_source` varchar(191) DEFAULT NULL,
  `open_graph_image_meta` text,
  `link_count` int(11) DEFAULT NULL,
  `incoming_link_count` int(11) DEFAULT NULL,
  `prominent_words_version` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_yoast_indexable`
--

LOCK TABLES `cegepvicto_yoast_indexable` WRITE;
/*!40000 ALTER TABLE `cegepvicto_yoast_indexable` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_yoast_indexable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_yoast_indexable_hierarchy`
--

DROP TABLE IF EXISTS `cegepvicto_yoast_indexable_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_yoast_indexable_hierarchy` (
  `indexable_id` int(11) unsigned NOT NULL,
  `ancestor_id` int(11) unsigned NOT NULL,
  `depth` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`indexable_id`,`ancestor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_yoast_indexable_hierarchy`
--

LOCK TABLES `cegepvicto_yoast_indexable_hierarchy` WRITE;
/*!40000 ALTER TABLE `cegepvicto_yoast_indexable_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_yoast_indexable_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_yoast_migrations`
--

DROP TABLE IF EXISTS `cegepvicto_yoast_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_yoast_migrations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_yoast_migrations`
--

LOCK TABLES `cegepvicto_yoast_migrations` WRITE;
/*!40000 ALTER TABLE `cegepvicto_yoast_migrations` DISABLE KEYS */;
INSERT INTO `cegepvicto_yoast_migrations` VALUES (1,'20171228151840'),(2,'20171228151841'),(3,'20190529075038'),(4,'20191011111109'),(5,'20200408101900'),(6,'20200420073606'),(7,'20200428123747'),(8,'20200428194858'),(9,'20200429105310'),(10,'20200430075614'),(11,'20200430150130'),(12,'20200507054848'),(13,'20200513133401'),(14,'20200609154515'),(15,'20200616130143'),(16,'20200617122511'),(17,'20200702141921'),(18,'20200728095334'),(19,'20201202144329'),(20,'20201216124002'),(21,'20201216141134');
/*!40000 ALTER TABLE `cegepvicto_yoast_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_yoast_primary_term`
--

DROP TABLE IF EXISTS `cegepvicto_yoast_primary_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_yoast_primary_term` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `term_id` int(11) unsigned NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_yoast_primary_term`
--

LOCK TABLES `cegepvicto_yoast_primary_term` WRITE;
/*!40000 ALTER TABLE `cegepvicto_yoast_primary_term` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_yoast_primary_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cegepvicto_yoast_seo_links`
--

DROP TABLE IF EXISTS `cegepvicto_yoast_seo_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cegepvicto_yoast_seo_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `target_post_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cegepvicto_yoast_seo_links`
--

LOCK TABLES `cegepvicto_yoast_seo_links` WRITE;
/*!40000 ALTER TABLE `cegepvicto_yoast_seo_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `cegepvicto_yoast_seo_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'wordpress2021_gaulinelliot'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 23:04:13