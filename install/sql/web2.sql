-- MySQL dump 10.19  Distrib 10.3.32-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: web2
-- ------------------------------------------------------
-- Server version	10.3.32-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `billingcode`
--

DROP TABLE IF EXISTS `billingcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billingcode` (
  `billingcode_id` int(10) NOT NULL AUTO_INCREMENT,
  `billingcode_name` varchar(25) NOT NULL DEFAULT '',
  `billingcode_value` float NOT NULL DEFAULT 0,
  `billingcode_desc` varchar(255) NOT NULL DEFAULT '',
  `billingcode_status` int(1) NOT NULL DEFAULT 0,
  `company_id` bigint(20) NOT NULL DEFAULT 0 COMMENT 'deprecated',
  `billingcode_company` int(10) NOT NULL DEFAULT 0,
  `billingcode_category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`billingcode_id`),
  KEY `billingcode_name_2` (`billingcode_name`),
  KEY `billingcode_name` (`billingcode_name`),
  KEY `billingcode_status` (`billingcode_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingcode`
--

LOCK TABLES `billingcode` WRITE;
/*!40000 ALTER TABLE `billingcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `billingcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgets` (
  `budget_id` int(10) NOT NULL AUTO_INCREMENT,
  `budget_company` int(10) NOT NULL DEFAULT 0,
  `budget_dept` int(10) NOT NULL DEFAULT 0,
  `budget_start_date` date DEFAULT NULL,
  `budget_end_date` date DEFAULT NULL,
  `budget_amount` decimal(10,2) NOT NULL,
  `budget_category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`budget_id`),
  KEY `budget_start_date` (`budget_start_date`),
  KEY `budget_end_date` (`budget_end_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets_assigned`
--

DROP TABLE IF EXISTS `budgets_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgets_assigned` (
  `budget_id` int(10) NOT NULL AUTO_INCREMENT,
  `budget_project` int(10) NOT NULL,
  `budget_task` int(10) NOT NULL,
  `budget_category` varchar(50) NOT NULL DEFAULT '',
  `budget_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`budget_id`),
  KEY `budget_project` (`budget_project`),
  KEY `budget_task` (`budget_task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets_assigned`
--

LOCK TABLES `budgets_assigned` WRITE;
/*!40000 ALTER TABLE `budgets_assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `company_id` int(10) NOT NULL AUTO_INCREMENT,
  `company_module` int(10) NOT NULL DEFAULT 0,
  `company_name` varchar(100) DEFAULT '',
  `company_phone1` varchar(30) DEFAULT '',
  `company_phone2` varchar(30) DEFAULT '',
  `company_fax` varchar(30) DEFAULT '',
  `company_address1` varchar(50) DEFAULT '',
  `company_address2` varchar(50) DEFAULT '',
  `company_city` varchar(30) DEFAULT '',
  `company_state` varchar(30) DEFAULT '',
  `company_zip` varchar(11) DEFAULT '',
  `company_country` varchar(100) NOT NULL DEFAULT '',
  `company_primary_url` varchar(255) DEFAULT '',
  `company_owner` int(10) NOT NULL DEFAULT 0,
  `company_description` mediumtext DEFAULT NULL,
  `company_type` int(3) NOT NULL DEFAULT 0,
  `company_email` varchar(255) DEFAULT NULL,
  `company_custom` longtext DEFAULT NULL,
  `company_private` int(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`company_id`),
  KEY `idx_cpy1` (`company_owner`),
  KEY `company_name` (`company_name`),
  KEY `company_type` (`company_type`),
  KEY `company_owner` (`company_owner`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) NOT NULL DEFAULT '',
  `config_value` varchar(255) NOT NULL DEFAULT '',
  `config_group` varchar(255) NOT NULL DEFAULT '',
  `config_type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_id`),
  KEY `config_name` (`config_name`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'activate_external_user_creation','true','admin_users','checkbox'),(2,'admin_username','admin','admin_users','text'),(3,'auth_method','sql','auth','select'),(4,'cal_day_end','17','calendar','text'),(5,'cal_day_increment','15','calendar','text'),(6,'cal_day_start','8','calendar','text'),(7,'cal_day_view_show_minical','true','calendar','checkbox'),(8,'cal_working_days','1,2,3,4,5','calendar','text'),(9,'check_overallocation','false','tasks','checkbox'),(10,'check_task_dates','true','tasks','checkbox'),(11,'company_name','web2Project Development','admin_system','text'),(12,'currency_symbol','$','budgeting','text'),(13,'daily_working_hours','8.0','calendar','text'),(14,'debug','0','admin_system','text'),(15,'default_view_a','day_view','startup','text'),(16,'default_view_m','events','startup','text'),(17,'default_view_tab','1','startup','text'),(18,'direct_edit_assignment','true','tasks','checkbox'),(19,'display_debug','false','admin_system','checkbox'),(20,'email_prefix','[web2Project]','mail','text'),(21,'enable_gantt_charts','true','admin_system','checkbox'),(22,'files_ci_preserve_attr','true','files','checkbox'),(23,'files_show_versions_edit','false','files','checkbox'),(24,'host_locale','en','admin_system','text'),(25,'host_style','web2project','admin_system','text'),(26,'index_max_file_size','-1','files','text'),(27,'ldap_allow_login','true','ldap','checkbox'),(28,'ldap_base_dn','dc=web2project,dc=net','ldap','text'),(29,'ldap_host','localhost','ldap','text'),(30,'ldap_port','389','ldap','text'),(31,'ldap_search_pass','secret','ldap','password'),(32,'ldap_search_user','Manager','ldap','text'),(33,'ldap_user_filter','(uid=%USERNAME%)','ldap','text'),(34,'ldap_version','3','ldap','text'),(35,'locale_alert','^','locales','text'),(36,'locale_warn','false','locales','checkbox'),(37,'log_changes','true','admin_system','checkbox'),(38,'mail_auth','false','mail','checkbox'),(39,'mail_debug','false','mail','checkbox'),(40,'mail_defer','false','mail','checkbox'),(41,'mail_host','mail.yourdomain.com','mail','text'),(42,'mail_pass','smtppasswd','mail','password'),(43,'mail_port','25','mail','text'),(44,'mail_secure','','mail','select'),(45,'mail_timeout','30','mail','text'),(46,'mail_transport','smtp','mail','select'),(47,'mail_user','smtpuser','mail','text'),(48,'page_title','web2Project','admin_system','text'),(49,'parser_application/msword','/usr/bin/strings','files','text'),(50,'parser_application/pdf','/usr/bin/pdftotext','files','text'),(51,'parser_default','/usr/bin/strings','files','text'),(52,'parser_text/html','/usr/bin/strings','files','text'),(53,'password_min_len','4','admin_users','text'),(54,'postnuke_allow_login','true','auth','checkbox'),(55,'projectdesigner_view_project','false','projects','checkbox'),(56,'reset_memory_limit','64M','admin_system','text'),(57,'restrict_color_selection','false','projects','checkbox'),(58,'restrict_task_time_editing','false','tasks','checkbox'),(59,'session_gc_scan_queue','false','session','checkbox'),(60,'session_handling','app','session','select'),(61,'session_idle_time','2d','session','text'),(62,'session_max_lifetime','1m','session','text'),(63,'show_all_task_assignees','false','tasks','checkbox'),(64,'site_domain','web2project.net','admin_system','text'),(65,'task_reminder_control','false','tasks','checkbox'),(66,'task_reminder_days_before','1','tasks','text'),(67,'task_reminder_repeat','100','tasks','text'),(68,'template_projects_status_id','6','projects','text'),(69,'username_min_len','4','admin_users','text'),(70,'system_timezone','America/New_York','admin_system','select'),(77,'system_update_check','true','admin_system','checkbox'),(73,'company_filter_default','all','tasks','select'),(74,'task_filter_default','myunfinished','tasks','select'),(75,'page_size','50','admin_system','text'),(76,'admin_email','admin@web2project.net','admin_system','text'),(78,'system_update_last_check','2001-01-01 00:00:00','admin_system','text'),(79,'ldap_complete_string','','ldap','text'),(80,'budget_info_display','false','budgeting','checkbox');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_list`
--

DROP TABLE IF EXISTS `config_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_list` (
  `config_list_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL DEFAULT 0,
  `config_list_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`config_list_id`),
  KEY `config_id` (`config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_list`
--

LOCK TABLES `config_list` WRITE;
/*!40000 ALTER TABLE `config_list` DISABLE KEYS */;
INSERT INTO `config_list` VALUES (1,3,'sql'),(2,3,'ldap'),(3,3,'pn'),(4,60,'app'),(5,60,'php'),(6,46,'php'),(7,46,'smtp'),(8,44,''),(9,44,'tls'),(10,44,'ssl'),(11,73,'allcompanies'),(12,73,'user'),(13,74,'my'),(14,74,'myunfinished'),(15,74,'allunfinished'),(16,74,'myproj'),(17,74,'mycomp'),(18,74,'unassigned'),(19,74,'taskowned'),(20,74,'taskcreated'),(21,74,'all'),(22,74,'allfinished7days'),(23,74,'myfinished7days');
/*!40000 ALTER TABLE `config_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `contact_id` int(10) NOT NULL AUTO_INCREMENT,
  `contact_first_name` varchar(30) DEFAULT NULL,
  `contact_last_name` varchar(30) DEFAULT NULL,
  `contact_display_name` varchar(100) NOT NULL,
  `contact_order_by` varchar(30) NOT NULL DEFAULT '' COMMENT 'deprecated',
  `contact_title` varchar(50) DEFAULT NULL,
  `contact_birthday` date DEFAULT NULL,
  `contact_job` varchar(255) DEFAULT NULL,
  `contact_company` int(10) NOT NULL DEFAULT 0,
  `contact_department` int(10) NOT NULL DEFAULT 0,
  `contact_type` varchar(20) DEFAULT NULL,
  `contact_email` varchar(255) NOT NULL DEFAULT '',
  `contact_phone` varchar(30) NOT NULL DEFAULT '',
  `contact_address1` varchar(60) DEFAULT NULL,
  `contact_address2` varchar(60) DEFAULT NULL,
  `contact_city` varchar(30) DEFAULT NULL,
  `contact_state` varchar(30) DEFAULT NULL,
  `contact_zip` varchar(11) DEFAULT NULL,
  `contact_country` varchar(30) DEFAULT NULL,
  `contact_notes` mediumtext DEFAULT NULL,
  `contact_project` int(10) NOT NULL DEFAULT 0,
  `contact_icon` varchar(20) DEFAULT 'obj/contact',
  `contact_owner` int(10) unsigned DEFAULT 0,
  `contact_private` tinyint(3) unsigned DEFAULT 0,
  `contact_updatekey` varchar(32) DEFAULT NULL,
  `contact_lastupdate` datetime DEFAULT NULL,
  `contact_updateasked` datetime DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `contact_first_name` (`contact_first_name`),
  KEY `contact_last_name` (`contact_last_name`),
  KEY `contact_company` (`contact_company`),
  KEY `contact_department` (`contact_department`),
  KEY `contact_project` (`contact_project`),
  KEY `contact_owner` (`contact_owner`),
  KEY `contact_updatekey` (`contact_updatekey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Admin','Person','Admin Person','Admin Person',NULL,NULL,NULL,0,0,NULL,'admin@localhost','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'obj/contact',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_methods`
--

DROP TABLE IF EXISTS `contacts_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_methods` (
  `method_id` int(10) NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) NOT NULL,
  `method_name` varchar(20) NOT NULL,
  `method_value` varchar(255) NOT NULL,
  PRIMARY KEY (`method_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_methods`
--

LOCK TABLES `contacts_methods` WRITE;
/*!40000 ALTER TABLE `contacts_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_lists`
--

DROP TABLE IF EXISTS `custom_fields_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_lists` (
  `field_id` int(10) DEFAULT NULL,
  `list_option_id` int(10) DEFAULT NULL,
  `list_value` varchar(250) DEFAULT NULL,
  KEY `list_value` (`list_value`),
  KEY `field_id` (`field_id`),
  KEY `list_option_id` (`list_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_lists`
--

LOCK TABLES `custom_fields_lists` WRITE;
/*!40000 ALTER TABLE `custom_fields_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_struct`
--

DROP TABLE IF EXISTS `custom_fields_struct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_struct` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_module` varchar(30) DEFAULT NULL,
  `field_page` varchar(30) DEFAULT NULL,
  `field_htmltype` varchar(20) DEFAULT NULL,
  `field_datatype` varchar(20) DEFAULT NULL,
  `field_order` int(10) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `field_extratags` varchar(250) DEFAULT NULL,
  `field_description` varchar(250) DEFAULT NULL,
  `field_tab` int(10) NOT NULL DEFAULT 0,
  `field_published` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`field_id`),
  KEY `cfs_field_order` (`field_order`),
  KEY `field_module` (`field_module`),
  KEY `field_page` (`field_page`),
  KEY `field_order` (`field_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_struct`
--

LOCK TABLES `custom_fields_struct` WRITE;
/*!40000 ALTER TABLE `custom_fields_struct` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_struct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_values`
--

DROP TABLE IF EXISTS `custom_fields_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_values` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `value_module` varchar(30) DEFAULT NULL,
  `value_object_id` int(10) DEFAULT NULL,
  `value_field_id` int(10) DEFAULT NULL,
  `value_charvalue` varchar(250) DEFAULT NULL,
  `value_intvalue` int(10) DEFAULT NULL,
  PRIMARY KEY (`value_id`),
  KEY `value_module` (`value_module`),
  KEY `value_object_id` (`value_object_id`),
  KEY `value_field_id` (`value_field_id`),
  KEY `value_charvalue` (`value_charvalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_values`
--

LOCK TABLES `custom_fields_values` WRITE;
/*!40000 ALTER TABLE `custom_fields_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `dept_company` int(10) unsigned NOT NULL DEFAULT 0,
  `dept_name` varchar(255) NOT NULL DEFAULT '',
  `dept_phone` varchar(30) DEFAULT NULL,
  `dept_fax` varchar(30) DEFAULT NULL,
  `dept_address1` varchar(30) DEFAULT NULL,
  `dept_address2` varchar(30) DEFAULT NULL,
  `dept_city` varchar(30) DEFAULT NULL,
  `dept_state` varchar(30) DEFAULT NULL,
  `dept_zip` varchar(11) DEFAULT NULL,
  `dept_url` varchar(255) DEFAULT NULL,
  `dept_desc` mediumtext DEFAULT NULL,
  `dept_owner` int(10) unsigned NOT NULL DEFAULT 0,
  `dept_country` varchar(100) NOT NULL DEFAULT '',
  `dept_email` varchar(255) NOT NULL DEFAULT '',
  `dept_type` int(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`dept_id`),
  KEY `dept_parent` (`dept_parent`),
  KEY `dept_company` (`dept_company`),
  KEY `dept_name` (`dept_name`),
  KEY `dept_owner` (`dept_owner`),
  KEY `dept_type` (`dept_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Department heirarchy under a company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `email_template_identifier` varchar(50) NOT NULL,
  `email_template_name` varchar(255) NOT NULL,
  `email_template_language` varchar(5) NOT NULL,
  `email_template_subject` varchar(255) NOT NULL,
  `email_template_body` text NOT NULL,
  PRIMARY KEY (`email_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_contacts`
--

DROP TABLE IF EXISTS `event_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_contacts` (
  `event_id` int(10) NOT NULL DEFAULT 0,
  `contact_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`event_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='deprecated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_contacts`
--

LOCK TABLES `event_contacts` WRITE;
/*!40000 ALTER TABLE `event_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_queue`
--

DROP TABLE IF EXISTS `event_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_start` int(10) NOT NULL DEFAULT 0,
  `queue_type` varchar(40) NOT NULL DEFAULT '',
  `queue_repeat_interval` int(10) NOT NULL DEFAULT 0,
  `queue_repeat_count` int(10) NOT NULL DEFAULT 0,
  `queue_data` longblob NOT NULL,
  `queue_callback` varchar(127) NOT NULL DEFAULT '',
  `queue_owner` int(10) NOT NULL DEFAULT 0,
  `queue_origin_id` int(10) NOT NULL DEFAULT 0,
  `queue_module` varchar(40) NOT NULL DEFAULT '',
  `queue_module_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`queue_id`),
  KEY `queue_start` (`queue_start`),
  KEY `queue_type` (`queue_type`),
  KEY `queue_origin_id` (`queue_origin_id`),
  KEY `queue_module` (`queue_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_queue`
--

LOCK TABLES `event_queue` WRITE;
/*!40000 ALTER TABLE `event_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `event_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'deprecated',
  `event_start_date` datetime DEFAULT NULL,
  `event_end_date` datetime DEFAULT NULL,
  `event_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `event_description` mediumtext DEFAULT NULL,
  `event_url` varchar(255) DEFAULT NULL,
  `event_times_recuring` int(10) unsigned NOT NULL DEFAULT 0,
  `event_recurs` int(10) unsigned NOT NULL DEFAULT 0,
  `event_remind` int(10) unsigned NOT NULL DEFAULT 0,
  `event_icon` varchar(20) DEFAULT 'obj/event',
  `event_owner` int(10) DEFAULT 0,
  `event_project` int(10) DEFAULT 0,
  `event_task` int(10) DEFAULT NULL,
  `event_private` tinyint(3) DEFAULT 0,
  `event_type` tinyint(3) DEFAULT 0,
  `event_cwd` tinyint(3) DEFAULT 0,
  `event_notify` tinyint(3) NOT NULL DEFAULT 0,
  `event_location` varchar(255) NOT NULL DEFAULT '',
  `event_creator` int(10) NOT NULL DEFAULT 0,
  `event_updator` int(10) NOT NULL DEFAULT 0,
  `event_created` datetime NOT NULL DEFAULT '1999-12-31 00:00:00',
  `event_updated` datetime NOT NULL DEFAULT '1999-12-31 00:00:00',
  `event_sequence` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`event_id`),
  KEY `id_esd` (`event_start_date`),
  KEY `id_eed` (`event_end_date`),
  KEY `id_evp` (`event_parent`),
  KEY `idx_ev1` (`event_owner`),
  KEY `idx_ev2` (`event_project`),
  KEY `event_recurs` (`event_recurs`),
  KEY `event_start_date` (`event_start_date`),
  KEY `event_end_date` (`event_end_date`),
  KEY `event_parent` (`event_parent`),
  KEY `event_owner` (`event_owner`),
  KEY `event_project` (`event_project`),
  KEY `event_type` (`event_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_folders`
--

DROP TABLE IF EXISTS `file_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_folders` (
  `file_folder_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_folder_parent` int(10) NOT NULL DEFAULT 0,
  `file_folder_name` varchar(255) NOT NULL DEFAULT '',
  `file_folder_description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`file_folder_id`),
  KEY `file_folder_parent` (`file_folder_parent`),
  KEY `file_folder_name` (`file_folder_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_folders`
--

LOCK TABLES `file_folders` WRITE;
/*!40000 ALTER TABLE `file_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_real_filename` varchar(255) NOT NULL DEFAULT '',
  `file_project` int(10) NOT NULL DEFAULT 0,
  `file_task` int(10) NOT NULL DEFAULT 0,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_parent` int(10) DEFAULT 0,
  `file_description` mediumtext DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `file_owner` int(10) DEFAULT 0,
  `file_date` datetime DEFAULT NULL,
  `file_size` int(10) DEFAULT 0,
  `file_version` float NOT NULL DEFAULT 0,
  `file_icon` varchar(20) DEFAULT 'obj/',
  `file_category` int(10) DEFAULT 0,
  `file_checkout` varchar(16) NOT NULL DEFAULT '',
  `file_co_reason` mediumtext DEFAULT NULL,
  `file_version_id` int(10) NOT NULL DEFAULT 0,
  `file_folder` int(10) NOT NULL DEFAULT 0,
  `file_indexed` tinyint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_id`),
  KEY `idx_file_task` (`file_task`),
  KEY `idx_file_project` (`file_project`),
  KEY `idx_file_parent` (`file_parent`),
  KEY `idx_file_vid` (`file_version_id`),
  KEY `file_checkout` (`file_checkout`),
  KEY `file_project` (`file_project`),
  KEY `file_task` (`file_task`),
  KEY `file_name` (`file_name`),
  KEY `file_parent` (`file_parent`),
  KEY `file_type` (`file_type`),
  KEY `file_owner` (`file_owner`),
  KEY `file_category` (`file_category`),
  KEY `file_folder` (`file_folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_index`
--

DROP TABLE IF EXISTS `files_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_index` (
  `file_id` int(10) NOT NULL DEFAULT 0,
  `word` varchar(50) NOT NULL DEFAULT '',
  `word_placement` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_id`,`word`,`word_placement`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_index`
--

LOCK TABLES `files_index` WRITE;
/*!40000 ALTER TABLE `files_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_messages`
--

DROP TABLE IF EXISTS `forum_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_messages` (
  `message_id` int(10) NOT NULL AUTO_INCREMENT,
  `message_forum` int(10) NOT NULL DEFAULT 0,
  `message_parent` int(10) NOT NULL DEFAULT 0,
  `message_author` int(10) NOT NULL DEFAULT 0,
  `message_editor` int(10) NOT NULL DEFAULT 0,
  `message_title` varchar(255) NOT NULL DEFAULT '',
  `message_date` datetime DEFAULT '1000-01-01 00:00:00',
  `message_body` mediumtext DEFAULT NULL,
  `message_published` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`message_id`),
  KEY `message_forum` (`message_forum`),
  KEY `message_parent` (`message_parent`),
  KEY `message_author` (`message_author`),
  KEY `message_date` (`message_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_messages`
--

LOCK TABLES `forum_messages` WRITE;
/*!40000 ALTER TABLE `forum_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_visits`
--

DROP TABLE IF EXISTS `forum_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_visits` (
  `visit_user` int(10) NOT NULL DEFAULT 0,
  `visit_forum` int(10) NOT NULL DEFAULT 0,
  `visit_message` int(10) NOT NULL DEFAULT 0,
  `visit_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`visit_user`,`visit_forum`,`visit_message`),
  KEY `visit_user` (`visit_user`),
  KEY `visit_forum` (`visit_forum`),
  KEY `visit_message` (`visit_message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_visits`
--

LOCK TABLES `forum_visits` WRITE;
/*!40000 ALTER TABLE `forum_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_watch`
--

DROP TABLE IF EXISTS `forum_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_watch` (
  `watch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `watch_user` int(10) unsigned NOT NULL DEFAULT 0,
  `watch_forum` int(10) unsigned DEFAULT NULL,
  `watch_topic` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`watch_id`),
  KEY `watch_user` (`watch_user`),
  KEY `watch_forum` (`watch_forum`),
  KEY `watch_topic` (`watch_topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links users to the forums/messages they are watching';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_watch`
--

LOCK TABLES `forum_watch` WRITE;
/*!40000 ALTER TABLE `forum_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `forum_project` int(10) NOT NULL DEFAULT 0,
  `forum_status` tinyint(4) NOT NULL DEFAULT -1,
  `forum_owner` int(10) NOT NULL DEFAULT 0,
  `forum_name` varchar(50) NOT NULL DEFAULT '',
  `forum_create_date` datetime DEFAULT '1000-01-01 00:00:00',
  `forum_last_date` datetime DEFAULT '1000-01-01 00:00:00',
  `forum_last_id` int(10) unsigned NOT NULL DEFAULT 0,
  `forum_message_count` int(10) NOT NULL DEFAULT 0,
  `forum_description` varchar(255) DEFAULT NULL,
  `forum_moderated` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`forum_id`),
  KEY `idx_fproject` (`forum_project`),
  KEY `idx_fowner` (`forum_owner`),
  KEY `forum_status` (`forum_status`),
  KEY `forum_name` (`forum_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_acl`
--

DROP TABLE IF EXISTS `gacl_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_acl` (
  `id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT 'system',
  `allow` int(10) NOT NULL DEFAULT 0,
  `enabled` int(10) NOT NULL DEFAULT 0,
  `return_value` longtext DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `updated_date` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `section_value` (`section_value`),
  KEY `enabled` (`enabled`),
  KEY `updated_date` (`updated_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_acl`
--

LOCK TABLES `gacl_acl` WRITE;
/*!40000 ALTER TABLE `gacl_acl` DISABLE KEYS */;
INSERT INTO `gacl_acl` VALUES (10,'user',1,1,'','',1195510857),(11,'user',1,1,'','',1195510857);
/*!40000 ALTER TABLE `gacl_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_acl_sections`
--

DROP TABLE IF EXISTS `gacl_acl_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_acl_sections` (
  `id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_acl_sections`
--

LOCK TABLES `gacl_acl_sections` WRITE;
/*!40000 ALTER TABLE `gacl_acl_sections` DISABLE KEYS */;
INSERT INTO `gacl_acl_sections` VALUES (1,'system',1,'System',0),(2,'user',2,'User',0);
/*!40000 ALTER TABLE `gacl_acl_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_acl_seq`
--

DROP TABLE IF EXISTS `gacl_acl_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_acl_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_acl_seq`
--

LOCK TABLES `gacl_acl_seq` WRITE;
/*!40000 ALTER TABLE `gacl_acl_seq` DISABLE KEYS */;
INSERT INTO `gacl_acl_seq` VALUES (29);
/*!40000 ALTER TABLE `gacl_acl_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aco`
--

DROP TABLE IF EXISTS `gacl_aco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aco` (
  `id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `section_value` (`section_value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aco`
--

LOCK TABLES `gacl_aco` WRITE;
/*!40000 ALTER TABLE `gacl_aco` DISABLE KEYS */;
INSERT INTO `gacl_aco` VALUES (10,'system','login',1,'Login',0),(11,'application','access',1,'Access',0),(12,'application','view',2,'View',0),(13,'application','add',3,'Add',0),(14,'application','edit',4,'Edit',0),(15,'application','delete',5,'Delete',0);
/*!40000 ALTER TABLE `gacl_aco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aco_map`
--

DROP TABLE IF EXISTS `gacl_aco_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aco_map` (
  `acl_id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aco_map`
--

LOCK TABLES `gacl_aco_map` WRITE;
/*!40000 ALTER TABLE `gacl_aco_map` DISABLE KEYS */;
INSERT INTO `gacl_aco_map` VALUES (10,'system','login'),(11,'application','access'),(11,'application','add'),(11,'application','delete'),(11,'application','edit'),(11,'application','view');
/*!40000 ALTER TABLE `gacl_aco_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aco_sections`
--

DROP TABLE IF EXISTS `gacl_aco_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aco_sections` (
  `id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aco_sections`
--

LOCK TABLES `gacl_aco_sections` WRITE;
/*!40000 ALTER TABLE `gacl_aco_sections` DISABLE KEYS */;
INSERT INTO `gacl_aco_sections` VALUES (10,'system',1,'System',0),(11,'application',2,'Application',0);
/*!40000 ALTER TABLE `gacl_aco_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aco_sections_seq`
--

DROP TABLE IF EXISTS `gacl_aco_sections_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aco_sections_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aco_sections_seq`
--

LOCK TABLES `gacl_aco_sections_seq` WRITE;
/*!40000 ALTER TABLE `gacl_aco_sections_seq` DISABLE KEYS */;
INSERT INTO `gacl_aco_sections_seq` VALUES (11);
/*!40000 ALTER TABLE `gacl_aco_sections_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aco_seq`
--

DROP TABLE IF EXISTS `gacl_aco_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aco_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aco_seq`
--

LOCK TABLES `gacl_aco_seq` WRITE;
/*!40000 ALTER TABLE `gacl_aco_seq` DISABLE KEYS */;
INSERT INTO `gacl_aco_seq` VALUES (15);
/*!40000 ALTER TABLE `gacl_aco_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro`
--

DROP TABLE IF EXISTS `gacl_aro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro` (
  `id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro`
--

LOCK TABLES `gacl_aro` WRITE;
/*!40000 ALTER TABLE `gacl_aro` DISABLE KEYS */;
INSERT INTO `gacl_aro` VALUES (10,'user','1',1,'admin',0);
/*!40000 ALTER TABLE `gacl_aro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_groups`
--

DROP TABLE IF EXISTS `gacl_aro_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_groups` (
  `id` int(10) NOT NULL DEFAULT 0,
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `lft` int(10) NOT NULL DEFAULT 0,
  `rgt` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`value`),
  KEY `parent_id` (`parent_id`),
  KEY `lft_rgt` (`lft`,`rgt`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_groups`
--

LOCK TABLES `gacl_aro_groups` WRITE;
/*!40000 ALTER TABLE `gacl_aro_groups` DISABLE KEYS */;
INSERT INTO `gacl_aro_groups` VALUES (10,0,1,12,'Roles','role'),(11,10,2,3,'Administrator','admin'),(12,10,4,5,'Anonymous','anon'),(13,10,6,7,'Guest','guest'),(14,10,8,9,'Project worker','normal'),(16,10,10,11,'Empty Role','empty');
/*!40000 ALTER TABLE `gacl_aro_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_groups_id_seq`
--

DROP TABLE IF EXISTS `gacl_aro_groups_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_groups_id_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_groups_id_seq`
--

LOCK TABLES `gacl_aro_groups_id_seq` WRITE;
/*!40000 ALTER TABLE `gacl_aro_groups_id_seq` DISABLE KEYS */;
INSERT INTO `gacl_aro_groups_id_seq` VALUES (16);
/*!40000 ALTER TABLE `gacl_aro_groups_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_groups_map`
--

DROP TABLE IF EXISTS `gacl_aro_groups_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_groups_map` (
  `acl_id` int(10) NOT NULL DEFAULT 0,
  `group_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`acl_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_groups_map`
--

LOCK TABLES `gacl_aro_groups_map` WRITE;
/*!40000 ALTER TABLE `gacl_aro_groups_map` DISABLE KEYS */;
INSERT INTO `gacl_aro_groups_map` VALUES (10,10),(11,11);
/*!40000 ALTER TABLE `gacl_aro_groups_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_map`
--

DROP TABLE IF EXISTS `gacl_aro_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_map` (
  `acl_id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_map`
--

LOCK TABLES `gacl_aro_map` WRITE;
/*!40000 ALTER TABLE `gacl_aro_map` DISABLE KEYS */;
INSERT INTO `gacl_aro_map` VALUES (23,'user','2');
/*!40000 ALTER TABLE `gacl_aro_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_sections`
--

DROP TABLE IF EXISTS `gacl_aro_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_sections` (
  `id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_sections`
--

LOCK TABLES `gacl_aro_sections` WRITE;
/*!40000 ALTER TABLE `gacl_aro_sections` DISABLE KEYS */;
INSERT INTO `gacl_aro_sections` VALUES (10,'user',1,'Users',0);
/*!40000 ALTER TABLE `gacl_aro_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_sections_seq`
--

DROP TABLE IF EXISTS `gacl_aro_sections_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_sections_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_sections_seq`
--

LOCK TABLES `gacl_aro_sections_seq` WRITE;
/*!40000 ALTER TABLE `gacl_aro_sections_seq` DISABLE KEYS */;
INSERT INTO `gacl_aro_sections_seq` VALUES (10);
/*!40000 ALTER TABLE `gacl_aro_sections_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_aro_seq`
--

DROP TABLE IF EXISTS `gacl_aro_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_aro_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_aro_seq`
--

LOCK TABLES `gacl_aro_seq` WRITE;
/*!40000 ALTER TABLE `gacl_aro_seq` DISABLE KEYS */;
INSERT INTO `gacl_aro_seq` VALUES (10);
/*!40000 ALTER TABLE `gacl_aro_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo`
--

DROP TABLE IF EXISTS `gacl_axo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo`
--

LOCK TABLES `gacl_axo` WRITE;
/*!40000 ALTER TABLE `gacl_axo` DISABLE KEYS */;
INSERT INTO `gacl_axo` VALUES (10,'sys','acl',1,'ACL Administration',0),(11,'app','users',1,'User Administration',0),(12,'app','events',2,'Calendar',0),(13,'app','events',2,'Events',0),(14,'app','companies',3,'Companies',0),(15,'app','contacts',4,'Contacts',0),(16,'app','departments',5,'Departments',0),(17,'app','files',6,'Files',0),(18,'app','forums',7,'Forums',0),(19,'app','help',8,'Help',0),(20,'app','projects',9,'Projects',0),(21,'app','system',10,'System Administration',0),(22,'app','tasks',11,'Tasks',0),(23,'app','task_log',11,'Task Logs',0),(25,'app','public',13,'Public',0),(26,'app','roles',14,'Roles Administration',0),(27,'app','users',15,'User Table',0),(28,'app','smartsearch',1,'SmartSearch',0),(55,'app','links',1,'Links',0),(51,'app','projectdesigner',1,'ProjectDesigner',0),(31,'departments','1',0,'1',0),(36,'app','history',1,'History',0),(39,'app','reports',1,'Reports',0),(54,'app','resources',1,'Resources',0);
/*!40000 ALTER TABLE `gacl_axo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_groups`
--

DROP TABLE IF EXISTS `gacl_axo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_groups` (
  `id` int(10) NOT NULL DEFAULT 0,
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `lft` int(10) NOT NULL DEFAULT 0,
  `rgt` int(10) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`value`),
  KEY `parent_id` (`parent_id`),
  KEY `lft_rgt` (`lft`,`rgt`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_groups`
--

LOCK TABLES `gacl_axo_groups` WRITE;
/*!40000 ALTER TABLE `gacl_axo_groups` DISABLE KEYS */;
INSERT INTO `gacl_axo_groups` VALUES (10,0,1,8,'Modules','mod'),(11,10,2,3,'All Modules','all'),(12,10,4,5,'Admin Modules','admin'),(13,10,6,7,'Non-Admin Modules','non_admin');
/*!40000 ALTER TABLE `gacl_axo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_groups_id_seq`
--

DROP TABLE IF EXISTS `gacl_axo_groups_id_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_groups_id_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_groups_id_seq`
--

LOCK TABLES `gacl_axo_groups_id_seq` WRITE;
/*!40000 ALTER TABLE `gacl_axo_groups_id_seq` DISABLE KEYS */;
INSERT INTO `gacl_axo_groups_id_seq` VALUES (13);
/*!40000 ALTER TABLE `gacl_axo_groups_id_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_groups_map`
--

DROP TABLE IF EXISTS `gacl_axo_groups_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_groups_map` (
  `acl_id` int(10) NOT NULL DEFAULT 0,
  `group_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`acl_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_groups_map`
--

LOCK TABLES `gacl_axo_groups_map` WRITE;
/*!40000 ALTER TABLE `gacl_axo_groups_map` DISABLE KEYS */;
INSERT INTO `gacl_axo_groups_map` VALUES (11,11),(13,13),(14,13),(15,13);
/*!40000 ALTER TABLE `gacl_axo_groups_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_map`
--

DROP TABLE IF EXISTS `gacl_axo_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_map` (
  `acl_id` int(10) NOT NULL DEFAULT 0,
  `section_value` varchar(80) NOT NULL DEFAULT '0',
  `value` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_map`
--

LOCK TABLES `gacl_axo_map` WRITE;
/*!40000 ALTER TABLE `gacl_axo_map` DISABLE KEYS */;
INSERT INTO `gacl_axo_map` VALUES (12,'sys','acl');
/*!40000 ALTER TABLE `gacl_axo_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_sections`
--

DROP TABLE IF EXISTS `gacl_axo_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_sections` (
  `id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(80) NOT NULL DEFAULT '',
  `order_value` int(10) NOT NULL DEFAULT 0,
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `value` (`value`),
  KEY `hidden` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_sections`
--

LOCK TABLES `gacl_axo_sections` WRITE;
/*!40000 ALTER TABLE `gacl_axo_sections` DISABLE KEYS */;
INSERT INTO `gacl_axo_sections` VALUES (10,'sys',1,'System',0),(11,'app',2,'Application',0);
/*!40000 ALTER TABLE `gacl_axo_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_sections_seq`
--

DROP TABLE IF EXISTS `gacl_axo_sections_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_sections_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_sections_seq`
--

LOCK TABLES `gacl_axo_sections_seq` WRITE;
/*!40000 ALTER TABLE `gacl_axo_sections_seq` DISABLE KEYS */;
INSERT INTO `gacl_axo_sections_seq` VALUES (11);
/*!40000 ALTER TABLE `gacl_axo_sections_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_axo_seq`
--

DROP TABLE IF EXISTS `gacl_axo_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_axo_seq` (
  `id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_axo_seq`
--

LOCK TABLES `gacl_axo_seq` WRITE;
/*!40000 ALTER TABLE `gacl_axo_seq` DISABLE KEYS */;
INSERT INTO `gacl_axo_seq` VALUES (55);
/*!40000 ALTER TABLE `gacl_axo_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_groups_aro_map`
--

DROP TABLE IF EXISTS `gacl_groups_aro_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_groups_aro_map` (
  `group_id` int(10) NOT NULL DEFAULT 0,
  `aro_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_groups_aro_map`
--

LOCK TABLES `gacl_groups_aro_map` WRITE;
/*!40000 ALTER TABLE `gacl_groups_aro_map` DISABLE KEYS */;
INSERT INTO `gacl_groups_aro_map` VALUES (11,10);
/*!40000 ALTER TABLE `gacl_groups_aro_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_groups_axo_map`
--

DROP TABLE IF EXISTS `gacl_groups_axo_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_groups_axo_map` (
  `group_id` int(10) NOT NULL DEFAULT 0,
  `axo_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`axo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_groups_axo_map`
--

LOCK TABLES `gacl_groups_axo_map` WRITE;
/*!40000 ALTER TABLE `gacl_groups_axo_map` DISABLE KEYS */;
INSERT INTO `gacl_groups_axo_map` VALUES (11,11),(11,12),(11,13),(11,14),(11,15),(11,16),(11,17),(11,18),(11,19),(11,20),(11,21),(11,22),(11,23),(11,24),(11,25),(11,26),(11,27),(11,28),(11,36),(11,39),(11,51),(11,54),(11,55),(12,11),(12,21),(12,26),(12,27),(13,12),(13,13),(13,14),(13,15),(13,16),(13,17),(13,18),(13,19),(13,20),(13,22),(13,23),(13,24),(13,25),(13,28),(13,36),(13,39),(13,51),(13,54),(13,55);
/*!40000 ALTER TABLE `gacl_groups_axo_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_permissions`
--

DROP TABLE IF EXISTS `gacl_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_permissions` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(64) NOT NULL DEFAULT '',
  `item_id` int(10) NOT NULL DEFAULT 0,
  `action` varchar(32) NOT NULL DEFAULT '',
  `access` int(1) NOT NULL DEFAULT 0,
  `acl_id` int(10) NOT NULL DEFAULT 0,
  KEY `user_id` (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `module` (`module`),
  KEY `item_id` (`item_id`),
  KEY `action` (`action`),
  KEY `acl_id` (`acl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_permissions`
--

LOCK TABLES `gacl_permissions` WRITE;
/*!40000 ALTER TABLE `gacl_permissions` DISABLE KEYS */;
INSERT INTO `gacl_permissions` VALUES (1,'admin','users',0,'access',1,11),(1,'admin','events',0,'access',1,11),(1,'admin','companies',0,'access',1,11),(1,'admin','contacts',0,'access',1,11),(1,'admin','departments',0,'access',1,11),(1,'admin','events',0,'access',1,11),(1,'admin','files',0,'access',1,11),(1,'admin','forums',0,'access',1,11),(1,'admin','help',0,'access',1,11),(1,'admin','history',0,'access',1,11),(1,'admin','projectdesigner',0,'access',1,11),(1,'admin','projects',0,'access',1,11),(1,'admin','public',0,'access',1,11),(1,'admin','reports',0,'access',1,11),(1,'admin','resources',0,'access',1,11),(1,'admin','roles',0,'access',1,11),(1,'admin','smartsearch',0,'access',1,11),(1,'admin','system',0,'access',1,11),(1,'admin','tasks',0,'access',1,11),(1,'admin','task_log',0,'access',1,11),(1,'admin','users',0,'access',1,11),(1,'admin','acl',0,'access',1,12),(1,'admin','users',0,'add',1,11),(1,'admin','events',0,'add',1,11),(1,'admin','companies',0,'add',1,11),(1,'admin','contacts',0,'add',1,11),(1,'admin','departments',0,'add',1,11),(1,'admin','events',0,'add',1,11),(1,'admin','files',0,'add',1,11),(1,'admin','forums',0,'add',1,11),(1,'admin','help',0,'add',1,11),(1,'admin','history',0,'add',1,11),(1,'admin','projectdesigner',0,'add',1,11),(1,'admin','projects',0,'add',1,11),(1,'admin','public',0,'add',1,11),(1,'admin','reports',0,'add',1,11),(1,'admin','resources',0,'add',1,11),(1,'admin','roles',0,'add',1,11),(1,'admin','smartsearch',0,'add',1,11),(1,'admin','system',0,'add',1,11),(1,'admin','tasks',0,'add',1,11),(1,'admin','task_log',0,'add',1,11),(1,'admin','users',0,'add',1,11),(1,'admin','acl',0,'add',0,0),(1,'admin','users',0,'delete',1,11),(1,'admin','events',0,'delete',1,11),(1,'admin','companies',0,'delete',1,11),(1,'admin','contacts',0,'delete',1,11),(1,'admin','departments',0,'delete',1,11),(1,'admin','events',0,'delete',1,11),(1,'admin','files',0,'delete',1,11),(1,'admin','forums',0,'delete',1,11),(1,'admin','help',0,'delete',1,11),(1,'admin','history',0,'delete',1,11),(1,'admin','projectdesigner',0,'delete',1,11),(1,'admin','projects',0,'delete',1,11),(1,'admin','public',0,'delete',1,11),(1,'admin','reports',0,'delete',1,11),(1,'admin','resources',0,'delete',1,11),(1,'admin','roles',0,'delete',1,11),(1,'admin','smartsearch',0,'delete',1,11),(1,'admin','system',0,'delete',1,11),(1,'admin','tasks',0,'delete',1,11),(1,'admin','task_log',0,'delete',1,11),(1,'admin','users',0,'delete',1,11),(1,'admin','acl',0,'delete',0,0),(1,'admin','users',0,'edit',1,11),(1,'admin','events',0,'edit',1,11),(1,'admin','companies',0,'edit',1,11),(1,'admin','contacts',0,'edit',1,11),(1,'admin','departments',0,'edit',1,11),(1,'admin','events',0,'edit',1,11),(1,'admin','files',0,'edit',1,11),(1,'admin','forums',0,'edit',1,11),(1,'admin','help',0,'edit',1,11),(1,'admin','history',0,'edit',1,11),(1,'admin','projectdesigner',0,'edit',1,11),(1,'admin','projects',0,'edit',1,11),(1,'admin','public',0,'edit',1,11),(1,'admin','reports',0,'edit',1,11),(1,'admin','resources',0,'edit',1,11),(1,'admin','roles',0,'edit',1,11),(1,'admin','smartsearch',0,'edit',1,11),(1,'admin','system',0,'edit',1,11),(1,'admin','tasks',0,'edit',1,11),(1,'admin','task_log',0,'edit',1,11),(1,'admin','users',0,'edit',1,11),(1,'admin','acl',0,'edit',0,0),(1,'admin','users',0,'view',1,11),(1,'admin','events',0,'view',1,11),(1,'admin','companies',0,'view',1,11),(1,'admin','contacts',0,'view',1,11),(1,'admin','departments',0,'view',1,11),(1,'admin','events',0,'view',1,11),(1,'admin','files',0,'view',1,11),(1,'admin','forums',0,'view',1,11),(1,'admin','help',0,'view',1,11),(1,'admin','history',0,'view',1,11),(1,'admin','projectdesigner',0,'view',1,11),(1,'admin','projects',0,'view',1,11),(1,'admin','public',0,'view',1,11),(1,'admin','reports',0,'view',1,11),(1,'admin','resources',0,'view',1,11),(1,'admin','roles',0,'view',1,11),(1,'admin','smartsearch',0,'view',1,11),(1,'admin','system',0,'view',1,11),(1,'admin','tasks',0,'view',1,11),(1,'admin','task_log',0,'view',1,11),(1,'admin','users',0,'view',1,11),(1,'admin','acl',0,'view',0,0),(1,'admin','links',0,'view',1,11),(1,'admin','links',0,'edit',1,11),(1,'admin','links',0,'delete',1,11),(1,'admin','links',0,'add',1,11),(1,'admin','links',0,'access',1,11);
/*!40000 ALTER TABLE `gacl_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gacl_phpgacl`
--

DROP TABLE IF EXISTS `gacl_phpgacl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gacl_phpgacl` (
  `name` varchar(230) NOT NULL DEFAULT '',
  `value` varchar(230) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gacl_phpgacl`
--

LOCK TABLES `gacl_phpgacl` WRITE;
/*!40000 ALTER TABLE `gacl_phpgacl` DISABLE KEYS */;
INSERT INTO `gacl_phpgacl` VALUES ('version','3.3.7'),('schema_version','0.95');
/*!40000 ALTER TABLE `gacl_phpgacl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `history_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `history_user` int(10) NOT NULL DEFAULT 0,
  `history_action` varchar(20) NOT NULL DEFAULT 'modify',
  `history_item` int(10) NOT NULL,
  `history_table` varchar(20) NOT NULL DEFAULT '',
  `history_project` int(10) NOT NULL DEFAULT 0,
  `history_name` varchar(255) DEFAULT NULL,
  `history_changes` mediumtext DEFAULT NULL,
  `history_description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `index_history_module` (`history_table`,`history_item`),
  KEY `index_history_item` (`history_item`),
  KEY `history_date` (`history_date`),
  KEY `history_table` (`history_table`),
  KEY `history_user` (`history_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `link_id` int(10) NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_project` int(10) NOT NULL DEFAULT 0,
  `link_task` int(10) NOT NULL DEFAULT 0,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_parent` int(10) DEFAULT 0,
  `link_description` mediumtext DEFAULT NULL,
  `link_owner` int(10) DEFAULT 0,
  `link_date` datetime DEFAULT NULL,
  `link_icon` varchar(20) DEFAULT 'obj/',
  `link_category` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`link_id`),
  KEY `link_name` (`link_name`),
  KEY `link_project` (`link_project`),
  KEY `link_task` (`link_task`),
  KEY `link_parent` (`link_parent`),
  KEY `link_owner` (`link_owner`),
  KEY `link_category` (`link_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_config`
--

DROP TABLE IF EXISTS `module_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_config` (
  `module_config_id` int(10) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_config_name` varchar(50) NOT NULL,
  `module_config_value` varchar(50) NOT NULL,
  `module_config_text` varchar(50) NOT NULL,
  `module_config_order` int(10) NOT NULL,
  PRIMARY KEY (`module_config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_config`
--

LOCK TABLES `module_config` WRITE;
/*!40000 ALTER TABLE `module_config` DISABLE KEYS */;
INSERT INTO `module_config` VALUES (1,'projects','index_list','project_color_identifier','Progress',1),(2,'projects','index_list','project_priority','P',2),(3,'projects','index_list','project_name','Project Name',3),(4,'projects','index_list','project_company','Company',4),(5,'projects','index_list','project_start_date','Start',5),(6,'projects','index_list','project_end_date','End',6),(7,'projects','index_list','project_actual_end_date','Actual',7),(8,'projects','index_list','task_log_problem','LP',8),(9,'projects','index_list','project_owner','Owner',9),(10,'projects','index_list','project_task_count','Tasks',10);
/*!40000 ALTER TABLE `module_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `mod_id` int(10) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(64) NOT NULL DEFAULT '',
  `mod_directory` varchar(64) NOT NULL DEFAULT '',
  `mod_version` varchar(10) NOT NULL DEFAULT '',
  `mod_setup_class` varchar(64) NOT NULL DEFAULT '',
  `mod_type` varchar(64) NOT NULL DEFAULT '',
  `mod_active` int(1) unsigned NOT NULL DEFAULT 0,
  `mod_ui_name` varchar(20) NOT NULL DEFAULT '',
  `mod_ui_icon` varchar(64) NOT NULL DEFAULT '',
  `mod_ui_order` tinyint(3) NOT NULL DEFAULT 0,
  `mod_ui_active` int(1) unsigned NOT NULL DEFAULT 0,
  `mod_description` varchar(255) NOT NULL DEFAULT '',
  `permissions_item_table` varchar(100) DEFAULT NULL,
  `permissions_item_field` varchar(100) DEFAULT NULL,
  `permissions_item_label` varchar(100) DEFAULT NULL,
  `mod_main_class` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`mod_id`,`mod_directory`),
  KEY `mod_directory` (`mod_directory`),
  KEY `mod_type` (`mod_type`),
  KEY `mod_ui_order` (`mod_ui_order`),
  KEY `mod_active` (`mod_active`),
  KEY `permissions_item_table` (`permissions_item_table`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Companies','companies','3.0.0','','core',1,'Companies','handshake.png',1,1,'','companies','company_id','company_name','CCompany'),(2,'Projects','projects','3.0.0','','core',1,'Projects','applet3-48.png',2,1,'','projects','project_id','project_name','CProject'),(3,'Tasks','tasks','3.0.0','','core',1,'Tasks','applet-48.png',3,1,'','tasks','task_id','task_name','CTask'),(4,'Calendar','events','3.0.0','','core',1,'Calendar','myevo-appointments.png',4,1,'','events','event_id','event_name','CEvent'),(5,'Contacts','contacts','3.0.0','','core',1,'Contacts','monkeychat-48.png',5,1,'','contacts','contact_id','contact_first_name','CContact'),(6,'Files','files','3.0.0','','core',1,'Files','folder5.png',6,1,'','files','file_id','file_name','CFile'),(7,'Links','links','3.0.0','CSetupLinks','user',1,'Links','communicate.gif',7,1,'Links related to tasks','links','link_id','link_name','CLink'),(8,'SmartSearch','smartsearch','3.0.0','SSearchNS','user',1,'SmartSearch','kfind.png',8,1,'A module to search keywords and find the needle in the haystack',NULL,NULL,NULL,'CSmartSearch'),(9,'Reports','reports','3.0.0','CSetupReports','user',1,'Reports','printer.png',9,0,'A module for reports',NULL,NULL,NULL,'CReport'),(10,'User Administration','users','3.0.0','','core',1,'User Admin','helix-setup-users.png',10,1,'','users','user_id','user_username','CUser'),(11,'System Administration','system','3.0.0','','core',1,'System Admin','48_my_computer.png',11,1,'','','','','CSystem'),(12,'History','history','3.0.0','CSetupHistory','user',1,'History','',12,0,'A module for tracking changes',NULL,NULL,NULL,''),(13,'Public','public','3.0.0','','core',1,'Public','users.gif',13,0,'','','','',''),(14,'Help','help','3.0.0','','core',1,'Help','w2p.gif',14,0,'','','','',''),(15,'ProjectDesigner','projectdesigner','3.0.0','projectDesigner','user',1,'ProjectDesigner','projectdesigner.jpg',15,0,'A module to design projects',NULL,NULL,NULL,'CProjectDesigner'),(16,'Forums','forums','3.0.0','','core',0,'Forums','support.png',16,0,'','forums','forum_id','forum_name','CForum'),(17,'Departments','departments','3.0.0','','core',0,'Departments','',17,0,'','departments','dept_id','dept_name','CDepartment'),(18,'Resources','resources','3.0.0','SResource','user',0,'Resources','helpdesk.png',18,0,'','resources','resource_id','resource_name','CResource');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_forums`
--

DROP TABLE IF EXISTS `old_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_forums` (
  `forum_id` int(10) NOT NULL AUTO_INCREMENT,
  `forum_project` int(10) NOT NULL DEFAULT 0,
  `forum_status` tinyint(4) NOT NULL DEFAULT -1,
  `forum_owner` int(10) NOT NULL DEFAULT 0,
  `forum_name` varchar(50) NOT NULL DEFAULT '',
  `forum_create_date` datetime DEFAULT '1000-01-01 00:00:00',
  `forum_last_date` datetime DEFAULT '1000-01-01 00:00:00',
  `forum_last_id` int(10) unsigned NOT NULL DEFAULT 0,
  `forum_message_count` int(10) NOT NULL DEFAULT 0,
  `forum_description` varchar(255) DEFAULT NULL,
  `forum_moderated` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`forum_id`),
  KEY `forum_project` (`forum_project`),
  KEY `forum_status` (`forum_status`),
  KEY `forum_owner` (`forum_owner`),
  KEY `forum_name` (`forum_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_forums`
--

LOCK TABLES `old_forums` WRITE;
/*!40000 ALTER TABLE `old_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_projects`
--

DROP TABLE IF EXISTS `old_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_projects` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_company` int(10) NOT NULL DEFAULT 0,
  `project_department` int(10) NOT NULL DEFAULT 0,
  `project_name` varchar(255) DEFAULT NULL,
  `project_short_name` varchar(10) DEFAULT NULL,
  `project_owner` int(10) DEFAULT 0,
  `project_url` varchar(255) DEFAULT NULL,
  `project_demo_url` varchar(255) DEFAULT NULL,
  `project_start_date` date DEFAULT NULL,
  `project_end_date` date DEFAULT NULL,
  `project_actual_end_date` datetime DEFAULT NULL,
  `project_status` int(10) DEFAULT 0,
  `project_percent_complete` tinyint(4) DEFAULT 0,
  `project_color_identifier` varchar(6) DEFAULT 'eeeeee',
  `project_description` mediumtext DEFAULT NULL,
  `project_target_budget` decimal(10,2) DEFAULT 0.00,
  `project_actual_budget` decimal(10,2) DEFAULT 0.00,
  `project_scheduled_hours` float NOT NULL DEFAULT 0,
  `project_worked_hours` float NOT NULL DEFAULT 0,
  `project_task_count` int(10) NOT NULL DEFAULT 0,
  `project_creator` int(10) DEFAULT 0,
  `project_private` tinyint(3) unsigned DEFAULT 0,
  `project_departments` varchar(100) DEFAULT NULL COMMENT 'deprecated',
  `project_contacts` varchar(100) DEFAULT NULL COMMENT 'deprecated',
  `project_priority` tinyint(4) DEFAULT 0,
  `project_type` smallint(6) NOT NULL DEFAULT 0,
  `project_keydate` datetime DEFAULT NULL,
  `project_keydate_pos` tinyint(1) DEFAULT 0,
  `project_keytask` int(10) DEFAULT 0,
  `project_active` int(1) NOT NULL DEFAULT 1,
  `project_original_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `project_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `project_empireint_special` int(1) NOT NULL DEFAULT 0,
  `project_updator` int(10) NOT NULL DEFAULT 0,
  `project_created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `project_updated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `project_status_comment` varchar(255) NOT NULL DEFAULT '',
  `project_subpriority` tinyint(4) DEFAULT 0,
  `project_end_date_adjusted_user` int(10) NOT NULL DEFAULT 0,
  `project_location` varchar(255) NOT NULL DEFAULT '',
  `project_last_task` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`project_id`),
  KEY `idx_project_owner` (`project_owner`),
  KEY `idx_proj1` (`project_company`),
  KEY `project_company` (`project_company`),
  KEY `project_name` (`project_name`),
  KEY `project_short_name` (`project_short_name`),
  KEY `project_start_date` (`project_start_date`),
  KEY `project_end_date` (`project_end_date`),
  KEY `project_status` (`project_status`),
  KEY `project_creator` (`project_creator`),
  KEY `project_priority` (`project_priority`),
  KEY `project_type` (`project_type`),
  KEY `project_parent` (`project_parent`),
  KEY `project_original_parent` (`project_original_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_projects`
--

LOCK TABLES `old_projects` WRITE;
/*!40000 ALTER TABLE `old_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_user_access_log`
--

DROP TABLE IF EXISTS `old_user_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_user_access_log` (
  `user_access_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_ip` varchar(15) NOT NULL DEFAULT '',
  `date_time_in` datetime DEFAULT '1000-01-01 00:00:00',
  `date_time_out` datetime DEFAULT '1000-01-01 00:00:00',
  `date_time_last_action` datetime DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`user_access_log_id`),
  KEY `user_id` (`user_id`),
  KEY `date_time_in` (`date_time_in`),
  KEY `date_time_out` (`date_time_out`),
  KEY `date_time_last_action` (`date_time_last_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_user_access_log`
--

LOCK TABLES `old_user_access_log` WRITE;
/*!40000 ALTER TABLE `old_user_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `old_user_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `old_w2pversion`
--

DROP TABLE IF EXISTS `old_w2pversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `old_w2pversion` (
  `code_revision` int(10) unsigned NOT NULL DEFAULT 0,
  `code_version` varchar(10) NOT NULL DEFAULT '',
  `db_version` int(10) NOT NULL DEFAULT 0,
  `last_db_update` date NOT NULL DEFAULT '1000-01-01',
  `last_code_update` date NOT NULL DEFAULT '1000-01-01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `old_w2pversion`
--

LOCK TABLES `old_w2pversion` WRITE;
/*!40000 ALTER TABLE `old_w2pversion` DISABLE KEYS */;
INSERT INTO `old_w2pversion` VALUES (427,'1.0.0',1,'2022-02-03','2022-02-03'),(0,'',1,'2022-02-03','1000-01-01'),(489,'1.0.0',0,'1000-01-01','2022-02-03'),(0,'',6,'2022-02-03','1000-01-01'),(0,'',7,'2022-02-03','1000-01-01'),(0,'',8,'2022-02-03','1000-01-01'),(0,'',9,'2022-02-03','1000-01-01'),(0,'',10,'2022-02-03','1000-01-01'),(0,'',11,'2022-02-03','1000-01-01'),(0,'1.1.0',12,'1000-01-01','2022-02-03'),(0,'',12,'2022-02-03','1000-01-01'),(0,'',13,'2022-02-03','1000-01-01'),(0,'',14,'2022-02-03','1000-01-01'),(0,'',15,'2022-02-03','1000-01-01'),(0,'',16,'2022-02-03','1000-01-01'),(0,'',17,'2022-02-03','1000-01-01'),(989,'1.3.0',18,'2022-02-03','2022-02-03'),(0,'',18,'2022-02-03','1000-01-01'),(0,'',19,'2022-02-03','1000-01-01'),(0,'',20,'2022-02-03','1000-01-01'),(0,'',21,'2022-02-03','1000-01-01'),(0,'',22,'2022-02-03','1000-01-01'),(0,'',23,'2022-02-03','1000-01-01'),(1220,'2.0.0',24,'2022-02-03','2022-02-03'),(0,'',24,'2022-02-03','1000-01-01'),(1465,'2.1.0',25,'2022-02-03','2022-02-03'),(0,'',25,'2022-02-03','1000-01-01'),(0,'',26,'2022-02-03','1000-01-01'),(0,'',27,'2022-02-03','1000-01-01'),(0,'',28,'2022-02-03','1000-01-01'),(0,'',29,'2022-02-03','1000-01-01'),(0,'',30,'2022-02-03','1000-01-01'),(0,'',31,'2022-02-03','1000-01-01'),(0,'',32,'2022-02-03','1000-01-01'),(0,'2.3.0',33,'1000-01-01','2022-02-03'),(0,'',33,'2022-02-03','1000-01-01'),(0,'',34,'2022-02-03','1000-01-01'),(0,'',35,'2022-02-03','1000-01-01'),(0,'',36,'2022-02-03','1000-01-01'),(0,'',37,'2022-02-03','1000-01-01'),(0,'',38,'2022-02-03','1000-01-01'),(0,'',39,'2022-02-03','1000-01-01'),(0,'',40,'2022-02-03','1000-01-01'),(0,'',41,'2022-02-03','1000-01-01'),(0,'',42,'2022-02-03','1000-01-01'),(0,'',43,'2022-02-03','1000-01-01'),(0,'',44,'2022-02-03','1000-01-01'),(0,'',45,'2022-02-03','1000-01-01'),(0,'',46,'2022-02-03','1000-01-01'),(0,'',47,'2022-02-03','1000-01-01'),(0,'',48,'2022-02-03','1000-01-01'),(0,'',49,'2022-02-03','1000-01-01'),(0,'',50,'2022-02-03','1000-01-01'),(0,'',51,'2022-02-03','1000-01-01'),(0,'',52,'2022-02-03','1000-01-01'),(0,'',53,'2022-02-03','1000-01-01'),(0,'',54,'2022-02-03','1000-01-01'),(0,'',55,'2022-02-03','1000-01-01');
/*!40000 ALTER TABLE `old_w2pversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_contacts`
--

DROP TABLE IF EXISTS `project_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_contacts` (
  `project_id` int(10) NOT NULL DEFAULT 0,
  `contact_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`project_id`,`contact_id`),
  KEY `project_id` (`project_id`),
  KEY `contact_id` (`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_contacts`
--

LOCK TABLES `project_contacts` WRITE;
/*!40000 ALTER TABLE `project_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_departments`
--

DROP TABLE IF EXISTS `project_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_departments` (
  `project_id` int(10) NOT NULL DEFAULT 0,
  `department_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`project_id`,`department_id`),
  KEY `project_id` (`project_id`),
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_departments`
--

LOCK TABLES `project_departments` WRITE;
/*!40000 ALTER TABLE `project_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_designer_options`
--

DROP TABLE IF EXISTS `project_designer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_designer_options` (
  `pd_option_id` int(10) NOT NULL AUTO_INCREMENT,
  `pd_option_user` int(10) NOT NULL DEFAULT 0,
  `pd_option_view_project` int(1) NOT NULL DEFAULT 1,
  `pd_option_view_gantt` int(1) NOT NULL DEFAULT 1,
  `pd_option_view_tasks` int(1) NOT NULL DEFAULT 1,
  `pd_option_view_actions` int(1) NOT NULL DEFAULT 1,
  `pd_option_view_addtasks` int(1) NOT NULL DEFAULT 1,
  `pd_option_view_files` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`pd_option_id`),
  UNIQUE KEY `pd_option_user` (`pd_option_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_designer_options`
--

LOCK TABLES `project_designer_options` WRITE;
/*!40000 ALTER TABLE `project_designer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_designer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` int(10) NOT NULL AUTO_INCREMENT,
  `project_company` int(10) NOT NULL DEFAULT 0,
  `project_department` int(10) NOT NULL DEFAULT 0,
  `project_name` varchar(255) DEFAULT NULL,
  `project_short_name` varchar(10) DEFAULT NULL,
  `project_owner` int(10) DEFAULT 0,
  `project_url` varchar(255) DEFAULT NULL,
  `project_demo_url` varchar(255) DEFAULT NULL,
  `project_start_date` date DEFAULT NULL,
  `project_end_date` date DEFAULT NULL,
  `project_actual_end_date` datetime DEFAULT NULL,
  `project_status` int(10) DEFAULT 0,
  `project_percent_complete` tinyint(4) DEFAULT 0,
  `project_color_identifier` varchar(6) DEFAULT 'eeeeee',
  `project_description` mediumtext DEFAULT NULL,
  `project_target_budget` decimal(10,2) DEFAULT 0.00,
  `project_actual_budget` decimal(10,2) DEFAULT 0.00,
  `project_scheduled_hours` float NOT NULL DEFAULT 0,
  `project_worked_hours` float NOT NULL DEFAULT 0,
  `project_task_count` int(10) NOT NULL DEFAULT 0,
  `project_creator` int(10) DEFAULT 0,
  `project_private` tinyint(3) unsigned DEFAULT 0,
  `project_departments` varchar(100) DEFAULT NULL COMMENT 'deprecated',
  `project_contacts` varchar(100) DEFAULT NULL COMMENT 'deprecated',
  `project_priority` tinyint(4) DEFAULT 0,
  `project_type` smallint(6) NOT NULL DEFAULT 0,
  `project_keydate` datetime DEFAULT NULL,
  `project_keydate_pos` tinyint(1) DEFAULT 0,
  `project_keytask` int(10) DEFAULT 0,
  `project_active` int(1) NOT NULL DEFAULT 1,
  `project_original_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `project_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `project_empireint_special` int(1) NOT NULL DEFAULT 0,
  `project_updator` int(10) NOT NULL DEFAULT 0,
  `project_created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `project_updated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `project_status_comment` varchar(255) NOT NULL DEFAULT '',
  `project_subpriority` tinyint(4) DEFAULT 0,
  `project_end_date_adjusted_user` int(10) NOT NULL DEFAULT 0,
  `project_location` varchar(255) NOT NULL DEFAULT '',
  `project_last_task` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`project_id`),
  KEY `idx_project_owner` (`project_owner`),
  KEY `idx_sdate` (`project_start_date`),
  KEY `idx_edate` (`project_end_date`),
  KEY `project_short_name` (`project_short_name`),
  KEY `idx_proj1` (`project_company`),
  KEY `project_name` (`project_name`),
  KEY `project_parent` (`project_parent`),
  KEY `project_status` (`project_status`),
  KEY `project_type` (`project_type`),
  KEY `project_original_parent` (`project_original_parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_tasks`
--

DROP TABLE IF EXISTS `resource_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_tasks` (
  `resource_id` int(10) NOT NULL DEFAULT 0,
  `task_id` int(10) NOT NULL DEFAULT 0,
  `percent_allocated` int(10) NOT NULL DEFAULT 100,
  PRIMARY KEY (`resource_id`,`task_id`),
  KEY `resource_id` (`resource_id`),
  KEY `task_id` (`task_id`,`resource_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_tasks`
--

LOCK TABLES `resource_tasks` WRITE;
/*!40000 ALTER TABLE `resource_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_types`
--

DROP TABLE IF EXISTS `resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_types` (
  `resource_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `resource_type_name` varchar(255) NOT NULL DEFAULT '',
  `resource_type_note` mediumtext DEFAULT NULL,
  PRIMARY KEY (`resource_type_id`),
  KEY `resource_type_name` (`resource_type_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_types`
--

LOCK TABLES `resource_types` WRITE;
/*!40000 ALTER TABLE `resource_types` DISABLE KEYS */;
INSERT INTO `resource_types` VALUES (1,'Equipment',NULL),(2,'Tool',NULL),(3,'Venue',NULL);
/*!40000 ALTER TABLE `resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `resource_id` int(10) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) NOT NULL DEFAULT '',
  `resource_key` varchar(64) NOT NULL DEFAULT '',
  `resource_type` int(10) NOT NULL DEFAULT 0,
  `resource_note` mediumtext NOT NULL,
  `resource_max_allocation` int(10) NOT NULL DEFAULT 100,
  PRIMARY KEY (`resource_id`),
  KEY `resource_name` (`resource_name`),
  KEY `resource_type` (`resource_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL DEFAULT '',
  `session_user` int(10) NOT NULL DEFAULT 0,
  `session_data` longblob DEFAULT NULL,
  `session_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `session_created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`session_id`),
  KEY `session_updated` (`session_updated`),
  KEY `session_created` (`session_created`),
  KEY `session_user` (`session_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syskeys`
--

DROP TABLE IF EXISTS `syskeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syskeys` (
  `syskey_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `syskey_name` varchar(48) NOT NULL DEFAULT '',
  `syskey_label` varchar(255) NOT NULL DEFAULT '',
  `syskey_type` int(1) unsigned NOT NULL DEFAULT 0,
  `syskey_sep1` char(2) DEFAULT '\n',
  `syskey_sep2` char(2) NOT NULL DEFAULT '|',
  PRIMARY KEY (`syskey_id`),
  KEY `syskey_name` (`syskey_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syskeys`
--

LOCK TABLES `syskeys` WRITE;
/*!40000 ALTER TABLE `syskeys` DISABLE KEYS */;
INSERT INTO `syskeys` VALUES (1,'SelectList','Enter values for list',0,'\n','|'),(2,'CustomField','Serialized array in the following format:\r\n<KEY>|<SERIALIZED ARRAY>\r\n\r\nSerialized Array:\r\n[type] => text | checkbox | select | textarea | label\r\n[name] => <Field\'s name>\r\n[options] => <html capture options>\r\n[selects] => <options for select and checkbox>',0,'\n','|'),(3,'ColorSelection','Hex color values for type=>color association.',0,'','|'),(4,'ContactMethods','Alternate methods of communication for contacts',0,'\n','|');
/*!40000 ALTER TABLE `syskeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysvals`
--

DROP TABLE IF EXISTS `sysvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysvals` (
  `sysval_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sysval_key_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sysval_title` varchar(48) NOT NULL DEFAULT '',
  `sysval_value` mediumtext NOT NULL,
  `sysval_value_id` varchar(128) DEFAULT '0',
  PRIMARY KEY (`sysval_id`),
  KEY `sysval_key_id` (`sysval_key_id`),
  KEY `sysval_title` (`sysval_title`),
  KEY `sysval_value_id` (`sysval_value_id`)
) ENGINE=MyISAM AUTO_INCREMENT=505 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysvals`
--

LOCK TABLES `sysvals` WRITE;
/*!40000 ALTER TABLE `sysvals` DISABLE KEYS */;
INSERT INTO `sysvals` VALUES (1,1,'CompanyType','Not Applicable','0'),(2,1,'CompanyType','Client','1'),(3,1,'CompanyType','Vendor','2'),(4,1,'CompanyType','Supplier','3'),(5,1,'CompanyType','Consultant','4'),(6,1,'CompanyType','Government','5'),(7,1,'CompanyType','Internal','6'),(8,1,'DepartmentType','Not Defined','0'),(9,1,'DepartmentType','Profit','1'),(10,1,'DepartmentType','Cost','2'),(11,1,'EventType','General','0'),(12,1,'EventType','Appointment','1'),(13,1,'EventType','Meeting','2'),(14,1,'EventType','All Day Event','3'),(15,1,'EventType','Anniversary','4'),(16,1,'EventType','Reminder','5'),(17,1,'FileType','Unknown','0'),(18,1,'FileType','Document','1'),(19,1,'FileType','Application','2'),(20,1,'GlobalCountries','Andorra, Principality of','AD'),(21,1,'GlobalCountries','United Arab Emirates','AE'),(22,1,'GlobalCountries','Afghanistan, Islamic State of','AF'),(23,1,'GlobalCountries','Antigua and Barbuda','AG'),(24,1,'GlobalCountries','Anguilla','AI'),(25,1,'GlobalCountries','Albania','AL'),(26,1,'GlobalCountries','Armenia','AM'),(27,1,'GlobalCountries','Netherlands Antilles','AN'),(28,1,'GlobalCountries','Angola','AO'),(29,1,'GlobalCountries','Antarctica','AQ'),(30,1,'GlobalCountries','Argentina','AR'),(31,1,'GlobalCountries','American Samoa','AS'),(32,1,'GlobalCountries','Austria','AT'),(33,1,'GlobalCountries','Australia','AU'),(34,1,'GlobalCountries','Aruba','AW'),(35,1,'GlobalCountries','Azerbaidjan','AZ'),(36,1,'GlobalCountries','Bosnia-Herzegovina','BA'),(37,1,'GlobalCountries','Barbados','BB'),(38,1,'GlobalCountries','Bangladesh','BD'),(39,1,'GlobalCountries','Belgium','BE'),(40,1,'GlobalCountries','Burkina Faso','BF'),(41,1,'GlobalCountries','Bulgaria','BG'),(42,1,'GlobalCountries','Bahrain','BH'),(43,1,'GlobalCountries','Burundi','BI'),(44,1,'GlobalCountries','Benin','BJ'),(45,1,'GlobalCountries','Bermuda','BM'),(46,1,'GlobalCountries','Brunei Darussalam','BN'),(47,1,'GlobalCountries','Bolivia','BO'),(48,1,'GlobalCountries','Brazil','BR'),(49,1,'GlobalCountries','Bahamas','BS'),(50,1,'GlobalCountries','Bhutan','BT'),(51,1,'GlobalCountries','Bouvet Island','BV'),(52,1,'GlobalCountries','Botswana','BW'),(53,1,'GlobalCountries','Belarus','BY'),(54,1,'GlobalCountries','Belize','BZ'),(55,1,'GlobalCountries','Canada','CA'),(56,1,'GlobalCountries','Cocos (Keeling) Islands','CC'),(57,1,'GlobalCountries','Central African Republic','CF'),(58,1,'GlobalCountries','Congo, The Democratic Republic of the','CD'),(59,1,'GlobalCountries','Congo','CG'),(60,1,'GlobalCountries','Switzerland','CH'),(61,1,'GlobalCountries','Ivory Coast (Cote D\'Ivoire)','CI'),(62,1,'GlobalCountries','Cook Islands','CK'),(63,1,'GlobalCountries','Chile','CL'),(64,1,'GlobalCountries','Cameroon','CM'),(65,1,'GlobalCountries','China','CN'),(66,1,'GlobalCountries','Colombia','CO'),(67,1,'GlobalCountries','Costa Rica','CR'),(68,1,'GlobalCountries','Former Czechoslovakia','CS'),(69,1,'GlobalCountries','Cuba','CU'),(70,1,'GlobalCountries','Cape Verde','CV'),(71,1,'GlobalCountries','Christmas Island','CX'),(72,1,'GlobalCountries','Cyprus','CY'),(73,1,'GlobalCountries','Czech Republic','CZ'),(74,1,'GlobalCountries','Germany','DE'),(75,1,'GlobalCountries','Djibouti','DJ'),(76,1,'GlobalCountries','Denmark','DK'),(77,1,'GlobalCountries','Dominica','DM'),(78,1,'GlobalCountries','Dominican Republic','DO'),(79,1,'GlobalCountries','Algeria','DZ'),(80,1,'GlobalCountries','Ecuador','EC'),(81,1,'GlobalCountries','Estonia','EE'),(82,1,'GlobalCountries','Egypt','EG'),(83,1,'GlobalCountries','Western Sahara','EH'),(84,1,'GlobalCountries','Eritrea','ER'),(85,1,'GlobalCountries','Spain','ES'),(86,1,'GlobalCountries','Ethiopia','ET'),(87,1,'GlobalCountries','Finland','FI'),(88,1,'GlobalCountries','Fiji','FJ'),(89,1,'GlobalCountries','Falkland Islands','FK'),(90,1,'GlobalCountries','Micronesia','FM'),(91,1,'GlobalCountries','Faroe Islands','FO'),(92,1,'GlobalCountries','France','FR'),(93,1,'GlobalCountries','Gabon','GA'),(94,1,'GlobalCountries','Great Britain','GB'),(95,1,'GlobalCountries','Grenada','GD'),(96,1,'GlobalCountries','Georgia','GE'),(97,1,'GlobalCountries','French Guyana','GF'),(98,1,'GlobalCountries','Ghana','GH'),(99,1,'GlobalCountries','Gibraltar','GI'),(100,1,'GlobalCountries','Greenland','GL'),(101,1,'GlobalCountries','Gambia','GM'),(102,1,'GlobalCountries','Guinea','GN'),(103,1,'GlobalCountries','Guadeloupe (French)','GP'),(104,1,'GlobalCountries','Equatorial Guinea','GQ'),(105,1,'GlobalCountries','Greece','GR'),(106,1,'GlobalCountries','S. Georgia & S. Sandwich Isls.','GS'),(107,1,'GlobalCountries','Guatemala','GT'),(108,1,'GlobalCountries','Guam (USA)','GU'),(109,1,'GlobalCountries','Guinea Bissau','GW'),(110,1,'GlobalCountries','Guyana','GY'),(111,1,'GlobalCountries','Hong Kong','HK'),(112,1,'GlobalCountries','Heard and McDonald Islands','HM'),(113,1,'GlobalCountries','Honduras','HN'),(114,1,'GlobalCountries','Croatia','HR'),(115,1,'GlobalCountries','Haiti','HT'),(116,1,'GlobalCountries','Hungary','HU'),(117,1,'GlobalCountries','Indonesia','ID'),(118,1,'GlobalCountries','Ireland','IE'),(119,1,'GlobalCountries','Israel','IL'),(120,1,'GlobalCountries','India','IN'),(121,1,'GlobalCountries','British Indian Ocean Territory','IO'),(122,1,'GlobalCountries','Iraq','IQ'),(123,1,'GlobalCountries','Iran','IR'),(124,1,'GlobalCountries','Iceland','IS'),(125,1,'GlobalCountries','Italy','IT'),(126,1,'GlobalCountries','Jamaica','JM'),(127,1,'GlobalCountries','Jordan','JO'),(128,1,'GlobalCountries','Japan','JP'),(129,1,'GlobalCountries','Kenya','KE'),(130,1,'GlobalCountries','Kyrgyz Republic (Kyrgyzstan)','KG'),(131,1,'GlobalCountries','Cambodia, Kingdom of','KH'),(132,1,'GlobalCountries','Kiribati','KI'),(133,1,'GlobalCountries','Comoros','KM'),(134,1,'GlobalCountries','Saint Kitts & Nevis Anguilla','KN'),(135,1,'GlobalCountries','North Korea','KP'),(136,1,'GlobalCountries','South Korea','KR'),(137,1,'GlobalCountries','Kuwait','KW'),(138,1,'GlobalCountries','Cayman Islands','KY'),(139,1,'GlobalCountries','Kazakhstan','KZ'),(140,1,'GlobalCountries','Laos','LA'),(141,1,'GlobalCountries','Lebanon','LB'),(142,1,'GlobalCountries','Saint Lucia','LC'),(143,1,'GlobalCountries','Liechtenstein','LI'),(144,1,'GlobalCountries','Sri Lanka','LK'),(145,1,'GlobalCountries','Liberia','LR'),(146,1,'GlobalCountries','Lesotho','LS'),(147,1,'GlobalCountries','Lithuania','LT'),(148,1,'GlobalCountries','Luxembourg','LU'),(149,1,'GlobalCountries','Latvia','LV'),(150,1,'GlobalCountries','Libya','LY'),(151,1,'GlobalCountries','Morocco','MA'),(152,1,'GlobalCountries','Monaco','MC'),(153,1,'GlobalCountries','Moldavia','MD'),(154,1,'GlobalCountries','Madagascar','MG'),(155,1,'GlobalCountries','Marshall Islands','MH'),(156,1,'GlobalCountries','Macedonia','MK'),(157,1,'GlobalCountries','Mali','ML'),(158,1,'GlobalCountries','Myanmar','MM'),(159,1,'GlobalCountries','Mongolia','MN'),(160,1,'GlobalCountries','Macau','MO'),(161,1,'GlobalCountries','Northern Mariana Islands','MP'),(162,1,'GlobalCountries','Martinique (French)','MQ'),(163,1,'GlobalCountries','Mauritania','MR'),(164,1,'GlobalCountries','Montserrat','MS'),(165,1,'GlobalCountries','Malta','MT'),(166,1,'GlobalCountries','Mauritius','MU'),(167,1,'GlobalCountries','Maldives','MV'),(168,1,'GlobalCountries','Malawi','MW'),(169,1,'GlobalCountries','Mexico','MX'),(170,1,'GlobalCountries','Malaysia','MY'),(171,1,'GlobalCountries','Mozambique','MZ'),(172,1,'GlobalCountries','Namibia','NA'),(173,1,'GlobalCountries','New Caledonia (French)','NC'),(174,1,'GlobalCountries','Niger','NE'),(175,1,'GlobalCountries','Norfolk Island','NF'),(176,1,'GlobalCountries','Nigeria','NG'),(177,1,'GlobalCountries','Nicaragua','NI'),(178,1,'GlobalCountries','Netherlands','NL'),(179,1,'GlobalCountries','Norway','NO'),(180,1,'GlobalCountries','Nepal','NP'),(181,1,'GlobalCountries','Nauru','NR'),(182,1,'GlobalCountries','Neutral Zone','NT'),(183,1,'GlobalCountries','Niue','NU'),(184,1,'GlobalCountries','New Zealand','NZ'),(185,1,'GlobalCountries','Oman','OM'),(186,1,'GlobalCountries','Panama','PA'),(187,1,'GlobalCountries','Peru','PE'),(188,1,'GlobalCountries','Polynesia (French)','PF'),(189,1,'GlobalCountries','Papua New Guinea','PG'),(190,1,'GlobalCountries','Philippines','PH'),(191,1,'GlobalCountries','Pakistan','PK'),(192,1,'GlobalCountries','Poland','PL'),(193,1,'GlobalCountries','Saint Pierre and Miquelon','PM'),(194,1,'GlobalCountries','Pitcairn Island','PN'),(195,1,'GlobalCountries','Puerto Rico','PR'),(196,1,'GlobalCountries','Portugal','PT'),(197,1,'GlobalCountries','Palau','PW'),(198,1,'GlobalCountries','Paraguay','PY'),(199,1,'GlobalCountries','Qatar','QA'),(200,1,'GlobalCountries','Reunion (French)','RE'),(201,1,'GlobalCountries','Romania','RO'),(202,1,'GlobalCountries','Russian Federation','RU'),(203,1,'GlobalCountries','Rwanda','RW'),(204,1,'GlobalCountries','Saudi Arabia','SA'),(205,1,'GlobalCountries','Solomon Islands','SB'),(206,1,'GlobalCountries','Seychelles','SC'),(207,1,'GlobalCountries','Sudan','SD'),(208,1,'GlobalCountries','Sweden','SE'),(209,1,'GlobalCountries','Singapore','SG'),(210,1,'GlobalCountries','Saint Helena','SH'),(211,1,'GlobalCountries','Slovenia','SI'),(212,1,'GlobalCountries','Svalbard and Jan Mayen Islands','SJ'),(213,1,'GlobalCountries','Slovak Republic','SK'),(214,1,'GlobalCountries','Sierra Leone','SL'),(215,1,'GlobalCountries','San Marino','SM'),(216,1,'GlobalCountries','Senegal','SN'),(217,1,'GlobalCountries','Somalia','SO'),(218,1,'GlobalCountries','Suriname','SR'),(219,1,'GlobalCountries','Saint Tome (Sao Tome) and Principe','ST'),(220,1,'GlobalCountries','Former USSR','SU'),(221,1,'GlobalCountries','El Salvador','SV'),(222,1,'GlobalCountries','Syria','SY'),(223,1,'GlobalCountries','Swaziland','SZ'),(224,1,'GlobalCountries','Turks and Caicos Islands','TC'),(225,1,'GlobalCountries','Chad','TD'),(226,1,'GlobalCountries','French Southern Territories','TF'),(227,1,'GlobalCountries','Togo','TG'),(228,1,'GlobalCountries','Thailand','TH'),(229,1,'GlobalCountries','Tadjikistan','TJ'),(230,1,'GlobalCountries','Tokelau','TK'),(231,1,'GlobalCountries','Turkmenistan','TM'),(232,1,'GlobalCountries','Tunisia','TN'),(233,1,'GlobalCountries','Tonga','TO'),(234,1,'GlobalCountries','East Timor','TL'),(235,1,'GlobalCountries','Turkey','TR'),(236,1,'GlobalCountries','Trinidad and Tobago','TT'),(237,1,'GlobalCountries','Tuvalu','TV'),(238,1,'GlobalCountries','Taiwan','TW'),(239,1,'GlobalCountries','Tanzania','TZ'),(240,1,'GlobalCountries','Ukraine','UA'),(241,1,'GlobalCountries','Uganda','UG'),(242,1,'GlobalCountries','United Kingdom','UK'),(243,1,'GlobalCountries','USA Minor Outlying Islands','UM'),(244,1,'GlobalCountries','United States','US'),(245,1,'GlobalCountries','Uruguay','UY'),(246,1,'GlobalCountries','Uzbekistan','UZ'),(247,1,'GlobalCountries','Holy See (Vatican City State)','VA'),(248,1,'GlobalCountries','Saint Vincent & Grenadines','VC'),(249,1,'GlobalCountries','Venezuela','VE'),(250,1,'GlobalCountries','Virgin Islands (British)','VG'),(251,1,'GlobalCountries','Virgin Islands (USA)','VI'),(252,1,'GlobalCountries','Vietnam','VN'),(253,1,'GlobalCountries','Vanuatu','VU'),(254,1,'GlobalCountries','Wallis and Futuna Islands','WF'),(255,1,'GlobalCountries','Samoa','WS'),(256,1,'GlobalCountries','Yemen','YE'),(257,1,'GlobalCountries','Mayotte','YT'),(258,1,'GlobalCountries','Yugoslavia','YU'),(259,1,'GlobalCountries','South Africa','ZA'),(260,1,'GlobalCountries','Zambia','ZM'),(261,1,'GlobalCountries','Zaire','ZR'),(262,1,'GlobalCountries','Zimbabwe','ZW'),(263,1,'GlobalYesNo','No','0'),(264,1,'GlobalYesNo','Yes','1'),(265,1,'LinkType','Unknown','0'),(266,1,'LinkType','Document','1'),(267,1,'LinkType','Application','2'),(268,3,'ProjectColors','FFFCAE','HelpDesk'),(269,3,'ProjectColors','AEFFB2','Engineering'),(270,3,'ProjectColors','FFAEAE','System Administration'),(271,3,'ProjectColors','FFE0AE','Web'),(272,1,'ProjectPriority','low','-1'),(273,1,'ProjectPriority','normal','0'),(274,1,'ProjectPriority','high','1'),(275,1,'ProjectPriorityColor','#E5F7FF','-1'),(276,1,'ProjectPriorityColor','','0'),(277,1,'ProjectPriorityColor','#FFDCB3','1'),(278,1,'ProjectRequiredFields','<3','f.project_color_identifier.value.length'),(279,1,'ProjectRequiredFields','<1','f.project_company.options[f.project_company.selectedIndex].value'),(280,1,'ProjectRequiredFields','<3','f.project_name.value.length'),(281,1,'ProjectStatus','Not Defined','0'),(282,1,'ProjectStatus','Proposed','1'),(283,1,'ProjectStatus','In Planning','2'),(284,1,'ProjectStatus','In Progress','3'),(285,1,'ProjectStatus','On Hold','4'),(286,1,'ProjectStatus','Complete','5'),(287,1,'ProjectStatus','Template','6'),(288,1,'ProjectType','Unknown','0'),(289,1,'ProjectType','Administrative','1'),(290,1,'ProjectType','Operative','2'),(291,1,'TaskDurationType','hours','1'),(292,1,'TaskDurationType','days','24'),(293,1,'TaskLogReference','Not Defined','0'),(294,1,'TaskLogReference','Email','1'),(295,1,'TaskLogReference','Helpdesk','2'),(296,1,'TaskLogReference','Phone Call','3'),(297,1,'TaskLogReference','Fax','4'),(298,1,'TaskLogReferenceImage','i','0'),(299,1,'TaskLogReferenceImage','a','1'),(300,1,'TaskPriority','low','-1'),(301,1,'TaskPriority','normal','0'),(302,1,'TaskPriority','high','1'),(303,1,'TaskStatus','Active','0'),(304,1,'TaskStatus','Inactive','-1'),(305,1,'TaskType','Unknown','0'),(306,1,'TaskType','Administrative','1'),(307,1,'TaskType','Operative','2'),(308,1,'UserType','Default User','0'),(309,1,'UserType','Administrator','1'),(310,1,'UserType','CEO','2'),(311,1,'UserType','Director','3'),(312,1,'UserType','Branch Manager','4'),(313,1,'UserType','Manager','5'),(314,1,'UserType','Supervisor','6'),(315,1,'UserType','Employee','7'),(316,1,'ProjectRequiredFields','<1','f.project_short_name.value.length'),(317,1,'FileIndexIgnoreWords','a,about,also, an,and,another,any,are,as,at,back,be,because,been,being,but,\n	by,can,could,did,do,each,end,even,for,from,get,go,had,have,he,her,here,his,how, i,if,in,into,is,it,else,\n	just,may,me,might,much,must, my,no,not,ofv,off,on,only,or,other,our,out,should,so,some,still,such,than,\n	that,the,their,them,then,there,these,they,this,those,to,too,try,twov,under, up,us,was,we,were,what,when,\n	where,which,while,who,why,will,with,within,without,would,you,your,MSWordDoc,bjbjU','FileIndexIgnoreWords'),(318,1,'Timezones','Kwajalein','Kwajalein'),(319,1,'Timezones','Pacific/Midway','Pacific/Midway'),(320,1,'Timezones','Pacific/Samoa','Pacific/Samoa'),(321,1,'Timezones','Pacific/Honolulu','Pacific/Honolulu'),(322,1,'Timezones','America/Anchorage','America/Anchorage'),(323,1,'Timezones','America/Los_Angeles','America/Los_Angeles'),(324,1,'Timezones','America/Tijuana','America/Tijuana'),(325,1,'Timezones','America/Denver','America/Denver'),(326,1,'Timezones','America/Chihuahua','America/Chihuahua'),(327,1,'Timezones','America/Mazatlan','America/Mazatlan'),(328,1,'Timezones','America/Phoenix','America/Phoenix'),(329,1,'Timezones','America/Regina','America/Regina'),(330,1,'Timezones','America/Tegucigalpa','America/Tegucigalpa'),(331,1,'Timezones','America/Chicago','America/Chicago'),(332,1,'Timezones','America/Mexico_City','America/Mexico_City'),(333,1,'Timezones','America/Monterrey','America/Monterrey'),(334,1,'Timezones','America/New_York','America/New_York'),(335,1,'Timezones','America/Bogota','America/Bogota'),(336,1,'Timezones','America/Lima','America/Lima'),(337,1,'Timezones','America/Rio_Branco','America/Rio_Branco'),(338,1,'Timezones','America/Indiana/Indianapolis','America/Indiana/Indianapolis'),(339,1,'Timezones','America/Caracas','America/Caracas'),(340,1,'Timezones','America/Halifax','America/Halifax'),(341,1,'Timezones','America/Manaus','America/Manaus'),(342,1,'Timezones','America/Santiago','America/Santiago'),(343,1,'Timezones','America/La_Paz','America/La_Paz'),(344,1,'Timezones','America/St_Johns','America/St_Johns'),(345,1,'Timezones','America/Argentina/Buenos_Aires','America/Argentina/Buenos_Aires'),(346,1,'Timezones','America/Sao_Paulo','America/Sao_Paulo'),(347,1,'Timezones','America/Godthab','America/Godthab'),(348,1,'Timezones','America/Montevideo','America/Montevideo'),(349,1,'Timezones','Atlantic/South_Georgia','Atlantic/South_Georgia'),(350,1,'Timezones','Atlantic/Azores','Atlantic/Azores'),(351,1,'Timezones','Atlantic/Cape_Verde','Atlantic/Cape_Verde'),(352,1,'Timezones','Europe/Dublin','Europe/Dublin'),(353,1,'Timezones','Europe/Lisbon','Europe/Lisbon'),(354,1,'Timezones','Europe/London','Europe/London'),(355,1,'Timezones','Africa/Monrovia','Africa/Monrovia'),(356,1,'Timezones','Atlantic/Reykjavik','Atlantic/Reykjavik'),(357,1,'Timezones','Africa/Casablanca','Africa/Casablanca'),(358,1,'Timezones','Europe/Belgrade','Europe/Belgrade'),(359,1,'Timezones','Europe/Bratislava','Europe/Bratislava'),(360,1,'Timezones','Europe/Budapest','Europe/Budapest'),(361,1,'Timezones','Europe/Ljubljana','Europe/Ljubljana'),(362,1,'Timezones','Europe/Prague','Europe/Prague'),(363,1,'Timezones','Europe/Sarajevo','Europe/Sarajevo'),(364,1,'Timezones','Europe/Skopje','Europe/Skopje'),(365,1,'Timezones','Europe/Warsaw','Europe/Warsaw'),(366,1,'Timezones','Europe/Zagreb','Europe/Zagreb'),(367,1,'Timezones','Europe/Brussels','Europe/Brussels'),(368,1,'Timezones','Europe/Copenhagen','Europe/Copenhagen'),(369,1,'Timezones','Europe/Madrid','Europe/Madrid'),(370,1,'Timezones','Europe/Paris','Europe/Paris'),(371,1,'Timezones','Africa/Algiers','Africa/Algiers'),(372,1,'Timezones','Europe/Amsterdam','Europe/Amsterdam'),(373,1,'Timezones','Europe/Berlin','Europe/Berlin'),(374,1,'Timezones','Europe/Rome','Europe/Rome'),(375,1,'Timezones','Europe/Stockholm','Europe/Stockholm'),(376,1,'Timezones','Europe/Vienna','Europe/Vienna'),(377,1,'Timezones','Europe/Minsk','Europe/Minsk'),(378,1,'Timezones','Africa/Cairo','Africa/Cairo'),(379,1,'Timezones','Europe/Helsinki','Europe/Helsinki'),(380,1,'Timezones','Europe/Riga','Europe/Riga'),(381,1,'Timezones','Europe/Sofia','Europe/Sofia'),(382,1,'Timezones','Europe/Tallinn','Europe/Tallinn'),(383,1,'Timezones','Europe/Vilnius','Europe/Vilnius'),(384,1,'Timezones','Europe/Athens','Europe/Athens'),(385,1,'Timezones','Europe/Bucharest','Europe/Bucharest'),(386,1,'Timezones','Europe/Istanbul','Europe/Istanbul'),(387,1,'Timezones','Asia/Jerusalem','Asia/Jerusalem'),(388,1,'Timezones','Asia/Amman','Asia/Amman'),(389,1,'Timezones','Asia/Beirut','Asia/Beirut'),(390,1,'Timezones','Africa/Windhoek','Africa/Windhoek'),(391,1,'Timezones','Africa/Harare','Africa/Harare'),(392,1,'Timezones','Asia/Kuwait','Asia/Kuwait'),(393,1,'Timezones','Asia/Riyadh','Asia/Riyadh'),(394,1,'Timezones','Asia/Baghdad','Asia/Baghdad'),(395,1,'Timezones','Africa/Nairobi','Africa/Nairobi'),(396,1,'Timezones','Asia/Tbilisi','Asia/Tbilisi'),(397,1,'Timezones','Europe/Moscow','Europe/Moscow'),(398,1,'Timezones','Europe/Volgograd','Europe/Volgograd'),(399,1,'Timezones','Asia/Tehran','Asia/Tehran'),(400,1,'Timezones','Asia/Muscat','Asia/Muscat'),(401,1,'Timezones','Asia/Baku','Asia/Baku'),(402,1,'Timezones','Asia/Yerevan','Asia/Yerevan'),(403,1,'Timezones','Asia/Yekaterinburg','Asia/Yekaterinburg'),(404,1,'Timezones','Asia/Karachi','Asia/Karachi'),(405,1,'Timezones','Asia/Tashkent','Asia/Tashkent'),(406,1,'Timezones','Asia/Kolkata','Asia/Kolkata'),(407,1,'Timezones','Asia/Colombo','Asia/Colombo'),(408,1,'Timezones','Asia/Katmandu','Asia/Katmandu'),(409,1,'Timezones','Asia/Dhaka','Asia/Dhaka'),(410,1,'Timezones','Asia/Almaty','Asia/Almaty'),(411,1,'Timezones','Asia/Novosibirsk','Asia/Novosibirsk'),(412,1,'Timezones','Asia/Rangoon','Asia/Rangoon'),(413,1,'Timezones','Asia/Krasnoyarsk','Asia/Krasnoyarsk'),(414,1,'Timezones','Asia/Bangkok','Asia/Bangkok'),(415,1,'Timezones','Asia/Jakarta','Asia/Jakarta'),(416,1,'Timezones','Asia/Brunei','Asia/Brunei'),(417,1,'Timezones','Asia/Chongqing','Asia/Chongqing'),(418,1,'Timezones','Asia/Hong_Kong','Asia/Hong_Kong'),(419,1,'Timezones','Asia/Urumqi','Asia/Urumqi'),(420,1,'Timezones','Asia/Irkutsk','Asia/Irkutsk'),(421,1,'Timezones','Asia/Ulaanbaatar','Asia/Ulaanbaatar'),(422,1,'Timezones','Asia/Kuala_Lumpur','Asia/Kuala_Lumpur'),(423,1,'Timezones','Asia/Singapore','Asia/Singapore'),(424,1,'Timezones','Asia/Taipei','Asia/Taipei'),(425,1,'Timezones','Australia/Perth','Australia/Perth'),(426,1,'Timezones','Asia/Seoul','Asia/Seoul'),(427,1,'Timezones','Asia/Tokyo','Asia/Tokyo'),(428,1,'Timezones','Asia/Yakutsk','Asia/Yakutsk'),(429,1,'Timezones','Australia/Darwin','Australia/Darwin'),(430,1,'Timezones','Australia/Adelaide','Australia/Adelaide'),(431,1,'Timezones','Australia/Canberra','Australia/Canberra'),(432,1,'Timezones','Australia/Melbourne','Australia/Melbourne'),(433,1,'Timezones','Australia/Sydney','Australia/Sydney'),(434,1,'Timezones','Australia/Brisbane','Australia/Brisbane'),(435,1,'Timezones','Australia/Hobart','Australia/Hobart'),(436,1,'Timezones','Asia/Vladivostok','Asia/Vladivostok'),(437,1,'Timezones','Pacific/Guam','Pacific/Guam'),(438,1,'Timezones','Pacific/Port_Moresby','Pacific/Port_Moresby'),(439,1,'Timezones','Asia/Magadan','Asia/Magadan'),(440,1,'Timezones','Pacific/Fiji','Pacific/Fiji'),(441,1,'Timezones','Asia/Kamchatka','Asia/Kamchatka'),(442,1,'Timezones','Pacific/Auckland','Pacific/Auckland'),(443,1,'Timezones','Pacific/Tongatapu','Pacific/Tongatapu'),(458,1,'GlobalCountriesPreferred','Australia','AU'),(445,4,'ContactMethods','Email: Alternate','email_alt'),(446,4,'ContactMethods','Web Site','url'),(459,1,'GlobalCountriesPreferred','Canada','CA'),(448,4,'ContactMethods','Phone: Alternate','phone_alt'),(449,4,'ContactMethods','Phone: Fax','phone_fax'),(450,4,'ContactMethods','Phone: Mobile','phone_mobile'),(451,4,'ContactMethods','IM: Jabber','im_jabber'),(452,4,'ContactMethods','IM: ICQ','im_icq'),(453,4,'ContactMethods','IM: MSN','im_msn'),(454,4,'ContactMethods','IM: Yahoo','im_yahoo'),(455,4,'ContactMethods','IM: AOL','im_aol'),(456,4,'ContactMethods','IM: Skype','im_skype'),(457,4,'ContactMethods','IM: Google','im_google'),(460,1,'GlobalCountriesPreferred','Germany','DE'),(461,1,'GlobalCountriesPreferred','France','FR'),(462,1,'GlobalCountriesPreferred','Portugal','PT'),(463,1,'GlobalCountriesPreferred','United Kingdom','GB'),(464,1,'GlobalCountriesPreferred','United States','US'),(465,1,'GlobalCountries','Andorra','AD'),(466,1,'GlobalCountries','Aland Islands','AX'),(467,1,'GlobalCountries','Saint Barthélemy','BL'),(468,1,'GlobalCountries','Western Sahara','EH'),(469,1,'GlobalCountries','Falkland Islands (Malvinas)','FK'),(470,1,'GlobalCountries','Micronesia, Federated States Of','FM'),(471,1,'GlobalCountries','United Kingdom','GB'),(472,1,'GlobalCountries','Guernsey','GG'),(473,1,'GlobalCountries','Isle Of Man','IM'),(474,1,'GlobalCountries','Jersey','JE'),(475,1,'GlobalCountries','Korea, Democratic People\'s Republic Of','KP'),(476,1,'GlobalCountries','Korea, Republic Of','KR'),(477,1,'GlobalCountries','Lao People\'s Democratic Republic','LA'),(478,1,'GlobalCountries','Libyan Arab Jamahiriya','LY'),(479,1,'GlobalCountries','Moldova, Republic Of','MD'),(480,1,'GlobalCountries','Montenegro','ME'),(481,1,'GlobalCountries','Saint Martin (French part)','MF'),(482,1,'GlobalCountries','Macedonia, The Former Yugoslav Republic Of','MK'),(483,1,'GlobalCountries','Macao','MO'),(484,1,'GlobalCountries','French Polynesia','PF'),(485,1,'GlobalCountries','Pitcairn','PN'),(486,1,'GlobalCountries','Palestinian Territory, Occupied','PS'),(487,1,'GlobalCountries','Reunion','RE'),(488,1,'GlobalCountries','Serbia','RS'),(489,1,'GlobalCountries','Svalbard And Jan Mayen','SJ'),(490,1,'GlobalCountries','Slovakia','SK'),(491,1,'GlobalCountries','Sao Tome And Principe','ST'),(492,1,'GlobalCountries','Syrian Arab Republic','SY'),(493,1,'GlobalCountries','Tajikistan','TJ'),(494,1,'GlobalCountries','Timor-Leste','TL'),(495,1,'GlobalCountries','Taiwan, Province Of China','TW'),(496,1,'GlobalCountries','Tanzania, United Republic Of','TZ'),(497,1,'BudgetCategory','Not Specified','0'),(498,1,'BudgetCategory','Labor','1'),(499,1,'BudgetCategory','Travel','2'),(500,1,'BudgetCategory','Licensing','3'),(501,1,'BudgetCategory','Software','4'),(502,1,'BudgetCategory','Administrative','5'),(503,4,'ContactMethods','Email: Primary','email_primary'),(504,4,'ContactMethods','Phone: Primary','phone_primary');
/*!40000 ALTER TABLE `sysvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_contacts`
--

DROP TABLE IF EXISTS `task_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_contacts` (
  `task_id` int(10) NOT NULL DEFAULT 0,
  `contact_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`task_id`,`contact_id`),
  KEY `contact_id` (`contact_id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_contacts`
--

LOCK TABLES `task_contacts` WRITE;
/*!40000 ALTER TABLE `task_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_departments`
--

DROP TABLE IF EXISTS `task_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_departments` (
  `task_id` int(10) NOT NULL DEFAULT 0,
  `department_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`task_id`,`department_id`),
  KEY `department_id` (`department_id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_departments`
--

LOCK TABLES `task_departments` WRITE;
/*!40000 ALTER TABLE `task_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_dependencies`
--

DROP TABLE IF EXISTS `task_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_dependencies` (
  `dependencies_task_id` int(10) NOT NULL DEFAULT 0,
  `dependencies_req_task_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`dependencies_task_id`,`dependencies_req_task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_dependencies`
--

LOCK TABLES `task_dependencies` WRITE;
/*!40000 ALTER TABLE `task_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_log`
--

DROP TABLE IF EXISTS `task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_log` (
  `task_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_log_task` int(10) NOT NULL DEFAULT 0,
  `task_log_name` varchar(255) DEFAULT NULL,
  `task_log_description` mediumtext DEFAULT NULL,
  `task_log_creator` int(10) NOT NULL DEFAULT 0,
  `task_log_created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `task_log_updator` int(10) NOT NULL DEFAULT 0,
  `task_log_updated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `task_log_hours` float NOT NULL DEFAULT 0,
  `task_log_date` date DEFAULT NULL,
  `task_log_percent_complete` tinyint(4) NOT NULL DEFAULT 0,
  `task_log_task_end_date` datetime NOT NULL,
  `task_log_costcode` varchar(8) NOT NULL DEFAULT '',
  `task_log_problem` tinyint(1) DEFAULT 0,
  `task_log_reference` tinyint(4) DEFAULT 0,
  `task_log_related_url` varchar(255) DEFAULT NULL,
  `task_log_project` int(10) unsigned NOT NULL DEFAULT 0,
  `task_log_company` int(10) unsigned NOT NULL DEFAULT 0,
  `task_log_record_creator` int(10) unsigned NOT NULL,
  PRIMARY KEY (`task_log_id`),
  KEY `task_log_task` (`task_log_task`),
  KEY `task_log_creator` (`task_log_creator`),
  KEY `task_log_date` (`task_log_date`),
  KEY `task_log_costcode` (`task_log_costcode`),
  KEY `task_log_problem` (`task_log_problem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_log`
--

LOCK TABLES `task_log` WRITE;
/*!40000 ALTER TABLE `task_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) DEFAULT NULL,
  `task_parent` int(10) DEFAULT 0,
  `task_milestone` tinyint(1) DEFAULT 0,
  `task_project` int(10) NOT NULL DEFAULT 0,
  `task_owner` int(10) NOT NULL DEFAULT 0,
  `task_start_date` datetime DEFAULT NULL,
  `task_duration` float unsigned DEFAULT 0,
  `task_duration_type` int(10) NOT NULL DEFAULT 1,
  `task_hours_worked` float unsigned NOT NULL DEFAULT 0,
  `task_end_date` datetime DEFAULT NULL,
  `task_status` int(10) DEFAULT 0,
  `task_priority` tinyint(4) DEFAULT 0,
  `task_percent_complete` tinyint(4) DEFAULT 0,
  `task_description` mediumtext DEFAULT NULL,
  `task_target_budget` decimal(10,2) DEFAULT 0.00,
  `task_related_url` varchar(255) DEFAULT NULL,
  `task_creator` int(10) NOT NULL DEFAULT 0,
  `task_order` int(10) NOT NULL DEFAULT 0,
  `task_client_publish` tinyint(1) NOT NULL DEFAULT 0,
  `task_dynamic` tinyint(1) NOT NULL DEFAULT 0,
  `task_access` int(10) NOT NULL DEFAULT 0,
  `task_notify` int(10) NOT NULL DEFAULT 0,
  `task_departments` varchar(100) DEFAULT NULL,
  `task_contacts` varchar(100) DEFAULT NULL COMMENT 'deprecated',
  `task_custom` longtext DEFAULT NULL,
  `task_type` smallint(6) NOT NULL DEFAULT 0,
  `task_updator` int(10) NOT NULL DEFAULT 0,
  `task_created` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `task_updated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `task_dep_reset_dates` tinyint(1) DEFAULT 0,
  `task_represents_project` int(10) NOT NULL DEFAULT 0,
  `task_allow_other_user_tasklogs` int(1) NOT NULL DEFAULT 0,
  `task_sequence` int(10) NOT NULL DEFAULT 0,
  `task_path_enumeration` varchar(255) NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `idx_task1` (`task_start_date`),
  KEY `idx_task2` (`task_end_date`),
  KEY `task_name` (`task_name`),
  KEY `task_parent` (`task_parent`),
  KEY `task_project` (`task_project`),
  KEY `task_owner` (`task_owner`),
  KEY `task_start_date` (`task_start_date`),
  KEY `task_end_date` (`task_end_date`),
  KEY `task_status` (`task_status`),
  KEY `task_priority` (`task_priority`),
  KEY `task_creator` (`task_creator`),
  KEY `task_order` (`task_order`),
  KEY `task_type` (`task_type`),
  KEY `task_updator` (`task_updator`),
  KEY `task_represents_project` (`task_represents_project`),
  KEY `task_path_enumeration` (`task_path_enumeration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_critical`
--

DROP TABLE IF EXISTS `tasks_critical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_critical` (
  `task_project` int(10) DEFAULT NULL,
  `critical_task` int(10) DEFAULT NULL,
  `project_actual_end_date` datetime DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_critical`
--

LOCK TABLES `tasks_critical` WRITE;
/*!40000 ALTER TABLE `tasks_critical` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_critical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_problems`
--

DROP TABLE IF EXISTS `tasks_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_problems` (
  `task_project` int(10) DEFAULT NULL,
  `task_log_problem` tinyint(1) DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_problems`
--

LOCK TABLES `tasks_problems` WRITE;
/*!40000 ALTER TABLE `tasks_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_sum`
--

DROP TABLE IF EXISTS `tasks_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_sum` (
  `task_project` int(10) DEFAULT NULL,
  `total_tasks` int(6) DEFAULT NULL,
  `project_percent_complete` float DEFAULT NULL,
  `project_duration` float DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_sum`
--

LOCK TABLES `tasks_sum` WRITE;
/*!40000 ALTER TABLE `tasks_sum` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_summy`
--

DROP TABLE IF EXISTS `tasks_summy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_summy` (
  `task_project` int(10) DEFAULT NULL,
  `my_tasks` varchar(10) DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_summy`
--

LOCK TABLES `tasks_summy` WRITE;
/*!40000 ALTER TABLE `tasks_summy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_summy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_total`
--

DROP TABLE IF EXISTS `tasks_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_total` (
  `task_project` int(10) DEFAULT NULL,
  `total_tasks` int(10) DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_total`
--

LOCK TABLES `tasks_total` WRITE;
/*!40000 ALTER TABLE `tasks_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_users`
--

DROP TABLE IF EXISTS `tasks_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_users` (
  `task_project` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  KEY `task_project` (`task_project`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_users`
--

LOCK TABLES `tasks_users` WRITE;
/*!40000 ALTER TABLE `tasks_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_access_log`
--

DROP TABLE IF EXISTS `user_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_access_log` (
  `user_access_log_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_ip` varchar(15) NOT NULL DEFAULT '',
  `date_time_in` datetime DEFAULT '1000-01-01 00:00:00',
  `date_time_out` datetime DEFAULT '1000-01-01 00:00:00',
  `date_time_last_action` datetime DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`user_access_log_id`),
  KEY `date_time_last_action` (`date_time_last_action`),
  KEY `date_time_in` (`date_time_in`),
  KEY `date_time_out` (`date_time_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_access_log`
--

LOCK TABLES `user_access_log` WRITE;
/*!40000 ALTER TABLE `user_access_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_events`
--

DROP TABLE IF EXISTS `user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_events` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `event_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `user_id` (`user_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_events`
--

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feeds`
--

DROP TABLE IF EXISTS `user_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_feeds` (
  `feed_id` int(10) NOT NULL AUTO_INCREMENT,
  `feed_user` int(10) NOT NULL,
  `feed_token` varchar(255) NOT NULL,
  PRIMARY KEY (`feed_id`),
  KEY `feed_token` (`feed_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feeds`
--

LOCK TABLES `user_feeds` WRITE;
/*!40000 ALTER TABLE `user_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `pref_user` varchar(12) NOT NULL DEFAULT '',
  `pref_name` varchar(72) NOT NULL DEFAULT '',
  `pref_value` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`pref_user`,`pref_name`),
  KEY `pref_user_2` (`pref_user`),
  KEY `pref_user` (`pref_user`),
  KEY `pref_name` (`pref_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('0','CURRENCYFORM','en'),('0','EVENTFILTER','all'),('0','LOCALE','en'),('0','MAILALL','0'),('0','SHDATEFORMAT','%d/%m/%Y'),('0','TABVIEW','0'),('0','TASKASSIGNMAX','100'),('0','TASKLOGEMAIL','0'),('0','TASKLOGNOTE','0'),('0','TASKLOGSUBJ',''),('0','TIMEFORMAT','%I:%M %p'),('0','UISTYLE','web2project'),('0','USERFORMAT','user'),('1','CURRENCYFORM','en'),('1','EVENTFILTER','my'),('1','LOCALE','en'),('1','MAILALL','0'),('1','SHDATEFORMAT','%d/%b/%Y'),('1','TABVIEW','0'),('1','TASKASSIGNMAX','100'),('1','TASKLOGEMAIL','0'),('1','TASKLOGNOTE','0'),('1','TASKLOGSUBJ',''),('1','TIMEFORMAT','%I:%M %p'),('1','UISTYLE','web2project'),('1','USERFORMAT','user'),('0','LGDATEFORMAT','%B %d, %Y'),('1','LGDATEFORMAT','%B %d, %Y'),('0','TIMEZONE','America/New_York'),('1','TIMEZONE','America/New_York'),('0','TASKSEXPANDED','0'),('1','TASKSEXPANDED','0');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_task_pin`
--

DROP TABLE IF EXISTS `user_task_pin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_task_pin` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `task_id` int(10) NOT NULL DEFAULT 0,
  `task_pinned` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`,`task_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_task_pin`
--

LOCK TABLES `user_task_pin` WRITE;
/*!40000 ALTER TABLE `user_task_pin` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_task_pin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tasks`
--

DROP TABLE IF EXISTS `user_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tasks` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `user_type` tinyint(4) NOT NULL DEFAULT 0,
  `task_id` int(10) NOT NULL DEFAULT 0,
  `perc_assignment` int(10) NOT NULL DEFAULT 100,
  `user_task_priority` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`user_id`,`task_id`),
  KEY `index_ut_to_tasks` (`task_id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tasks`
--

LOCK TABLES `user_tasks` WRITE;
/*!40000 ALTER TABLE `user_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_contact` int(10) NOT NULL DEFAULT 0,
  `user_username` varchar(255) NOT NULL DEFAULT '',
  `user_password` varchar(255) NOT NULL DEFAULT '',
  `user_parent` int(10) NOT NULL DEFAULT 0,
  `user_type` tinyint(3) NOT NULL DEFAULT 0,
  `user_signature` mediumtext DEFAULT NULL,
  `user_empireint_special` int(1) NOT NULL DEFAULT 0,
  `user_department` int(10) unsigned NOT NULL DEFAULT 0,
  `user_company` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `user_username` (`user_username`),
  KEY `user_password` (`user_password`),
  KEY `user_parent` (`user_parent`),
  KEY `user_type` (`user_type`),
  KEY `user_company` (`user_company`),
  KEY `user_department` (`user_department`),
  KEY `user_contact` (`user_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','76a2173be6393254e72ffa4d6df1030a',0,1,'',0,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `w2pversion`
--

DROP TABLE IF EXISTS `w2pversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w2pversion` (
  `code_revision` int(10) unsigned NOT NULL DEFAULT 0,
  `code_version` varchar(10) NOT NULL DEFAULT '',
  `db_version` int(10) NOT NULL DEFAULT 0,
  `last_db_update` date NOT NULL DEFAULT '1000-01-01',
  `last_code_update` date NOT NULL DEFAULT '1000-01-01',
  PRIMARY KEY (`db_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `w2pversion`
--

LOCK TABLES `w2pversion` WRITE;
/*!40000 ALTER TABLE `w2pversion` DISABLE KEYS */;
INSERT INTO `w2pversion` VALUES (0,'1.0.0',1,'2022-02-03','2022-02-03'),(0,'',56,'2022-02-03','1000-01-01'),(0,'',57,'2022-02-03','1000-01-01'),(0,'3.4.0',58,'2022-02-03','1000-01-01');
/*!40000 ALTER TABLE `w2pversion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-03  0:36:12
