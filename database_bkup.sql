-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: food_park
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `main_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `video_link` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts`
--

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
INSERT INTO `abouts` VALUES (1,'/uploads/media_66e0b43f9b29a.jpg','About Company','Refreshing Experience','<div class=\"fp__about_us_text\">\r\n                        <p>We ....</p>\r\n                        <ul><li>Delicious & Satisfying </li><li>Best Price & Offers</li><li>Made By Fresh Ingredients</li></ul>\r\n                    </div><p></p>','https://www.youtube.com/watch?v=WSTf9Bja7is','2023-09-20 00:01:51','2024-09-11 04:03:59');
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_area_id` bigint(20) unsigned NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  KEY `addresses_delivery_area_id_foreign` (`delivery_area_id`),
  CONSTRAINT `addresses_delivery_area_id_foreign` FOREIGN KEY (`delivery_area_id`) REFERENCES `delivery_areas` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,3,1,'Anastasia','ahmed','test@gmail.com','+1 (106) 882-8138','7232 Broadway Suite 308,','home','2023-09-20 01:30:46','2023-09-20 01:30:46'),(2,3,4,'Anastasia','Abbott','test@gmail.com','+1 (106) 882-8138','172 Waterford Oaks','office','2023-09-20 01:31:16','2023-09-20 01:31:16'),(3,2,1,'Anastasia','Avila','hello@gmaiol.com','+1 (106) 882-8138','232 Broadway Suite','home','2023-09-20 22:16:59','2023-09-20 22:16:59'),(4,2,3,'Anastasia','Abbott','hello@gmaiol.com','+1 (106) 882-8138','453 Broadway Suite','office','2023-09-20 22:17:26','2023-09-20 22:17:26'),(5,5,1,'aava','Whistler','aava@gmail.com','6473132120','aava Whistler address','home','2024-09-09 01:04:52','2024-09-09 01:04:52');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menu_items`
--

DROP TABLE IF EXISTS `admin_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menu_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `class` varchar(255) DEFAULT NULL,
  `menu_id` bigint(20) unsigned NOT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `admin_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menu_items`
--

LOCK TABLES `admin_menu_items` WRITE;
/*!40000 ALTER TABLE `admin_menu_items` DISABLE KEYS */;
INSERT INTO `admin_menu_items` VALUES (2,'Home','/',0,1,NULL,2,0,'2023-09-13 00:00:59','2024-09-15 00:52:49'),(4,'Contact','/contact',0,0,NULL,2,0,'2023-09-13 00:03:39','2023-09-21 02:49:28'),(7,'Terms and Conditions','/',0,3,NULL,3,0,'2023-09-13 00:56:59','2024-09-15 00:54:07'),(8,'Privacy Policy','/',0,2,NULL,3,0,'2023-09-13 00:57:29','2024-09-15 00:53:58'),(9,'More','/',0,4,NULL,3,0,'2023-09-13 00:59:45','2024-09-15 00:54:15'),(10,'Blogs','/',0,0,NULL,3,0,'2023-09-13 01:00:20','2024-09-15 00:53:42'),(11,'Chefs','/',0,1,NULL,3,0,'2023-09-13 01:00:41','2024-09-15 00:53:51'),(12,'Contact','/contact',0,0,NULL,4,0,'2023-09-13 01:03:56','2023-09-13 01:04:12'),(13,'About','/',0,1,NULL,4,0,'2023-09-13 01:04:11','2024-09-15 00:55:18'),(14,'Blogs','/',0,2,NULL,4,0,'2023-09-13 01:04:33','2024-09-15 00:55:24'),(15,'Home','/',0,0,NULL,1,0,'2023-09-13 01:21:58','2023-09-21 05:00:54'),(19,'Contact','/contact',0,2,NULL,1,0,'2023-09-13 01:23:23','2024-09-14 03:47:16'),(24,'Menu','/products',0,1,NULL,1,0,'2023-09-13 01:26:58','2024-09-14 03:47:50');
/*!40000 ALTER TABLE `admin_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_menus`
--

DROP TABLE IF EXISTS `admin_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_menus`
--

LOCK TABLES `admin_menus` WRITE;
/*!40000 ALTER TABLE `admin_menus` DISABLE KEYS */;
INSERT INTO `admin_menus` VALUES (1,'main_menu',NULL,NULL),(2,'footer_menu_one','2023-09-12 23:31:22','2023-09-12 23:31:22'),(3,'footer_menu_two','2023-09-12 23:34:53','2023-09-12 23:34:53'),(4,'footer_menu_three','2023-09-12 23:35:29','2023-09-12 23:35:29');
/*!40000 ALTER TABLE `admin_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_download_sections`
--

DROP TABLE IF EXISTS `app_download_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_download_sections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `play_store_link` varchar(255) DEFAULT NULL,
  `apple_store_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_download_sections`
--

LOCK TABLES `app_download_sections` WRITE;
/*!40000 ALTER TABLE `app_download_sections` DISABLE KEYS */;
INSERT INTO `app_download_sections` VALUES (1,'/uploads/media_66e5c586582e5.png','/uploads/media_66e5c48c0c60f.webp','Mobile App Coming Soon','Stay tuned for an exciting new way to enjoy Whistler Bubble Tea! Our mobile app is coming soon, bringing you all your favorite bubble tea drinks right to your fingertips. With easy ordering, exclusive offers, and updates on our latest creations, our app will make your bubble tea experience even more convenient and enjoyable. Keep an eye out for its launch and get ready to sip, savor, and smile with Whistler Bubble Tea!','https://yechengwang.ca','https://yechengwang.ca','2023-09-19 23:28:11','2024-09-15 00:19:02');
/*!40000 ALTER TABLE `app_download_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_sliders`
--

DROP TABLE IF EXISTS `banner_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sliders`
--

LOCK TABLES `banner_sliders` WRITE;
/*!40000 ALTER TABLE `banner_sliders` DISABLE KEYS */;
INSERT INTO `banner_sliders` VALUES (1,'Fried Rice','Lorem ipsum dolor sit amet consectetur.','#','/uploads/media_650a80c5c4482.png',1,'2023-09-19 23:19:01','2023-09-19 23:19:01'),(2,'Veggie Burger','Lorem ipsum dolor sit amet consectetur.','#','/uploads/media_650a80e997899.png',1,'2023-09-19 23:19:37','2023-09-19 23:19:37'),(3,'Beef and Broccoli','Lorem ipsum dolor sit amet consectetur.','#','/uploads/media_650a811025fd2.png',1,'2023-09-19 23:20:16','2023-09-19 23:20:16'),(4,'Chicken Wrap','Lorem ipsum dolor sit amet consectetur.','#','/uploads/media_650a8130b475d.png',1,'2023-09-19 23:20:48','2023-09-19 23:20:48');
/*!40000 ALTER TABLE `banner_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES (1,'Fruits','fruits',1,'2023-09-19 23:39:27','2023-09-19 23:39:27'),(2,'Vegetables','vegetables',1,'2023-09-19 23:39:35','2023-09-19 23:39:35'),(3,'Grains','grains',1,'2023-09-19 23:39:44','2023-09-19 23:39:44'),(4,'Dairy Products','dairy-products',1,'2023-09-19 23:39:53','2023-09-19 23:39:53'),(5,'Proteins','proteins',1,'2023-09-19 23:40:02','2023-09-19 23:40:02');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comments`
--

DROP TABLE IF EXISTS `blog_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comments_blog_id_foreign` (`blog_id`),
  CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comments`
--

LOCK TABLES `blog_comments` WRITE;
/*!40000 ALTER TABLE `blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  KEY `blogs_category_id_foreign` (`category_id`),
  CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,1,1,'/uploads/media_650a885b0984c.jpg','Kitchen Hacks: Cook Like a Pro','kitchen-hacks-cook-like-a-pro','<p>There are many variations of passages of Lorem Ipsum available, but the majority have\r\n                                ered alteration in some form, by injected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are going to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing hidden in the middle of text.Erators on the Internet tend to repeat predefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p></p>',NULL,NULL,1,'2023-09-19 23:51:23','2023-09-19 23:51:23'),(2,1,2,'/uploads/media_650a88a6db383.jpg','Healthy Eating 101 - Tips and Tricks','healthy-eating-101-tips-and-tricks','<p>There are many variations of passages of Lorem Ipsum available, but \r\nthe majority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p><br></p><p></p>',NULL,NULL,1,'2023-09-19 23:52:38','2023-09-19 23:52:38'),(3,1,3,'/uploads/media_650a88c975cf6.jpg','Foodie Adventures: Exploring Global Flavors','foodie-adventures-exploring-global-flavors','<p>There are many variations of passages of Lorem Ipsum available, but \r\nthe majority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p><br></p><p></p>',NULL,NULL,1,'2023-09-19 23:53:13','2023-09-19 23:53:13'),(4,1,5,'/uploads/media_650a89009830f.jpg','The Art of Baking: Sweet and Savory Delights','the-art-of-baking-sweet-and-savory-delights','<p>There are many variations of passages of Lorem Ipsum available, but \r\nthe majority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p><br></p><p></p>',NULL,NULL,1,'2023-09-19 23:54:08','2023-09-19 23:54:08'),(5,1,2,'/uploads/media_650a894602b39.jpg','From Farm to Table: Fresh Ingredient Spotlight','from-farm-to-table-fresh-ingredient-spotlight','<p>There are many variations of passages of Lorem Ipsum available, but \r\nthe majority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p><br></p><p></p>',NULL,NULL,1,'2023-09-19 23:55:18','2023-09-19 23:55:18'),(6,1,5,'/uploads/media_650a8982aa811.jpg','Veggie Delights: A Vegetarian\'s Guide to Flavor','veggie-delights-a-vegetarians-guide-to-flavor','<p>There are many variations of passages of Lorem Ipsum available, but \r\nthe majority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>There are many variations of passages of Lorem Ipsum available, but the \r\nmajority have\r\n                                ered alteration in some form, by \r\ninjected humour, or randomised word which don\'t look\r\n                                even slightly believable. If you are \r\ngoing to use a passage of Lorem Ipsulm you need to\r\n                                sure there isn\'t anything embarrassing \r\nhidden in the middle of text.Erators on the Internet tend to repeat \r\npredefined chunks as necessiary, making this the\r\n                                true generator on the Internet. It uses a\r\n dictionary of over 200 Latin words, combinedss\r\n                                handful of model sentence structures</p><p>Sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem our\r\n                                asIpsum gen erators on the Internet tend to repeat predefined chunks as the as\r\n                                necessliary, making this the first\r\n                                true generator on the Internet. It uses a dictionary of over 200 our asliatin words,\r\n                                combined with a\r\n                                handful of model sentence structures</p>\r\n\r\n                            <ul class=\"blog_details_list\"><li>It is a long established fact that a reader will be</li><li>There are many variations of passages</li><li>All the Lorem Ipsum generators</li><li>Asearch for \'lorem ipsum\' will uncover many </li></ul><p></p><p><br></p><p></p>',NULL,NULL,1,'2023-09-19 23:56:18','2023-09-19 23:56:18');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `show_at_home` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Burger','burger',1,0,'2023-09-19 22:15:46','2024-09-12 09:19:02'),(2,'Chicken','chicken',1,0,'2023-09-19 22:16:22','2024-09-11 03:31:55'),(3,'Pizza','pizza',1,0,'2023-09-19 22:16:56','2024-09-11 03:31:47'),(4,'Dresserts','dresserts',1,0,'2023-09-19 22:17:21','2024-09-11 03:31:37'),(5,'Milky Bubble Tea','milky-bubble-tea',1,1,'2024-09-11 03:30:49','2024-09-11 03:31:04'),(6,'Fruity Bubble Tea','fruity-bubble-tea',1,1,'2024-09-11 03:31:24','2024-09-11 03:31:24');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) unsigned NOT NULL,
  `receiver_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,3,1,'Hi',1,'2023-09-20 01:35:41','2023-09-20 01:36:26'),(2,3,1,'What is the status of my product?',1,'2023-09-20 01:35:53','2023-09-20 01:36:26'),(3,1,3,'your order is proccessing..',1,'2023-09-20 01:36:50','2023-09-20 01:41:11'),(4,3,1,'how long it will take to deliver ?',1,'2023-09-20 01:37:14','2023-09-20 01:38:06'),(5,1,3,'1-2 days',1,'2023-09-20 01:37:42','2023-09-20 01:41:11'),(6,3,1,'Thanks.',1,'2023-09-20 01:37:54','2023-09-20 01:38:06'),(7,1,3,'👍✨',1,'2023-09-20 01:38:36','2023-09-20 01:41:11'),(8,2,1,'Hellloooo!',1,'2023-09-20 23:03:23','2023-09-21 02:45:55'),(9,2,1,'hello',1,'2023-09-21 02:34:25','2023-09-21 02:45:55'),(10,1,3,'hy',0,'2023-09-21 02:46:14','2023-09-21 02:46:14');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chefs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `fb` varchar(255) DEFAULT NULL,
  `in` varchar(255) DEFAULT NULL,
  `x` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `show_at_home` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs`
--

LOCK TABLES `chefs` WRITE;
/*!40000 ALTER TABLE `chefs` DISABLE KEYS */;
INSERT INTO `chefs` VALUES (1,'/uploads/media_650a81c9c22f8.jpg','rajib khan','senior chef','https://facebook.com','https://facebook.com','https://facebook.com','https://facebook.com',1,1,'2023-09-19 23:23:21','2023-09-19 23:23:21'),(2,'/uploads/media_650a81e93c593.jpg','mahmud hassan','senior chef','https://facebook.com','https://facebook.com','https://facebook.com','https://facebook.com',1,1,'2023-09-19 23:23:53','2023-09-19 23:23:53'),(3,'/uploads/media_650a8213e4b4d.jpg','ayerin ira','senior chef','https://facebook.com','https://facebook.com','https://facebook.com','https://facebook.com',1,1,'2023-09-19 23:24:35','2023-09-19 23:24:35'),(4,'/uploads/media_650a82443f255.jpg','sima ahmed','senior chef','https://facebook.com','https://facebook.com','https://facebook.com','https://facebook.com',1,1,'2023-09-19 23:25:24','2023-09-19 23:25:24'),(5,'/uploads/media_650a8263a73d5.jpg','sathi akter','senior chef','https://facebook.com','https://facebook.com','https://facebook.com','https://facebook.com',1,1,'2023-09-19 23:25:55','2023-09-19 23:25:55');
/*!40000 ALTER TABLE `chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `phone_one` varchar(255) DEFAULT NULL,
  `phone_two` varchar(255) DEFAULT NULL,
  `mail_one` varchar(255) DEFAULT NULL,
  `mail_two` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `map_link` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'+1-604-906-2427','+1-604-906-2427','yechengwang@gmail.com','cindysppoh@gmail.com','4359 Main St, Whistler, BC V8E 1B5','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2558.2777132837555!2d-122.9593364230994!3d50.118525071530684!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54873df7f3c705e1%3A0xbeb9fb3965cd1e39!2sWhistler%20Bubble%20Tea%20(located%20inside%20Summit%20Lodge%20Hotel%20in%20the%20Lotus%20Spa)!5e0!3m2!1sen!2sca!4v1726108770449!5m2!1sen!2sca','2023-09-20 00:12:45','2024-09-12 09:39:53');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `background` varchar(255) NOT NULL,
  `counter_icon_one` varchar(255) NOT NULL,
  `counter_count_one` varchar(255) NOT NULL,
  `counter_name_one` varchar(255) NOT NULL,
  `counter_icon_two` varchar(255) NOT NULL,
  `counter_count_two` varchar(255) NOT NULL,
  `counter_name_two` varchar(255) NOT NULL,
  `counter_icon_three` varchar(255) NOT NULL,
  `counter_count_three` varchar(255) NOT NULL,
  `counter_name_three` varchar(255) NOT NULL,
  `counter_icon_four` varchar(255) NOT NULL,
  `counter_count_four` varchar(255) NOT NULL,
  `counter_name_four` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counters`
--

LOCK TABLES `counters` WRITE;
/*!40000 ALTER TABLE `counters` DISABLE KEYS */;
INSERT INTO `counters` VALUES (1,'/uploads/media_650a85261f08f.jpg','fas fa-box','500','customer serve','fas fa-user','100','experience chef','fas fa-handshake','100','happy customer','fas fa-trophy','100','winning award','2023-09-19 23:37:42','2023-09-20 04:51:56');
/*!40000 ALTER TABLE `counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `min_purchase_amount` int(11) NOT NULL DEFAULT 0,
  `expire_date` date NOT NULL,
  `discount_type` enum('percent','amount') NOT NULL,
  `discount` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'20 % Off','super20',1000,10,'2024-09-17','percent',20,1,'2023-09-19 23:13:20','2023-09-19 23:13:20');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_page_builders`
--

DROP TABLE IF EXISTS `custom_page_builders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_page_builders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_page_builders`
--

LOCK TABLES `custom_page_builders` WRITE;
/*!40000 ALTER TABLE `custom_page_builders` DISABLE KEYS */;
INSERT INTO `custom_page_builders` VALUES (1,'Custom Page','custom-page','<h3>This is a custom page :</h3>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <h3>Main responsibilities:</h3>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p><p></p>',1,'2023-09-20 21:09:24','2023-09-20 21:09:24');
/*!40000 ALTER TABLE `custom_page_builders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_offers`
--

DROP TABLE IF EXISTS `daily_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_offers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `daily_offers_product_id_foreign` (`product_id`),
  CONSTRAINT `daily_offers_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_offers`
--

LOCK TABLES `daily_offers` WRITE;
/*!40000 ALTER TABLE `daily_offers` DISABLE KEYS */;
INSERT INTO `daily_offers` VALUES (6,34,1,'2024-09-13 13:40:30','2024-09-13 13:40:30'),(7,35,1,'2024-09-15 00:12:35','2024-09-15 00:12:35'),(8,37,1,'2024-09-15 00:12:57','2024-09-15 00:12:57');
/*!40000 ALTER TABLE `daily_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_areas`
--

DROP TABLE IF EXISTS `delivery_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) NOT NULL,
  `min_delivery_time` varchar(255) NOT NULL,
  `max_delivery_time` varchar(255) NOT NULL,
  `delivery_fee` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_areas`
--

LOCK TABLES `delivery_areas` WRITE;
/*!40000 ALTER TABLE `delivery_areas` DISABLE KEYS */;
INSERT INTO `delivery_areas` VALUES (1,'Cedarwood Park','20','25',10,1,'2023-09-20 01:28:21','2023-09-20 01:28:21'),(2,'Maplewood Terrace','10','20',15,1,'2023-09-20 01:28:37','2023-09-20 01:28:37'),(3,'Riverview Estates','10','15',15,1,'2023-09-20 01:28:48','2023-09-20 01:28:48'),(4,'Oakridge Meadows','10m','30m',15,1,'2023-09-20 01:29:08','2023-09-20 01:29:08'),(5,'Sunset Ridge','15m','30m',15,1,'2023-09-20 01:29:24','2023-09-20 01:29:24'),(6,'Brookside Haven','15m','30m',15,1,'2023-09-20 01:29:35','2023-09-20 01:29:35');
/*!40000 ALTER TABLE `delivery_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `footer_infos`
--

DROP TABLE IF EXISTS `footer_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `footer_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `short_info` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `footer_infos`
--

LOCK TABLES `footer_infos` WRITE;
/*!40000 ALTER TABLE `footer_infos` DISABLE KEYS */;
INSERT INTO `footer_infos` VALUES (1,'Whistler\'s freshest bubble tea. Take deliciousness with you on your adventures.','4359 Main St, Whistler, BC V8E 1B5','(604) 906-2427','WBT@gmail.com','Copyright 2024 Yecheng Wang','2023-09-20 00:14:31','2024-09-11 04:04:38');
/*!40000 ALTER TABLE `footer_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2017_08_11_073824_create_menus_wp_table',1),(4,'2017_08_11_074006_create_menu_items_wp_table',1),(5,'2019_08_19_000000_create_failed_jobs_table',1),(6,'2019_12_14_000001_create_personal_access_tokens_table',1),(7,'2023_07_13_062327_create_sliders_table',1),(8,'2023_07_16_034121_create_why_choose_us_table',1),(9,'2023_07_16_034352_create_section_titles_table',1),(10,'2023_08_01_051504_create_categories_table',1),(11,'2023_08_01_102352_create_products_table',1),(12,'2023_08_03_035416_create_product_galleries_table',1),(13,'2023_08_03_062618_create_product_sizes_table',1),(14,'2023_08_03_091617_create_product_options_table',1),(15,'2023_08_05_072633_create_settings_table',1),(16,'2023_08_12_062151_create_coupons_table',1),(17,'2023_08_14_042130_create_delivery_areas_table',1),(18,'2023_08_14_071832_create_addresses_table',1),(19,'2023_08_17_072342_create_orders_table',1),(20,'2023_08_17_072407_create_order_items_table',1),(21,'2023_08_19_035121_create_payment_gateway_settings_table',1),(22,'2023_08_20_065829_create_jobs_table',1),(23,'2023_08_20_093708_add_address_id_table',1),(24,'2023_08_27_091240_create_order_placed_notifications_table',1),(25,'2023_08_28_072704_create_chats_table',1),(26,'2023_09_02_042454_create_daily_offers_table',1),(27,'2023_09_02_112836_create_banner_sliders_table',1),(28,'2023_09_03_064440_create_chefs_table',1),(29,'2023_09_04_045906_create_app_download_sections_table',1),(30,'2023_09_04_095634_create_testimonials_table',1),(31,'2023_09_05_061255_create_counters_table',1),(32,'2023_09_05_101935_create_blog_categories_table',1),(33,'2023_09_06_033753_create_blogs_table',1),(34,'2023_09_07_050056_create_blog_comments_table',1),(35,'2023_09_09_045531_create_abouts_table',1),(36,'2023_09_09_101329_create_privacy_policies_table',1),(37,'2023_09_09_111400_create_trams_and_conditions_table',1),(38,'2023_09_10_032823_create_contacts_table',1),(39,'2023_09_11_040528_create_reservation_times_table',1),(40,'2023_09_11_073206_create_reservations_table',1),(41,'2023_09_12_042307_create_subscribers_table',1),(42,'2023_09_12_064908_create_social_links_table',1),(43,'2023_09_12_104836_create_footer_infos_table',1),(44,'2023_09_14_035403_create_custom_page_builders_table',1),(45,'2023_09_14_071015_create_product_ratings_table',1),(46,'2023_09_16_111107_create_wishlists_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `unit_price` double NOT NULL,
  `qty` int(11) NOT NULL,
  `product_size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_size`)),
  `product_option` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_option`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'Egg Roll',24,30,3,'{\"id\": 73, \"name\": \"Large\", \"price\": 30}','[{\"id\": 47, \"name\": \"Coca-Cola\", \"price\": 5}, {\"id\": 48, \"name\": \"Extra Cheese\", \"price\": 10}]','2023-09-20 01:31:43','2023-09-20 01:31:43'),(2,1,'Hot Dog',5,15,1,'{\"id\": 16, \"name\": \"Large\", \"price\": 30}','[]','2023-09-20 01:31:43','2023-09-20 01:31:43'),(3,1,'Hamburger',1,15,3,'{\"id\": 4, \"name\": \"Large\", \"price\": 30}','[{\"id\": 2, \"name\": \"Extra Cheese\", \"price\": 10}]','2023-09-20 01:31:43','2023-09-20 01:31:43'),(4,2,'Egg Roll',24,30,1,'{\"id\": 73, \"name\": \"Large\", \"price\": 30}','[]','2023-09-20 01:41:44','2023-09-20 01:41:44'),(5,2,'Chicken Nuggets',4,70,1,'{\"id\": 14, \"name\": \"Medium\", \"price\": 20}','[]','2023-09-20 01:41:44','2023-09-20 01:41:44'),(6,3,'Cheeseburger',2,50,1,'{\"id\": 7, \"name\": \"Large\", \"price\": 30}','[{\"id\": 3, \"name\": \"Coca-Cola\", \"price\": 5}, {\"id\": 4, \"name\": \"Extra Cheese\", \"price\": 10}]','2023-09-20 01:43:46','2023-09-20 01:43:46'),(7,3,'Hamburger',1,15,1,'{\"id\": 4, \"name\": \"Large\", \"price\": 30}','[]','2023-09-20 01:43:46','2023-09-20 01:43:46'),(8,4,'Chili Cheese Fries',18,60,2,'{\"id\": 55, \"name\": \"Large\", \"price\": 30}','[{\"id\": 35, \"name\": \"Coca-Cola\", \"price\": 5}, {\"id\": 36, \"name\": \"Extra Cheese\", \"price\": 10}]','2023-09-20 22:18:17','2023-09-20 22:18:17'),(9,4,'Buffalo Wings',16,100,1,'{\"id\": 49, \"name\": \"Large\", \"price\": 30}','[{\"id\": 31, \"name\": \"Coca-Cola\", \"price\": 5}]','2023-09-20 22:18:17','2023-09-20 22:18:17'),(10,5,'Tater Tots',20,100,1,'{\"id\": 61, \"name\": \"Large\", \"price\": 30}','[]','2023-09-20 23:02:08','2023-09-20 23:02:08'),(11,6,'Sausage Biscuit',32,40,3,'{\"id\": 97, \"name\": \"Large\", \"price\": 30}','[{\"id\": 63, \"name\": \"Coca-Cola\", \"price\": 5}]','2023-09-21 02:22:19','2023-09-21 02:22:19'),(12,6,'Poutine',25,60,1,'{\"id\": 76, \"name\": \"Large\", \"price\": 30}','[{\"id\": 49, \"name\": \"Coca-Cola\", \"price\": 5}, {\"id\": 50, \"name\": \"Extra Cheese\", \"price\": 10}]','2023-09-21 02:22:19','2023-09-21 02:22:19'),(13,7,'Veggie Burger',31,60,1,'{\"id\":95,\"name\":\"Medium\",\"price\":20}','[{\"id\":62,\"name\":\"Extra Cheese\",\"price\":10}]','2024-09-09 01:06:52','2024-09-09 01:06:52'),(14,7,'Falafel',26,30,1,'{\"id\":81,\"name\":\"Small\",\"price\":10}','[{\"id\":51,\"name\":\"Coca-Cola\",\"price\":5},{\"id\":52,\"name\":\"Extra Cheese\",\"price\":10}]','2024-09-09 01:06:52','2024-09-09 01:06:52');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_placed_notifications`
--

DROP TABLE IF EXISTS `order_placed_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_placed_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_placed_notifications`
--

LOCK TABLES `order_placed_notifications` WRITE;
/*!40000 ALTER TABLE `order_placed_notifications` DISABLE KEYS */;
INSERT INTO `order_placed_notifications` VALUES (1,'#868232043 a new order has been placed!',1,0,'2023-09-20 01:32:18','2023-09-20 01:32:18'),(2,'#2218232044 a new order has been placed!',2,0,'2023-09-20 01:42:05','2023-09-20 01:42:05'),(3,'#125232046 a new order has been placed!',3,1,'2023-09-20 01:44:04','2023-09-20 21:03:33'),(4,'#4275232117 a new order has been placed!',4,0,'2023-09-20 22:19:05','2023-09-20 22:19:05'),(5,'#9643232108 a new order has been placed!',5,1,'2023-09-20 23:02:29','2023-09-21 02:42:24'),(6,'#5743232119 a new order has been placed!',6,0,'2023-09-21 02:23:11','2023-09-21 02:23:11');
/*!40000 ALTER TABLE `order_placed_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_charge` double NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL,
  `grand_total` double NOT NULL,
  `product_qty` int(11) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_approve_date` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `coupon_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`coupon_info`)),
  `currency_name` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'868232043',3,'7232 Broadway Suite 308,, Aria: Cedarwood Park',87,10,435,358,3,'PayPal','completed','2023-09-20 01:32:09','0L3009975R675583A','{\"code\": \"super20\", \"discount\": \"87.00\"}','USD','delivered','2023-09-20 01:31:43','2023-09-20 01:44:37',1),(2,'2218232044',3,'7232 Broadway Suite 308,, Aria: Cedarwood Park',0,10,150,160,2,'PayPal','completed','2023-09-20 01:41:58','17E76628VU0157335','null','USD','delivered','2023-09-20 01:41:44','2023-09-20 01:44:44',1),(3,'125232046',3,'7232 Broadway Suite 308,, Aria: Cedarwood Park',0,10,140,150,2,'PayPal','completed','2023-09-20 01:43:58','22C489894V3327925','null','USD','pending','2023-09-20 01:43:46','2023-09-20 01:43:58',1),(4,'4275232117',2,'453 Broadway Suite, Aria: Riverview Estates',0,15,345,360,2,'PayPal','completed','2023-09-20 22:18:56','5E468902SB295722R','null','USD','pending','2023-09-20 22:18:17','2023-09-20 22:18:56',4),(5,'9643232108',2,'232 Broadway Suite, Aria: Cedarwood Park',0,10,130,140,1,'PayPal','completed','2023-09-20 23:02:23','0TK97272WU868634E','null','USD','pending','2023-09-20 23:02:08','2023-09-20 23:02:23',3),(6,'5743232119',2,'453 Broadway Suite, Aria: Riverview Estates',66,15,330,279,2,'PayPal','completed','2023-09-21 02:23:04','0B9617197M068064G','{\"code\": \"super20\", \"discount\": \"66.00\"}','USD','pending','2023-09-21 02:22:19','2023-09-21 02:23:04',4),(7,'2572240852',5,'aava Whistler address, Aria: Cedarwood Park',0,10,145,155,2,NULL,'pending',NULL,NULL,'null',NULL,'pending','2024-09-09 01:06:52','2024-09-09 01:06:52',5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateway_settings`
--

DROP TABLE IF EXISTS `payment_gateway_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateway_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateway_settings`
--

LOCK TABLES `payment_gateway_settings` WRITE;
/*!40000 ALTER TABLE `payment_gateway_settings` DISABLE KEYS */;
INSERT INTO `payment_gateway_settings` VALUES (1,'paypal_logo','/uploads/media_64e58838d3a51.png','2023-08-18 23:36:53','2023-08-22 22:16:56'),(2,'paypal_status','1','2023-08-18 23:36:53','2023-08-22 22:19:47'),(3,'paypal_account_mode','sandbox','2023-08-18 23:36:53','2023-08-18 23:36:53'),(4,'paypal_country','GB','2023-08-18 23:36:53','2023-08-18 23:39:44'),(5,'paypal_currency','USD','2023-08-18 23:36:53','2023-08-18 23:36:53'),(6,'paypal_rate','1','2023-08-18 23:36:53','2023-08-18 23:36:53'),(7,'paypal_api_key','AUnOIw_wR15MzYo0eg87xjJ4bH2b_fsXVMtVtVZcpJVTrQC_rcStGAjyzBJK40vpaaCnYSvi1Gbf6L9f','2023-08-18 23:36:53','2023-08-19 01:56:43'),(8,'paypal_secret_key','EPrUhxAOGPrnp_5-BkaI6UO0CQMyZ-F4ANGdm3Ye4QZofTuHjyzzJCZm3sP5hiSb4XKlUKOo-ozDddD3','2023-08-18 23:36:53','2023-08-19 01:56:43'),(9,'paypal_app_id','APP_ID','2023-08-20 23:07:55','2023-08-20 23:07:55'),(10,'stripe_logo','/uploads/media_64e30eb5c51eb.png','2023-08-21 01:13:57','2023-08-21 01:13:57'),(11,'stripe_status','1','2023-08-21 01:13:57','2023-08-21 01:13:57'),(12,'stripe_country','US','2023-08-21 01:13:57','2023-08-21 01:13:57'),(13,'stripe_currency','USD','2023-08-21 01:13:57','2023-08-21 01:13:57'),(14,'stripe_rate','1','2023-08-21 01:13:57','2023-08-21 01:13:57'),(15,'stripe_api_key','pk_test_51NhSkBLAjq0ac3am3UhnOZKyJcyh1wHiH4tkIeu60qcYE53YFCeQiD6mvkEcDyR5a8TrnMq0HiMndlflptDDU5cc00NA7t4tNd','2023-08-21 01:13:57','2023-08-21 01:47:18'),(16,'stripe_secret_key','sk_test_51NhSkBLAjq0ac3amThHW5zGEFluTCqirQw3xYwNh2KlYTIoV1nUfj0wXQ1ktXOlooaVRF0M99N7XXnaTBoLX7xgd00suPQpGgI','2023-08-21 01:13:57','2023-08-21 01:47:18'),(17,'razorpay_status','1','2023-08-21 23:45:12','2023-08-21 23:45:12'),(18,'razorpay_country','IN','2023-08-21 23:45:13','2023-08-21 23:45:13'),(19,'razorpay_currency','USD','2023-08-21 23:45:13','2023-08-22 05:42:34'),(20,'razorpay_rate','1','2023-08-21 23:45:13','2023-08-22 05:42:34'),(21,'razorpay_api_key','rzp_test_K7CipNQYyyMPiS','2023-08-21 23:45:13','2023-08-22 00:42:04'),(22,'razorpay_secret_key','zSBmNMorJrirOrnDrbOd1ALO','2023-08-21 23:45:13','2023-08-22 00:42:04'),(23,'razorpay_logo','/uploads/media_64e44b9f4fac0.png','2023-08-21 23:46:07','2023-08-21 23:46:07');
/*!40000 ALTER TABLE `payment_gateway_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacy_policies`
--

DROP TABLE IF EXISTS `privacy_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacy_policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacy_policies`
--

LOCK TABLES `privacy_policies` WRITE;
/*!40000 ALTER TABLE `privacy_policies` DISABLE KEYS */;
INSERT INTO `privacy_policies` VALUES (1,'<h3>Your agreement:</h3>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <h3>Main responsibilities:</h3>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p><p></p>','2023-09-20 00:11:35','2023-09-20 00:11:35');
/*!40000 ALTER TABLE `privacy_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_galleries`
--

DROP TABLE IF EXISTS `product_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_galleries_product_id_foreign` (`product_id`),
  CONSTRAINT `product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_galleries`
--

LOCK TABLES `product_galleries` WRITE;
/*!40000 ALTER TABLE `product_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ratings`
--

DROP TABLE IF EXISTS `product_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_ratings_user_id_foreign` (`user_id`),
  KEY `product_ratings_product_id_foreign` (`product_id`),
  CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ratings`
--

LOCK TABLES `product_ratings` WRITE;
/*!40000 ALTER TABLE `product_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_sizes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sizes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `short_description` text NOT NULL,
  `long_description` text NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `show_at_home` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (33,'Taro Milk Tea w/ Pearls','milk-bubble-tea','/uploads/media_66e4f82a43d48.png',5,'Dreamy taro milk tea with pearls.','<p>Indulge in sweetness with our flagship taro milk tea with your choice of toppings.</p>',10,0,1,NULL,NULL,NULL,1,1,'2024-09-11 04:24:34','2024-09-14 09:42:50'),(34,'Lychee Fruit Tea w/ Popping Pearls','lychee-fruit-tea-w-popping-pearls','/uploads/media_66e3de060fc26.png',6,'Kick back and relax with this refreshing and fresh Lychee drink.','<p>Is Lychee your favourite fruit? Enjoy it in a fruity bubble tea today!</p>',10,0,1,NULL,'Lychee Fruit Tea with Pearls','Kick back and relax with this refreshing drink.',1,1,'2024-09-13 13:39:02','2024-09-13 13:39:13'),(35,'Mango Milk Tea w/ Popping Pearls','mango-milk-tea-w-popping-pearls','/uploads/media_66e4f7ecc0774.png',5,'Fresh mango with delicious pearls that pop in your mouth.','<p>Indulge in a tropical delight with Mango Milk Tea topped with vibrant popping pearls. This refreshing beverage features creamy, sweet mango-infused milk tea, perfectly balanced with the burst of juicy fruit flavours from the popping pearls. Each sip delivers a tropical escape with a fun, flavourful pop!<br></p>',10,0,1,NULL,'Mango Milk Tea w/ Popping Pearls','Enjoy a delicious Mango Milk Tea with Popping Pearls – a tropical treat that combines rich, creamy mango flavor with the excitement of fruity, bursting pearls.',1,1,'2024-09-14 09:41:48','2024-09-14 09:41:48'),(36,'Strawberry Milk Tea w/ Pearls','strawberry-milk-tea-w-pearls','/uploads/media_66e5c1146cf3e.png',5,'Savor the sweet, creamy bliss of our Strawberry Milk Tea, a perfect blend of rich milk tea and fresh strawberry flavor, creating a refreshing and indulgent treat.','<p>Experience the ultimate in sweet satisfaction with our Strawberry Milk Tea. This delectable drink combines smooth, creamy milk tea with the vibrant, fruity essence of ripe strawberries. Each sip delivers a harmonious balance of luscious strawberry flavor and velvety milk tea, making it a refreshing and indulgent choice for any time of day. Perfectly chilled and crafted to highlight the natural sweetness of strawberries, our Strawberry Milk Tea is a delightful treat for those who love a fruity twist on classic milk tea.<br></p>',10,0,1,NULL,NULL,NULL,1,1,'2024-09-15 00:00:04','2024-09-15 00:00:04'),(37,'Brown Sugar Milk Tea w/ Pearls','brown-sugar-milk-tea-w-pearls','/uploads/media_66e5c172024bb.png',5,'Enjoy the rich, caramelized goodness of Brown Sugar Milk Tea with Pearls, featuring creamy milk tea infused with sweet brown sugar and chewy pearls for a delectable treat.','<p>Indulge in the luxurious blend of our Brown Sugar Milk Tea with Pearls. This delightful beverage combines creamy milk tea with the deep, caramelized flavor of brown sugar, creating a rich and satisfying taste experience. Each sip is enhanced by chewy, flavorful pearls that add a delightful texture and extra layer of sweetness. Perfectly balanced and irresistibly smooth, our Brown Sugar Milk Tea with Pearls is an exquisite treat that brings together the best of both worlds: the comforting richness of milk tea and the sweet, satisfying crunch of brown sugar pearls. Ideal for a refreshing break or a sweet indulgence anytime.<br></p>',10,0,1,NULL,NULL,NULL,1,1,'2024-09-15 00:01:38','2024-09-15 00:01:38'),(38,'Honeydew Milk Tea w/ Popping Pearls','honeydew-milk-tea-w-popping-pearls','/uploads/media_66e5c1e6c6109.png',5,'Delight in the refreshing sweetness of Honeydew Milk Tea with Pearls, a creamy blend of smooth milk tea and juicy honeydew flavor, perfectly complemented by chewy pearls.','<p>Experience a tropical escape with our Honeydew Milk Tea with Pearls. This enticing beverage combines the subtle, refreshing sweetness of honeydew melon with smooth, creamy milk tea. Each sip offers a harmonious balance of fruity honeydew flavor and velvety milk tea, while chewy pearls add a satisfying burst of texture. Ideal for a cool, invigorating treat, our Honeydew Milk Tea with Pearls provides a delightful fusion of sweetness and chewiness, making it a perfect choice for a refreshing and indulgent break.<br></p>',10,0,1,NULL,NULL,NULL,1,1,'2024-09-15 00:03:34','2024-09-15 00:03:34'),(39,'Strawberry Fruit Tea w/ Popping Pearls','strawberry-fruit-tea-w-popping-pearls','/uploads/media_66e5c26291f10.png',6,'Refresh with our Strawberry Fruit Tea with Popping Pearls—a vibrant blend of tangy strawberry fruit tea and juicy, bursting pearls for a fun, fruity twist.','<p>Indulge in the lively flavors of our Strawberry Fruit Tea with Popping Pearls. This invigorating drink combines the tangy and refreshing taste of ripe strawberries with crisp fruit tea, delivering a burst of fruity goodness in every sip. Enhanced by the playful texture of popping pearls, each mouthful is a delightful experience of juicy, fruit-filled bursts. Perfect for a refreshing break or a sweet treat, our Strawberry Fruit Tea with Popping Pearls offers a fun and flavorful twist on traditional fruit tea, making it a favorite for those who love a bit of excitement with their drink.<br></p>',10,0,500,NULL,NULL,NULL,1,1,'2024-09-15 00:05:38','2024-09-15 00:05:38'),(40,'Mango Fruit Tea w/ Popping Pearls','mango-fruit-tea-w-popping-pearls','/uploads/media_66e5c2c0a6beb.png',6,'Enjoy the tropical delight of Mango Fruit Tea with Popping Pearls—a refreshing blend of fruity mango tea and juicy, bursting pearls for a burst of tropical flavor in every sip.','<p>Savor the taste of paradise with our Mango Fruit Tea with Popping Pearls. This refreshing beverage features a vibrant mango fruit tea, blending the rich, tropical flavor of ripe mangoes with a crisp, invigorating tea base. The addition of popping pearls provides a fun, flavorful burst with each sip, enhancing the overall tropical experience. Perfectly chilled and bursting with fruity goodness, our Mango Fruit Tea with Popping Pearls is an ideal choice for a refreshing and indulgent treat, bringing a touch of the tropics to any occasion.<br></p>',10,0,500,NULL,NULL,NULL,1,1,'2024-09-15 00:07:12','2024-09-15 00:07:12');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_times`
--

DROP TABLE IF EXISTS `reservation_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_times` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_times`
--

LOCK TABLES `reservation_times` WRITE;
/*!40000 ALTER TABLE `reservation_times` DISABLE KEYS */;
INSERT INTO `reservation_times` VALUES (1,'9:00 AM','10:00 AM',1,'2023-09-20 01:57:30','2023-09-20 01:57:30'),(2,'11:00 AM','12:00 AM',1,'2023-09-20 01:57:54','2023-09-20 01:57:54'),(3,'1:00 PM','2:00 PM',1,'2023-09-20 01:58:15','2023-09-20 01:58:15'),(4,'3:00 PM','4:00 PM',1,'2023-09-20 01:58:26','2023-09-20 01:58:26'),(5,'5:00 PM','6:00 PM',1,'2023-09-20 01:58:37','2023-09-20 01:58:37');
/*!40000 ALTER TABLE `reservation_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(255) NOT NULL,
  `persons` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'23199',3,'jhone Deo','+1 (106) 882-8138','2023-09-29','9:00 AM-10:00 AM',5,'pending','2023-09-20 01:58:55','2023-09-20 01:58:55'),(2,'268730',3,'jhone Deo','+1 (106) 882-8138','2023-09-22','11:00 AM-12:00 AM',4,'pending','2023-09-20 01:59:13','2023-09-20 01:59:13');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_titles`
--

DROP TABLE IF EXISTS `section_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_titles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_titles`
--

LOCK TABLES `section_titles` WRITE;
/*!40000 ALTER TABLE `section_titles` DISABLE KEYS */;
INSERT INTO `section_titles` VALUES (4,'why_choose_top_title','why choose us','2023-07-16 00:04:13','2023-09-02 04:42:34'),(5,'why_choose_main_title','why choose us','2023-07-16 00:04:13','2023-09-02 04:42:34'),(6,'why_choose_sub_title','Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional materials.','2023-07-16 00:05:48','2023-09-02 04:42:34'),(7,'daily_offer_top_title','Today\'s Picks','2023-09-02 04:41:02','2024-09-13 13:42:57'),(8,'daily_offer_main_title','Ice cold, exploding flavour. Grab-and-go milk or fruit tea.','2023-09-02 04:41:02','2024-09-13 13:42:57'),(9,'daily_offer_sub_title','A hot summer\'s day and a cold cup of bubble tea. A match made in heaven.','2023-09-02 04:41:02','2024-09-13 13:42:57'),(10,'chef_top_title','our team','2023-09-03 22:18:09','2023-09-03 22:18:09'),(11,'chef_main_title','meet our expert chefs','2023-09-03 22:18:09','2023-09-03 22:18:09'),(12,'chef_sub_title','Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional materials.','2023-09-03 22:18:09','2023-09-03 22:18:09'),(13,'testimonial_top_title','testimonial','2023-09-04 22:24:02','2023-09-04 22:24:02'),(14,'testimonial_main_title','our customar feedbacks','2023-09-04 22:24:02','2023-09-04 22:24:02'),(15,'testimonial_sub_title','Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional materials.','2023-09-04 22:24:02','2023-09-04 22:24:02');
/*!40000 ALTER TABLE `section_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site_name','Whistler Bubble Tea','2023-08-05 04:31:55','2024-09-08 13:28:22'),(2,'site_default_currency','CAD','2023-08-05 04:31:55','2024-09-08 13:28:22'),(3,'site_currency_icon','$','2023-08-05 04:31:55','2023-08-13 21:43:30'),(4,'site_currency_icon_position','left','2023-08-05 04:31:55','2023-08-06 01:30:18'),(5,'site_delivery_charge','50','2023-08-13 21:43:44','2023-08-13 21:43:44'),(6,'pusher_app_id','1659217','2023-08-26 04:36:34','2023-08-26 04:36:34'),(7,'pusher_key','be9d8c800e229ec729c6','2023-08-26 04:36:34','2023-08-26 04:36:34'),(8,'pusher_secret','52afd25d2a55c3df77e5','2023-08-26 04:36:34','2023-08-26 04:36:34'),(9,'pusher_cluster','mt1','2023-08-26 04:36:34','2023-08-26 04:36:34'),(10,'mail_driver','smtp','2023-09-10 00:35:57','2023-09-10 00:44:34'),(11,'mail_host','sandbox.smtp.mailtrap.io','2023-09-10 00:35:57','2023-09-10 00:44:34'),(12,'mail_port','2525','2023-09-10 00:35:57','2023-09-10 00:44:34'),(13,'mail_username','808ae887829cf7','2023-09-10 00:35:57','2023-09-10 00:44:34'),(14,'mail_password','188d4565252515','2023-09-10 00:35:57','2023-09-10 00:44:34'),(15,'mail_encryption','tls','2023-09-10 00:35:57','2023-09-10 00:44:34'),(16,'mail_from_address','yechengofficial@gmail.com','2023-09-10 00:35:57','2024-09-08 13:30:17'),(17,'mail_receive_address','yechengofficial@gmail.com','2023-09-10 00:35:57','2024-09-08 13:30:17'),(18,'logo','/uploads/logo.png','2023-09-17 03:27:14','2023-09-20 00:16:25'),(19,'footer_logo','/uploads/media_66e278e06ab39.png','2023-09-17 03:27:14','2024-09-12 12:15:12'),(20,'favicon','/uploads/media_66e278e06c4d9.png','2023-09-17 03:27:14','2024-09-12 12:15:12'),(21,'breadcrumb','/uploads/bubbleteabreadcrumb.jpg','2023-09-17 03:27:14','2023-09-20 00:16:25'),(22,'site_email','yechengofficial@gmail.com','2023-09-17 05:18:32','2024-09-08 13:28:22'),(23,'site_phone','(604) 906-2427','2023-09-17 05:18:32','2024-09-08 13:28:22'),(24,'site_color','#d6b3ff','2023-09-17 22:02:41','2023-09-17 22:15:30'),(25,'seo_title','Whistler Bubble Tea','2023-09-17 23:17:55','2024-09-08 13:31:26'),(26,'seo_description','Providing Yummy delicious meals','2023-09-17 23:17:55','2024-09-08 13:31:26'),(27,'seo_keywords','food,lunch,delicious,nutrition','2023-09-17 23:17:55','2024-09-08 13:31:38');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (3,'/uploads/media_66e25120858f1.png',NULL,'The Freshest Bubble Tea in Whistler','Your favourite flavours!','Take one and go! Enjoy your activities while feeling refreshed with fresh tea and delicious boba!','#',1,'2023-09-19 22:06:47','2024-09-13 13:32:13'),(4,'/uploads/media_66e2527b2cd6c.png','$8.50','Strawberry Milkshake with Boba','Handpicked strawberries squeezed into a lovely milkshake for those hot summer days.','Want something sweet with a silky blend of tartness? Try our strawberry milkshake boba drink today.',NULL,1,'2024-09-12 09:31:23','2024-09-13 13:33:07'),(5,'/uploads/media_66e49fe096676.png',NULL,'Pick Your Favourite','Variety is the spice of life - Ask for our staff picks!','Fruit tea or milk tea? The decision is a tough one. At Whistler Bubble Tea, our friendly staff will always be there to help you make a tasty decision. Come in and say hi today!',NULL,1,'2024-09-14 03:26:08','2024-09-14 03:26:45');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,'fab fa-facebook-f','facebook','https://facebook.com',1,'2023-09-19 23:57:42','2023-09-19 23:57:42'),(2,'fab fa-twitter','Twitter','https://x.com',1,'2023-09-19 23:57:59','2023-09-19 23:57:59'),(3,'fab fa-discord','discord','https://discord.com',1,'2023-09-19 23:58:16','2023-09-19 23:58:16'),(4,'fab fa-linkedin-in','linkedin','https://linkedin.com',1,'2023-09-19 23:58:41','2023-09-19 23:58:41');
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,'bella@gmail.com','2024-09-09 04:57:57','2024-09-09 04:57:57');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `rating` int(11) NOT NULL,
  `show_at_home` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'/uploads/media_650a83706854b.jpg','sumon mahmud','nyc usa','Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut accusamus praesentium quaerat  nihil magnam a porro eaque numquam',5,1,1,'2023-09-19 23:30:24','2023-09-19 23:30:24'),(2,'/uploads/media_650a8394a77e6.png','Jhone Deo','nyc usa','Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut accusamus praesentium quaerat  nihil magnam a porro eaque numquam',5,1,1,'2023-09-19 23:31:00','2023-09-19 23:31:00'),(3,'/uploads/media_650a83c787418.png','Payel Sarkar','nyc usa','Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut accusamus praesentium quaerat  nihil magnam a porro eaque numquam',5,1,1,'2023-09-19 23:31:51','2023-09-19 23:31:51'),(4,'/uploads/media_650a83ecf1452.png','Deo Jhone','nyc usa','Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut accusamus praesentium quaerat  nihil magnam a porro eaque numquam',5,1,1,'2023-09-19 23:32:28','2023-09-19 23:32:28');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trams_and_conditions`
--

DROP TABLE IF EXISTS `trams_and_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trams_and_conditions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trams_and_conditions`
--

LOCK TABLES `trams_and_conditions` WRITE;
/*!40000 ALTER TABLE `trams_and_conditions` DISABLE KEYS */;
INSERT INTO `trams_and_conditions` VALUES (1,'<h3>Your agreement:</h3>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <h3>Main responsibilities:</h3>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p>\r\n                        <ul><li>Solve the problem with code.</li><li>Work on Client\'s projects &amp; In-house products as well.</li><li>Analyze the product\'s needs and find out the best solutions.</li><li>Work as a team and lead the junior developer.</li><li>Collaborate with other teams by providing code review and technical direction.</li></ul>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam\r\n                            doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit porro\r\n                            consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime nostrum\r\n                            quod\r\n                            ipsum, quibusdam, a omnis quam aperiam pariatur consectetur est perspiciatis. Laboriosam\r\n                            praesentium id asperiores cumque debitis, ex adipisci? Impedit temporibus labore dolores\r\n                            iusto\r\n                            error nobis, porro hic iure placeat, sint esse corporis, quibusdam adipisci magni non minus\r\n                            quo\r\n                            quae repudiandae earum facere eum ad qui voluptatum eaque.</p>\r\n                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, repellendus! Nesciunt fugit\r\n                            aliquam doloremque velit ullam quos ad et magnam aperiam eum vero unde cum reprehenderit\r\n                            porro consectetur voluptatum, veritatis blanditiis. Repellendus veritatis fugit maxime\r\n                            nostrum quod ipsum, quibusdam, a omnis quam aperiam pariatur</p><p></p>','2023-09-20 00:11:54','2023-09-20 00:11:54');
/*!40000 ALTER TABLE `trams_and_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) NOT NULL DEFAULT '/uploads/avatar.png',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'/uploads/avatar.png','Admin','admin@gmail.com','admin',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','kPU4ewu3KdXoImziPhtGnzAotctcJjm0BPmFpEauU8szZ9ZizDejGM2Jlhj2',NULL,NULL),(2,'/uploads/media_650bce8f34d46.png','User','user@gmail.com','user',NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',NULL,NULL,'2023-09-20 23:03:11'),(3,'/uploads/media_650a9196f120d.jpg','Jhone Deo','jhonedeo@gmail.com','user',NULL,'$2y$10$8kMHpzR9kogLoWSh2ve1z.viHcES2jNdmmaytq72lyT0IGKAshj46',NULL,'2023-09-20 00:30:32','2023-09-20 00:30:46'),(4,'/uploads/avatar.png','Cindy','cindysppoh@gmail.com','user',NULL,'$2y$10$D8yQ48qyWtOsCKESk4Q3rOW3.m//6pe0U4pBriGl.1OCpcSXM4Qoq',NULL,'2024-09-08 13:24:08','2024-09-08 13:24:08'),(5,'/uploads/avatar.png','Aava','aava@gmail.com','user',NULL,'$2y$10$YUR1C2E7eecVk1oVXWsgbej3wWo1xJC5I5TRZKIG43v1w2R/oyWR2',NULL,'2024-09-09 01:03:26','2024-09-09 01:03:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `why_choose_us`
--

DROP TABLE IF EXISTS `why_choose_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `why_choose_us` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `why_choose_us`
--

LOCK TABLES `why_choose_us` WRITE;
/*!40000 ALTER TABLE `why_choose_us` DISABLE KEYS */;
INSERT INTO `why_choose_us` VALUES (1,'fas fa-percent','discount voucher','Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .',1,'2023-09-19 22:09:14','2023-09-19 22:09:14'),(2,'fas fa-bullhorn','fresh healthy foods','Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .',1,'2023-09-19 22:10:17','2023-09-19 22:10:17'),(3,'fas fa-shipping-fast','fast serve on table','Lorem ipsum dolor sit amet consectetur adipisicing elit. Est, debitis expedita .',1,'2023-09-19 22:10:48','2023-09-19 22:10:48');
/*!40000 ALTER TABLE `why_choose_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-22 18:38:04
