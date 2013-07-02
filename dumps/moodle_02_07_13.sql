CREATE DATABASE  IF NOT EXISTS `moodle` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `moodle`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: moodle
-- ------------------------------------------------------
-- Server version	5.1.63-0+squeeze1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign`
--

LOCK TABLES `mdl_assign` WRITE;
/*!40000 ALTER TABLE `mdl_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_grades`
--

LOCK TABLES `mdl_assign_grades` WRITE;
/*!40000 ALTER TABLE `mdl_assign_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_plugin_config`
--

LOCK TABLES `mdl_assign_plugin_config` WRITE;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_submission`
--

LOCK TABLES `mdl_assign_submission` WRITE;
/*!40000 ALTER TABLE `mdl_assign_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_flags`
--

LOCK TABLES `mdl_assign_user_flags` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assign_user_mapping`
--

LOCK TABLES `mdl_assign_user_mapping` WRITE;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assign_user_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_comments`
--

LOCK TABLES `mdl_assignfeedback_comments` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignfeedback_file`
--

LOCK TABLES `mdl_assignfeedback_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignfeedback_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment`
--

LOCK TABLES `mdl_assignment` WRITE;
/*!40000 ALTER TABLE `mdl_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignment_submissions`
--

LOCK TABLES `mdl_assignment_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_assignment_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_file`
--

LOCK TABLES `mdl_assignsubmission_file` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_assignsubmission_onlinetext`
--

LOCK TABLES `mdl_assignsubmission_onlinetext` WRITE;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_assignsubmission_onlinetext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_autoview`
--

DROP TABLE IF EXISTS `mdl_autoview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_autoview` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `configfile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `noframe` tinyint(1) NOT NULL DEFAULT '0',
  `summary` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_auto_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines autoviews';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_autoview`
--

LOCK TABLES `mdl_autoview` WRITE;
/*!40000 ALTER TABLE `mdl_autoview` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_autoview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_autoview_keys`
--

DROP TABLE IF EXISTS `mdl_autoview_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_autoview_keys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `accesskey` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines access keys for the flash streaming server';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_autoview_keys`
--

LOCK TABLES `mdl_autoview_keys` WRITE;
/*!40000 ALTER TABLE `mdl_autoview_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_autoview_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_controllers`
--

LOCK TABLES `mdl_backup_controllers` WRITE;
/*!40000 ALTER TABLE `mdl_backup_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_courses`
--

LOCK TABLES `mdl_backup_courses` WRITE;
/*!40000 ALTER TABLE `mdl_backup_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_files_template`
--

DROP TABLE IF EXISTS `mdl_backup_files_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_files_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  `newcontextid` bigint(10) DEFAULT NULL,
  `newitemid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store files along the backup process. Note this table isn';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_files_template`
--

LOCK TABLES `mdl_backup_files_template` WRITE;
/*!40000 ALTER TABLE `mdl_backup_files_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_files_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_ids_template`
--

DROP TABLE IF EXISTS `mdl_backup_ids_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_ids_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemname` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `newitemid` bigint(10) NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) DEFAULT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all sort of ids along the backup process. Note this';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_ids_template`
--

LOCK TABLES `mdl_backup_ids_template` WRITE;
/*!40000 ALTER TABLE `mdl_backup_ids_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_ids_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_backup_logs`
--

LOCK TABLES `mdl_backup_logs` WRITE;
/*!40000 ALTER TABLE `mdl_backup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_backup_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `image` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge`
--

LOCK TABLES `mdl_badge` WRITE;
/*!40000 ALTER TABLE `mdl_badge` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_backpack`
--

LOCK TABLES `mdl_badge_backpack` WRITE;
/*!40000 ALTER TABLE `mdl_badge_backpack` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_backpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria`
--

LOCK TABLES `mdl_badge_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_met`
--

LOCK TABLES `mdl_badge_criteria_met` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_met` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_criteria_param`
--

LOCK TABLES `mdl_badge_criteria_param` WRITE;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_criteria_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_external`
--

LOCK TABLES `mdl_badge_external` WRITE;
/*!40000 ALTER TABLE `mdl_badge_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_issued`
--

LOCK TABLES `mdl_badge_issued` WRITE;
/*!40000 ALTER TABLE `mdl_badge_issued` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_issued` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_badge_manual_award`
--

LOCK TABLES `mdl_badge_manual_award` WRITE;
/*!40000 ALTER TABLE `mdl_badge_manual_award` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_badge_manual_award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block`
--

LOCK TABLES `mdl_block` WRITE;
/*!40000 ALTER TABLE `mdl_block` DISABLE KEYS */;
INSERT INTO `mdl_block` VALUES (1,'activity_modules',2013050100,0,0,1),(2,'admin_bookmarks',2013050100,0,0,1),(3,'badges',2013050101,0,0,1),(4,'blog_menu',2013050100,0,0,1),(5,'blog_recent',2013050100,0,0,1),(6,'blog_tags',2013050100,0,0,1),(7,'calendar_month',2013050100,0,0,1),(8,'calendar_upcoming',2013050100,0,0,1),(9,'comments',2013050100,0,0,1),(10,'community',2013050100,0,0,1),(11,'completionstatus',2013050100,0,0,1),(12,'course_list',2013050100,0,0,1),(13,'course_overview',2013050100,0,0,1),(14,'course_summary',2013050100,0,0,1),(15,'feedback',2013050100,0,0,0),(16,'glossary_random',2013050100,0,0,1),(17,'html',2013050100,0,0,1),(18,'login',2013050100,0,0,1),(19,'mentees',2013050100,0,0,1),(20,'messages',2013050100,0,0,1),(21,'mnet_hosts',2013050100,0,0,1),(22,'myprofile',2013050100,0,0,1),(23,'navigation',2013050100,0,0,1),(24,'news_items',2013050100,0,0,1),(25,'online_users',2013050100,0,0,1),(26,'participants',2013050100,0,0,1),(27,'private_files',2013050100,0,0,1),(28,'quiz_results',2013050100,0,0,1),(29,'recent_activity',2013050100,0,0,1),(30,'rss_client',2013050100,300,0,1),(31,'search_forums',2013050100,0,0,1),(32,'section_links',2013050100,0,0,1),(33,'selfcompletion',2013050100,0,0,1),(34,'settings',2013050100,0,0,1),(35,'site_main_menu',2013050100,0,0,1),(36,'social_activities',2013050100,0,0,1),(37,'tag_flickr',2013050100,0,0,1),(38,'tag_youtube',2013050100,0,0,1),(39,'tags',2013050100,0,0,1);
/*!40000 ALTER TABLE `mdl_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_community`
--

LOCK TABLES `mdl_block_community` WRITE;
/*!40000 ALTER TABLE `mdl_block_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_instances`
--

LOCK TABLES `mdl_block_instances` WRITE;
/*!40000 ALTER TABLE `mdl_block_instances` DISABLE KEYS */;
INSERT INTO `mdl_block_instances` VALUES (1,'site_main_menu',2,0,'site-index',NULL,'side-pre',0,''),(2,'course_summary',2,0,'site-index',NULL,'side-post',0,''),(3,'calendar_month',2,0,'site-index',NULL,'side-post',1,''),(4,'navigation',1,1,'*',NULL,'side-pre',0,''),(5,'settings',1,1,'*',NULL,'side-pre',1,''),(6,'admin_bookmarks',1,0,'admin-*',NULL,'side-pre',0,''),(7,'private_files',1,0,'my-index','2','side-post',0,''),(8,'online_users',1,0,'my-index','2','side-post',1,''),(9,'course_overview',1,0,'my-index','2','content',0,''),(10,'search_forums',15,0,'course-view-*',NULL,'side-post',0,''),(11,'news_items',15,0,'course-view-*',NULL,'side-post',1,''),(12,'calendar_upcoming',15,0,'course-view-*',NULL,'side-post',2,''),(13,'recent_activity',15,0,'course-view-*',NULL,'side-post',3,'');
/*!40000 ALTER TABLE `mdl_block_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_positions`
--

LOCK TABLES `mdl_block_positions` WRITE;
/*!40000 ALTER TABLE `mdl_block_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_block_rss_client`
--

LOCK TABLES `mdl_block_rss_client` WRITE;
/*!40000 ALTER TABLE `mdl_block_rss_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_block_rss_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_association`
--

LOCK TABLES `mdl_blog_association` WRITE;
/*!40000 ALTER TABLE `mdl_blog_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_blog_external`
--

LOCK TABLES `mdl_blog_external` WRITE;
/*!40000 ALTER TABLE `mdl_blog_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_blog_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book`
--

LOCK TABLES `mdl_book` WRITE;
/*!40000 ALTER TABLE `mdl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_book_chapters`
--

LOCK TABLES `mdl_book_chapters` WRITE;
/*!40000 ALTER TABLE `mdl_book_chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_book_chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_filters`
--

LOCK TABLES `mdl_cache_filters` WRITE;
/*!40000 ALTER TABLE `mdl_cache_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cache_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_flags`
--

LOCK TABLES `mdl_cache_flags` WRITE;
/*!40000 ALTER TABLE `mdl_cache_flags` DISABLE KEYS */;
INSERT INTO `mdl_cache_flags` VALUES (1,'userpreferenceschanged','2',1372687967,'1',1372695167),(2,'accesslib/dirtycontexts','/1/3/15',1372425305,'1',1372432505);
/*!40000 ALTER TABLE `mdl_cache_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cache_text`
--

DROP TABLE IF EXISTS `mdl_cache_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cache_text`
--

LOCK TABLES `mdl_cache_text` WRITE;
/*!40000 ALTER TABLE `mdl_cache_text` DISABLE KEYS */;
INSERT INTO `mdl_cache_text` VALUES (1,'58b1923dceb565b8817a4065b258eb4b','<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n',1372686812),(2,'bfbc0774210510ca883e92d8d1ed40ab','<div class=\"text_to_html\">Тема для Академии Молодежного Лидерства</div>',1372424099),(3,'a094f0bd82cddc290e7481dc470d1e45','<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n',1372686816),(4,'534ce0e2ffd18f9b83f26267f4396fa3','<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n',1372425306),(5,'1f08b7c7d4459a5d7028adcd57f62817','<div class=\"no-overflow\"><p>Описание курса</p></div>',1372746997),(6,'7cae3b9cc9366eafc693f700995ed836','<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n',1372687967),(7,'c9da4fd327087f5bf1206348589629d0','<div class=\"no-overflow\"><p>На сайте используется два типа cookies:</p>\n\n<p>Первый тип, \"MoodleSession\", является обязательным. Вам необходимо разрешить приём cookie этого типа, чтобы непрерывно переходить со страницы на страницу, не вводя каждый раз логин и пароль. При выходе из системы или закрытии браузера такие cookies удаляются (и в браузере, и на сервере).</p>\n\n<p>Второй тип, \"MoodleID\", нужен для удобства. В cookie этого типа в браузере сохраняется информация о логине. Это значит, что когда Вы снова зайдёте на этот сайт, поле \"Логин\" уже будет заполнено. Приём cookie этого типа можно запретить, но тогда при каждом входе в систему потребуется набирать заново не только пароль, но и логин.</p>\n</div>',1372440900);
/*!40000 ALTER TABLE `mdl_cache_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_capabilities`
--

LOCK TABLES `mdl_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_capabilities` VALUES (1,'moodle/site:config','write',10,'moodle',62),(2,'moodle/site:readallmessages','read',10,'moodle',8),(3,'moodle/site:sendmessage','write',10,'moodle',16),(4,'moodle/site:approvecourse','write',10,'moodle',4),(5,'moodle/backup:backupcourse','write',50,'moodle',28),(6,'moodle/backup:backupsection','write',50,'moodle',28),(7,'moodle/backup:backupactivity','write',70,'moodle',28),(8,'moodle/backup:backuptargethub','write',50,'moodle',28),(9,'moodle/backup:backuptargetimport','write',50,'moodle',28),(10,'moodle/backup:downloadfile','write',50,'moodle',28),(11,'moodle/backup:configure','write',50,'moodle',28),(12,'moodle/backup:userinfo','read',50,'moodle',8),(13,'moodle/backup:anonymise','read',50,'moodle',8),(14,'moodle/restore:restorecourse','write',50,'moodle',28),(15,'moodle/restore:restoresection','write',50,'moodle',28),(16,'moodle/restore:restoreactivity','write',50,'moodle',28),(17,'moodle/restore:viewautomatedfilearea','write',50,'moodle',28),(18,'moodle/restore:restoretargethub','write',50,'moodle',28),(19,'moodle/restore:restoretargetimport','write',50,'moodle',28),(20,'moodle/restore:uploadfile','write',50,'moodle',28),(21,'moodle/restore:configure','write',50,'moodle',28),(22,'moodle/restore:rolldates','write',50,'moodle',0),(23,'moodle/restore:userinfo','write',50,'moodle',30),(24,'moodle/restore:createuser','write',10,'moodle',24),(25,'moodle/site:manageblocks','write',80,'moodle',20),(26,'moodle/site:accessallgroups','read',50,'moodle',0),(27,'moodle/site:viewfullnames','read',50,'moodle',0),(28,'moodle/site:viewuseridentity','read',50,'moodle',0),(29,'moodle/site:viewreports','read',50,'moodle',8),(30,'moodle/site:trustcontent','write',50,'moodle',4),(31,'moodle/site:uploadusers','write',10,'moodle',24),(32,'moodle/filter:manage','write',50,'moodle',0),(33,'moodle/user:create','write',10,'moodle',24),(34,'moodle/user:delete','write',10,'moodle',8),(35,'moodle/user:update','write',10,'moodle',24),(36,'moodle/user:viewdetails','read',50,'moodle',0),(37,'moodle/user:viewalldetails','read',30,'moodle',8),(38,'moodle/user:viewhiddendetails','read',50,'moodle',8),(39,'moodle/user:loginas','write',50,'moodle',30),(40,'moodle/user:managesyspages','write',10,'moodle',0),(41,'moodle/user:manageblocks','write',30,'moodle',0),(42,'moodle/user:manageownblocks','write',10,'moodle',0),(43,'moodle/user:manageownfiles','write',10,'moodle',0),(44,'moodle/user:ignoreuserquota','write',10,'moodle',0),(45,'moodle/my:configsyspages','write',10,'moodle',0),(46,'moodle/role:assign','write',50,'moodle',28),(47,'moodle/role:review','read',50,'moodle',8),(48,'moodle/role:override','write',50,'moodle',28),(49,'moodle/role:safeoverride','write',50,'moodle',16),(50,'moodle/role:manage','write',10,'moodle',28),(51,'moodle/role:switchroles','read',50,'moodle',12),(52,'moodle/category:manage','write',40,'moodle',4),(53,'moodle/category:viewhiddencategories','read',40,'moodle',0),(54,'moodle/cohort:manage','write',40,'moodle',0),(55,'moodle/cohort:assign','write',40,'moodle',0),(56,'moodle/cohort:view','read',50,'moodle',0),(57,'moodle/course:create','write',40,'moodle',4),(58,'moodle/course:request','write',10,'moodle',0),(59,'moodle/course:delete','write',50,'moodle',32),(60,'moodle/course:update','write',50,'moodle',4),(61,'moodle/course:view','read',50,'moodle',0),(62,'moodle/course:enrolreview','read',50,'moodle',8),(63,'moodle/course:enrolconfig','write',50,'moodle',8),(64,'moodle/course:bulkmessaging','write',50,'moodle',16),(65,'moodle/course:viewhiddenuserfields','read',50,'moodle',8),(66,'moodle/course:viewhiddencourses','read',50,'moodle',0),(67,'moodle/course:visibility','write',50,'moodle',0),(68,'moodle/course:managefiles','write',50,'moodle',4),(69,'moodle/course:ignorefilesizelimits','write',50,'moodle',0),(70,'moodle/course:manageactivities','write',70,'moodle',4),(71,'moodle/course:activityvisibility','write',70,'moodle',0),(72,'moodle/course:viewhiddenactivities','write',70,'moodle',0),(73,'moodle/course:viewparticipants','read',50,'moodle',0),(74,'moodle/course:changefullname','write',50,'moodle',4),(75,'moodle/course:changeshortname','write',50,'moodle',4),(76,'moodle/course:changeidnumber','write',50,'moodle',4),(77,'moodle/course:changecategory','write',50,'moodle',4),(78,'moodle/course:changesummary','write',50,'moodle',4),(79,'moodle/site:viewparticipants','read',10,'moodle',0),(80,'moodle/course:isincompletionreports','read',50,'moodle',0),(81,'moodle/course:viewscales','read',50,'moodle',0),(82,'moodle/course:managescales','write',50,'moodle',0),(83,'moodle/course:managegroups','write',50,'moodle',0),(84,'moodle/course:reset','write',50,'moodle',32),(85,'moodle/course:viewsuspendedusers','read',10,'moodle',0),(86,'moodle/blog:view','read',10,'moodle',0),(87,'moodle/blog:search','read',10,'moodle',0),(88,'moodle/blog:viewdrafts','read',10,'moodle',8),(89,'moodle/blog:create','write',10,'moodle',16),(90,'moodle/blog:manageentries','write',10,'moodle',16),(91,'moodle/blog:manageexternal','write',10,'moodle',16),(92,'moodle/blog:associatecourse','write',50,'moodle',0),(93,'moodle/blog:associatemodule','write',70,'moodle',0),(94,'moodle/calendar:manageownentries','write',50,'moodle',16),(95,'moodle/calendar:managegroupentries','write',50,'moodle',16),(96,'moodle/calendar:manageentries','write',50,'moodle',16),(97,'moodle/user:editprofile','write',30,'moodle',24),(98,'moodle/user:editownprofile','write',10,'moodle',16),(99,'moodle/user:changeownpassword','write',10,'moodle',0),(100,'moodle/user:readuserposts','read',30,'moodle',0),(101,'moodle/user:readuserblogs','read',30,'moodle',0),(102,'moodle/user:viewuseractivitiesreport','read',30,'moodle',8),(103,'moodle/user:editmessageprofile','write',30,'moodle',16),(104,'moodle/user:editownmessageprofile','write',10,'moodle',0),(105,'moodle/question:managecategory','write',50,'moodle',20),(106,'moodle/question:add','write',50,'moodle',20),(107,'moodle/question:editmine','write',50,'moodle',20),(108,'moodle/question:editall','write',50,'moodle',20),(109,'moodle/question:viewmine','read',50,'moodle',0),(110,'moodle/question:viewall','read',50,'moodle',0),(111,'moodle/question:usemine','read',50,'moodle',0),(112,'moodle/question:useall','read',50,'moodle',0),(113,'moodle/question:movemine','write',50,'moodle',0),(114,'moodle/question:moveall','write',50,'moodle',0),(115,'moodle/question:config','write',10,'moodle',2),(116,'moodle/question:flag','write',50,'moodle',0),(117,'moodle/site:doclinks','read',10,'moodle',0),(118,'moodle/course:sectionvisibility','write',50,'moodle',0),(119,'moodle/course:useremail','write',50,'moodle',0),(120,'moodle/course:viewhiddensections','write',50,'moodle',0),(121,'moodle/course:setcurrentsection','write',50,'moodle',0),(122,'moodle/course:movesections','write',50,'moodle',0),(123,'moodle/site:mnetlogintoremote','read',10,'moodle',0),(124,'moodle/grade:viewall','read',50,'moodle',8),(125,'moodle/grade:view','read',50,'moodle',0),(126,'moodle/grade:viewhidden','read',50,'moodle',8),(127,'moodle/grade:import','write',50,'moodle',12),(128,'moodle/grade:export','read',50,'moodle',8),(129,'moodle/grade:manage','write',50,'moodle',12),(130,'moodle/grade:edit','write',50,'moodle',12),(131,'moodle/grade:managegradingforms','write',50,'moodle',12),(132,'moodle/grade:sharegradingforms','write',10,'moodle',4),(133,'moodle/grade:managesharedforms','write',10,'moodle',4),(134,'moodle/grade:manageoutcomes','write',50,'moodle',0),(135,'moodle/grade:manageletters','write',50,'moodle',0),(136,'moodle/grade:hide','write',50,'moodle',0),(137,'moodle/grade:lock','write',50,'moodle',0),(138,'moodle/grade:unlock','write',50,'moodle',0),(139,'moodle/my:manageblocks','write',10,'moodle',0),(140,'moodle/notes:view','read',50,'moodle',0),(141,'moodle/notes:manage','write',50,'moodle',16),(142,'moodle/tag:manage','write',10,'moodle',16),(143,'moodle/tag:create','write',10,'moodle',16),(144,'moodle/tag:edit','write',10,'moodle',16),(145,'moodle/tag:flag','write',10,'moodle',16),(146,'moodle/tag:editblocks','write',10,'moodle',0),(147,'moodle/block:view','read',80,'moodle',0),(148,'moodle/block:edit','write',80,'moodle',20),(149,'moodle/portfolio:export','read',10,'moodle',0),(150,'moodle/comment:view','read',50,'moodle',0),(151,'moodle/comment:post','write',50,'moodle',24),(152,'moodle/comment:delete','write',50,'moodle',32),(153,'moodle/webservice:createtoken','write',10,'moodle',62),(154,'moodle/webservice:createmobiletoken','write',10,'moodle',24),(155,'moodle/rating:view','read',50,'moodle',0),(156,'moodle/rating:viewany','read',50,'moodle',8),(157,'moodle/rating:viewall','read',50,'moodle',8),(158,'moodle/rating:rate','write',50,'moodle',0),(159,'moodle/course:publish','write',10,'moodle',24),(160,'moodle/course:markcomplete','write',50,'moodle',0),(161,'moodle/community:add','write',10,'moodle',0),(162,'moodle/community:download','write',10,'moodle',0),(163,'moodle/badges:manageglobalsettings','write',10,'moodle',34),(164,'moodle/badges:viewbadges','read',50,'moodle',0),(165,'moodle/badges:manageownbadges','write',30,'moodle',0),(166,'moodle/badges:viewotherbadges','read',30,'moodle',0),(167,'moodle/badges:earnbadge','write',50,'moodle',0),(168,'moodle/badges:createbadge','write',50,'moodle',16),(169,'moodle/badges:deletebadge','write',50,'moodle',32),(170,'moodle/badges:configuredetails','write',50,'moodle',16),(171,'moodle/badges:configurecriteria','write',50,'moodle',0),(172,'moodle/badges:configuremessages','write',50,'moodle',16),(173,'moodle/badges:awardbadge','write',50,'moodle',16),(174,'moodle/badges:viewawarded','read',50,'moodle',8),(175,'mod/assign:view','read',70,'mod_assign',0),(176,'mod/assign:submit','write',70,'mod_assign',0),(177,'mod/assign:grade','write',70,'mod_assign',4),(178,'mod/assign:exportownsubmission','read',70,'mod_assign',0),(179,'mod/assign:addinstance','write',50,'mod_assign',4),(180,'mod/assign:grantextension','write',70,'mod_assign',0),(181,'mod/assign:revealidentities','write',70,'mod_assign',0),(182,'mod/assignment:view','read',70,'mod_assignment',0),(183,'mod/assignment:addinstance','write',50,'mod_assignment',4),(184,'mod/assignment:submit','write',70,'mod_assignment',0),(185,'mod/assignment:grade','write',70,'mod_assignment',4),(186,'mod/assignment:exportownsubmission','read',70,'mod_assignment',0),(187,'mod/book:addinstance','write',50,'mod_book',4),(188,'mod/book:read','read',70,'mod_book',0),(189,'mod/book:viewhiddenchapters','read',70,'mod_book',0),(190,'mod/book:edit','write',70,'mod_book',4),(191,'mod/chat:addinstance','write',50,'mod_chat',4),(192,'mod/chat:chat','write',70,'mod_chat',16),(193,'mod/chat:readlog','read',70,'mod_chat',0),(194,'mod/chat:deletelog','write',70,'mod_chat',0),(195,'mod/chat:exportparticipatedsession','read',70,'mod_chat',8),(196,'mod/chat:exportsession','read',70,'mod_chat',8),(197,'mod/choice:addinstance','write',50,'mod_choice',4),(198,'mod/choice:choose','write',70,'mod_choice',0),(199,'mod/choice:readresponses','read',70,'mod_choice',0),(200,'mod/choice:deleteresponses','write',70,'mod_choice',0),(201,'mod/choice:downloadresponses','read',70,'mod_choice',0),(202,'mod/data:addinstance','write',50,'mod_data',4),(203,'mod/data:viewentry','read',70,'mod_data',0),(204,'mod/data:writeentry','write',70,'mod_data',16),(205,'mod/data:comment','write',70,'mod_data',16),(206,'mod/data:rate','write',70,'mod_data',0),(207,'mod/data:viewrating','read',70,'mod_data',0),(208,'mod/data:viewanyrating','read',70,'mod_data',8),(209,'mod/data:viewallratings','read',70,'mod_data',8),(210,'mod/data:approve','write',70,'mod_data',16),(211,'mod/data:manageentries','write',70,'mod_data',16),(212,'mod/data:managecomments','write',70,'mod_data',16),(213,'mod/data:managetemplates','write',70,'mod_data',20),(214,'mod/data:viewalluserpresets','read',70,'mod_data',0),(215,'mod/data:manageuserpresets','write',70,'mod_data',20),(216,'mod/data:exportentry','read',70,'mod_data',8),(217,'mod/data:exportownentry','read',70,'mod_data',0),(218,'mod/data:exportallentries','read',70,'mod_data',8),(219,'mod/data:exportuserinfo','read',70,'mod_data',8),(220,'mod/feedback:addinstance','write',50,'mod_feedback',4),(221,'mod/feedback:view','read',70,'mod_feedback',0),(222,'mod/feedback:complete','write',70,'mod_feedback',16),(223,'mod/feedback:viewanalysepage','read',70,'mod_feedback',8),(224,'mod/feedback:deletesubmissions','write',70,'mod_feedback',0),(225,'mod/feedback:mapcourse','write',70,'mod_feedback',0),(226,'mod/feedback:edititems','write',70,'mod_feedback',20),(227,'mod/feedback:createprivatetemplate','write',70,'mod_feedback',16),(228,'mod/feedback:createpublictemplate','write',70,'mod_feedback',16),(229,'mod/feedback:deletetemplate','write',70,'mod_feedback',0),(230,'mod/feedback:viewreports','read',70,'mod_feedback',8),(231,'mod/feedback:receivemail','read',70,'mod_feedback',8),(232,'mod/folder:addinstance','write',50,'mod_folder',4),(233,'mod/folder:view','read',70,'mod_folder',0),(234,'mod/folder:managefiles','write',70,'mod_folder',16),(235,'mod/forum:addinstance','write',50,'mod_forum',4),(236,'mod/forum:viewdiscussion','read',70,'mod_forum',0),(237,'mod/forum:viewhiddentimedposts','read',70,'mod_forum',0),(238,'mod/forum:startdiscussion','write',70,'mod_forum',16),(239,'mod/forum:replypost','write',70,'mod_forum',16),(240,'mod/forum:addnews','write',70,'mod_forum',16),(241,'mod/forum:replynews','write',70,'mod_forum',16),(242,'mod/forum:viewrating','read',70,'mod_forum',0),(243,'mod/forum:viewanyrating','read',70,'mod_forum',8),(244,'mod/forum:viewallratings','read',70,'mod_forum',8),(245,'mod/forum:rate','write',70,'mod_forum',0),(246,'mod/forum:createattachment','write',70,'mod_forum',16),(247,'mod/forum:deleteownpost','read',70,'mod_forum',0),(248,'mod/forum:deleteanypost','read',70,'mod_forum',0),(249,'mod/forum:splitdiscussions','read',70,'mod_forum',0),(250,'mod/forum:movediscussions','read',70,'mod_forum',0),(251,'mod/forum:editanypost','write',70,'mod_forum',16),(252,'mod/forum:viewqandawithoutposting','read',70,'mod_forum',0),(253,'mod/forum:viewsubscribers','read',70,'mod_forum',0),(254,'mod/forum:managesubscriptions','read',70,'mod_forum',16),(255,'mod/forum:postwithoutthrottling','write',70,'mod_forum',16),(256,'mod/forum:exportdiscussion','read',70,'mod_forum',8),(257,'mod/forum:exportpost','read',70,'mod_forum',8),(258,'mod/forum:exportownpost','read',70,'mod_forum',8),(259,'mod/forum:addquestion','write',70,'mod_forum',16),(260,'mod/forum:allowforcesubscribe','read',70,'mod_forum',0),(261,'mod/glossary:addinstance','write',50,'mod_glossary',4),(262,'mod/glossary:view','read',70,'mod_glossary',0),(263,'mod/glossary:write','write',70,'mod_glossary',16),(264,'mod/glossary:manageentries','write',70,'mod_glossary',16),(265,'mod/glossary:managecategories','write',70,'mod_glossary',16),(266,'mod/glossary:comment','write',70,'mod_glossary',16),(267,'mod/glossary:managecomments','write',70,'mod_glossary',16),(268,'mod/glossary:import','write',70,'mod_glossary',16),(269,'mod/glossary:export','read',70,'mod_glossary',0),(270,'mod/glossary:approve','write',70,'mod_glossary',16),(271,'mod/glossary:rate','write',70,'mod_glossary',0),(272,'mod/glossary:viewrating','read',70,'mod_glossary',0),(273,'mod/glossary:viewanyrating','read',70,'mod_glossary',8),(274,'mod/glossary:viewallratings','read',70,'mod_glossary',8),(275,'mod/glossary:exportentry','read',70,'mod_glossary',8),(276,'mod/glossary:exportownentry','read',70,'mod_glossary',0),(277,'mod/imscp:view','read',70,'mod_imscp',0),(278,'mod/imscp:addinstance','write',50,'mod_imscp',4),(279,'mod/label:addinstance','write',50,'mod_label',4),(280,'mod/lesson:addinstance','write',50,'mod_lesson',4),(281,'mod/lesson:edit','write',70,'mod_lesson',4),(282,'mod/lesson:manage','write',70,'mod_lesson',0),(283,'mod/lti:view','read',70,'mod_lti',0),(284,'mod/lti:addinstance','write',50,'mod_lti',4),(285,'mod/lti:grade','write',70,'mod_lti',4),(286,'mod/lti:manage','write',70,'mod_lti',4),(287,'mod/lti:addcoursetool','write',50,'mod_lti',0),(288,'mod/lti:requesttooladd','write',50,'mod_lti',0),(289,'mod/page:view','read',70,'mod_page',0),(290,'mod/page:addinstance','write',50,'mod_page',4),(291,'mod/quiz:view','read',70,'mod_quiz',0),(292,'mod/quiz:addinstance','write',50,'mod_quiz',4),(293,'mod/quiz:attempt','write',70,'mod_quiz',16),(294,'mod/quiz:reviewmyattempts','read',70,'mod_quiz',0),(295,'mod/quiz:manage','write',70,'mod_quiz',16),(296,'mod/quiz:manageoverrides','write',70,'mod_quiz',0),(297,'mod/quiz:preview','write',70,'mod_quiz',0),(298,'mod/quiz:grade','write',70,'mod_quiz',16),(299,'mod/quiz:regrade','write',70,'mod_quiz',16),(300,'mod/quiz:viewreports','read',70,'mod_quiz',8),(301,'mod/quiz:deleteattempts','write',70,'mod_quiz',32),(302,'mod/quiz:ignoretimelimits','read',70,'mod_quiz',0),(303,'mod/quiz:emailconfirmsubmission','read',70,'mod_quiz',0),(304,'mod/quiz:emailnotifysubmission','read',70,'mod_quiz',0),(305,'mod/quiz:emailwarnoverdue','read',70,'mod_quiz',0),(306,'mod/resource:view','read',70,'mod_resource',0),(307,'mod/resource:addinstance','write',50,'mod_resource',4),(308,'mod/scorm:addinstance','write',50,'mod_scorm',4),(309,'mod/scorm:viewreport','read',70,'mod_scorm',0),(310,'mod/scorm:skipview','write',70,'mod_scorm',0),(311,'mod/scorm:savetrack','write',70,'mod_scorm',0),(312,'mod/scorm:viewscores','read',70,'mod_scorm',0),(313,'mod/scorm:deleteresponses','read',70,'mod_scorm',0),(314,'mod/scorm:deleteownresponses','write',70,'mod_scorm',0),(315,'mod/survey:addinstance','write',50,'mod_survey',4),(316,'mod/survey:participate','read',70,'mod_survey',0),(317,'mod/survey:readresponses','read',70,'mod_survey',0),(318,'mod/survey:download','read',70,'mod_survey',0),(319,'mod/url:view','read',70,'mod_url',0),(320,'mod/url:addinstance','write',50,'mod_url',4),(321,'mod/wiki:addinstance','write',50,'mod_wiki',4),(322,'mod/wiki:viewpage','read',70,'mod_wiki',0),(323,'mod/wiki:editpage','write',70,'mod_wiki',16),(324,'mod/wiki:createpage','write',70,'mod_wiki',16),(325,'mod/wiki:viewcomment','read',70,'mod_wiki',0),(326,'mod/wiki:editcomment','write',70,'mod_wiki',16),(327,'mod/wiki:managecomment','write',70,'mod_wiki',0),(328,'mod/wiki:managefiles','write',70,'mod_wiki',0),(329,'mod/wiki:overridelock','write',70,'mod_wiki',0),(330,'mod/wiki:managewiki','write',70,'mod_wiki',0),(331,'mod/workshop:view','read',70,'mod_workshop',0),(332,'mod/workshop:addinstance','write',50,'mod_workshop',4),(333,'mod/workshop:switchphase','write',70,'mod_workshop',0),(334,'mod/workshop:editdimensions','write',70,'mod_workshop',4),(335,'mod/workshop:submit','write',70,'mod_workshop',0),(336,'mod/workshop:peerassess','write',70,'mod_workshop',0),(337,'mod/workshop:manageexamples','write',70,'mod_workshop',0),(338,'mod/workshop:allocate','write',70,'mod_workshop',0),(339,'mod/workshop:publishsubmissions','write',70,'mod_workshop',0),(340,'mod/workshop:viewauthornames','read',70,'mod_workshop',0),(341,'mod/workshop:viewreviewernames','read',70,'mod_workshop',0),(342,'mod/workshop:viewallsubmissions','read',70,'mod_workshop',0),(343,'mod/workshop:viewpublishedsubmissions','read',70,'mod_workshop',0),(344,'mod/workshop:viewauthorpublished','read',70,'mod_workshop',0),(345,'mod/workshop:viewallassessments','read',70,'mod_workshop',0),(346,'mod/workshop:overridegrades','write',70,'mod_workshop',0),(347,'mod/workshop:ignoredeadlines','write',70,'mod_workshop',0),(348,'enrol/authorize:config','write',50,'enrol_authorize',0),(349,'enrol/authorize:manage','write',50,'enrol_authorize',0),(350,'enrol/authorize:unenrol','write',50,'enrol_authorize',0),(351,'enrol/authorize:unenrolself','write',50,'enrol_authorize',0),(352,'enrol/authorize:managepayments','write',10,'enrol_authorize',8),(353,'enrol/authorize:uploadcsv','write',10,'enrol_authorize',4),(354,'enrol/category:synchronised','write',10,'enrol_category',0),(355,'enrol/cohort:config','write',50,'enrol_cohort',0),(356,'enrol/cohort:unenrol','write',50,'enrol_cohort',0),(357,'enrol/database:unenrol','write',50,'enrol_database',0),(358,'enrol/flatfile:manage','write',50,'enrol_flatfile',0),(359,'enrol/flatfile:unenrol','write',50,'enrol_flatfile',0),(360,'enrol/guest:config','write',50,'enrol_guest',0),(361,'enrol/ldap:manage','write',50,'enrol_ldap',0),(362,'enrol/manual:config','write',50,'enrol_manual',0),(363,'enrol/manual:enrol','write',50,'enrol_manual',0),(364,'enrol/manual:manage','write',50,'enrol_manual',0),(365,'enrol/manual:unenrol','write',50,'enrol_manual',0),(366,'enrol/manual:unenrolself','write',50,'enrol_manual',0),(367,'enrol/meta:config','write',50,'enrol_meta',0),(368,'enrol/meta:selectaslinked','read',50,'enrol_meta',0),(369,'enrol/meta:unenrol','write',50,'enrol_meta',0),(370,'enrol/paypal:config','write',50,'enrol_paypal',0),(371,'enrol/paypal:manage','write',50,'enrol_paypal',0),(372,'enrol/paypal:unenrol','write',50,'enrol_paypal',0),(373,'enrol/paypal:unenrolself','write',50,'enrol_paypal',0),(374,'enrol/self:config','write',50,'enrol_self',0),(375,'enrol/self:manage','write',50,'enrol_self',0),(376,'enrol/self:unenrolself','write',50,'enrol_self',0),(377,'enrol/self:unenrol','write',50,'enrol_self',0),(378,'block/activity_modules:addinstance','write',80,'block_activity_modules',20),(379,'block/admin_bookmarks:myaddinstance','write',10,'block_admin_bookmarks',0),(380,'block/admin_bookmarks:addinstance','write',80,'block_admin_bookmarks',20),(381,'block/badges:addinstance','read',80,'block_badges',0),(382,'block/badges:myaddinstance','read',10,'block_badges',8),(383,'block/blog_menu:addinstance','write',80,'block_blog_menu',20),(384,'block/blog_recent:addinstance','write',80,'block_blog_recent',20),(385,'block/blog_tags:addinstance','write',80,'block_blog_tags',20),(386,'block/calendar_month:myaddinstance','write',10,'block_calendar_month',0),(387,'block/calendar_month:addinstance','write',80,'block_calendar_month',20),(388,'block/calendar_upcoming:myaddinstance','write',10,'block_calendar_upcoming',0),(389,'block/calendar_upcoming:addinstance','write',80,'block_calendar_upcoming',20),(390,'block/comments:myaddinstance','write',10,'block_comments',0),(391,'block/comments:addinstance','write',80,'block_comments',20),(392,'block/community:myaddinstance','write',10,'block_community',0),(393,'block/community:addinstance','write',80,'block_community',20),(394,'block/completionstatus:addinstance','write',80,'block_completionstatus',20),(395,'block/course_list:myaddinstance','write',10,'block_course_list',0),(396,'block/course_list:addinstance','write',80,'block_course_list',20),(397,'block/course_overview:myaddinstance','write',10,'block_course_overview',0),(398,'block/course_summary:addinstance','write',80,'block_course_summary',20),(399,'block/feedback:addinstance','write',80,'block_feedback',20),(400,'block/glossary_random:myaddinstance','write',10,'block_glossary_random',0),(401,'block/glossary_random:addinstance','write',80,'block_glossary_random',20),(402,'block/html:myaddinstance','write',10,'block_html',0),(403,'block/html:addinstance','write',80,'block_html',20),(404,'block/login:addinstance','write',80,'block_login',20),(405,'block/mentees:myaddinstance','write',10,'block_mentees',0),(406,'block/mentees:addinstance','write',80,'block_mentees',20),(407,'block/messages:myaddinstance','write',10,'block_messages',0),(408,'block/messages:addinstance','write',80,'block_messages',20),(409,'block/mnet_hosts:myaddinstance','write',10,'block_mnet_hosts',0),(410,'block/mnet_hosts:addinstance','write',80,'block_mnet_hosts',20),(411,'block/myprofile:myaddinstance','write',10,'block_myprofile',0),(412,'block/myprofile:addinstance','write',80,'block_myprofile',20),(413,'block/navigation:myaddinstance','write',10,'block_navigation',0),(414,'block/navigation:addinstance','write',80,'block_navigation',20),(415,'block/news_items:myaddinstance','write',10,'block_news_items',0),(416,'block/news_items:addinstance','write',80,'block_news_items',20),(417,'block/online_users:myaddinstance','write',10,'block_online_users',0),(418,'block/online_users:addinstance','write',80,'block_online_users',20),(419,'block/online_users:viewlist','read',80,'block_online_users',0),(420,'block/participants:addinstance','write',80,'block_participants',20),(421,'block/private_files:myaddinstance','write',10,'block_private_files',0),(422,'block/private_files:addinstance','write',80,'block_private_files',20),(423,'block/quiz_results:addinstance','write',80,'block_quiz_results',20),(424,'block/recent_activity:addinstance','write',80,'block_recent_activity',20),(425,'block/rss_client:myaddinstance','write',10,'block_rss_client',0),(426,'block/rss_client:addinstance','write',80,'block_rss_client',20),(427,'block/rss_client:manageownfeeds','write',80,'block_rss_client',0),(428,'block/rss_client:manageanyfeeds','write',80,'block_rss_client',16),(429,'block/search_forums:addinstance','write',80,'block_search_forums',20),(430,'block/section_links:addinstance','write',80,'block_section_links',20),(431,'block/selfcompletion:addinstance','write',80,'block_selfcompletion',20),(432,'block/settings:myaddinstance','write',10,'block_settings',0),(433,'block/settings:addinstance','write',80,'block_settings',20),(434,'block/site_main_menu:addinstance','write',80,'block_site_main_menu',20),(435,'block/social_activities:addinstance','write',80,'block_social_activities',20),(436,'block/tag_flickr:addinstance','write',80,'block_tag_flickr',20),(437,'block/tag_youtube:addinstance','write',80,'block_tag_youtube',20),(438,'block/tags:myaddinstance','write',10,'block_tags',0),(439,'block/tags:addinstance','write',80,'block_tags',20),(440,'report/completion:view','read',50,'report_completion',8),(441,'report/courseoverview:view','read',10,'report_courseoverview',8),(442,'report/log:view','read',50,'report_log',8),(443,'report/log:viewtoday','read',50,'report_log',8),(444,'report/loglive:view','read',50,'report_loglive',8),(445,'report/outline:view','read',50,'report_outline',8),(446,'report/participation:view','read',50,'report_participation',8),(447,'report/performance:view','read',10,'report_performance',2),(448,'report/progress:view','read',50,'report_progress',8),(449,'report/questioninstances:view','read',10,'report_questioninstances',0),(450,'report/security:view','read',10,'report_security',2),(451,'report/stats:view','read',50,'report_stats',8),(452,'gradeexport/ods:view','read',50,'gradeexport_ods',8),(453,'gradeexport/ods:publish','read',50,'gradeexport_ods',8),(454,'gradeexport/txt:view','read',50,'gradeexport_txt',8),(455,'gradeexport/txt:publish','read',50,'gradeexport_txt',8),(456,'gradeexport/xls:view','read',50,'gradeexport_xls',8),(457,'gradeexport/xls:publish','read',50,'gradeexport_xls',8),(458,'gradeexport/xml:view','read',50,'gradeexport_xml',8),(459,'gradeexport/xml:publish','read',50,'gradeexport_xml',8),(460,'gradeimport/csv:view','write',50,'gradeimport_csv',0),(461,'gradeimport/xml:view','write',50,'gradeimport_xml',0),(462,'gradeimport/xml:publish','write',50,'gradeimport_xml',0),(463,'gradereport/grader:view','read',50,'gradereport_grader',8),(464,'gradereport/outcomes:view','read',50,'gradereport_outcomes',8),(465,'gradereport/overview:view','read',50,'gradereport_overview',8),(466,'gradereport/user:view','read',50,'gradereport_user',8),(467,'webservice/amf:use','read',50,'webservice_amf',62),(468,'webservice/rest:use','read',50,'webservice_rest',62),(469,'webservice/soap:use','read',50,'webservice_soap',62),(470,'webservice/xmlrpc:use','read',50,'webservice_xmlrpc',62),(471,'repository/alfresco:view','read',70,'repository_alfresco',0),(472,'repository/boxnet:view','read',70,'repository_boxnet',0),(473,'repository/coursefiles:view','read',70,'repository_coursefiles',0),(474,'repository/dropbox:view','read',70,'repository_dropbox',0),(475,'repository/equella:view','read',70,'repository_equella',0),(476,'repository/filesystem:view','read',70,'repository_filesystem',0),(477,'repository/flickr:view','read',70,'repository_flickr',0),(478,'repository/flickr_public:view','read',70,'repository_flickr_public',0),(479,'repository/googledocs:view','read',70,'repository_googledocs',0),(480,'repository/local:view','read',70,'repository_local',0),(481,'repository/merlot:view','read',70,'repository_merlot',0),(482,'repository/picasa:view','read',70,'repository_picasa',0),(483,'repository/recent:view','read',70,'repository_recent',0),(484,'repository/s3:view','read',70,'repository_s3',0),(485,'repository/upload:view','read',70,'repository_upload',0),(486,'repository/url:view','read',70,'repository_url',0),(487,'repository/user:view','read',70,'repository_user',0),(488,'repository/webdav:view','read',70,'repository_webdav',0),(489,'repository/wikimedia:view','read',70,'repository_wikimedia',0),(490,'repository/youtube:view','read',70,'repository_youtube',0),(491,'tool/customlang:view','read',10,'tool_customlang',2),(492,'tool/customlang:edit','write',10,'tool_customlang',6),(493,'booktool/exportimscp:export','read',70,'booktool_exportimscp',0),(494,'booktool/importhtml:import','write',70,'booktool_importhtml',4),(495,'booktool/print:print','read',70,'booktool_print',0),(496,'quiz/grading:viewstudentnames','read',70,'quiz_grading',0),(497,'quiz/grading:viewidnumber','read',70,'quiz_grading',0),(498,'quiz/statistics:view','read',70,'quiz_statistics',0),(499,'enrol/payanyway:config','write',50,'enrol_payanyway',0),(500,'enrol/payanyway:manage','write',50,'enrol_payanyway',0),(501,'enrol/payanyway:unenrol','write',50,'enrol_payanyway',0),(502,'enrol/payanyway:unenrolself','write',50,'enrol_payanyway',0),(503,'mod/autoview:canedit','write',70,'mod_autoview',0),(504,'mod/autoview:canrecordflash','write',70,'mod_autoview',0),(505,'mod/autoview:canbroadcastflash','write',70,'mod_autoview',0),(506,'mod/autoview:canconvertdocument','write',70,'mod_autoview',0),(507,'mod/autoview:viewpresentation','read',70,'mod_autoview',0),(508,'repository/coursefilearea:view','read',70,'repository_coursefilearea',0),(509,'block/repo_filemanager:addinstance','write',80,'repository_repo_filemanager',0);
/*!40000 ALTER TABLE `mdl_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat`
--

LOCK TABLES `mdl_chat` WRITE;
/*!40000 ALTER TABLE `mdl_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages`
--

LOCK TABLES `mdl_chat_messages` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_messages_current`
--

LOCK TABLES `mdl_chat_messages_current` WRITE;
/*!40000 ALTER TABLE `mdl_chat_messages_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_messages_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_chat_users`
--

LOCK TABLES `mdl_chat_users` WRITE;
/*!40000 ALTER TABLE `mdl_chat_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_chat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice`
--

LOCK TABLES `mdl_choice` WRITE;
/*!40000 ALTER TABLE `mdl_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_answers`
--

LOCK TABLES `mdl_choice_answers` WRITE;
/*!40000 ALTER TABLE `mdl_choice_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_choice_options`
--

LOCK TABLES `mdl_choice_options` WRITE;
/*!40000 ALTER TABLE `mdl_choice_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_choice_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort`
--

LOCK TABLES `mdl_cohort` WRITE;
/*!40000 ALTER TABLE `mdl_cohort` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_cohort_members`
--

LOCK TABLES `mdl_cohort_members` WRITE;
/*!40000 ALTER TABLE `mdl_cohort_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_cohort_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_comments`
--

LOCK TABLES `mdl_comments` WRITE;
/*!40000 ALTER TABLE `mdl_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config`
--

LOCK TABLES `mdl_config` WRITE;
/*!40000 ALTER TABLE `mdl_config` DISABLE KEYS */;
INSERT INTO `mdl_config` VALUES (2,'rolesactive','1'),(3,'auth','email'),(4,'auth_pop3mailbox','INBOX'),(5,'enrol_plugins_enabled','manual,guest,self,cohort'),(6,'theme','academy'),(7,'filter_multilang_converted','1'),(8,'siteidentifier','pjNuOXL4szYxdPyeaLJcDODqWjHSAll6localhost.com'),(9,'backup_version','2008111700'),(10,'backup_release','2.0 dev'),(11,'mnet_dispatcher_mode','off'),(12,'sessiontimeout','7200'),(13,'stringfilters',''),(14,'filterall','0'),(15,'texteditors','tinymce,textarea'),(16,'mnet_localhost_id','1'),(17,'mnet_all_hosts_id','2'),(18,'siteguest','1'),(19,'siteadmins','2'),(20,'themerev','1372423809'),(21,'jsrev','1372423808'),(22,'gdversion','2'),(23,'licenses','unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),(24,'version','2013051400.08'),(25,'enableoutcomes','0'),(26,'usecomments','1'),(27,'usetags','1'),(28,'enablenotes','1'),(29,'enableportfolios','0'),(30,'enablewebservices','0'),(31,'messaging','1'),(32,'messaginghidereadnotifications','0'),(33,'messagingdeletereadnotificationsdelay','604800'),(34,'messagingallowemailoverride','0'),(35,'enablestats','0'),(36,'enablerssfeeds','0'),(37,'enableblogs','1'),(38,'enablecompletion','0'),(39,'enableavailability','0'),(40,'enableplagiarism','0'),(41,'enablebadges','1'),(42,'autologinguests','0'),(43,'hiddenuserfields',''),(44,'showuseridentity','email'),(45,'maxusersperpage','100'),(46,'enablegravatar','0'),(47,'gravatardefaulturl','mm'),(48,'enablecourserequests','0'),(49,'defaultrequestcategory','1'),(50,'requestcategoryselection','0'),(51,'courserequestnotify',''),(52,'grade_profilereport','user'),(53,'grade_aggregationposition','1'),(54,'grade_includescalesinaggregation','1'),(55,'grade_hiddenasdate','0'),(56,'gradepublishing','0'),(57,'grade_export_displaytype','1'),(58,'grade_export_decimalpoints','2'),(59,'grade_navmethod','0'),(60,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email'),(61,'grade_export_customprofilefields',''),(62,'recovergradesdefault','0'),(63,'gradeexport',''),(64,'unlimitedgrades','0'),(65,'grade_hideforcedsettings','1'),(66,'grade_aggregation','11'),(67,'grade_aggregation_flag','0'),(68,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13'),(69,'grade_aggregateonlygraded','1'),(70,'grade_aggregateonlygraded_flag','2'),(71,'grade_aggregateoutcomes','0'),(72,'grade_aggregateoutcomes_flag','2'),(73,'grade_aggregatesubcats','0'),(74,'grade_aggregatesubcats_flag','2'),(75,'grade_keephigh','0'),(76,'grade_keephigh_flag','3'),(77,'grade_droplow','0'),(78,'grade_droplow_flag','2'),(79,'grade_displaytype','1'),(80,'grade_decimalpoints','2'),(81,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),(82,'grade_report_studentsperpage','100'),(83,'grade_report_showonlyactiveenrol','1'),(84,'grade_report_quickgrading','1'),(85,'grade_report_showquickfeedback','0'),(86,'grade_report_fixedstudents','0'),(87,'grade_report_meanselection','1'),(88,'grade_report_enableajax','0'),(89,'grade_report_showcalculations','0'),(90,'grade_report_showeyecons','0'),(91,'grade_report_showaverages','1'),(92,'grade_report_showlocks','0'),(93,'grade_report_showranges','0'),(94,'grade_report_showanalysisicon','1'),(95,'grade_report_showuserimage','1'),(96,'grade_report_showactivityicons','1'),(97,'grade_report_shownumberofgrades','0'),(98,'grade_report_averagesdisplaytype','inherit'),(99,'grade_report_rangesdisplaytype','inherit'),(100,'grade_report_averagesdecimalpoints','inherit'),(101,'grade_report_rangesdecimalpoints','inherit'),(102,'grade_report_overview_showrank','0'),(103,'grade_report_overview_showtotalsifcontainhidden','0'),(104,'grade_report_user_showrank','0'),(105,'grade_report_user_showpercentage','1'),(106,'grade_report_user_showgrade','1'),(107,'grade_report_user_showfeedback','1'),(108,'grade_report_user_showrange','1'),(109,'grade_report_user_showweight','0'),(110,'grade_report_user_showaverage','0'),(111,'grade_report_user_showlettergrade','0'),(112,'grade_report_user_rangedecimals','0'),(113,'grade_report_user_showhiddenitems','1'),(114,'grade_report_user_showtotalsifcontainhidden','0'),(115,'badges_defaultissuername',''),(116,'badges_defaultissuercontact',''),(117,'badges_badgesalt','badges1372420970'),(118,'badges_allowexternalbackpack','1'),(119,'badges_allowcoursebadges','1'),(120,'timezone','99'),(121,'forcetimezone','99'),(122,'country','0'),(123,'defaultcity',''),(124,'geoipfile','/home/user/Загрузки/new/geoip/GeoLiteCity.dat'),(125,'googlemapkey3',''),(126,'allcountrycodes',''),(127,'autolang','1'),(128,'lang','ru'),(129,'langmenu','1'),(130,'langlist',''),(131,'langrev','1372423809'),(132,'langcache','1'),(133,'langstringcache','1'),(134,'locale',''),(135,'latinexcelexport','0'),(136,'block_course_list_adminview','all'),(137,'block_course_list_hideallcourseslink','0'),(138,'block_html_allowcssclasses','0'),(139,'block_online_users_timetosee','5'),(140,'block_rss_client_num_entries','5'),(141,'block_rss_client_timeout','30'),(142,'block_tags_showcoursetags','0'),(144,'authpreventaccountcreation','0'),(145,'loginpageautofocus','0'),(146,'guestloginbutton','1'),(147,'alternateloginurl',''),(148,'forgottenpasswordurl',''),(149,'auth_instructions',''),(150,'allowemailaddresses',''),(151,'denyemailaddresses',''),(152,'verifychangedemail','1'),(153,'recaptchapublickey',''),(154,'recaptchaprivatekey',''),(155,'sitedefaultlicense','allrightsreserved'),(156,'cachetext','60'),(157,'filteruploadedfiles','0'),(158,'filtermatchoneperpage','0'),(159,'filtermatchonepertext','0'),(160,'filter_multilang_force_old','0'),(161,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),(162,'filter_tex_latexbackground','#FFFFFF'),(163,'filter_tex_density','120'),(164,'filter_tex_pathlatex','/usr/bin/latex'),(165,'filter_tex_pathdvips','/usr/bin/dvips'),(166,'filter_tex_pathconvert','/usr/bin/convert'),(167,'filter_tex_convertformat','gif'),(168,'filter_censor_badwords',''),(169,'portfolio_moderate_filesize_threshold','1048576'),(170,'portfolio_high_filesize_threshold','5242880'),(171,'portfolio_moderate_db_threshold','20'),(172,'portfolio_high_db_threshold','50'),(173,'repositorycacheexpire','120'),(174,'repositoryallowexternallinks','1'),(175,'legacyfilesinnewcourses','0'),(176,'mobilecssurl',''),(177,'enablewsdocumentation','0'),(178,'allowbeforeblock','0'),(179,'allowedip',''),(180,'blockedip',''),(181,'protectusernames','1'),(182,'forcelogin','0'),(183,'forceloginforprofiles','1'),(184,'forceloginforprofileimage','0'),(185,'opentogoogle','0'),(186,'maxbytes','0'),(187,'userquota','104857600'),(188,'allowobjectembed','0'),(189,'enabletrusttext','0'),(190,'maxeditingtime','1800'),(191,'fullnamedisplay','language'),(192,'extendedusernamechars','0'),(193,'sitepolicy',''),(194,'sitepolicyguest',''),(195,'keeptagnamecase','1'),(196,'profilesforenrolledusersonly','1'),(197,'cronclionly','0'),(198,'cronremotepassword',''),(199,'lockoutthreshold','0'),(200,'lockoutwindow','1800'),(201,'lockoutduration','1800'),(202,'passwordpolicy','1'),(203,'minpasswordlength','8'),(204,'minpassworddigits','1'),(205,'minpasswordlower','1'),(206,'minpasswordupper','1'),(207,'minpasswordnonalphanum','1'),(208,'maxconsecutiveidentchars','0'),(209,'groupenrolmentkeypolicy','1'),(210,'disableuserimages','0'),(211,'emailchangeconfirmation','1'),(212,'rememberusername','2'),(213,'strictformsrequired','0'),(214,'loginhttps','0'),(215,'cookiesecure','0'),(216,'cookiehttponly','0'),(217,'allowframembedding','0'),(218,'loginpasswordautocomplete','0'),(219,'displayloginfailures',''),(220,'notifyloginfailures',''),(221,'notifyloginthreshold','10'),(222,'runclamonupload','0'),(223,'pathtoclam',''),(224,'quarantinedir',''),(225,'clamfailureonupload','donothing'),(226,'themelist',''),(227,'themedesignermode','0'),(228,'allowuserthemes','0'),(229,'allowcoursethemes','0'),(230,'allowcategorythemes','0'),(231,'allowthemechangeonurl','0'),(232,'allowuserblockhiding','1'),(233,'allowblockstodock','1'),(234,'custommenuitems',''),(235,'enabledevicedetection','1'),(236,'devicedetectregex','[]'),(237,'calendar_adminseesall','0'),(238,'calendar_site_timeformat','0'),(239,'calendar_startwday','0'),(240,'calendar_weekend','65'),(241,'calendar_lookahead','21'),(242,'calendar_maxevents','10'),(243,'enablecalendarexport','1'),(244,'calendar_customexport','1'),(245,'calendar_exportlookahead','365'),(246,'calendar_exportlookback','5'),(247,'calendar_exportsalt','I0a88Gb4VzfewCqHJpwvIkNqoGRgOZCbPf7dqs4zkLiecVjkNavR7zuSfAki'),(248,'calendar_showicalsource','1'),(249,'useblogassociations','1'),(250,'bloglevel','4'),(251,'useexternalblogs','1'),(252,'externalblogcrontime','86400'),(253,'maxexternalblogsperuser','1'),(254,'blogusecomments','1'),(255,'blogshowcommentscount','1'),(256,'defaulthomepage','0'),(257,'allowguestmymoodle','1'),(258,'navshowfullcoursenames','0'),(259,'navshowcategories','1'),(260,'navshowmycoursecategories','0'),(261,'navshowallcourses','0'),(262,'navsortmycoursessort','sortorder'),(263,'navcourselimit','20'),(264,'usesitenameforsitepages','0'),(265,'linkadmincategories','0'),(266,'navshowfrontpagemods','1'),(267,'navadduserpostslinks','1'),(268,'formatstringstriptags','1'),(269,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]'),(270,'core_media_enable_youtube','1'),(271,'core_media_enable_vimeo','0'),(272,'core_media_enable_mp3','1'),(273,'core_media_enable_flv','1'),(274,'core_media_enable_swf','1'),(275,'core_media_enable_html5audio','1'),(276,'core_media_enable_html5video','1'),(277,'core_media_enable_qt','1'),(278,'core_media_enable_wmp','1'),(279,'core_media_enable_rm','1'),(280,'docroot','http://docs.moodle.org'),(281,'doctonewwindow','0'),(282,'courselistshortnames','0'),(283,'coursesperpage','20'),(284,'courseswithsummarieslimit','10'),(285,'courseoverviewfileslimit','1'),(286,'courseoverviewfilesext','.jpg,.gif,.png'),(287,'enableajax','1'),(288,'useexternalyui','0'),(289,'yuicomboloading','1'),(290,'cachejs','1'),(291,'modchooserdefault','1'),(292,'additionalhtmlhead',''),(293,'additionalhtmltopofbody',''),(294,'additionalhtmlfooter',''),(295,'pathtodu',''),(296,'aspellpath',''),(297,'pathtodot',''),(298,'supportpage',''),(299,'dbsessions','1'),(300,'sessioncookie',''),(301,'sessioncookiepath','/'),(302,'sessioncookiedomain',''),(303,'statsfirstrun','none'),(304,'statsmaxruntime','0'),(305,'statsruntimedays','31'),(306,'statsruntimestarthour','0'),(307,'statsruntimestartminute','0'),(308,'statsuserthreshold','0'),(309,'slasharguments','1'),(310,'getremoteaddrconf','0'),(311,'proxyhost',''),(312,'proxyport','0'),(313,'proxytype','HTTP'),(314,'proxyuser',''),(315,'proxypassword',''),(316,'proxybypass','localhost, 127.0.0.1'),(317,'maintenance_enabled','0'),(318,'maintenance_message',''),(319,'deleteunconfirmed','168'),(320,'deleteincompleteusers','0'),(321,'logguests','1'),(322,'loglifetime','0'),(323,'disablegradehistory','0'),(324,'gradehistorylifetime','0'),(325,'extramemorylimit','512M'),(326,'curlcache','120'),(327,'curltimeoutkbitrate','56'),(328,'updateautocheck','1'),(329,'updateautodeploy','0'),(330,'updateminmaturity','200'),(331,'updatenotifybuilds','0'),(332,'enablesafebrowserintegration','0'),(333,'enablegroupmembersonly','0'),(334,'dndallowtextandlinks','0'),(335,'enablecssoptimiser','0'),(336,'debug','0'),(337,'debugdisplay','1'),(338,'debugsmtp','0'),(339,'perfdebug','7'),(340,'debugstringids','0'),(341,'debugvalidators','0'),(342,'debugpageinfo','0'),(343,'release','2.5+ (Build: 20130627)'),(344,'branch','25'),(346,'notloggedinroleid','6'),(347,'guestroleid','6'),(348,'defaultuserroleid','7'),(349,'creatornewroleid','3'),(350,'restorernewroleid','3'),(351,'gradebookroles','5'),(352,'assignment_maxbytes','1048576'),(353,'assignment_itemstocount','1'),(354,'assignment_showrecentsubmissions','1'),(355,'chat_method','ajax'),(356,'chat_refresh_userlist','10'),(357,'chat_old_ping','35'),(358,'chat_refresh_room','5'),(359,'chat_normal_updatemode','jsupdate'),(360,'chat_serverhost','localhost.com'),(361,'chat_serverip','127.0.0.1'),(362,'chat_serverport','9111'),(363,'chat_servermax','100'),(364,'data_enablerssfeeds','0'),(365,'feedback_allowfullanonymous','0'),(366,'forum_displaymode','3'),(367,'forum_replytouser','1'),(368,'forum_shortpost','300'),(369,'forum_longpost','600'),(370,'forum_manydiscussions','100'),(371,'forum_maxbytes','512000'),(372,'forum_maxattachments','9'),(373,'forum_trackreadposts','1'),(374,'forum_oldpostdays','14'),(375,'forum_usermarksread','0'),(376,'forum_cleanreadtime','2'),(377,'digestmailtime','17'),(378,'forum_enablerssfeeds','0'),(379,'forum_enabletimedposts','0'),(380,'glossary_entbypage','10'),(381,'glossary_dupentries','0'),(382,'glossary_allowcomments','0'),(383,'glossary_linkbydefault','1'),(384,'glossary_defaultapproval','1'),(385,'glossary_enablerssfeeds','0'),(386,'glossary_linkentries','0'),(387,'glossary_casesensitive','0'),(388,'glossary_fullmatch','0'),(389,'lesson_slideshowwidth','640'),(390,'lesson_slideshowheight','480'),(391,'lesson_slideshowbgcolor','#FFFFFF'),(392,'lesson_mediawidth','640'),(393,'lesson_mediaheight','480'),(394,'lesson_mediaclose','0'),(395,'lesson_maxhighscores','10'),(396,'lesson_maxanswers','4'),(397,'lesson_defaultnextpage','0'),(398,'smtphosts',''),(399,'smtpsecure',''),(400,'smtpuser',''),(401,'smtppass',''),(402,'smtpmaxbulk','1'),(403,'noreplyaddress','noreply@localhost.com'),(404,'sitemailcharset','0'),(405,'allowusermailcharset','0'),(406,'mailnewline','LF'),(407,'jabberhost',''),(408,'jabberserver',''),(409,'jabberusername',''),(410,'jabberpassword',''),(411,'jabberport','5222'),(412,'profileroles','5,4,3'),(413,'coursecontact','3'),(414,'frontpage','6'),(415,'frontpageloggedin','6'),(416,'maxcategorydepth','2'),(417,'frontpagecourselimit','200'),(418,'commentsperpage','15'),(419,'defaultfrontpageroleid','8'),(420,'supportname','Администратор Пользователь'),(421,'supportemail','groundsale@yandex.ru'),(422,'registerauth','email');
/*!40000 ALTER TABLE `mdl_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=855 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_log`
--

LOCK TABLES `mdl_config_log` WRITE;
/*!40000 ALTER TABLE `mdl_config_log` DISABLE KEYS */;
INSERT INTO `mdl_config_log` VALUES (1,0,1372421021,NULL,'enableoutcomes','0',NULL),(2,0,1372421021,NULL,'usecomments','1',NULL),(3,0,1372421021,NULL,'usetags','1',NULL),(4,0,1372421021,NULL,'enablenotes','1',NULL),(5,0,1372421021,NULL,'enableportfolios','0',NULL),(6,0,1372421021,NULL,'enablewebservices','0',NULL),(7,0,1372421021,NULL,'messaging','1',NULL),(8,0,1372421021,NULL,'messaginghidereadnotifications','0',NULL),(9,0,1372421021,NULL,'messagingdeletereadnotificationsdelay','604800',NULL),(10,0,1372421021,NULL,'messagingallowemailoverride','0',NULL),(11,0,1372421021,NULL,'enablestats','0',NULL),(12,0,1372421021,NULL,'enablerssfeeds','0',NULL),(13,0,1372421021,NULL,'enableblogs','1',NULL),(14,0,1372421021,NULL,'enablecompletion','0',NULL),(15,0,1372421022,NULL,'enableavailability','0',NULL),(16,0,1372421022,NULL,'enableplagiarism','0',NULL),(17,0,1372421022,NULL,'enablebadges','1',NULL),(18,0,1372421022,NULL,'autologinguests','0',NULL),(19,0,1372421022,NULL,'hiddenuserfields','',NULL),(20,0,1372421022,NULL,'showuseridentity','email',NULL),(21,0,1372421022,NULL,'maxusersperpage','100',NULL),(22,0,1372421022,NULL,'enablegravatar','0',NULL),(23,0,1372421022,NULL,'gravatardefaulturl','mm',NULL),(24,0,1372421022,'moodlecourse','visible','1',NULL),(25,0,1372421022,'moodlecourse','format','weeks',NULL),(26,0,1372421023,'moodlecourse','maxsections','52',NULL),(27,0,1372421023,'moodlecourse','numsections','10',NULL),(28,0,1372421023,'moodlecourse','hiddensections','0',NULL),(29,0,1372421023,'moodlecourse','coursedisplay','0',NULL),(30,0,1372421023,'moodlecourse','lang','',NULL),(31,0,1372421023,'moodlecourse','newsitems','5',NULL),(32,0,1372421023,'moodlecourse','showgrades','1',NULL),(33,0,1372421024,'moodlecourse','showreports','0',NULL),(34,0,1372421024,'moodlecourse','maxbytes','0',NULL),(35,0,1372421024,'moodlecourse','enablecompletion','0',NULL),(36,0,1372421024,'moodlecourse','groupmode','0',NULL),(37,0,1372421024,'moodlecourse','groupmodeforce','0',NULL),(38,0,1372421024,NULL,'enablecourserequests','0',NULL),(39,0,1372421025,NULL,'defaultrequestcategory','1',NULL),(40,0,1372421025,NULL,'requestcategoryselection','0',NULL),(41,0,1372421025,NULL,'courserequestnotify','',NULL),(42,0,1372421025,'backup','loglifetime','30',NULL),(43,0,1372421025,'backup','backup_general_users','1',NULL),(44,0,1372421025,'backup','backup_general_users_locked','0',NULL),(45,0,1372421025,'backup','backup_general_anonymize','0',NULL),(46,0,1372421025,'backup','backup_general_anonymize_locked','0',NULL),(47,0,1372421025,'backup','backup_general_role_assignments','1',NULL),(48,0,1372421025,'backup','backup_general_role_assignments_locked','0',NULL),(49,0,1372421025,'backup','backup_general_activities','1',NULL),(50,0,1372421026,'backup','backup_general_activities_locked','0',NULL),(51,0,1372421026,'backup','backup_general_blocks','1',NULL),(52,0,1372421026,'backup','backup_general_blocks_locked','0',NULL),(53,0,1372421026,'backup','backup_general_filters','1',NULL),(54,0,1372421026,'backup','backup_general_filters_locked','0',NULL),(55,0,1372421026,'backup','backup_general_comments','1',NULL),(56,0,1372421026,'backup','backup_general_comments_locked','0',NULL),(57,0,1372421026,'backup','backup_general_userscompletion','1',NULL),(58,0,1372421026,'backup','backup_general_userscompletion_locked','0',NULL),(59,0,1372421026,'backup','backup_general_logs','0',NULL),(60,0,1372421027,'backup','backup_general_logs_locked','0',NULL),(61,0,1372421027,'backup','backup_general_histories','0',NULL),(62,0,1372421027,'backup','backup_general_histories_locked','0',NULL),(63,0,1372421027,'backup','import_general_maxresults','10',NULL),(64,0,1372421027,'backup','backup_auto_active','0',NULL),(65,0,1372421027,'backup','backup_auto_weekdays','0000000',NULL),(66,0,1372421027,'backup','backup_auto_hour','0',NULL),(67,0,1372421027,'backup','backup_auto_minute','0',NULL),(68,0,1372421027,'backup','backup_auto_storage','0',NULL),(69,0,1372421027,'backup','backup_auto_destination','',NULL),(70,0,1372421027,'backup','backup_auto_keep','1',NULL),(71,0,1372421027,'backup','backup_shortname','0',NULL),(72,0,1372421027,'backup','backup_auto_skip_hidden','1',NULL),(73,0,1372421028,'backup','backup_auto_skip_modif_days','30',NULL),(74,0,1372421028,'backup','backup_auto_skip_modif_prev','0',NULL),(75,0,1372421028,'backup','backup_auto_users','1',NULL),(76,0,1372421028,'backup','backup_auto_role_assignments','1',NULL),(77,0,1372421028,'backup','backup_auto_activities','1',NULL),(78,0,1372421028,'backup','backup_auto_blocks','1',NULL),(79,0,1372421028,'backup','backup_auto_filters','1',NULL),(80,0,1372421028,'backup','backup_auto_comments','1',NULL),(81,0,1372421028,'backup','backup_auto_userscompletion','1',NULL),(82,0,1372421028,'backup','backup_auto_logs','0',NULL),(83,0,1372421029,'backup','backup_auto_histories','0',NULL),(84,0,1372421029,NULL,'grade_profilereport','user',NULL),(85,0,1372421029,NULL,'grade_aggregationposition','1',NULL),(86,0,1372421029,NULL,'grade_includescalesinaggregation','1',NULL),(87,0,1372421029,NULL,'grade_hiddenasdate','0',NULL),(88,0,1372421029,NULL,'gradepublishing','0',NULL),(89,0,1372421030,NULL,'grade_export_displaytype','1',NULL),(90,0,1372421030,NULL,'grade_export_decimalpoints','2',NULL),(91,0,1372421030,NULL,'grade_navmethod','0',NULL),(92,0,1372421030,NULL,'grade_export_userprofilefields','firstname,lastname,idnumber,institution,department,email',NULL),(93,0,1372421030,NULL,'grade_export_customprofilefields','',NULL),(94,0,1372421030,NULL,'recovergradesdefault','0',NULL),(95,0,1372421030,NULL,'gradeexport','',NULL),(96,0,1372421030,NULL,'unlimitedgrades','0',NULL),(97,0,1372421030,NULL,'grade_hideforcedsettings','1',NULL),(98,0,1372421030,NULL,'grade_aggregation','11',NULL),(99,0,1372421031,NULL,'grade_aggregation_flag','0',NULL),(100,0,1372421031,NULL,'grade_aggregations_visible','0,10,11,12,2,4,6,8,13',NULL),(101,0,1372421031,NULL,'grade_aggregateonlygraded','1',NULL),(102,0,1372421031,NULL,'grade_aggregateonlygraded_flag','2',NULL),(103,0,1372421031,NULL,'grade_aggregateoutcomes','0',NULL),(104,0,1372421031,NULL,'grade_aggregateoutcomes_flag','2',NULL),(105,0,1372421031,NULL,'grade_aggregatesubcats','0',NULL),(106,0,1372421031,NULL,'grade_aggregatesubcats_flag','2',NULL),(107,0,1372421031,NULL,'grade_keephigh','0',NULL),(108,0,1372421031,NULL,'grade_keephigh_flag','3',NULL),(109,0,1372421031,NULL,'grade_droplow','0',NULL),(110,0,1372421032,NULL,'grade_droplow_flag','2',NULL),(111,0,1372421032,NULL,'grade_displaytype','1',NULL),(112,0,1372421032,NULL,'grade_decimalpoints','2',NULL),(113,0,1372421032,NULL,'grade_item_advanced','iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime',NULL),(114,0,1372421032,NULL,'grade_report_studentsperpage','100',NULL),(115,0,1372421032,NULL,'grade_report_showonlyactiveenrol','1',NULL),(116,0,1372421032,NULL,'grade_report_quickgrading','1',NULL),(117,0,1372421032,NULL,'grade_report_showquickfeedback','0',NULL),(118,0,1372421032,NULL,'grade_report_fixedstudents','0',NULL),(119,0,1372421033,NULL,'grade_report_meanselection','1',NULL),(120,0,1372421033,NULL,'grade_report_enableajax','0',NULL),(121,0,1372421033,NULL,'grade_report_showcalculations','0',NULL),(122,0,1372421033,NULL,'grade_report_showeyecons','0',NULL),(123,0,1372421033,NULL,'grade_report_showaverages','1',NULL),(124,0,1372421033,NULL,'grade_report_showlocks','0',NULL),(125,0,1372421033,NULL,'grade_report_showranges','0',NULL),(126,0,1372421033,NULL,'grade_report_showanalysisicon','1',NULL),(127,0,1372421033,NULL,'grade_report_showuserimage','1',NULL),(128,0,1372421033,NULL,'grade_report_showactivityicons','1',NULL),(129,0,1372421033,NULL,'grade_report_shownumberofgrades','0',NULL),(130,0,1372421033,NULL,'grade_report_averagesdisplaytype','inherit',NULL),(131,0,1372421033,NULL,'grade_report_rangesdisplaytype','inherit',NULL),(132,0,1372421033,NULL,'grade_report_averagesdecimalpoints','inherit',NULL),(133,0,1372421034,NULL,'grade_report_rangesdecimalpoints','inherit',NULL),(134,0,1372421034,NULL,'grade_report_overview_showrank','0',NULL),(135,0,1372421034,NULL,'grade_report_overview_showtotalsifcontainhidden','0',NULL),(136,0,1372421034,NULL,'grade_report_user_showrank','0',NULL),(137,0,1372421034,NULL,'grade_report_user_showpercentage','1',NULL),(138,0,1372421034,NULL,'grade_report_user_showgrade','1',NULL),(139,0,1372421034,NULL,'grade_report_user_showfeedback','1',NULL),(140,0,1372421034,NULL,'grade_report_user_showrange','1',NULL),(141,0,1372421034,NULL,'grade_report_user_showweight','0',NULL),(142,0,1372421034,NULL,'grade_report_user_showaverage','0',NULL),(143,0,1372421034,NULL,'grade_report_user_showlettergrade','0',NULL),(144,0,1372421035,NULL,'grade_report_user_rangedecimals','0',NULL),(145,0,1372421035,NULL,'grade_report_user_showhiddenitems','1',NULL),(146,0,1372421035,NULL,'grade_report_user_showtotalsifcontainhidden','0',NULL),(147,0,1372421035,NULL,'badges_defaultissuername','',NULL),(148,0,1372421035,NULL,'badges_defaultissuercontact','',NULL),(149,0,1372421035,NULL,'badges_badgesalt','badges1372420970',NULL),(150,0,1372421035,NULL,'badges_allowexternalbackpack','1',NULL),(151,0,1372421036,NULL,'badges_allowcoursebadges','1',NULL),(152,0,1372421036,NULL,'timezone','99',NULL),(153,0,1372421036,NULL,'forcetimezone','99',NULL),(154,0,1372421036,NULL,'country','0',NULL),(155,0,1372421036,NULL,'defaultcity','',NULL),(156,0,1372421036,NULL,'geoipfile','/home/user/Загрузки/new/geoip/GeoLiteCity.dat',NULL),(157,0,1372421036,NULL,'googlemapkey3','',NULL),(158,0,1372421036,NULL,'allcountrycodes','',NULL),(159,0,1372421037,NULL,'autolang','1',NULL),(160,0,1372421037,NULL,'lang','ru',NULL),(161,0,1372421037,NULL,'langmenu','1',NULL),(162,0,1372421037,NULL,'langlist','',NULL),(163,0,1372421037,NULL,'langcache','1',NULL),(164,0,1372421037,NULL,'langstringcache','1',NULL),(165,0,1372421037,NULL,'locale','',NULL),(166,0,1372421037,NULL,'latinexcelexport','0',NULL),(167,0,1372421037,NULL,'block_course_list_adminview','all',NULL),(168,0,1372421038,NULL,'block_course_list_hideallcourseslink','0',NULL),(169,0,1372421038,'block_course_overview','defaultmaxcourses','10',NULL),(170,0,1372421038,'block_course_overview','forcedefaultmaxcourses','0',NULL),(171,0,1372421038,'block_course_overview','showchildren','0',NULL),(172,0,1372421038,'block_course_overview','showwelcomearea','0',NULL),(173,0,1372421038,NULL,'block_html_allowcssclasses','0',NULL),(174,0,1372421038,NULL,'block_online_users_timetosee','5',NULL),(175,0,1372421038,NULL,'block_rss_client_num_entries','5',NULL),(176,0,1372421038,NULL,'block_rss_client_timeout','30',NULL),(177,0,1372421038,'block_section_links','numsections1','22',NULL),(178,0,1372421038,'block_section_links','incby1','2',NULL),(179,0,1372421038,'block_section_links','numsections2','40',NULL),(180,0,1372421038,'block_section_links','incby2','5',NULL),(181,0,1372421038,NULL,'block_tags_showcoursetags','0',NULL),(182,0,1372421039,NULL,'registerauth','',NULL),(183,0,1372421039,NULL,'authpreventaccountcreation','0',NULL),(184,0,1372421039,NULL,'loginpageautofocus','0',NULL),(185,0,1372421039,NULL,'guestloginbutton','1',NULL),(186,0,1372421039,NULL,'alternateloginurl','',NULL),(187,0,1372421039,NULL,'forgottenpasswordurl','',NULL),(188,0,1372421039,NULL,'auth_instructions','',NULL),(189,0,1372421039,NULL,'allowemailaddresses','',NULL),(190,0,1372421039,NULL,'denyemailaddresses','',NULL),(191,0,1372421039,NULL,'verifychangedemail','1',NULL),(192,0,1372421039,NULL,'recaptchapublickey','',NULL),(193,0,1372421039,NULL,'recaptchaprivatekey','',NULL),(194,0,1372421039,'enrol_database','dbtype','',NULL),(195,0,1372421039,'enrol_database','dbhost','localhost',NULL),(196,0,1372421040,'enrol_database','dbuser','',NULL),(197,0,1372421040,'enrol_database','dbpass','',NULL),(198,0,1372421040,'enrol_database','dbname','',NULL),(199,0,1372421040,'enrol_database','dbencoding','utf-8',NULL),(200,0,1372421040,'enrol_database','dbsetupsql','',NULL),(201,0,1372421040,'enrol_database','dbsybasequoting','0',NULL),(202,0,1372421041,'enrol_database','debugdb','0',NULL),(203,0,1372421041,'enrol_database','localcoursefield','idnumber',NULL),(204,0,1372421041,'enrol_database','localuserfield','idnumber',NULL),(205,0,1372421041,'enrol_database','localrolefield','shortname',NULL),(206,0,1372421041,'enrol_database','localcategoryfield','id',NULL),(207,0,1372421041,'enrol_database','remoteenroltable','',NULL),(208,0,1372421042,'enrol_database','remotecoursefield','',NULL),(209,0,1372421042,'enrol_database','remoteuserfield','',NULL),(210,0,1372421042,'enrol_database','remoterolefield','',NULL),(211,0,1372421042,'enrol_database','ignorehiddencourses','0',NULL),(212,0,1372421042,'enrol_database','unenrolaction','0',NULL),(213,0,1372421042,'enrol_database','newcoursetable','',NULL),(214,0,1372421042,'enrol_database','newcoursefullname','fullname',NULL),(215,0,1372421042,'enrol_database','newcourseshortname','shortname',NULL),(216,0,1372421042,'enrol_database','newcourseidnumber','idnumber',NULL),(217,0,1372421042,'enrol_database','newcoursecategory','',NULL),(218,0,1372421042,'enrol_database','templatecourse','',NULL),(219,0,1372421042,'enrol_flatfile','location','',NULL),(220,0,1372421043,'enrol_flatfile','encoding','UTF-8',NULL),(221,0,1372421043,'enrol_flatfile','mailstudents','0',NULL),(222,0,1372421043,'enrol_flatfile','mailteachers','0',NULL),(223,0,1372421043,'enrol_flatfile','mailadmins','0',NULL),(224,0,1372421043,'enrol_flatfile','unenrolaction','3',NULL),(225,0,1372421043,'enrol_flatfile','expiredaction','3',NULL),(226,0,1372421043,'enrol_guest','requirepassword','0',NULL),(227,0,1372421043,'enrol_guest','usepasswordpolicy','0',NULL),(228,0,1372421043,'enrol_guest','showhint','0',NULL),(229,0,1372421043,'enrol_guest','defaultenrol','1',NULL),(230,0,1372421043,'enrol_guest','status','1',NULL),(231,0,1372421043,'enrol_guest','status_adv','0',NULL),(232,0,1372421043,'enrol_imsenterprise','imsfilelocation','',NULL),(233,0,1372421043,'enrol_imsenterprise','logtolocation','',NULL),(234,0,1372421043,'enrol_imsenterprise','mailadmins','0',NULL),(235,0,1372421044,'enrol_imsenterprise','createnewusers','0',NULL),(236,0,1372421044,'enrol_imsenterprise','imsdeleteusers','0',NULL),(237,0,1372421044,'enrol_imsenterprise','fixcaseusernames','0',NULL),(238,0,1372421044,'enrol_imsenterprise','fixcasepersonalnames','0',NULL),(239,0,1372421044,'enrol_imsenterprise','imssourcedidfallback','0',NULL),(240,0,1372421044,'enrol_imsenterprise','truncatecoursecodes','0',NULL),(241,0,1372421044,'enrol_imsenterprise','createnewcourses','0',NULL),(242,0,1372421044,'enrol_imsenterprise','createnewcategories','0',NULL),(243,0,1372421044,'enrol_imsenterprise','imsunenrol','0',NULL),(244,0,1372421045,'enrol_imsenterprise','imsrestricttarget','',NULL),(245,0,1372421045,'enrol_imsenterprise','imscapitafix','0',NULL),(246,0,1372421045,'enrol_ldap','host_url','',NULL),(247,0,1372421046,'enrol_ldap','start_tls','0',NULL),(248,0,1372421046,'enrol_ldap','ldap_version','3',NULL),(249,0,1372421046,'enrol_ldap','ldapencoding','utf-8',NULL),(250,0,1372421046,'enrol_ldap','pagesize','250',NULL),(251,0,1372421046,'enrol_ldap','bind_dn','',NULL),(252,0,1372421046,'enrol_ldap','bind_pw','',NULL),(253,0,1372421046,'enrol_ldap','course_search_sub','0',NULL),(254,0,1372421046,'enrol_ldap','memberattribute_isdn','0',NULL),(255,0,1372421046,'enrol_ldap','user_contexts','',NULL),(256,0,1372421046,'enrol_ldap','user_search_sub','0',NULL),(257,0,1372421047,'enrol_ldap','user_type','default',NULL),(258,0,1372421047,'enrol_ldap','opt_deref','0',NULL),(259,0,1372421047,'enrol_ldap','idnumber_attribute','',NULL),(260,0,1372421047,'enrol_ldap','objectclass','',NULL),(261,0,1372421047,'enrol_ldap','course_idnumber','',NULL),(262,0,1372421047,'enrol_ldap','course_shortname','',NULL),(263,0,1372421047,'enrol_ldap','course_fullname','',NULL),(264,0,1372421047,'enrol_ldap','course_summary','',NULL),(265,0,1372421047,'enrol_ldap','ignorehiddencourses','0',NULL),(266,0,1372421047,'enrol_ldap','unenrolaction','0',NULL),(267,0,1372421047,'enrol_ldap','autocreate','0',NULL),(268,0,1372421047,'enrol_ldap','template','',NULL),(269,0,1372421047,'enrol_ldap','nested_groups','0',NULL),(270,0,1372421048,'enrol_ldap','group_memberofattribute','',NULL),(271,0,1372421048,'enrol_manual','expiredaction','1',NULL),(272,0,1372421048,'enrol_manual','expirynotifyhour','6',NULL),(273,0,1372421048,'enrol_manual','defaultenrol','1',NULL),(274,0,1372421048,'enrol_manual','status','0',NULL),(275,0,1372421048,'enrol_manual','enrolperiod','0',NULL),(276,0,1372421048,'enrol_manual','expirynotify','0',NULL),(277,0,1372421048,'enrol_manual','expirythreshold','86400',NULL),(278,0,1372421048,'enrol_paypal','paypalbusiness','',NULL),(279,0,1372421049,'enrol_paypal','mailstudents','0',NULL),(280,0,1372421049,'enrol_paypal','mailteachers','0',NULL),(281,0,1372421049,'enrol_paypal','mailadmins','0',NULL),(282,0,1372421049,'enrol_paypal','expiredaction','3',NULL),(283,0,1372421049,'enrol_paypal','status','1',NULL),(284,0,1372421049,'enrol_paypal','cost','0',NULL),(285,0,1372421049,'enrol_paypal','currency','USD',NULL),(286,0,1372421049,'enrol_paypal','enrolperiod','0',NULL),(287,0,1372421049,'enrol_self','requirepassword','0',NULL),(288,0,1372421049,'enrol_self','usepasswordpolicy','0',NULL),(289,0,1372421050,'enrol_self','showhint','0',NULL),(290,0,1372421050,'enrol_self','expiredaction','1',NULL),(291,0,1372421050,'enrol_self','expirynotifyhour','6',NULL),(292,0,1372421050,'enrol_self','defaultenrol','1',NULL),(293,0,1372421050,'enrol_self','status','1',NULL),(294,0,1372421050,'enrol_self','newenrols','1',NULL),(295,0,1372421050,'enrol_self','groupkey','0',NULL),(296,0,1372421051,'enrol_self','enrolperiod','0',NULL),(297,0,1372421051,'enrol_self','expirynotify','0',NULL),(298,0,1372421051,'enrol_self','expirythreshold','86400',NULL),(299,0,1372421051,'enrol_self','longtimenosee','0',NULL),(300,0,1372421051,'enrol_self','maxenrolled','0',NULL),(301,0,1372421051,'enrol_self','sendcoursewelcomemessage','1',NULL),(302,0,1372421051,'editor_tinymce','customtoolbar','fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code',NULL),(303,0,1372421051,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings',NULL),(304,0,1372421051,'editor_tinymce','customconfig','',NULL),(305,0,1372421051,'tinymce_dragmath','requiretex','1',NULL),(306,0,1372421051,'tinymce_moodleemoticon','requireemoticon','1',NULL),(307,0,1372421051,'tinymce_spellchecker','spellengine','GoogleSpell',NULL),(308,0,1372421051,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv',NULL),(309,0,1372421051,NULL,'sitedefaultlicense','allrightsreserved',NULL),(310,0,1372421052,NULL,'cachetext','60',NULL),(311,0,1372421052,NULL,'filteruploadedfiles','0',NULL),(312,0,1372421052,NULL,'filtermatchoneperpage','0',NULL),(313,0,1372421052,NULL,'filtermatchonepertext','0',NULL),(314,0,1372421052,NULL,'filter_multilang_force_old','0',NULL),(315,0,1372421052,'filter_emoticon','formats','1,4,0',NULL),(316,0,1372421052,'filter_urltolink','formats','0',NULL),(317,0,1372421052,'filter_urltolink','embedimages','1',NULL),(318,0,1372421052,NULL,'filter_tex_latexpreamble','\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n',NULL),(319,0,1372421052,NULL,'filter_tex_latexbackground','#FFFFFF',NULL),(320,0,1372421052,NULL,'filter_tex_density','120',NULL),(321,0,1372421052,NULL,'filter_tex_pathlatex','/usr/bin/latex',NULL),(322,0,1372421052,NULL,'filter_tex_pathdvips','/usr/bin/dvips',NULL),(323,0,1372421053,NULL,'filter_tex_pathconvert','/usr/bin/convert',NULL),(324,0,1372421053,NULL,'filter_tex_convertformat','gif',NULL),(325,0,1372421053,NULL,'filter_censor_badwords','',NULL),(326,0,1372421053,NULL,'portfolio_moderate_filesize_threshold','1048576',NULL),(327,0,1372421053,NULL,'portfolio_high_filesize_threshold','5242880',NULL),(328,0,1372421053,NULL,'portfolio_moderate_db_threshold','20',NULL),(329,0,1372421053,NULL,'portfolio_high_db_threshold','50',NULL),(330,0,1372421053,NULL,'repositorycacheexpire','120',NULL),(331,0,1372421053,NULL,'repositoryallowexternallinks','1',NULL),(332,0,1372421054,NULL,'legacyfilesinnewcourses','0',NULL),(333,0,1372421054,NULL,'mobilecssurl','',NULL),(334,0,1372421054,NULL,'enablewsdocumentation','0',NULL),(335,0,1372421054,'question_preview','behaviour','deferredfeedback',NULL),(336,0,1372421054,'question_preview','correctness','1',NULL),(337,0,1372421055,'question_preview','marks','1',NULL),(338,0,1372421055,'question_preview','markdp','2',NULL),(339,0,1372421055,'question_preview','feedback','1',NULL),(340,0,1372421055,'question_preview','generalfeedback','1',NULL),(341,0,1372421055,'question_preview','rightanswer','1',NULL),(342,0,1372421055,'question_preview','history','0',NULL),(343,0,1372421055,'cachestore_memcache','testservers','',NULL),(344,0,1372421055,'cachestore_memcached','testservers','',NULL),(345,0,1372421055,'cachestore_mongodb','testserver','',NULL),(346,0,1372421055,NULL,'allowbeforeblock','0',NULL),(347,0,1372421056,NULL,'allowedip','',NULL),(348,0,1372421056,NULL,'blockedip','',NULL),(349,0,1372421056,NULL,'protectusernames','1',NULL),(350,0,1372421056,NULL,'forcelogin','0',NULL),(351,0,1372421056,NULL,'forceloginforprofiles','1',NULL),(352,0,1372421056,NULL,'forceloginforprofileimage','0',NULL),(353,0,1372421056,NULL,'opentogoogle','0',NULL),(354,0,1372421056,NULL,'maxbytes','0',NULL),(355,0,1372421057,NULL,'userquota','104857600',NULL),(356,0,1372421057,NULL,'allowobjectembed','0',NULL),(357,0,1372421057,NULL,'enabletrusttext','0',NULL),(358,0,1372421057,NULL,'maxeditingtime','1800',NULL),(359,0,1372421057,NULL,'fullnamedisplay','language',NULL),(360,0,1372421057,NULL,'extendedusernamechars','0',NULL),(361,0,1372421057,NULL,'sitepolicy','',NULL),(362,0,1372421057,NULL,'sitepolicyguest','',NULL),(363,0,1372421058,NULL,'keeptagnamecase','1',NULL),(364,0,1372421058,NULL,'profilesforenrolledusersonly','1',NULL),(365,0,1372421058,NULL,'cronclionly','0',NULL),(366,0,1372421058,NULL,'cronremotepassword','',NULL),(367,0,1372421058,NULL,'lockoutthreshold','0',NULL),(368,0,1372421058,NULL,'lockoutwindow','1800',NULL),(369,0,1372421058,NULL,'lockoutduration','1800',NULL),(370,0,1372421058,NULL,'passwordpolicy','1',NULL),(371,0,1372421058,NULL,'minpasswordlength','8',NULL),(372,0,1372421059,NULL,'minpassworddigits','1',NULL),(373,0,1372421059,NULL,'minpasswordlower','1',NULL),(374,0,1372421059,NULL,'minpasswordupper','1',NULL),(375,0,1372421059,NULL,'minpasswordnonalphanum','1',NULL),(376,0,1372421059,NULL,'maxconsecutiveidentchars','0',NULL),(377,0,1372421059,NULL,'groupenrolmentkeypolicy','1',NULL),(378,0,1372421059,NULL,'disableuserimages','0',NULL),(379,0,1372421059,NULL,'emailchangeconfirmation','1',NULL),(380,0,1372421059,NULL,'rememberusername','2',NULL),(381,0,1372421060,NULL,'strictformsrequired','0',NULL),(382,0,1372421060,NULL,'loginhttps','0',NULL),(383,0,1372421060,NULL,'cookiesecure','0',NULL),(384,0,1372421060,NULL,'cookiehttponly','0',NULL),(385,0,1372421060,NULL,'allowframembedding','0',NULL),(386,0,1372421061,NULL,'loginpasswordautocomplete','0',NULL),(387,0,1372421061,NULL,'displayloginfailures','',NULL),(388,0,1372421061,NULL,'notifyloginfailures','',NULL),(389,0,1372421061,NULL,'notifyloginthreshold','10',NULL),(390,0,1372421061,NULL,'runclamonupload','0',NULL),(391,0,1372421061,NULL,'pathtoclam','',NULL),(392,0,1372421061,NULL,'quarantinedir','',NULL),(393,0,1372421061,NULL,'clamfailureonupload','donothing',NULL),(394,0,1372421061,NULL,'themelist','',NULL),(395,0,1372421061,NULL,'themedesignermode','0',NULL),(396,0,1372421061,NULL,'allowuserthemes','0',NULL),(397,0,1372421061,NULL,'allowcoursethemes','0',NULL),(398,0,1372421061,NULL,'allowcategorythemes','0',NULL),(399,0,1372421061,NULL,'allowthemechangeonurl','0',NULL),(400,0,1372421062,NULL,'allowuserblockhiding','1',NULL),(401,0,1372421062,NULL,'allowblockstodock','1',NULL),(402,0,1372421062,NULL,'custommenuitems','',NULL),(403,0,1372421062,NULL,'enabledevicedetection','1',NULL),(404,0,1372421062,NULL,'devicedetectregex','[]',NULL),(405,0,1372421062,'theme_afterburner','logo','',NULL),(406,0,1372421062,'theme_afterburner','footnote','',NULL),(407,0,1372421063,'theme_afterburner','customcss','',NULL),(408,0,1372421063,'theme_anomaly','tagline','',NULL),(409,0,1372421063,'theme_anomaly','customcss','',NULL),(410,0,1372421063,'theme_arialist','logo','',NULL),(411,0,1372421063,'theme_arialist','tagline','',NULL),(412,0,1372421063,'theme_arialist','linkcolor','#f25f0f',NULL),(413,0,1372421063,'theme_arialist','regionwidth','250',NULL),(414,0,1372421063,'theme_arialist','customcss','',NULL),(415,0,1372421064,'theme_brick','logo','',NULL),(416,0,1372421064,'theme_brick','linkcolor','#06365b',NULL),(417,0,1372421064,'theme_brick','linkhover','#5487ad',NULL),(418,0,1372421064,'theme_brick','maincolor','#8e2800',NULL),(419,0,1372421064,'theme_brick','maincolorlink','#fff0a5',NULL),(420,0,1372421064,'theme_brick','headingcolor','#5c3500',NULL),(421,0,1372421064,'theme_clean','invert','0',NULL),(422,0,1372421064,'theme_clean','logo','',NULL),(423,0,1372421064,'theme_clean','customcss','',NULL),(424,0,1372421064,'theme_clean','footnote','',NULL),(425,0,1372421064,'theme_formal_white','fontsizereference','13',NULL),(426,0,1372421064,'theme_formal_white','noframe','0',NULL),(427,0,1372421064,'theme_formal_white','framemargin','15',NULL),(428,0,1372421064,'theme_formal_white','headercontent','1',NULL),(429,0,1372421064,'theme_formal_white','customlogourl','',NULL),(430,0,1372421065,'theme_formal_white','frontpagelogourl','',NULL),(431,0,1372421065,'theme_formal_white','headerbgc','#E3DFD4',NULL),(432,0,1372421065,'theme_formal_white','creditstomoodleorg','2',NULL),(433,0,1372421065,'theme_formal_white','blockcolumnwidth','200',NULL),(434,0,1372421065,'theme_formal_white','blockpadding','8',NULL),(435,0,1372421065,'theme_formal_white','blockcontentbgc','#F6F6F6',NULL),(436,0,1372421065,'theme_formal_white','lblockcolumnbgc','#E3DFD4',NULL),(437,0,1372421065,'theme_formal_white','rblockcolumnbgc','',NULL),(438,0,1372421065,'theme_formal_white','footnote','',NULL),(439,0,1372421066,'theme_formal_white','customcss','',NULL),(440,0,1372421066,'theme_fusion','linkcolor','#2d83d5',NULL),(441,0,1372421066,'theme_fusion','tagline','',NULL),(442,0,1372421066,'theme_fusion','footertext','',NULL),(443,0,1372421066,'theme_fusion','customcss','',NULL),(444,0,1372421067,'theme_magazine','background','',NULL),(445,0,1372421067,'theme_magazine','logo','',NULL),(446,0,1372421067,'theme_magazine','linkcolor','#32529a',NULL),(447,0,1372421067,'theme_magazine','linkhover','#4e2300',NULL),(448,0,1372421067,'theme_magazine','maincolor','#002f2f',NULL),(449,0,1372421067,'theme_magazine','maincoloraccent','#092323',NULL),(450,0,1372421067,'theme_magazine','headingcolor','#4e0000',NULL),(451,0,1372421068,'theme_magazine','blockcolor','#002f2f',NULL),(452,0,1372421068,'theme_magazine','forumback','#e6e2af',NULL),(453,0,1372421068,'theme_mymobile','colourswatch','light',NULL),(454,0,1372421068,'theme_mymobile','showmobileintro','',NULL),(455,0,1372421068,'theme_mymobile','showsitetopic','topicshow',NULL),(456,0,1372421068,'theme_mymobile','showfullsizeimages','ithumb',NULL),(457,0,1372421068,'theme_mymobile','usetableview','tabshow',NULL),(458,0,1372421068,'theme_mymobile','customcss','',NULL),(459,0,1372421068,'theme_nimble','tagline','',NULL),(460,0,1372421068,'theme_nimble','footerline','',NULL),(461,0,1372421068,'theme_nimble','backgroundcolor','#454545',NULL),(462,0,1372421068,'theme_nimble','linkcolor','#2a65b1',NULL),(463,0,1372421069,'theme_nimble','linkhover','#222222',NULL),(464,0,1372421069,'theme_nonzero','regionprewidth','200',NULL),(465,0,1372421069,'theme_nonzero','regionpostwidth','200',NULL),(466,0,1372421069,'theme_nonzero','customcss','',NULL),(467,0,1372421069,'theme_overlay','linkcolor','#428ab5',NULL),(468,0,1372421069,'theme_overlay','headercolor','#2a4c7b',NULL),(469,0,1372421069,'theme_overlay','footertext','',NULL),(470,0,1372421069,'theme_overlay','customcss','',NULL),(471,0,1372421069,'theme_sky_high','logo','',NULL),(472,0,1372421069,'theme_sky_high','regionwidth','240',NULL),(473,0,1372421069,'theme_sky_high','footnote','',NULL),(474,0,1372421069,'theme_sky_high','customcss','',NULL),(475,0,1372421069,'theme_splash','logo','',NULL),(476,0,1372421069,'theme_splash','tagline','Virtual learning center',NULL),(477,0,1372421070,'theme_splash','hide_tagline','0',NULL),(478,0,1372421070,'theme_splash','footnote','',NULL),(479,0,1372421070,'theme_splash','customcss','',NULL),(480,0,1372421070,NULL,'calendar_adminseesall','0',NULL),(481,0,1372421070,NULL,'calendar_site_timeformat','0',NULL),(482,0,1372421070,NULL,'calendar_startwday','0',NULL),(483,0,1372421070,NULL,'calendar_weekend','65',NULL),(484,0,1372421070,NULL,'calendar_lookahead','21',NULL),(485,0,1372421071,NULL,'calendar_maxevents','10',NULL),(486,0,1372421071,NULL,'enablecalendarexport','1',NULL),(487,0,1372421071,NULL,'calendar_customexport','1',NULL),(488,0,1372421071,NULL,'calendar_exportlookahead','365',NULL),(489,0,1372421071,NULL,'calendar_exportlookback','5',NULL),(490,0,1372421071,NULL,'calendar_exportsalt','I0a88Gb4VzfewCqHJpwvIkNqoGRgOZCbPf7dqs4zkLiecVjkNavR7zuSfAki',NULL),(491,0,1372421071,NULL,'calendar_showicalsource','1',NULL),(492,0,1372421071,NULL,'useblogassociations','1',NULL),(493,0,1372421071,NULL,'bloglevel','4',NULL),(494,0,1372421072,NULL,'useexternalblogs','1',NULL),(495,0,1372421072,NULL,'externalblogcrontime','86400',NULL),(496,0,1372421072,NULL,'maxexternalblogsperuser','1',NULL),(497,0,1372421072,NULL,'blogusecomments','1',NULL),(498,0,1372421072,NULL,'blogshowcommentscount','1',NULL),(499,0,1372421072,NULL,'defaulthomepage','0',NULL),(500,0,1372421072,NULL,'allowguestmymoodle','1',NULL),(501,0,1372421072,NULL,'navshowfullcoursenames','0',NULL),(502,0,1372421073,NULL,'navshowcategories','1',NULL),(503,0,1372421073,NULL,'navshowmycoursecategories','0',NULL),(504,0,1372421073,NULL,'navshowallcourses','0',NULL),(505,0,1372421073,NULL,'navsortmycoursessort','sortorder',NULL),(506,0,1372421073,NULL,'navcourselimit','20',NULL),(507,0,1372421073,NULL,'usesitenameforsitepages','0',NULL),(508,0,1372421073,NULL,'linkadmincategories','0',NULL),(509,0,1372421073,NULL,'navshowfrontpagemods','1',NULL),(510,0,1372421073,NULL,'navadduserpostslinks','1',NULL),(511,0,1372421073,NULL,'formatstringstriptags','1',NULL),(512,0,1372421073,NULL,'emoticons','[{\"text\":\":-)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":)\",\"imagename\":\"s\\/smiley\",\"imagecomponent\":\"core\",\"altidentifier\":\"smiley\",\"altcomponent\":\"core_pix\"},{\"text\":\":-D\",\"imagename\":\"s\\/biggrin\",\"imagecomponent\":\"core\",\"altidentifier\":\"biggrin\",\"altcomponent\":\"core_pix\"},{\"text\":\";-)\",\"imagename\":\"s\\/wink\",\"imagecomponent\":\"core\",\"altidentifier\":\"wink\",\"altcomponent\":\"core_pix\"},{\"text\":\":-\\/\",\"imagename\":\"s\\/mixed\",\"imagecomponent\":\"core\",\"altidentifier\":\"mixed\",\"altcomponent\":\"core_pix\"},{\"text\":\"V-.\",\"imagename\":\"s\\/thoughtful\",\"imagecomponent\":\"core\",\"altidentifier\":\"thoughtful\",\"altcomponent\":\"core_pix\"},{\"text\":\":-P\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\":-p\",\"imagename\":\"s\\/tongueout\",\"imagecomponent\":\"core\",\"altidentifier\":\"tongueout\",\"altcomponent\":\"core_pix\"},{\"text\":\"B-)\",\"imagename\":\"s\\/cool\",\"imagecomponent\":\"core\",\"altidentifier\":\"cool\",\"altcomponent\":\"core_pix\"},{\"text\":\"^-)\",\"imagename\":\"s\\/approve\",\"imagecomponent\":\"core\",\"altidentifier\":\"approve\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-)\",\"imagename\":\"s\\/wideeyes\",\"imagecomponent\":\"core\",\"altidentifier\":\"wideeyes\",\"altcomponent\":\"core_pix\"},{\"text\":\":o)\",\"imagename\":\"s\\/clown\",\"imagecomponent\":\"core\",\"altidentifier\":\"clown\",\"altcomponent\":\"core_pix\"},{\"text\":\":-(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\":(\",\"imagename\":\"s\\/sad\",\"imagecomponent\":\"core\",\"altidentifier\":\"sad\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-.\",\"imagename\":\"s\\/shy\",\"imagecomponent\":\"core\",\"altidentifier\":\"shy\",\"altcomponent\":\"core_pix\"},{\"text\":\":-I\",\"imagename\":\"s\\/blush\",\"imagecomponent\":\"core\",\"altidentifier\":\"blush\",\"altcomponent\":\"core_pix\"},{\"text\":\":-X\",\"imagename\":\"s\\/kiss\",\"imagecomponent\":\"core\",\"altidentifier\":\"kiss\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-o\",\"imagename\":\"s\\/surprise\",\"imagecomponent\":\"core\",\"altidentifier\":\"surprise\",\"altcomponent\":\"core_pix\"},{\"text\":\"P-|\",\"imagename\":\"s\\/blackeye\",\"imagecomponent\":\"core\",\"altidentifier\":\"blackeye\",\"altcomponent\":\"core_pix\"},{\"text\":\"8-[\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"(grr)\",\"imagename\":\"s\\/angry\",\"imagecomponent\":\"core\",\"altidentifier\":\"angry\",\"altcomponent\":\"core_pix\"},{\"text\":\"xx-P\",\"imagename\":\"s\\/dead\",\"imagecomponent\":\"core\",\"altidentifier\":\"dead\",\"altcomponent\":\"core_pix\"},{\"text\":\"|-.\",\"imagename\":\"s\\/sleepy\",\"imagecomponent\":\"core\",\"altidentifier\":\"sleepy\",\"altcomponent\":\"core_pix\"},{\"text\":\"}-]\",\"imagename\":\"s\\/evil\",\"imagecomponent\":\"core\",\"altidentifier\":\"evil\",\"altcomponent\":\"core_pix\"},{\"text\":\"(h)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(heart)\",\"imagename\":\"s\\/heart\",\"imagecomponent\":\"core\",\"altidentifier\":\"heart\",\"altcomponent\":\"core_pix\"},{\"text\":\"(y)\",\"imagename\":\"s\\/yes\",\"imagecomponent\":\"core\",\"altidentifier\":\"yes\",\"altcomponent\":\"core\"},{\"text\":\"(n)\",\"imagename\":\"s\\/no\",\"imagecomponent\":\"core\",\"altidentifier\":\"no\",\"altcomponent\":\"core\"},{\"text\":\"(martin)\",\"imagename\":\"s\\/martin\",\"imagecomponent\":\"core\",\"altidentifier\":\"martin\",\"altcomponent\":\"core_pix\"},{\"text\":\"( )\",\"imagename\":\"s\\/egg\",\"imagecomponent\":\"core\",\"altidentifier\":\"egg\",\"altcomponent\":\"core_pix\"}]',NULL),(513,0,1372421073,NULL,'core_media_enable_youtube','1',NULL),(514,0,1372421073,NULL,'core_media_enable_vimeo','0',NULL),(515,0,1372421073,NULL,'core_media_enable_mp3','1',NULL),(516,0,1372421074,NULL,'core_media_enable_flv','1',NULL),(517,0,1372421074,NULL,'core_media_enable_swf','1',NULL),(518,0,1372421074,NULL,'core_media_enable_html5audio','1',NULL),(519,0,1372421074,NULL,'core_media_enable_html5video','1',NULL),(520,0,1372421074,NULL,'core_media_enable_qt','1',NULL),(521,0,1372421074,NULL,'core_media_enable_wmp','1',NULL),(522,0,1372421074,NULL,'core_media_enable_rm','1',NULL),(523,0,1372421074,NULL,'docroot','http://docs.moodle.org',NULL),(524,0,1372421074,NULL,'doctonewwindow','0',NULL),(525,0,1372421075,NULL,'courselistshortnames','0',NULL),(526,0,1372421075,NULL,'coursesperpage','20',NULL),(527,0,1372421075,NULL,'courseswithsummarieslimit','10',NULL),(528,0,1372421075,NULL,'courseoverviewfileslimit','1',NULL),(529,0,1372421075,NULL,'courseoverviewfilesext','.jpg,.gif,.png',NULL),(530,0,1372421075,NULL,'enableajax','1',NULL),(531,0,1372421075,NULL,'useexternalyui','0',NULL),(532,0,1372421076,NULL,'yuicomboloading','1',NULL),(533,0,1372421076,NULL,'cachejs','1',NULL),(534,0,1372421076,NULL,'modchooserdefault','1',NULL),(535,0,1372421076,NULL,'additionalhtmlhead','',NULL),(536,0,1372421076,NULL,'additionalhtmltopofbody','',NULL),(537,0,1372421076,NULL,'additionalhtmlfooter','',NULL),(538,0,1372421076,NULL,'pathtodu','',NULL),(539,0,1372421077,NULL,'aspellpath','',NULL),(540,0,1372421077,NULL,'pathtodot','',NULL),(541,0,1372421077,NULL,'supportpage','',NULL),(542,0,1372421078,NULL,'dbsessions','1',NULL),(543,0,1372421078,NULL,'sessioncookie','',NULL),(544,0,1372421078,NULL,'sessioncookiepath','',NULL),(545,0,1372421078,NULL,'sessioncookiedomain','',NULL),(546,0,1372421078,NULL,'statsfirstrun','none',NULL),(547,0,1372421078,NULL,'statsmaxruntime','0',NULL),(548,0,1372421078,NULL,'statsruntimedays','31',NULL),(549,0,1372421079,NULL,'statsruntimestarthour','0',NULL),(550,0,1372421079,NULL,'statsruntimestartminute','0',NULL),(551,0,1372421079,NULL,'statsuserthreshold','0',NULL),(552,0,1372421079,NULL,'slasharguments','1',NULL),(553,0,1372421079,NULL,'getremoteaddrconf','0',NULL),(554,0,1372421079,NULL,'proxyhost','',NULL),(555,0,1372421079,NULL,'proxyport','0',NULL),(556,0,1372421079,NULL,'proxytype','HTTP',NULL),(557,0,1372421079,NULL,'proxyuser','',NULL),(558,0,1372421079,NULL,'proxypassword','',NULL),(559,0,1372421079,NULL,'proxybypass','localhost, 127.0.0.1',NULL),(560,0,1372421079,NULL,'maintenance_enabled','0',NULL),(561,0,1372421079,NULL,'maintenance_message','',NULL),(562,0,1372421079,NULL,'deleteunconfirmed','168',NULL),(563,0,1372421080,NULL,'deleteincompleteusers','0',NULL),(564,0,1372421080,NULL,'logguests','1',NULL),(565,0,1372421080,NULL,'loglifetime','0',NULL),(566,0,1372421080,NULL,'disablegradehistory','0',NULL),(567,0,1372421080,NULL,'gradehistorylifetime','0',NULL),(568,0,1372421080,NULL,'extramemorylimit','512M',NULL),(569,0,1372421080,NULL,'curlcache','120',NULL),(570,0,1372421080,NULL,'curltimeoutkbitrate','56',NULL),(571,0,1372421080,NULL,'updateautocheck','1',NULL),(572,0,1372421080,NULL,'updateautodeploy','0',NULL),(573,0,1372421080,NULL,'updateminmaturity','200',NULL),(574,0,1372421080,NULL,'updatenotifybuilds','0',NULL),(575,0,1372421080,NULL,'enablesafebrowserintegration','0',NULL),(576,0,1372421081,NULL,'enablegroupmembersonly','0',NULL),(577,0,1372421081,NULL,'dndallowtextandlinks','0',NULL),(578,0,1372421081,NULL,'enablecssoptimiser','0',NULL),(579,0,1372421081,NULL,'debug','0',NULL),(580,0,1372421081,NULL,'debugdisplay','1',NULL),(581,0,1372421081,NULL,'debugsmtp','0',NULL),(582,0,1372421081,NULL,'perfdebug','7',NULL),(583,0,1372421081,NULL,'debugstringids','0',NULL),(584,0,1372421081,NULL,'debugvalidators','0',NULL),(585,0,1372421082,NULL,'debugpageinfo','0',NULL),(586,2,1372421536,NULL,'notloggedinroleid','6',NULL),(587,2,1372421536,NULL,'guestroleid','6',NULL),(588,2,1372421536,NULL,'defaultuserroleid','7',NULL),(589,2,1372421536,NULL,'creatornewroleid','3',NULL),(590,2,1372421536,NULL,'restorernewroleid','3',NULL),(591,2,1372421536,NULL,'gradebookroles','5',NULL),(592,2,1372421536,'assign','feedback_plugin_for_gradebook','assignfeedback_comments',NULL),(593,2,1372421537,'assign','showrecentsubmissions','0',NULL),(594,2,1372421537,'assign','submissionreceipts','1',NULL),(595,2,1372421537,'assign','submissionstatement','This assignment is my own work, except where I have acknowledged the use of the works of other people.',NULL),(596,2,1372421537,'assign','requiresubmissionstatement','0',NULL),(597,2,1372421537,NULL,'assignment_maxbytes','1048576',NULL),(598,2,1372421537,NULL,'assignment_itemstocount','1',NULL),(599,2,1372421537,NULL,'assignment_showrecentsubmissions','1',NULL),(600,2,1372421538,'book','requiremodintro','1',NULL),(601,2,1372421538,'book','numberingoptions','0,1,2,3',NULL),(602,2,1372421538,'book','numbering','1',NULL),(603,2,1372421538,NULL,'chat_method','ajax',NULL),(604,2,1372421538,NULL,'chat_refresh_userlist','10',NULL),(605,2,1372421538,NULL,'chat_old_ping','35',NULL),(606,2,1372421538,NULL,'chat_refresh_room','5',NULL),(607,2,1372421538,NULL,'chat_normal_updatemode','jsupdate',NULL),(608,2,1372421538,NULL,'chat_serverhost','localhost.com',NULL),(609,2,1372421538,NULL,'chat_serverip','127.0.0.1',NULL),(610,2,1372421538,NULL,'chat_serverport','9111',NULL),(611,2,1372421538,NULL,'chat_servermax','100',NULL),(612,2,1372421538,NULL,'data_enablerssfeeds','0',NULL),(613,2,1372421538,NULL,'feedback_allowfullanonymous','0',NULL),(614,2,1372421538,'folder','requiremodintro','1',NULL),(615,2,1372421539,'folder','showexpanded','1',NULL),(616,2,1372421539,NULL,'forum_displaymode','3',NULL),(617,2,1372421539,NULL,'forum_replytouser','1',NULL),(618,2,1372421539,NULL,'forum_shortpost','300',NULL),(619,2,1372421539,NULL,'forum_longpost','600',NULL),(620,2,1372421539,NULL,'forum_manydiscussions','100',NULL),(621,2,1372421539,NULL,'forum_maxbytes','512000',NULL),(622,2,1372421539,NULL,'forum_maxattachments','9',NULL),(623,2,1372421539,NULL,'forum_trackreadposts','1',NULL),(624,2,1372421539,NULL,'forum_oldpostdays','14',NULL),(625,2,1372421539,NULL,'forum_usermarksread','0',NULL),(626,2,1372421540,NULL,'forum_cleanreadtime','2',NULL),(627,2,1372421540,NULL,'digestmailtime','17',NULL),(628,2,1372421540,NULL,'forum_enablerssfeeds','0',NULL),(629,2,1372421540,NULL,'forum_enabletimedposts','0',NULL),(630,2,1372421540,NULL,'glossary_entbypage','10',NULL),(631,2,1372421541,NULL,'glossary_dupentries','0',NULL),(632,2,1372421541,NULL,'glossary_allowcomments','0',NULL),(633,2,1372421541,NULL,'glossary_linkbydefault','1',NULL),(634,2,1372421541,NULL,'glossary_defaultapproval','1',NULL),(635,2,1372421541,NULL,'glossary_enablerssfeeds','0',NULL),(636,2,1372421541,NULL,'glossary_linkentries','0',NULL),(637,2,1372421541,NULL,'glossary_casesensitive','0',NULL),(638,2,1372421541,NULL,'glossary_fullmatch','0',NULL),(639,2,1372421541,'imscp','requiremodintro','1',NULL),(640,2,1372421541,'imscp','keepold','1',NULL),(641,2,1372421541,'imscp','keepold_adv','0',NULL),(642,2,1372421541,'label','dndmedia','1',NULL),(643,2,1372421541,'label','dndresizewidth','400',NULL),(644,2,1372421541,'label','dndresizeheight','400',NULL),(645,2,1372421542,NULL,'lesson_slideshowwidth','640',NULL),(646,2,1372421542,NULL,'lesson_slideshowheight','480',NULL),(647,2,1372421542,NULL,'lesson_slideshowbgcolor','#FFFFFF',NULL),(648,2,1372421542,NULL,'lesson_mediawidth','640',NULL),(649,2,1372421542,NULL,'lesson_mediaheight','480',NULL),(650,2,1372421542,NULL,'lesson_mediaclose','0',NULL),(651,2,1372421542,NULL,'lesson_maxhighscores','10',NULL),(652,2,1372421542,NULL,'lesson_maxanswers','4',NULL),(653,2,1372421542,NULL,'lesson_defaultnextpage','0',NULL),(654,2,1372421542,'page','requiremodintro','1',NULL),(655,2,1372421542,'page','displayoptions','5',NULL),(656,2,1372421542,'page','printheading','1',NULL),(657,2,1372421542,'page','printintro','0',NULL),(658,2,1372421542,'page','display','5',NULL),(659,2,1372421542,'page','popupwidth','620',NULL),(660,2,1372421543,'page','popupheight','450',NULL),(661,2,1372421543,'quiz','timelimit','0',NULL),(662,2,1372421543,'quiz','timelimit_adv','0',NULL),(663,2,1372421543,'quiz','overduehandling','autoabandon',NULL),(664,2,1372421543,'quiz','overduehandling_adv','0',NULL),(665,2,1372421543,'quiz','graceperiod','86400',NULL),(666,2,1372421543,'quiz','graceperiod_adv','0',NULL),(667,2,1372421543,'quiz','graceperiodmin','60',NULL),(668,2,1372421543,'quiz','attempts','0',NULL),(669,2,1372421543,'quiz','attempts_adv','0',NULL),(670,2,1372421544,'quiz','grademethod','1',NULL),(671,2,1372421544,'quiz','grademethod_adv','0',NULL),(672,2,1372421544,'quiz','maximumgrade','10',NULL),(673,2,1372421544,'quiz','shufflequestions','0',NULL),(674,2,1372421544,'quiz','shufflequestions_adv','0',NULL),(675,2,1372421544,'quiz','questionsperpage','1',NULL),(676,2,1372421544,'quiz','questionsperpage_adv','0',NULL),(677,2,1372421544,'quiz','navmethod','free',NULL),(678,2,1372421544,'quiz','navmethod_adv','1',NULL),(679,2,1372421545,'quiz','shuffleanswers','1',NULL),(680,2,1372421545,'quiz','shuffleanswers_adv','0',NULL),(681,2,1372421545,'quiz','preferredbehaviour','deferredfeedback',NULL),(682,2,1372421546,'quiz','attemptonlast','0',NULL),(683,2,1372421546,'quiz','attemptonlast_adv','1',NULL),(684,2,1372421546,'quiz','reviewattempt','69904',NULL),(685,2,1372421546,'quiz','reviewcorrectness','69904',NULL),(686,2,1372421546,'quiz','reviewmarks','69904',NULL),(687,2,1372421546,'quiz','reviewspecificfeedback','69904',NULL),(688,2,1372421546,'quiz','reviewgeneralfeedback','69904',NULL),(689,2,1372421546,'quiz','reviewrightanswer','69904',NULL),(690,2,1372421546,'quiz','reviewoverallfeedback','4368',NULL),(691,2,1372421546,'quiz','showuserpicture','0',NULL),(692,2,1372421546,'quiz','showuserpicture_adv','0',NULL),(693,2,1372421546,'quiz','decimalpoints','2',NULL),(694,2,1372421546,'quiz','decimalpoints_adv','0',NULL),(695,2,1372421546,'quiz','questiondecimalpoints','-1',NULL),(696,2,1372421547,'quiz','questiondecimalpoints_adv','1',NULL),(697,2,1372421547,'quiz','showblocks','0',NULL),(698,2,1372421547,'quiz','showblocks_adv','1',NULL),(699,2,1372421547,'quiz','password','',NULL),(700,2,1372421547,'quiz','password_adv','1',NULL),(701,2,1372421547,'quiz','subnet','',NULL),(702,2,1372421547,'quiz','subnet_adv','1',NULL),(703,2,1372421547,'quiz','delay1','0',NULL),(704,2,1372421547,'quiz','delay1_adv','1',NULL),(705,2,1372421547,'quiz','delay2','0',NULL),(706,2,1372421547,'quiz','delay2_adv','1',NULL),(707,2,1372421547,'quiz','browsersecurity','-',NULL),(708,2,1372421547,'quiz','browsersecurity_adv','1',NULL),(709,2,1372421548,'quiz','autosaveperiod','0',NULL),(710,2,1372421548,'resource','framesize','130',NULL),(711,2,1372421548,'resource','requiremodintro','1',NULL),(712,2,1372421548,'resource','displayoptions','0,1,4,5,6',NULL),(713,2,1372421548,'resource','printheading','0',NULL),(714,2,1372421548,'resource','printintro','1',NULL),(715,2,1372421549,'resource','display','0',NULL),(716,2,1372421549,'resource','showsize','0',NULL),(717,2,1372421549,'resource','showtype','0',NULL),(718,2,1372421549,'resource','popupwidth','620',NULL),(719,2,1372421549,'resource','popupheight','450',NULL),(720,2,1372421549,'resource','filterfiles','0',NULL),(721,2,1372421549,'scorm','displaycoursestructure','0',NULL),(722,2,1372421549,'scorm','displaycoursestructure_adv','0',NULL),(723,2,1372421549,'scorm','popup','0',NULL),(724,2,1372421549,'scorm','popup_adv','0',NULL),(725,2,1372421549,'scorm','framewidth','100',NULL),(726,2,1372421549,'scorm','framewidth_adv','1',NULL),(727,2,1372421549,'scorm','frameheight','500',NULL),(728,2,1372421550,'scorm','frameheight_adv','1',NULL),(729,2,1372421550,'scorm','winoptgrp_adv','1',NULL),(730,2,1372421550,'scorm','resizable','0',NULL),(731,2,1372421550,'scorm','scrollbars','0',NULL),(732,2,1372421550,'scorm','directories','0',NULL),(733,2,1372421550,'scorm','location','0',NULL),(734,2,1372421550,'scorm','menubar','0',NULL),(735,2,1372421550,'scorm','toolbar','0',NULL),(736,2,1372421550,'scorm','status','0',NULL),(737,2,1372421550,'scorm','skipview','0',NULL),(738,2,1372421550,'scorm','skipview_adv','1',NULL),(739,2,1372421550,'scorm','hidebrowse','0',NULL),(740,2,1372421551,'scorm','hidebrowse_adv','1',NULL),(741,2,1372421551,'scorm','hidetoc','0',NULL),(742,2,1372421551,'scorm','hidetoc_adv','1',NULL),(743,2,1372421551,'scorm','hidenav','0',NULL),(744,2,1372421551,'scorm','hidenav_adv','0',NULL),(745,2,1372421551,'scorm','displayattemptstatus','1',NULL),(746,2,1372421551,'scorm','displayattemptstatus_adv','0',NULL),(747,2,1372421551,'scorm','grademethod','1',NULL),(748,2,1372421551,'scorm','maxgrade','100',NULL),(749,2,1372421551,'scorm','maxattempt','0',NULL),(750,2,1372421551,'scorm','whatgrade','0',NULL),(751,2,1372421551,'scorm','forcecompleted','0',NULL),(752,2,1372421551,'scorm','forcenewattempt','0',NULL),(753,2,1372421551,'scorm','lastattemptlock','0',NULL),(754,2,1372421552,'scorm','auto','0',NULL),(755,2,1372421552,'scorm','updatefreq','0',NULL),(756,2,1372421552,'scorm','allowtypeexternal','0',NULL),(757,2,1372421552,'scorm','allowtypelocalsync','0',NULL),(758,2,1372421552,'scorm','allowtypeimsrepository','0',NULL),(759,2,1372421552,'scorm','allowtypeexternalaicc','0',NULL),(760,2,1372421552,'scorm','allowaicchacp','0',NULL),(761,2,1372421552,'scorm','aicchacptimeout','30',NULL),(762,2,1372421552,'scorm','aicchacpkeepsessiondata','1',NULL),(763,2,1372421552,'scorm','forcejavascript','1',NULL),(764,2,1372421552,'scorm','allowapidebug','0',NULL),(765,2,1372421552,'scorm','apidebugmask','.*',NULL),(766,2,1372421553,'url','framesize','130',NULL),(767,2,1372421553,'url','requiremodintro','1',NULL),(768,2,1372421553,'url','secretphrase','',NULL),(769,2,1372421553,'url','rolesinparams','0',NULL),(770,2,1372421553,'url','displayoptions','0,1,5,6',NULL),(771,2,1372421553,'url','printheading','0',NULL),(772,2,1372421554,'url','printintro','1',NULL),(773,2,1372421554,'url','display','0',NULL),(774,2,1372421554,'url','popupwidth','620',NULL),(775,2,1372421554,'url','popupheight','450',NULL),(776,2,1372421554,'workshop','grade','80',NULL),(777,2,1372421554,'workshop','gradinggrade','20',NULL),(778,2,1372421554,'workshop','gradedecimals','0',NULL),(779,2,1372421555,'workshop','maxbytes','0',NULL),(780,2,1372421555,'workshop','strategy','accumulative',NULL),(781,2,1372421555,'workshop','examplesmode','0',NULL),(782,2,1372421555,'workshopallocation_random','numofreviews','5',NULL),(783,2,1372421555,'workshopform_numerrors','grade0','Нет',NULL),(784,2,1372421555,'workshopform_numerrors','grade1','Да',NULL),(785,2,1372421555,'workshopeval_best','comparison','5',NULL),(786,2,1372421555,'assignsubmission_comments','default','0',NULL),(787,2,1372421555,'assignsubmission_onlinetext','default','0',NULL),(788,2,1372421555,'assignsubmission_file','default','1',NULL),(789,2,1372421555,'assignsubmission_file','maxbytes','1048576',NULL),(790,2,1372421556,'assignfeedback_offline','default','0',NULL),(791,2,1372421556,'assignfeedback_comments','default','1',NULL),(792,2,1372421556,'assignfeedback_file','default','0',NULL),(793,2,1372421556,NULL,'smtphosts','',NULL),(794,2,1372421557,NULL,'smtpsecure','',NULL),(795,2,1372421557,NULL,'smtpuser','',NULL),(796,2,1372421557,NULL,'smtppass','',NULL),(797,2,1372421557,NULL,'smtpmaxbulk','1',NULL),(798,2,1372421557,NULL,'noreplyaddress','noreply@localhost.com',NULL),(799,2,1372421557,NULL,'sitemailcharset','0',NULL),(800,2,1372421557,NULL,'allowusermailcharset','0',NULL),(801,2,1372421557,NULL,'mailnewline','LF',NULL),(802,2,1372421557,NULL,'jabberhost','',NULL),(803,2,1372421557,NULL,'jabberserver','',NULL),(804,2,1372421557,NULL,'jabberusername','',NULL),(805,2,1372421557,NULL,'jabberpassword','',NULL),(806,2,1372421557,NULL,'jabberport','5222',NULL),(807,2,1372421558,'enrol_cohort','roleid','5',NULL),(808,2,1372421558,'enrol_cohort','unenrolaction','0',NULL),(809,2,1372421558,'enrol_database','defaultrole','5',NULL),(810,2,1372421558,'enrol_database','defaultcategory','1',NULL),(811,2,1372421558,'enrol_imsenterprise','imsrolemap01','5',NULL),(812,2,1372421558,'enrol_imsenterprise','imsrolemap02','3',NULL),(813,2,1372421558,'enrol_imsenterprise','imsrolemap03','3',NULL),(814,2,1372421558,'enrol_imsenterprise','imsrolemap04','5',NULL),(815,2,1372421558,'enrol_imsenterprise','imsrolemap05','0',NULL),(816,2,1372421558,'enrol_imsenterprise','imsrolemap06','4',NULL),(817,2,1372421559,'enrol_imsenterprise','imsrolemap07','0',NULL),(818,2,1372421559,'enrol_imsenterprise','imsrolemap08','4',NULL),(819,2,1372421559,'enrol_imsenterprise','imscoursemapshortname','coursecode',NULL),(820,2,1372421559,'enrol_imsenterprise','imscoursemapfullname','short',NULL),(821,2,1372421559,'enrol_imsenterprise','imscoursemapsummary','ignore',NULL),(822,2,1372421559,'enrol_ldap','category','1',NULL),(823,2,1372421560,'enrol_manual','roleid','5',NULL),(824,2,1372421560,'enrol_meta','nosyncroleids','',NULL),(825,2,1372421560,'enrol_meta','syncall','1',NULL),(826,2,1372421560,'enrol_meta','unenrolaction','3',NULL),(827,2,1372421560,'enrol_mnet','roleid','5',NULL),(828,2,1372421560,'enrol_mnet','roleid_adv','1',NULL),(829,2,1372421560,'enrol_paypal','roleid','5',NULL),(830,2,1372421560,'enrol_self','roleid','5',NULL),(831,2,1372421560,NULL,'profileroles','5,4,3',NULL),(832,2,1372421560,NULL,'coursecontact','3',NULL),(833,2,1372421560,NULL,'frontpage','6',NULL),(834,2,1372421560,NULL,'frontpageloggedin','6',NULL),(835,2,1372421561,NULL,'maxcategorydepth','2',NULL),(836,2,1372421561,NULL,'frontpagecourselimit','200',NULL),(837,2,1372421561,NULL,'commentsperpage','15',NULL),(838,2,1372421561,NULL,'defaultfrontpageroleid','8',NULL),(839,2,1372421561,NULL,'supportname','Администратор Пользователь',NULL),(840,2,1372421561,NULL,'supportemail','groundsale@yandex.ru',NULL),(841,2,1372421702,NULL,'registerauth','email',NULL),(842,2,1372423207,'enrol_payanyway','paymentserver','demo.moneta.ru',NULL),(843,2,1372423207,'enrol_payanyway','mntid','89790689',NULL),(844,2,1372423207,'enrol_payanyway','mntdataintegritycode','12345',NULL),(845,2,1372423207,'enrol_payanyway','mnttestmode','1',NULL),(846,2,1372423207,'enrol_payanyway','payanywaylogin','k.kaplin@s-zl.ru',NULL),(847,2,1372423207,'enrol_payanyway','payanywaypassword','qazxc123',NULL),(848,2,1372423207,'enrol_payanyway','defaultenrol','1',NULL),(849,2,1372423207,'enrol_payanyway','status','0',NULL),(850,2,1372423207,'enrol_payanyway','cost','0',NULL),(851,2,1372423207,'enrol_payanyway','currency','RUB',NULL),(852,2,1372423207,'enrol_payanyway','roleid','5',NULL),(853,2,1372423207,'enrol_payanyway','enrolperiod','0',NULL),(854,2,1372432493,NULL,'sessioncookiepath','/','');
/*!40000 ALTER TABLE `mdl_config_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_config_plugins`
--

LOCK TABLES `mdl_config_plugins` WRITE;
/*!40000 ALTER TABLE `mdl_config_plugins` DISABLE KEYS */;
INSERT INTO `mdl_config_plugins` VALUES (1,'moodlecourse','visible','1'),(2,'moodlecourse','format','weeks'),(3,'moodlecourse','maxsections','52'),(4,'moodlecourse','numsections','10'),(5,'moodlecourse','hiddensections','0'),(6,'moodlecourse','coursedisplay','0'),(7,'moodlecourse','lang',''),(8,'moodlecourse','newsitems','5'),(9,'moodlecourse','showgrades','1'),(10,'moodlecourse','showreports','0'),(11,'moodlecourse','maxbytes','0'),(12,'moodlecourse','enablecompletion','0'),(13,'moodlecourse','groupmode','0'),(14,'moodlecourse','groupmodeforce','0'),(15,'backup','loglifetime','30'),(16,'backup','backup_general_users','1'),(17,'backup','backup_general_users_locked','0'),(18,'backup','backup_general_anonymize','0'),(19,'backup','backup_general_anonymize_locked','0'),(20,'backup','backup_general_role_assignments','1'),(21,'backup','backup_general_role_assignments_locked','0'),(22,'backup','backup_general_activities','1'),(23,'backup','backup_general_activities_locked','0'),(24,'backup','backup_general_blocks','1'),(25,'backup','backup_general_blocks_locked','0'),(26,'backup','backup_general_filters','1'),(27,'backup','backup_general_filters_locked','0'),(28,'backup','backup_general_comments','1'),(29,'backup','backup_general_comments_locked','0'),(30,'backup','backup_general_userscompletion','1'),(31,'backup','backup_general_userscompletion_locked','0'),(32,'backup','backup_general_logs','0'),(33,'backup','backup_general_logs_locked','0'),(34,'backup','backup_general_histories','0'),(35,'backup','backup_general_histories_locked','0'),(36,'backup','import_general_maxresults','10'),(37,'backup','backup_auto_active','0'),(38,'backup','backup_auto_weekdays','0000000'),(39,'backup','backup_auto_hour','0'),(40,'backup','backup_auto_minute','0'),(41,'backup','backup_auto_storage','0'),(42,'backup','backup_auto_destination',''),(43,'backup','backup_auto_keep','1'),(44,'backup','backup_shortname','0'),(45,'backup','backup_auto_skip_hidden','1'),(46,'backup','backup_auto_skip_modif_days','30'),(47,'backup','backup_auto_skip_modif_prev','0'),(48,'backup','backup_auto_users','1'),(49,'backup','backup_auto_role_assignments','1'),(50,'backup','backup_auto_activities','1'),(51,'backup','backup_auto_blocks','1'),(52,'backup','backup_auto_filters','1'),(53,'backup','backup_auto_comments','1'),(54,'backup','backup_auto_userscompletion','1'),(55,'backup','backup_auto_logs','0'),(56,'backup','backup_auto_histories','0'),(57,'block_course_overview','defaultmaxcourses','10'),(58,'block_course_overview','forcedefaultmaxcourses','0'),(59,'block_course_overview','showchildren','0'),(60,'block_course_overview','showwelcomearea','0'),(61,'block_section_links','numsections1','22'),(62,'block_section_links','incby1','2'),(63,'block_section_links','numsections2','40'),(64,'block_section_links','incby2','5'),(65,'enrol_database','dbtype',''),(66,'enrol_database','dbhost','localhost'),(67,'enrol_database','dbuser',''),(68,'enrol_database','dbpass',''),(69,'enrol_database','dbname',''),(70,'enrol_database','dbencoding','utf-8'),(71,'enrol_database','dbsetupsql',''),(72,'enrol_database','dbsybasequoting','0'),(73,'enrol_database','debugdb','0'),(74,'enrol_database','localcoursefield','idnumber'),(75,'enrol_database','localuserfield','idnumber'),(76,'enrol_database','localrolefield','shortname'),(77,'enrol_database','localcategoryfield','id'),(78,'enrol_database','remoteenroltable',''),(79,'enrol_database','remotecoursefield',''),(80,'enrol_database','remoteuserfield',''),(81,'enrol_database','remoterolefield',''),(82,'enrol_database','ignorehiddencourses','0'),(83,'enrol_database','unenrolaction','0'),(84,'enrol_database','newcoursetable',''),(85,'enrol_database','newcoursefullname','fullname'),(86,'enrol_database','newcourseshortname','shortname'),(87,'enrol_database','newcourseidnumber','idnumber'),(88,'enrol_database','newcoursecategory',''),(89,'enrol_database','templatecourse',''),(90,'enrol_flatfile','location',''),(91,'enrol_flatfile','encoding','UTF-8'),(92,'enrol_flatfile','mailstudents','0'),(93,'enrol_flatfile','mailteachers','0'),(94,'enrol_flatfile','mailadmins','0'),(95,'enrol_flatfile','unenrolaction','3'),(96,'enrol_flatfile','expiredaction','3'),(97,'enrol_guest','requirepassword','0'),(98,'enrol_guest','usepasswordpolicy','0'),(99,'enrol_guest','showhint','0'),(100,'enrol_guest','defaultenrol','1'),(101,'enrol_guest','status','1'),(102,'enrol_guest','status_adv','0'),(103,'enrol_imsenterprise','imsfilelocation',''),(104,'enrol_imsenterprise','logtolocation',''),(105,'enrol_imsenterprise','mailadmins','0'),(106,'enrol_imsenterprise','createnewusers','0'),(107,'enrol_imsenterprise','imsdeleteusers','0'),(108,'enrol_imsenterprise','fixcaseusernames','0'),(109,'enrol_imsenterprise','fixcasepersonalnames','0'),(110,'enrol_imsenterprise','imssourcedidfallback','0'),(111,'enrol_imsenterprise','truncatecoursecodes','0'),(112,'enrol_imsenterprise','createnewcourses','0'),(113,'enrol_imsenterprise','createnewcategories','0'),(114,'enrol_imsenterprise','imsunenrol','0'),(115,'enrol_imsenterprise','imsrestricttarget',''),(116,'enrol_imsenterprise','imscapitafix','0'),(117,'enrol_ldap','host_url',''),(118,'enrol_ldap','start_tls','0'),(119,'enrol_ldap','ldap_version','3'),(120,'enrol_ldap','ldapencoding','utf-8'),(121,'enrol_ldap','pagesize','250'),(122,'enrol_ldap','bind_dn',''),(123,'enrol_ldap','bind_pw',''),(124,'enrol_ldap','course_search_sub','0'),(125,'enrol_ldap','memberattribute_isdn','0'),(126,'enrol_ldap','user_contexts',''),(127,'enrol_ldap','user_search_sub','0'),(128,'enrol_ldap','user_type','default'),(129,'enrol_ldap','opt_deref','0'),(130,'enrol_ldap','idnumber_attribute',''),(131,'enrol_ldap','objectclass','(objectClass=*)'),(132,'enrol_ldap','course_idnumber',''),(133,'enrol_ldap','course_shortname',''),(134,'enrol_ldap','course_fullname',''),(135,'enrol_ldap','course_summary',''),(136,'enrol_ldap','ignorehiddencourses','0'),(137,'enrol_ldap','unenrolaction','0'),(138,'enrol_ldap','autocreate','0'),(139,'enrol_ldap','template',''),(140,'enrol_ldap','nested_groups','0'),(141,'enrol_ldap','group_memberofattribute',''),(142,'enrol_manual','expiredaction','1'),(143,'enrol_manual','expirynotifyhour','6'),(144,'enrol_manual','defaultenrol','1'),(145,'enrol_manual','status','0'),(146,'enrol_manual','enrolperiod','0'),(147,'enrol_manual','expirynotify','0'),(148,'enrol_manual','expirythreshold','86400'),(149,'enrol_paypal','paypalbusiness',''),(150,'enrol_paypal','mailstudents','0'),(151,'enrol_paypal','mailteachers','0'),(152,'enrol_paypal','mailadmins','0'),(153,'enrol_paypal','expiredaction','3'),(154,'enrol_paypal','status','1'),(155,'enrol_paypal','cost','0'),(156,'enrol_paypal','currency','USD'),(157,'enrol_paypal','enrolperiod','0'),(158,'enrol_self','requirepassword','0'),(159,'enrol_self','usepasswordpolicy','0'),(160,'enrol_self','showhint','0'),(161,'enrol_self','expiredaction','1'),(162,'enrol_self','expirynotifyhour','6'),(163,'enrol_self','defaultenrol','1'),(164,'enrol_self','status','1'),(165,'enrol_self','newenrols','1'),(166,'enrol_self','groupkey','0'),(167,'enrol_self','enrolperiod','0'),(168,'enrol_self','expirynotify','0'),(169,'enrol_self','expirythreshold','86400'),(170,'enrol_self','longtimenosee','0'),(171,'enrol_self','maxenrolled','0'),(172,'enrol_self','sendcoursewelcomemessage','1'),(173,'editor_tinymce','customtoolbar','fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code'),(174,'editor_tinymce','fontselectlist','Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),(175,'editor_tinymce','customconfig',''),(176,'tinymce_dragmath','requiretex','1'),(177,'tinymce_moodleemoticon','requireemoticon','1'),(178,'tinymce_spellchecker','spellengine','GoogleSpell'),(179,'tinymce_spellchecker','spelllanguagelist','+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),(180,'filter_emoticon','formats','1,4,0'),(181,'filter_urltolink','formats','0'),(182,'filter_urltolink','embedimages','1'),(183,'question_preview','behaviour','deferredfeedback'),(184,'question_preview','correctness','1'),(185,'question_preview','marks','1'),(186,'question_preview','markdp','2'),(187,'question_preview','feedback','1'),(188,'question_preview','generalfeedback','1'),(189,'question_preview','rightanswer','1'),(190,'question_preview','history','0'),(191,'cachestore_memcache','testservers',''),(192,'cachestore_memcached','testservers',''),(193,'cachestore_mongodb','testserver',''),(194,'theme_afterburner','logo',''),(195,'theme_afterburner','footnote',''),(196,'theme_afterburner','customcss',''),(197,'theme_anomaly','tagline',''),(198,'theme_anomaly','customcss',''),(199,'theme_arialist','logo',''),(200,'theme_arialist','tagline',''),(201,'theme_arialist','linkcolor','#f25f0f'),(202,'theme_arialist','regionwidth','250'),(203,'theme_arialist','customcss',''),(204,'theme_brick','logo',''),(205,'theme_brick','linkcolor','#06365b'),(206,'theme_brick','linkhover','#5487ad'),(207,'theme_brick','maincolor','#8e2800'),(208,'theme_brick','maincolorlink','#fff0a5'),(209,'theme_brick','headingcolor','#5c3500'),(210,'theme_clean','invert','0'),(211,'theme_clean','logo',''),(212,'theme_clean','customcss',''),(213,'theme_clean','footnote',''),(214,'theme_formal_white','fontsizereference','13'),(215,'theme_formal_white','noframe','0'),(216,'theme_formal_white','framemargin','15'),(217,'theme_formal_white','headercontent','1'),(218,'theme_formal_white','customlogourl',''),(219,'theme_formal_white','frontpagelogourl',''),(220,'theme_formal_white','headerbgc','#E3DFD4'),(221,'theme_formal_white','creditstomoodleorg','2'),(222,'theme_formal_white','blockcolumnwidth','200'),(223,'theme_formal_white','blockpadding','8'),(224,'theme_formal_white','blockcontentbgc','#F6F6F6'),(225,'theme_formal_white','lblockcolumnbgc','#E3DFD4'),(226,'theme_formal_white','rblockcolumnbgc',''),(227,'theme_formal_white','footnote',''),(228,'theme_formal_white','customcss',''),(229,'theme_fusion','linkcolor','#2d83d5'),(230,'theme_fusion','tagline',''),(231,'theme_fusion','footertext',''),(232,'theme_fusion','customcss',''),(233,'theme_magazine','background',''),(234,'theme_magazine','logo',''),(235,'theme_magazine','linkcolor','#32529a'),(236,'theme_magazine','linkhover','#4e2300'),(237,'theme_magazine','maincolor','#002f2f'),(238,'theme_magazine','maincoloraccent','#092323'),(239,'theme_magazine','headingcolor','#4e0000'),(240,'theme_magazine','blockcolor','#002f2f'),(241,'theme_magazine','forumback','#e6e2af'),(242,'theme_mymobile','colourswatch','light'),(243,'theme_mymobile','showmobileintro',''),(244,'theme_mymobile','showsitetopic','topicshow'),(245,'theme_mymobile','showfullsizeimages','ithumb'),(246,'theme_mymobile','usetableview','tabshow'),(247,'theme_mymobile','customcss',''),(248,'theme_nimble','tagline',''),(249,'theme_nimble','footerline',''),(250,'theme_nimble','backgroundcolor','#454545'),(251,'theme_nimble','linkcolor','#2a65b1'),(252,'theme_nimble','linkhover','#222222'),(253,'theme_nonzero','regionprewidth','200'),(254,'theme_nonzero','regionpostwidth','200'),(255,'theme_nonzero','customcss',''),(256,'theme_overlay','linkcolor','#428ab5'),(257,'theme_overlay','headercolor','#2a4c7b'),(258,'theme_overlay','footertext',''),(259,'theme_overlay','customcss',''),(260,'theme_sky_high','logo',''),(261,'theme_sky_high','regionwidth','240'),(262,'theme_sky_high','footnote',''),(263,'theme_sky_high','customcss',''),(264,'theme_splash','logo',''),(265,'theme_splash','tagline','Virtual learning center'),(266,'theme_splash','hide_tagline','0'),(267,'theme_splash','footnote',''),(268,'theme_splash','customcss',''),(269,'qtype_calculated','version','2013050100'),(270,'qtype_calculatedmulti','version','2013050100'),(271,'qtype_calculatedsimple','version','2013050100'),(272,'qtype_description','version','2013050100'),(273,'qtype_essay','version','2013050100'),(274,'qtype_match','version','2013050100'),(275,'qtype_missingtype','version','2013050100'),(276,'qtype_multianswer','version','2013050100'),(277,'qtype_multichoice','version','2013050100'),(278,'qtype_numerical','version','2013050100'),(279,'qtype_random','version','2013050100'),(280,'qtype_randomsamatch','version','2013050100'),(281,'qtype_shortanswer','version','2013050100'),(282,'qtype_truefalse','version','2013050100'),(291,'auth_cas','version','2013052100'),(293,'auth_db','version','2013050100'),(295,'auth_email','version','2013050100'),(296,'auth_fc','version','2013050100'),(298,'auth_imap','version','2013050100'),(300,'auth_ldap','version','2013052100'),(302,'auth_manual','version','2013050100'),(303,'auth_mnet','version','2013050100'),(305,'auth_nntp','version','2013050100'),(307,'auth_nologin','version','2013050100'),(308,'auth_none','version','2013050100'),(309,'auth_pam','version','2013050100'),(311,'auth_pop3','version','2013050100'),(313,'auth_radius','version','2013050100'),(315,'auth_shibboleth','version','2013050100'),(317,'auth_webservice','version','2013050100'),(318,'enrol_authorize','version','2013050100'),(319,'enrol_category','version','2013050100'),(321,'enrol_cohort','version','2013050100'),(322,'enrol_database','version','2013050100'),(324,'enrol_flatfile','version','2013050100'),(326,'enrol_flatfile','map_1','manager'),(327,'enrol_flatfile','map_2','coursecreator'),(328,'enrol_flatfile','map_3','editingteacher'),(329,'enrol_flatfile','map_4','teacher'),(330,'enrol_flatfile','map_5','student'),(331,'enrol_flatfile','map_6','guest'),(332,'enrol_flatfile','map_7','user'),(333,'enrol_flatfile','map_8','frontpage'),(334,'enrol_guest','version','2013050100'),(335,'enrol_imsenterprise','version','2013050100'),(337,'enrol_ldap','version','2013050100'),(339,'enrol_manual','version','2013050100'),(341,'enrol_meta','version','2013050100'),(343,'enrol_mnet','version','2013050100'),(344,'enrol_paypal','version','2013050100'),(345,'enrol_self','version','2013050100'),(347,'message_email','version','2013050100'),(349,'message','email_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(350,'message','message_provider_enrol_authorize_authorize_enrolment_loggedin','email'),(351,'message','message_provider_enrol_authorize_authorize_enrolment_loggedoff','email'),(352,'message','email_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(353,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedin','email'),(354,'message','message_provider_enrol_flatfile_flatfile_enrolment_loggedoff','email'),(355,'message','email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(356,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin','email'),(357,'message','message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff','email'),(358,'message','email_provider_enrol_manual_expiry_notification_permitted','permitted'),(359,'message','message_provider_enrol_manual_expiry_notification_loggedin','email'),(360,'message','message_provider_enrol_manual_expiry_notification_loggedoff','email'),(361,'message','email_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(362,'message','message_provider_enrol_paypal_paypal_enrolment_loggedin','email'),(363,'message','message_provider_enrol_paypal_paypal_enrolment_loggedoff','email'),(364,'message','email_provider_enrol_self_expiry_notification_permitted','permitted'),(365,'message','message_provider_enrol_self_expiry_notification_loggedin','email'),(366,'message','message_provider_enrol_self_expiry_notification_loggedoff','email'),(367,'message','email_provider_mod_assign_assign_notification_permitted','permitted'),(368,'message','message_provider_mod_assign_assign_notification_loggedin','email'),(369,'message','message_provider_mod_assign_assign_notification_loggedoff','email'),(370,'message','email_provider_mod_assignment_assignment_updates_permitted','permitted'),(371,'message','message_provider_mod_assignment_assignment_updates_loggedin','email'),(372,'message','message_provider_mod_assignment_assignment_updates_loggedoff','email'),(373,'message','email_provider_mod_feedback_submission_permitted','permitted'),(374,'message','message_provider_mod_feedback_submission_loggedin','email'),(375,'message','message_provider_mod_feedback_submission_loggedoff','email'),(376,'message','email_provider_mod_feedback_message_permitted','permitted'),(377,'message','message_provider_mod_feedback_message_loggedin','email'),(378,'message','message_provider_mod_feedback_message_loggedoff','email'),(379,'message','email_provider_mod_forum_posts_permitted','permitted'),(380,'message','message_provider_mod_forum_posts_loggedin','email'),(381,'message','message_provider_mod_forum_posts_loggedoff','email'),(382,'message','email_provider_mod_lesson_graded_essay_permitted','permitted'),(383,'message','message_provider_mod_lesson_graded_essay_loggedin','email'),(384,'message','message_provider_mod_lesson_graded_essay_loggedoff','email'),(385,'message','email_provider_mod_quiz_submission_permitted','permitted'),(386,'message','message_provider_mod_quiz_submission_loggedin','email'),(387,'message','message_provider_mod_quiz_submission_loggedoff','email'),(388,'message','email_provider_mod_quiz_confirmation_permitted','permitted'),(389,'message','message_provider_mod_quiz_confirmation_loggedin','email'),(390,'message','message_provider_mod_quiz_confirmation_loggedoff','email'),(391,'message','email_provider_mod_quiz_attempt_overdue_permitted','permitted'),(392,'message','message_provider_mod_quiz_attempt_overdue_loggedin','email'),(393,'message','message_provider_mod_quiz_attempt_overdue_loggedoff','email'),(394,'message','email_provider_moodle_notices_permitted','permitted'),(395,'message','message_provider_moodle_notices_loggedin','email'),(396,'message','message_provider_moodle_notices_loggedoff','email'),(397,'message','email_provider_moodle_errors_permitted','permitted'),(398,'message','message_provider_moodle_errors_loggedin','email'),(399,'message','message_provider_moodle_errors_loggedoff','email'),(400,'message','email_provider_moodle_availableupdate_permitted','permitted'),(401,'message','message_provider_moodle_availableupdate_loggedin','email'),(402,'message','message_provider_moodle_availableupdate_loggedoff','email'),(403,'message','email_provider_moodle_instantmessage_permitted','permitted'),(404,'message','message_provider_moodle_instantmessage_loggedoff','popup,email'),(405,'message','email_provider_moodle_backup_permitted','permitted'),(406,'message','message_provider_moodle_backup_loggedin','email'),(407,'message','message_provider_moodle_backup_loggedoff','email'),(408,'message','email_provider_moodle_courserequested_permitted','permitted'),(409,'message','message_provider_moodle_courserequested_loggedin','email'),(410,'message','message_provider_moodle_courserequested_loggedoff','email'),(411,'message','email_provider_moodle_courserequestapproved_permitted','permitted'),(412,'message','message_provider_moodle_courserequestapproved_loggedin','email'),(413,'message','message_provider_moodle_courserequestapproved_loggedoff','email'),(414,'message','email_provider_moodle_courserequestrejected_permitted','permitted'),(415,'message','message_provider_moodle_courserequestrejected_loggedin','email'),(416,'message','message_provider_moodle_courserequestrejected_loggedoff','email'),(417,'message_jabber','version','2013050100'),(419,'message','jabber_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(420,'message','jabber_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(421,'message','jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(422,'message','jabber_provider_enrol_manual_expiry_notification_permitted','permitted'),(423,'message','jabber_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(424,'message','jabber_provider_enrol_self_expiry_notification_permitted','permitted'),(425,'message','jabber_provider_mod_assign_assign_notification_permitted','permitted'),(426,'message','jabber_provider_mod_assignment_assignment_updates_permitted','permitted'),(427,'message','jabber_provider_mod_feedback_submission_permitted','permitted'),(428,'message','jabber_provider_mod_feedback_message_permitted','permitted'),(429,'message','jabber_provider_mod_forum_posts_permitted','permitted'),(430,'message','jabber_provider_mod_lesson_graded_essay_permitted','permitted'),(431,'message','jabber_provider_mod_quiz_submission_permitted','permitted'),(432,'message','jabber_provider_mod_quiz_confirmation_permitted','permitted'),(433,'message','jabber_provider_mod_quiz_attempt_overdue_permitted','permitted'),(434,'message','jabber_provider_moodle_notices_permitted','permitted'),(435,'message','jabber_provider_moodle_errors_permitted','permitted'),(436,'message','jabber_provider_moodle_availableupdate_permitted','permitted'),(437,'message','jabber_provider_moodle_instantmessage_permitted','permitted'),(438,'message','jabber_provider_moodle_backup_permitted','permitted'),(439,'message','jabber_provider_moodle_courserequested_permitted','permitted'),(440,'message','jabber_provider_moodle_courserequestapproved_permitted','permitted'),(441,'message','jabber_provider_moodle_courserequestrejected_permitted','permitted'),(442,'message_popup','version','2013050100'),(444,'message','popup_provider_enrol_authorize_authorize_enrolment_permitted','permitted'),(445,'message','popup_provider_enrol_flatfile_flatfile_enrolment_permitted','permitted'),(446,'message','popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted','permitted'),(447,'message','popup_provider_enrol_manual_expiry_notification_permitted','permitted'),(448,'message','popup_provider_enrol_paypal_paypal_enrolment_permitted','permitted'),(449,'message','popup_provider_enrol_self_expiry_notification_permitted','permitted'),(450,'message','popup_provider_mod_assign_assign_notification_permitted','permitted'),(451,'message','popup_provider_mod_assignment_assignment_updates_permitted','permitted'),(452,'message','popup_provider_mod_feedback_submission_permitted','permitted'),(453,'message','popup_provider_mod_feedback_message_permitted','permitted'),(454,'message','popup_provider_mod_forum_posts_permitted','permitted'),(455,'message','popup_provider_mod_lesson_graded_essay_permitted','permitted'),(456,'message','popup_provider_mod_quiz_submission_permitted','permitted'),(457,'message','popup_provider_mod_quiz_confirmation_permitted','permitted'),(458,'message','popup_provider_mod_quiz_attempt_overdue_permitted','permitted'),(459,'message','popup_provider_moodle_notices_permitted','permitted'),(460,'message','popup_provider_moodle_errors_permitted','permitted'),(461,'message','popup_provider_moodle_availableupdate_permitted','permitted'),(462,'message','popup_provider_moodle_instantmessage_permitted','permitted'),(463,'message','message_provider_moodle_instantmessage_loggedin','popup'),(464,'message','popup_provider_moodle_backup_permitted','permitted'),(465,'message','popup_provider_moodle_courserequested_permitted','permitted'),(466,'message','popup_provider_moodle_courserequestapproved_permitted','permitted'),(467,'message','popup_provider_moodle_courserequestrejected_permitted','permitted'),(469,'filter_activitynames','version','2013050100'),(471,'filter_algebra','version','2013050100'),(472,'filter_censor','version','2013050100'),(473,'filter_data','version','2013050100'),(475,'filter_emailprotect','version','2013050100'),(476,'filter_emoticon','version','2013050100'),(477,'filter_glossary','version','2013050100'),(479,'filter_mediaplugin','version','2013050100'),(481,'filter_multilang','version','2013050100'),(482,'filter_tex','version','2013050100'),(484,'filter_tidy','version','2013050100'),(485,'filter_urltolink','version','2013050100'),(486,'editor_textarea','version','2013050100'),(487,'editor_tinymce','version','2013050100'),(488,'format_scorm','version','2013050100'),(489,'format_social','version','2013050100'),(490,'format_topics','version','2013050100'),(491,'format_weeks','version','2013050100'),(492,'profilefield_checkbox','version','2013050100'),(493,'profilefield_datetime','version','2013050100'),(494,'profilefield_menu','version','2013050100'),(495,'profilefield_text','version','2013050100'),(496,'profilefield_textarea','version','2013050100'),(497,'report_backups','version','2013050100'),(498,'report_completion','version','2013050100'),(500,'report_configlog','version','2013050100'),(501,'report_courseoverview','version','2013050100'),(502,'report_log','version','2013050100'),(504,'report_loglive','version','2013050100'),(505,'report_outline','version','2013050100'),(507,'report_participation','version','2013050100'),(509,'report_performance','version','2013050100'),(510,'report_progress','version','2013050100'),(512,'report_questioninstances','version','2013050100'),(513,'report_security','version','2013050100'),(514,'report_stats','version','2013050100'),(516,'gradeexport_ods','version','2013050100'),(517,'gradeexport_txt','version','2013050100'),(518,'gradeexport_xls','version','2013050100'),(519,'gradeexport_xml','version','2013050100'),(520,'gradeimport_csv','version','2013050100'),(521,'gradeimport_xml','version','2013050100'),(522,'gradereport_grader','version','2013050100'),(523,'gradereport_outcomes','version','2013050100'),(524,'gradereport_overview','version','2013050100'),(525,'gradereport_user','version','2013050100'),(526,'gradingform_guide','version','2013050100'),(527,'gradingform_rubric','version','2013050100'),(528,'mnetservice_enrol','version','2013050100'),(529,'webservice_amf','version','2013050100'),(530,'webservice_rest','version','2013050100'),(531,'webservice_soap','version','2013050100'),(532,'webservice_xmlrpc','version','2013050100'),(533,'repository_alfresco','version','2013050100'),(534,'repository_boxnet','version','2013050100'),(535,'repository_coursefiles','version','2013050100'),(536,'repository_dropbox','version','2013050100'),(537,'repository_equella','version','2013050100'),(538,'repository_filesystem','version','2013050100'),(539,'repository_flickr','version','2013050100'),(540,'repository_flickr_public','version','2013050100'),(541,'repository_googledocs','version','2013050100'),(542,'repository_local','version','2013050100'),(544,'local','enablecourseinstances','0'),(545,'local','enableuserinstances','0'),(546,'repository_merlot','version','2013050100'),(547,'repository_picasa','version','2013050100'),(548,'repository_recent','version','2013050100'),(550,'recent','enablecourseinstances','0'),(551,'recent','enableuserinstances','0'),(552,'repository_s3','version','2013050100'),(553,'repository_upload','version','2013050100'),(555,'upload','enablecourseinstances','0'),(556,'upload','enableuserinstances','0'),(557,'repository_url','version','2013050100'),(559,'url','enablecourseinstances','0'),(560,'url','enableuserinstances','0'),(561,'repository_user','version','2013050100'),(563,'user','enablecourseinstances','0'),(564,'user','enableuserinstances','0'),(565,'repository_webdav','version','2013050100'),(566,'repository_wikimedia','version','2013050100'),(568,'wikimedia','enablecourseinstances','0'),(569,'wikimedia','enableuserinstances','0'),(570,'repository_youtube','version','2013050100'),(572,'youtube','enablecourseinstances','0'),(573,'youtube','enableuserinstances','0'),(574,'portfolio_boxnet','version','2013050100'),(575,'portfolio_download','version','2013050100'),(576,'portfolio_flickr','version','2013050100'),(577,'portfolio_googledocs','version','2013050100'),(578,'portfolio_mahara','version','2013050100'),(579,'portfolio_picasa','version','2013050100'),(580,'qbehaviour_adaptive','version','2013050100'),(581,'qbehaviour_adaptivenopenalty','version','2013050100'),(582,'qbehaviour_deferredcbm','version','2013050100'),(583,'qbehaviour_deferredfeedback','version','2013050100'),(584,'qbehaviour_immediatecbm','version','2013050100'),(585,'qbehaviour_immediatefeedback','version','2013050100'),(586,'qbehaviour_informationitem','version','2013050100'),(587,'qbehaviour_interactive','version','2013050100'),(588,'qbehaviour_interactivecountback','version','2013050100'),(589,'qbehaviour_manualgraded','version','2013050800'),(591,'question','disabledbehaviours','manualgraded'),(592,'qbehaviour_missing','version','2013050100'),(593,'qformat_aiken','version','2013050100'),(594,'qformat_blackboard_six','version','2013050100'),(595,'qformat_examview','version','2013050100'),(596,'qformat_gift','version','2013050100'),(597,'qformat_learnwise','version','2013050100'),(598,'qformat_missingword','version','2013050100'),(599,'qformat_multianswer','version','2013050100'),(600,'qformat_webct','version','2013050100'),(601,'qformat_xhtml','version','2013050100'),(602,'qformat_xml','version','2013050100'),(603,'tool_assignmentupgrade','version','2013050100'),(604,'tool_behat','version','2013050100'),(605,'tool_capability','version','2013050100'),(606,'tool_customlang','version','2013050100'),(608,'tool_dbtransfer','version','2013050100'),(609,'tool_generator','version','2013050100'),(610,'tool_health','version','2013050100'),(611,'tool_innodb','version','2013050100'),(612,'tool_installaddon','version','2013050100'),(613,'tool_langimport','version','2013050100'),(614,'tool_multilangupgrade','version','2013050100'),(615,'tool_phpunit','version','2013050100'),(616,'tool_profiling','version','2013050100'),(617,'tool_qeupgradehelper','version','2013050100'),(619,'tool_replace','version','2013050100'),(620,'tool_spamcleaner','version','2013050100'),(621,'tool_timezoneimport','version','2013050100'),(622,'tool_unsuproles','version','2013050100'),(624,'tool_uploaduser','version','2013050100'),(625,'tool_xmldb','version','2013050100'),(626,'cachestore_file','version','2013050100'),(627,'cachestore_memcache','version','2013050700'),(628,'cachestore_memcached','version','2013050100'),(629,'cachestore_mongodb','version','2013050100'),(630,'cachestore_session','version','2013050100'),(631,'cachestore_static','version','2013050100'),(632,'theme_afterburner','version','2013050100'),(633,'theme_anomaly','version','2013050100'),(634,'theme_arialist','version','2013050100'),(635,'theme_base','version','2013050100'),(636,'theme_binarius','version','2013050100'),(637,'theme_bootstrapbase','version','2013050100'),(638,'theme_boxxie','version','2013050100'),(639,'theme_brick','version','2013050100'),(640,'theme_canvas','version','2013050100'),(641,'theme_clean','version','2013050100'),(642,'theme_formal_white','version','2013050100'),(644,'theme_formfactor','version','2013050100'),(645,'theme_fusion','version','2013050100'),(646,'theme_leatherbound','version','2013050100'),(647,'theme_magazine','version','2013050100'),(648,'theme_mymobile','version','2013050100'),(649,'theme_nimble','version','2013050100'),(650,'theme_nonzero','version','2013050100'),(651,'theme_overlay','version','2013050100'),(652,'theme_serenity','version','2013050100'),(653,'theme_sky_high','version','2013050100'),(654,'theme_splash','version','2013050100'),(655,'theme_standard','version','2013050100'),(656,'theme_standardold','version','2013050100'),(657,'assignsubmission_comments','version','2013050100'),(659,'assignsubmission_file','sortorder','1'),(660,'assignsubmission_comments','sortorder','2'),(661,'assignsubmission_onlinetext','sortorder','0'),(662,'assignsubmission_file','version','2013050100'),(663,'assignsubmission_onlinetext','version','2013050100'),(665,'assignfeedback_comments','version','2013050100'),(667,'assignfeedback_comments','sortorder','0'),(668,'assignfeedback_file','sortorder','2'),(669,'assignfeedback_offline','sortorder','1'),(670,'assignfeedback_file','version','2013050100'),(672,'assignfeedback_offline','version','2013050100'),(673,'assignment_offline','version','2013050100'),(674,'assignment_online','version','2013050100'),(675,'assignment_upload','version','2013050100'),(676,'assignment_uploadsingle','version','2013050100'),(677,'booktool_exportimscp','version','2013050100'),(678,'booktool_importhtml','version','2013050100'),(679,'booktool_print','version','2013050100'),(680,'datafield_checkbox','version','2013050100'),(681,'datafield_date','version','2013050100'),(682,'datafield_file','version','2013050100'),(683,'datafield_latlong','version','2013050100'),(684,'datafield_menu','version','2013050100'),(685,'datafield_multimenu','version','2013050100'),(686,'datafield_number','version','2013050100'),(687,'datafield_picture','version','2013050100'),(688,'datafield_radiobutton','version','2013050100'),(689,'datafield_text','version','2013050100'),(690,'datafield_textarea','version','2013050100'),(691,'datafield_url','version','2013050100'),(692,'datapreset_imagegallery','version','2013050100'),(693,'quiz_grading','version','2013050100'),(695,'quiz_overview','version','2013050100'),(697,'quiz_responses','version','2013050100'),(699,'quiz_statistics','version','2013050100'),(701,'quizaccess_delaybetweenattempts','version','2013050100'),(702,'quizaccess_ipaddress','version','2013050100'),(703,'quizaccess_numattempts','version','2013050100'),(704,'quizaccess_openclosedate','version','2013050100'),(705,'quizaccess_password','version','2013050100'),(706,'quizaccess_safebrowser','version','2013050100'),(707,'quizaccess_securewindow','version','2013050100'),(708,'quizaccess_timelimit','version','2013050100'),(709,'scormreport_basic','version','2013050100'),(710,'scormreport_graphs','version','2013050100'),(711,'scormreport_interactions','version','2013050100'),(712,'workshopform_accumulative','version','2013050100'),(714,'workshopform_comments','version','2013050100'),(716,'workshopform_numerrors','version','2013050100'),(718,'workshopform_rubric','version','2013050100'),(720,'workshopallocation_manual','version','2013050100'),(721,'workshopallocation_random','version','2013050100'),(722,'workshopallocation_scheduled','version','2013050100'),(723,'workshopeval_best','version','2013050100'),(724,'tinymce_ctrlhelp','version','2013050100'),(725,'tinymce_dragmath','version','2013050100'),(726,'tinymce_moodleemoticon','version','2013050100'),(727,'tinymce_moodleimage','version','2013050100'),(728,'tinymce_moodlemedia','version','2013050100'),(729,'tinymce_moodlenolink','version','2013050100'),(730,'tinymce_spellchecker','version','2013050100'),(732,'assign','feedback_plugin_for_gradebook','assignfeedback_comments'),(733,'assign','showrecentsubmissions','0'),(734,'assign','submissionreceipts','1'),(735,'assign','submissionstatement','This assignment is my own work, except where I have acknowledged the use of the works of other people.'),(736,'assign','requiresubmissionstatement','0'),(737,'book','requiremodintro','1'),(738,'book','numberingoptions','0,1,2,3'),(739,'book','numbering','1'),(740,'folder','requiremodintro','1'),(741,'folder','showexpanded','1'),(742,'imscp','requiremodintro','1'),(743,'imscp','keepold','1'),(744,'imscp','keepold_adv','0'),(745,'label','dndmedia','1'),(746,'label','dndresizewidth','400'),(747,'label','dndresizeheight','400'),(748,'page','requiremodintro','1'),(749,'page','displayoptions','5'),(750,'page','printheading','1'),(751,'page','printintro','0'),(752,'page','display','5'),(753,'page','popupwidth','620'),(754,'page','popupheight','450'),(755,'quiz','timelimit','0'),(756,'quiz','timelimit_adv','0'),(757,'quiz','overduehandling','autoabandon'),(758,'quiz','overduehandling_adv','0'),(759,'quiz','graceperiod','86400'),(760,'quiz','graceperiod_adv','0'),(761,'quiz','graceperiodmin','60'),(762,'quiz','attempts','0'),(763,'quiz','attempts_adv','0'),(764,'quiz','grademethod','1'),(765,'quiz','grademethod_adv','0'),(766,'quiz','maximumgrade','10'),(767,'quiz','shufflequestions','0'),(768,'quiz','shufflequestions_adv','0'),(769,'quiz','questionsperpage','1'),(770,'quiz','questionsperpage_adv','0'),(771,'quiz','navmethod','free'),(772,'quiz','navmethod_adv','1'),(773,'quiz','shuffleanswers','1'),(774,'quiz','shuffleanswers_adv','0'),(775,'quiz','preferredbehaviour','deferredfeedback'),(776,'quiz','attemptonlast','0'),(777,'quiz','attemptonlast_adv','1'),(778,'quiz','reviewattempt','69904'),(779,'quiz','reviewcorrectness','69904'),(780,'quiz','reviewmarks','69904'),(781,'quiz','reviewspecificfeedback','69904'),(782,'quiz','reviewgeneralfeedback','69904'),(783,'quiz','reviewrightanswer','69904'),(784,'quiz','reviewoverallfeedback','4368'),(785,'quiz','showuserpicture','0'),(786,'quiz','showuserpicture_adv','0'),(787,'quiz','decimalpoints','2'),(788,'quiz','decimalpoints_adv','0'),(789,'quiz','questiondecimalpoints','-1'),(790,'quiz','questiondecimalpoints_adv','1'),(791,'quiz','showblocks','0'),(792,'quiz','showblocks_adv','1'),(793,'quiz','password',''),(794,'quiz','password_adv','1'),(795,'quiz','subnet',''),(796,'quiz','subnet_adv','1'),(797,'quiz','delay1','0'),(798,'quiz','delay1_adv','1'),(799,'quiz','delay2','0'),(800,'quiz','delay2_adv','1'),(801,'quiz','browsersecurity','-'),(802,'quiz','browsersecurity_adv','1'),(803,'quiz','autosaveperiod','0'),(804,'resource','framesize','130'),(805,'resource','requiremodintro','1'),(806,'resource','displayoptions','0,1,4,5,6'),(807,'resource','printheading','0'),(808,'resource','printintro','1'),(809,'resource','display','0'),(810,'resource','showsize','0'),(811,'resource','showtype','0'),(812,'resource','popupwidth','620'),(813,'resource','popupheight','450'),(814,'resource','filterfiles','0'),(815,'scorm','displaycoursestructure','0'),(816,'scorm','displaycoursestructure_adv','0'),(817,'scorm','popup','0'),(818,'scorm','popup_adv','0'),(819,'scorm','framewidth','100'),(820,'scorm','framewidth_adv','1'),(821,'scorm','frameheight','500'),(822,'scorm','frameheight_adv','1'),(823,'scorm','winoptgrp_adv','1'),(824,'scorm','resizable','0'),(825,'scorm','scrollbars','0'),(826,'scorm','directories','0'),(827,'scorm','location','0'),(828,'scorm','menubar','0'),(829,'scorm','toolbar','0'),(830,'scorm','status','0'),(831,'scorm','skipview','0'),(832,'scorm','skipview_adv','1'),(833,'scorm','hidebrowse','0'),(834,'scorm','hidebrowse_adv','1'),(835,'scorm','hidetoc','0'),(836,'scorm','hidetoc_adv','1'),(837,'scorm','hidenav','0'),(838,'scorm','hidenav_adv','0'),(839,'scorm','displayattemptstatus','1'),(840,'scorm','displayattemptstatus_adv','0'),(841,'scorm','grademethod','1'),(842,'scorm','maxgrade','100'),(843,'scorm','maxattempt','0'),(844,'scorm','whatgrade','0'),(845,'scorm','forcecompleted','0'),(846,'scorm','forcenewattempt','0'),(847,'scorm','lastattemptlock','0'),(848,'scorm','auto','0'),(849,'scorm','updatefreq','0'),(850,'scorm','allowtypeexternal','0'),(851,'scorm','allowtypelocalsync','0'),(852,'scorm','allowtypeimsrepository','0'),(853,'scorm','allowtypeexternalaicc','0'),(854,'scorm','allowaicchacp','0'),(855,'scorm','aicchacptimeout','30'),(856,'scorm','aicchacpkeepsessiondata','1'),(857,'scorm','forcejavascript','1'),(858,'scorm','allowapidebug','0'),(859,'scorm','apidebugmask','.*'),(860,'url','framesize','130'),(861,'url','requiremodintro','1'),(862,'url','secretphrase',''),(863,'url','rolesinparams','0'),(864,'url','displayoptions','0,1,5,6'),(865,'url','printheading','0'),(866,'url','printintro','1'),(867,'url','display','0'),(868,'url','popupwidth','620'),(869,'url','popupheight','450'),(870,'workshop','grade','80'),(871,'workshop','gradinggrade','20'),(872,'workshop','gradedecimals','0'),(873,'workshop','maxbytes','0'),(874,'workshop','strategy','accumulative'),(875,'workshop','examplesmode','0'),(876,'workshopallocation_random','numofreviews','5'),(877,'workshopform_numerrors','grade0','Нет'),(878,'workshopform_numerrors','grade1','Да'),(879,'workshopeval_best','comparison','5'),(880,'assignsubmission_comments','default','0'),(881,'assignsubmission_onlinetext','default','0'),(882,'assignsubmission_file','default','1'),(883,'assignsubmission_file','maxbytes','1048576'),(884,'assignfeedback_offline','default','0'),(885,'assignfeedback_comments','default','1'),(886,'assignfeedback_file','default','0'),(887,'enrol_cohort','roleid','5'),(888,'enrol_cohort','unenrolaction','0'),(889,'enrol_database','defaultrole','5'),(890,'enrol_database','defaultcategory','1'),(891,'enrol_imsenterprise','imsrolemap01','5'),(892,'enrol_imsenterprise','imsrolemap02','3'),(893,'enrol_imsenterprise','imsrolemap03','3'),(894,'enrol_imsenterprise','imsrolemap04','5'),(895,'enrol_imsenterprise','imsrolemap05','0'),(896,'enrol_imsenterprise','imsrolemap06','4'),(897,'enrol_imsenterprise','imsrolemap07','0'),(898,'enrol_imsenterprise','imsrolemap08','4'),(899,'enrol_imsenterprise','imscoursemapshortname','coursecode'),(900,'enrol_imsenterprise','imscoursemapfullname','short'),(901,'enrol_imsenterprise','imscoursemapsummary','ignore'),(902,'enrol_ldap','category','1'),(903,'enrol_manual','roleid','5'),(904,'enrol_meta','nosyncroleids',''),(905,'enrol_meta','syncall','1'),(906,'enrol_meta','unenrolaction','3'),(907,'enrol_mnet','roleid','5'),(908,'enrol_mnet','roleid_adv','1'),(909,'enrol_paypal','roleid','5'),(910,'enrol_self','roleid','5'),(911,'theme_academy','version','2013050100'),(912,'enrol_payanyway','version','2011121300'),(913,'enrol_payanyway','paymentserver','demo.moneta.ru'),(914,'enrol_payanyway','mntid','89790689'),(915,'enrol_payanyway','mntdataintegritycode','12345'),(916,'enrol_payanyway','mnttestmode','1'),(917,'enrol_payanyway','payanywaylogin','k.kaplin@s-zl.ru'),(918,'enrol_payanyway','payanywaypassword','qazxc123'),(919,'enrol_payanyway','defaultenrol','1'),(920,'enrol_payanyway','status','0'),(921,'enrol_payanyway','cost','0'),(922,'enrol_payanyway','currency','RUB'),(923,'enrol_payanyway','roleid','5'),(924,'enrol_payanyway','enrolperiod','0'),(925,'repository_coursefilearea','version','2013020301'),(926,'repository_repo_filemanager','version','2013020301');
/*!40000 ALTER TABLE `mdl_config_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context`
--

LOCK TABLES `mdl_context` WRITE;
/*!40000 ALTER TABLE `mdl_context` DISABLE KEYS */;
INSERT INTO `mdl_context` VALUES (1,10,0,'/1',1),(2,50,1,'/1/2',2),(3,40,1,'/1/3',2),(4,30,1,'/1/4',2),(5,30,2,'/1/5',2),(6,80,1,'/1/2/6',3),(7,80,2,'/1/2/7',3),(8,80,3,'/1/2/8',3),(9,80,4,'/1/9',2),(10,80,5,'/1/10',2),(11,80,6,'/1/11',2),(12,80,7,'/1/12',2),(13,80,8,'/1/13',2),(14,80,9,'/1/14',2),(15,50,2,'/1/3/15',3),(16,80,10,'/1/3/15/16',4),(17,80,11,'/1/3/15/17',4),(18,80,12,'/1/3/15/18',4),(19,80,13,'/1/3/15/19',4);
/*!40000 ALTER TABLE `mdl_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_context_temp`
--

LOCK TABLES `mdl_context_temp` WRITE;
/*!40000 ALTER TABLE `mdl_context_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_context_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `sectioncache` longtext COLLATE utf8_unicode_ci,
  `modinfo` longtext COLLATE utf8_unicode_ci,
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course`
--

LOCK TABLES `mdl_course` WRITE;
/*!40000 ALTER TABLE `mdl_course` DISABLE KEYS */;
INSERT INTO `mdl_course` VALUES (1,0,1,'Академия Молодежного Лидерства','Академия','','',0,'site',1,'a:0:{}','a:0:{}',3,0,0,0,0,0,1,1,0,0,0,'','',1372420970,1372421717,0,0,0),(2,1,10001,'Тестовый курс','тестовый','','<p>Описание курса</p>',1,'weeks',1,'a:1:{i:0;O:8:\"stdClass\":2:{s:2:\"id\";s:1:\"1\";s:4:\"name\";N;}}','a:0:{}',5,1403985600,0,0,0,0,1,1,0,0,0,'','',1372425304,1372425304,0,0,0);
/*!40000 ALTER TABLE `mdl_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_categories`
--

LOCK TABLES `mdl_course_categories` WRITE;
/*!40000 ALTER TABLE `mdl_course_categories` DISABLE KEYS */;
INSERT INTO `mdl_course_categories` VALUES (1,'Разное',NULL,NULL,0,0,10000,1,1,1,1372420971,1,'/1',NULL);
/*!40000 ALTER TABLE `mdl_course_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_aggr_methd`
--

LOCK TABLES `mdl_course_completion_aggr_methd` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_aggr_methd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_crit_compl`
--

LOCK TABLES `mdl_course_completion_crit_compl` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_crit_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completion_criteria`
--

LOCK TABLES `mdl_course_completion_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completion_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_completions`
--

LOCK TABLES `mdl_course_completions` WRITE;
/*!40000 ALTER TABLE `mdl_course_completions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_completions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_format_options`
--

LOCK TABLES `mdl_course_format_options` WRITE;
/*!40000 ALTER TABLE `mdl_course_format_options` DISABLE KEYS */;
INSERT INTO `mdl_course_format_options` VALUES (1,1,'site',0,'numsections','1'),(2,2,'weeks',0,'numsections','10'),(3,2,'weeks',0,'hiddensections','0'),(4,2,'weeks',0,'coursedisplay','0');
/*!40000 ALTER TABLE `mdl_course_format_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules`
--

LOCK TABLES `mdl_course_modules` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

DROP TABLE IF EXISTS `mdl_course_modules_avail_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_avail_fields`
--

LOCK TABLES `mdl_course_modules_avail_fields` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_avail_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_avail_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_availability`
--

DROP TABLE IF EXISTS `mdl_course_modules_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_availability`
--

LOCK TABLES `mdl_course_modules_availability` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_modules_completion`
--

LOCK TABLES `mdl_course_modules_completion` WRITE;
/*!40000 ALTER TABLE `mdl_course_modules_completion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_modules_completion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_published`
--

LOCK TABLES `mdl_course_published` WRITE;
/*!40000 ALTER TABLE `mdl_course_published` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_published` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_request`
--

LOCK TABLES `mdl_course_request` WRITE;
/*!40000 ALTER TABLE `mdl_course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections`
--

LOCK TABLES `mdl_course_sections` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections` DISABLE KEYS */;
INSERT INTO `mdl_course_sections` VALUES (1,2,0,NULL,'',1,'',1,0,0,0,0);
/*!40000 ALTER TABLE `mdl_course_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

DROP TABLE IF EXISTS `mdl_course_sections_avail_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections_avail_fields`
--

LOCK TABLES `mdl_course_sections_avail_fields` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections_avail_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections_avail_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_course_sections_availability`
--

DROP TABLE IF EXISTS `mdl_course_sections_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Completion or grade conditions that affect if a section is c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_course_sections_availability`
--

LOCK TABLES `mdl_course_sections_availability` WRITE;
/*!40000 ALTER TABLE `mdl_course_sections_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_course_sections_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data`
--

LOCK TABLES `mdl_data` WRITE;
/*!40000 ALTER TABLE `mdl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_content`
--

LOCK TABLES `mdl_data_content` WRITE;
/*!40000 ALTER TABLE `mdl_data_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_fields`
--

LOCK TABLES `mdl_data_fields` WRITE;
/*!40000 ALTER TABLE `mdl_data_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_data_records`
--

LOCK TABLES `mdl_data_records` WRITE;
/*!40000 ALTER TABLE `mdl_data_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_data_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol`
--

LOCK TABLES `mdl_enrol` WRITE;
/*!40000 ALTER TABLE `mdl_enrol` DISABLE KEYS */;
INSERT INTO `mdl_enrol` VALUES (1,'manual',0,2,0,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1372425305,1372425305),(2,'guest',1,2,1,NULL,0,0,0,0,0,0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1372425305,1372425305),(3,'self',1,2,2,NULL,0,0,0,0,86400,0,NULL,NULL,NULL,5,0,0,0,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1372425305,1372425305);
/*!40000 ALTER TABLE `mdl_enrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_authorize` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) NOT NULL DEFAULT '0',
  `ccname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `transid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about authorize.net transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_authorize`
--

LOCK TABLES `mdl_enrol_authorize` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_authorize_refunds`
--

DROP TABLE IF EXISTS `mdl_enrol_authorize_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_authorize_refunds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transid` bigint(20) DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Authorize.net refunds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_authorize_refunds`
--

LOCK TABLES `mdl_enrol_authorize_refunds` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_authorize_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_flatfile`
--

LOCK TABLES `mdl_enrol_flatfile` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_flatfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_payanyway_transactions`
--

DROP TABLE IF EXISTS `mdl_enrol_payanyway_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_payanyway_transactions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instanceid` bigint(10) NOT NULL,
  `cost` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_created` bigint(10) NOT NULL DEFAULT '0',
  `success` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='PayAnyWay enrolment plugin transactions log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_payanyway_transactions`
--

LOCK TABLES `mdl_enrol_payanyway_transactions` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_payanyway_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_payanyway_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_enrol_paypal`
--

LOCK TABLES `mdl_enrol_paypal` WRITE;
/*!40000 ALTER TABLE `mdl_enrol_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_enrol_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event`
--

LOCK TABLES `mdl_event` WRITE;
/*!40000 ALTER TABLE `mdl_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_event_subscriptions`
--

LOCK TABLES `mdl_event_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_event_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_event_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_handlers`
--

LOCK TABLES `mdl_events_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_handlers` DISABLE KEYS */;
INSERT INTO `mdl_events_handlers` VALUES (1,'portfolio_send','moodle','/lib/portfolio.php','s:22:\"portfolio_handle_event\";','cron',0,0),(2,'course_completed','moodle','/lib/badgeslib.php','s:42:\"badges_award_handle_course_criteria_review\";','instant',0,1),(3,'activity_completion_changed','moodle','/lib/badgeslib.php','s:44:\"badges_award_handle_activity_criteria_review\";','instant',0,1),(4,'user_updated','moodle','/lib/badgeslib.php','s:43:\"badges_award_handle_profile_criteria_review\";','instant',0,1),(5,'user_logout','mod_chat','/mod/chat/lib.php','s:16:\"chat_user_logout\";','instant',0,1),(6,'role_assigned','mod_forum','/mod/forum/lib.php','s:24:\"forum_user_role_assigned\";','instant',0,1),(7,'user_unenrolled','mod_forum','/mod/forum/lib.php','s:21:\"forum_user_unenrolled\";','instant',0,1),(8,'quiz_attempt_submitted','mod_quiz','/mod/quiz/locallib.php','s:30:\"quiz_attempt_submitted_handler\";','cron',0,1),(9,'quiz_attempt_overdue','mod_quiz','/mod/quiz/locallib.php','s:28:\"quiz_attempt_overdue_handler\";','cron',0,1),(10,'groups_member_added','mod_quiz','/mod/quiz/locallib.php','s:32:\"quiz_groups_member_added_handler\";','instant',0,1),(11,'groups_member_removed','mod_quiz','/mod/quiz/locallib.php','s:34:\"quiz_groups_member_removed_handler\";','instant',0,1),(12,'groups_members_removed','mod_quiz','/mod/quiz/locallib.php','s:35:\"quiz_groups_members_removed_handler\";','instant',0,1),(13,'groups_group_deleted','mod_quiz','/mod/quiz/locallib.php','s:33:\"quiz_groups_group_deleted_handler\";','instant',0,1),(14,'role_assigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(15,'role_unassigned','enrol_category','/enrol/category/locallib.php','a:2:{i:0;s:22:\"enrol_category_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(16,'cohort_member_added','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:12:\"member_added\";}','instant',0,1),(17,'cohort_member_removed','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:14:\"member_removed\";}','instant',0,1),(18,'cohort_deleted','enrol_cohort','/enrol/cohort/locallib.php','a:2:{i:0;s:20:\"enrol_cohort_handler\";i:1;s:7:\"deleted\";}','instant',0,1),(19,'role_assigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"role_assigned\";}','instant',0,1),(20,'role_unassigned','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"role_unassigned\";}','instant',0,1),(21,'user_enrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:13:\"user_enrolled\";}','instant',0,1),(22,'user_unenrolled','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:15:\"user_unenrolled\";}','instant',0,1),(23,'user_enrol_modified','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:19:\"user_enrol_modified\";}','instant',0,1),(24,'course_deleted','enrol_meta','/enrol/meta/locallib.php','a:2:{i:0;s:18:\"enrol_meta_handler\";i:1;s:14:\"course_deleted\";}','instant',0,1),(25,'workshop_viewed','workshopallocation_scheduled','/mod/workshop/allocation/scheduled/lib.php','s:44:\"workshopallocation_scheduled_workshop_viewed\";','instant',0,1);
/*!40000 ALTER TABLE `mdl_events_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue`
--

LOCK TABLES `mdl_events_queue` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_events_queue_handlers`
--

LOCK TABLES `mdl_events_queue_handlers` WRITE;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_events_queue_handlers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_functions`
--

LOCK TABLES `mdl_external_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_functions` VALUES (1,'core_cohort_create_cohorts','core_cohort_external','create_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(2,'core_cohort_delete_cohorts','core_cohort_external','delete_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(3,'core_cohort_get_cohorts','core_cohort_external','get_cohorts','cohort/externallib.php','moodle','moodle/cohort:view'),(4,'core_cohort_update_cohorts','core_cohort_external','update_cohorts','cohort/externallib.php','moodle','moodle/cohort:manage'),(5,'core_cohort_add_cohort_members','core_cohort_external','add_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(6,'core_cohort_delete_cohort_members','core_cohort_external','delete_cohort_members','cohort/externallib.php','moodle','moodle/cohort:assign'),(7,'core_cohort_get_cohort_members','core_cohort_external','get_cohort_members','cohort/externallib.php','moodle','moodle/cohort:view'),(8,'moodle_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(9,'core_group_create_groups','core_group_external','create_groups','group/externallib.php','moodle','moodle/course:managegroups'),(10,'moodle_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(11,'core_group_get_groups','core_group_external','get_groups','group/externallib.php','moodle','moodle/course:managegroups'),(12,'moodle_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(13,'core_group_get_course_groups','core_group_external','get_course_groups','group/externallib.php','moodle','moodle/course:managegroups'),(14,'moodle_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(15,'core_group_delete_groups','core_group_external','delete_groups','group/externallib.php','moodle','moodle/course:managegroups'),(16,'moodle_group_get_groupmembers','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(17,'core_group_get_group_members','core_group_external','get_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(18,'moodle_group_add_groupmembers','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(19,'core_group_add_group_members','core_group_external','add_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(20,'moodle_group_delete_groupmembers','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(21,'core_group_delete_group_members','core_group_external','delete_group_members','group/externallib.php','moodle','moodle/course:managegroups'),(22,'core_group_create_groupings','core_group_external','create_groupings','group/externallib.php','moodle',''),(23,'core_group_update_groupings','core_group_external','update_groupings','group/externallib.php','moodle',''),(24,'core_group_get_groupings','core_group_external','get_groupings','group/externallib.php','moodle',''),(25,'core_group_get_course_groupings','core_group_external','get_course_groupings','group/externallib.php','moodle',''),(26,'core_group_delete_groupings','core_group_external','delete_groupings','group/externallib.php','moodle',''),(27,'core_group_assign_grouping','core_group_external','assign_grouping','group/externallib.php','moodle',''),(28,'core_group_unassign_grouping','core_group_external','unassign_grouping','group/externallib.php','moodle',''),(29,'moodle_file_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(30,'core_files_get_files','core_files_external','get_files','files/externallib.php','moodle',''),(31,'moodle_file_upload','core_files_external','upload','files/externallib.php','moodle',''),(32,'core_files_upload','core_files_external','upload','files/externallib.php','moodle',''),(33,'moodle_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(34,'core_user_create_users','core_user_external','create_users','user/externallib.php','moodle','moodle/user:create'),(35,'core_user_get_users','core_user_external','get_users','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(36,'moodle_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(37,'core_user_get_users_by_field','core_user_external','get_users_by_field','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(38,'core_user_get_users_by_id','core_user_external','get_users_by_id','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),(39,'moodle_user_get_users_by_courseid','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(40,'moodle_user_get_course_participants_by_id','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(41,'core_user_get_course_user_profiles','core_user_external','get_course_user_profiles','user/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(42,'moodle_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(43,'core_user_delete_users','core_user_external','delete_users','user/externallib.php','moodle','moodle/user:delete'),(44,'moodle_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(45,'core_user_update_users','core_user_external','update_users','user/externallib.php','moodle','moodle/user:update'),(46,'core_enrol_get_enrolled_users_with_capability','core_enrol_external','get_enrolled_users_with_capability','enrol/externallib.php','moodle',''),(47,'moodle_enrol_get_enrolled_users','moodle_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),(48,'core_enrol_get_enrolled_users','core_enrol_external','get_enrolled_users','enrol/externallib.php','moodle','moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),(49,'moodle_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(50,'core_enrol_get_users_courses','core_enrol_external','get_users_courses','enrol/externallib.php','moodle','moodle/course:viewparticipants'),(51,'moodle_role_assign','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(52,'core_role_assign_roles','core_role_external','assign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(53,'moodle_role_unassign','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(54,'core_role_unassign_roles','core_role_external','unassign_roles','enrol/externallib.php','moodle','moodle/role:assign'),(55,'core_course_get_contents','core_course_external','get_course_contents','course/externallib.php','moodle','moodle/course:update,moodle/course:viewhiddencourses'),(56,'moodle_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(57,'core_course_get_courses','core_course_external','get_courses','course/externallib.php','moodle','moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),(58,'moodle_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(59,'core_course_create_courses','core_course_external','create_courses','course/externallib.php','moodle','moodle/course:create,moodle/course:visibility'),(60,'core_course_delete_courses','core_course_external','delete_courses','course/externallib.php','moodle','moodle/course:delete'),(61,'core_course_delete_modules','core_course_external','delete_modules','course/externallib.php','moodle','moodle/course:manageactivities'),(62,'core_course_duplicate_course','core_course_external','duplicate_course','course/externallib.php','moodle','moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),(63,'core_course_update_courses','core_course_external','update_courses','course/externallib.php','moodle','moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),(64,'core_course_get_categories','core_course_external','get_categories','course/externallib.php','moodle','moodle/category:viewhiddencategories'),(65,'core_course_create_categories','core_course_external','create_categories','course/externallib.php','moodle','moodle/category:manage'),(66,'core_course_update_categories','core_course_external','update_categories','course/externallib.php','moodle','moodle/category:manage'),(67,'core_course_delete_categories','core_course_external','delete_categories','course/externallib.php','moodle','moodle/category:manage'),(68,'core_course_import_course','core_course_external','import_course','course/externallib.php','moodle','moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),(69,'moodle_message_send_instantmessages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(70,'core_message_send_instant_messages','core_message_external','send_instant_messages','message/externallib.php','moodle','moodle/site:sendmessage'),(71,'core_message_create_contacts','core_message_external','create_contacts','message/externallib.php','moodle',''),(72,'core_message_delete_contacts','core_message_external','delete_contacts','message/externallib.php','moodle',''),(73,'core_message_block_contacts','core_message_external','block_contacts','message/externallib.php','moodle',''),(74,'core_message_unblock_contacts','core_message_external','unblock_contacts','message/externallib.php','moodle',''),(75,'core_message_get_contacts','core_message_external','get_contacts','message/externallib.php','moodle',''),(76,'core_message_search_contacts','core_message_external','search_contacts','message/externallib.php','moodle',''),(77,'moodle_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(78,'core_notes_create_notes','core_notes_external','create_notes','notes/externallib.php','moodle','moodle/notes:manage'),(79,'core_notes_delete_notes','core_notes_external','delete_notes','notes/externallib.php','moodle','moodle/notes:manage'),(80,'core_notes_get_notes','core_notes_external','get_notes','notes/externallib.php','moodle','moodle/notes:view'),(81,'core_notes_update_notes','core_notes_external','update_notes','notes/externallib.php','moodle','moodle/notes:manage'),(82,'core_grade_get_definitions','core_grade_external','get_definitions','grade/externallib.php','moodle',''),(83,'moodle_webservice_get_siteinfo','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(84,'core_webservice_get_site_info','core_webservice_external','get_site_info','webservice/externallib.php','moodle',''),(85,'core_get_string','core_external','get_string','lib/external/externallib.php','moodle',''),(86,'core_get_strings','core_external','get_strings','lib/external/externallib.php','moodle',''),(87,'core_get_component_strings','core_external','get_component_strings','lib/external/externallib.php','moodle',''),(88,'core_calendar_delete_calendar_events','core_calendar_external','delete_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(89,'core_calendar_get_calendar_events','core_calendar_external','get_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(90,'core_calendar_create_calendar_events','core_calendar_external','create_calendar_events','calendar/externallib.php','moodle','moodle/calendar:manageentries'),(91,'mod_assign_get_grades','mod_assign_external','get_grades','mod/assign/externallib.php','mod_assign',''),(92,'mod_assign_get_assignments','mod_assign_external','get_assignments','mod/assign/externallib.php','mod_assign',''),(93,'mod_assign_get_submissions','mod_assign_external','get_submissions','mod/assign/externallib.php','mod_assign',''),(94,'mod_forum_get_forums_by_courses','mod_forum_external','get_forums_by_courses','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion'),(95,'mod_forum_get_forum_discussions','mod_forum_external','get_forum_discussions','mod/forum/externallib.php','mod_forum','mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),(96,'moodle_enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol'),(97,'enrol_manual_enrol_users','enrol_manual_external','enrol_users','enrol/manual/externallib.php','enrol_manual','enrol/manual:enrol');
/*!40000 ALTER TABLE `mdl_external_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services`
--

LOCK TABLES `mdl_external_services` WRITE;
/*!40000 ALTER TABLE `mdl_external_services` DISABLE KEYS */;
INSERT INTO `mdl_external_services` VALUES (1,'Moodle mobile web service',0,NULL,0,'moodle',1372421016,NULL,'moodle_mobile_app',1);
/*!40000 ALTER TABLE `mdl_external_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_functions`
--

LOCK TABLES `mdl_external_services_functions` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_functions` DISABLE KEYS */;
INSERT INTO `mdl_external_services_functions` VALUES (1,1,'moodle_enrol_get_users_courses'),(2,1,'moodle_enrol_get_enrolled_users'),(3,1,'moodle_user_get_users_by_id'),(4,1,'moodle_webservice_get_siteinfo'),(5,1,'moodle_notes_create_notes'),(6,1,'moodle_user_get_course_participants_by_id'),(7,1,'moodle_user_get_users_by_courseid'),(8,1,'moodle_message_send_instantmessages'),(9,1,'core_course_get_contents'),(10,1,'core_get_component_strings');
/*!40000 ALTER TABLE `mdl_external_services_functions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_services_users`
--

LOCK TABLES `mdl_external_services_users` WRITE;
/*!40000 ALTER TABLE `mdl_external_services_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_services_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_external_tokens`
--

LOCK TABLES `mdl_external_tokens` WRITE;
/*!40000 ALTER TABLE `mdl_external_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_external_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback`
--

LOCK TABLES `mdl_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completed`
--

LOCK TABLES `mdl_feedback_completed` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completed` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_completedtmp`
--

LOCK TABLES `mdl_feedback_completedtmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_completedtmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_item`
--

LOCK TABLES `mdl_feedback_item` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_sitecourse_map`
--

LOCK TABLES `mdl_feedback_sitecourse_map` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_sitecourse_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_template`
--

LOCK TABLES `mdl_feedback_template` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_tracking`
--

DROP TABLE IF EXISTS `mdl_feedback_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_tracking`
--

LOCK TABLES `mdl_feedback_tracking` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_value`
--

LOCK TABLES `mdl_feedback_value` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_feedback_valuetmp`
--

LOCK TABLES `mdl_feedback_valuetmp` WRITE;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_feedback_valuetmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  `referencelastsync` bigint(10) DEFAULT NULL,
  `referencelifetime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files`
--

LOCK TABLES `mdl_files` WRITE;
/*!40000 ALTER TABLE `mdl_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `lifetime` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_files_reference`
--

LOCK TABLES `mdl_files_reference` WRITE;
/*!40000 ALTER TABLE `mdl_files_reference` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_files_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_active`
--

LOCK TABLES `mdl_filter_active` WRITE;
/*!40000 ALTER TABLE `mdl_filter_active` DISABLE KEYS */;
INSERT INTO `mdl_filter_active` VALUES (1,'activitynames',1,1,1),(2,'mediaplugin',1,1,2);
/*!40000 ALTER TABLE `mdl_filter_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_filter_config`
--

LOCK TABLES `mdl_filter_config` WRITE;
/*!40000 ALTER TABLE `mdl_filter_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_filter_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_folder`
--

LOCK TABLES `mdl_folder` WRITE;
/*!40000 ALTER TABLE `mdl_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum`
--

LOCK TABLES `mdl_forum` WRITE;
/*!40000 ALTER TABLE `mdl_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_discussions`
--

LOCK TABLES `mdl_forum_discussions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_posts`
--

LOCK TABLES `mdl_forum_posts` WRITE;
/*!40000 ALTER TABLE `mdl_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_queue`
--

LOCK TABLES `mdl_forum_queue` WRITE;
/*!40000 ALTER TABLE `mdl_forum_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_read`
--

LOCK TABLES `mdl_forum_read` WRITE;
/*!40000 ALTER TABLE `mdl_forum_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_subscriptions`
--

LOCK TABLES `mdl_forum_subscriptions` WRITE;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_forum_track_prefs`
--

LOCK TABLES `mdl_forum_track_prefs` WRITE;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_forum_track_prefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary`
--

LOCK TABLES `mdl_glossary` WRITE;
/*!40000 ALTER TABLE `mdl_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_alias`
--

LOCK TABLES `mdl_glossary_alias` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_categories`
--

LOCK TABLES `mdl_glossary_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries`
--

LOCK TABLES `mdl_glossary_entries` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_entries_categories`
--

LOCK TABLES `mdl_glossary_entries_categories` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_glossary_entries_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_glossary_formats`
--

LOCK TABLES `mdl_glossary_formats` WRITE;
/*!40000 ALTER TABLE `mdl_glossary_formats` DISABLE KEYS */;
INSERT INTO `mdl_glossary_formats` VALUES (1,'continuous','continuous',1,1,'','','',''),(2,'dictionary','dictionary',1,1,'','','',''),(3,'encyclopedia','encyclopedia',1,1,'','','',''),(4,'entrylist','entrylist',1,1,'','','',''),(5,'faq','faq',1,1,'','','',''),(6,'fullwithauthor','fullwithauthor',1,1,'','','',''),(7,'fullwithoutauthor','fullwithoutauthor',1,1,'','','','');
/*!40000 ALTER TABLE `mdl_glossary_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories`
--

LOCK TABLES `mdl_grade_categories` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_categories_history`
--

LOCK TABLES `mdl_grade_categories_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_categories_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_categories_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades`
--

LOCK TABLES `mdl_grade_grades` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_grades_history`
--

LOCK TABLES `mdl_grade_grades_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_grades_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_grades_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_newitem`
--

LOCK TABLES `mdl_grade_import_newitem` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_newitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_import_values`
--

LOCK TABLES `mdl_grade_import_values` WRITE;
/*!40000 ALTER TABLE `mdl_grade_import_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_import_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items`
--

LOCK TABLES `mdl_grade_items` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_items_history`
--

LOCK TABLES `mdl_grade_items_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_items_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_items_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_letters`
--

LOCK TABLES `mdl_grade_letters` WRITE;
/*!40000 ALTER TABLE `mdl_grade_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes`
--

LOCK TABLES `mdl_grade_outcomes` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_courses`
--

LOCK TABLES `mdl_grade_outcomes_courses` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_outcomes_history`
--

LOCK TABLES `mdl_grade_outcomes_history` WRITE;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_outcomes_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grade_settings`
--

LOCK TABLES `mdl_grade_settings` WRITE;
/*!40000 ALTER TABLE `mdl_grade_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grade_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_areas`
--

LOCK TABLES `mdl_grading_areas` WRITE;
/*!40000 ALTER TABLE `mdl_grading_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_definitions`
--

LOCK TABLES `mdl_grading_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_grading_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_grading_instances`
--

LOCK TABLES `mdl_grading_instances` WRITE;
/*!40000 ALTER TABLE `mdl_grading_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_grading_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_comments`
--

LOCK TABLES `mdl_gradingform_guide_comments` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_criteria`
--

LOCK TABLES `mdl_gradingform_guide_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_guide_fillings`
--

LOCK TABLES `mdl_gradingform_guide_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_guide_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_criteria`
--

LOCK TABLES `mdl_gradingform_rubric_criteria` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_fillings`
--

LOCK TABLES `mdl_gradingform_rubric_fillings` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_fillings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_gradingform_rubric_levels`
--

LOCK TABLES `mdl_gradingform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_gradingform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings`
--

LOCK TABLES `mdl_groupings` WRITE;
/*!40000 ALTER TABLE `mdl_groupings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groupings_groups`
--

LOCK TABLES `mdl_groupings_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groupings_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groupings_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups`
--

LOCK TABLES `mdl_groups` WRITE;
/*!40000 ALTER TABLE `mdl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_groups_members`
--

LOCK TABLES `mdl_groups_members` WRITE;
/*!40000 ALTER TABLE `mdl_groups_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_groups_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_imscp`
--

LOCK TABLES `mdl_imscp` WRITE;
/*!40000 ALTER TABLE `mdl_imscp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_imscp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_label`
--

LOCK TABLES `mdl_label` WRITE;
/*!40000 ALTER TABLE `mdl_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson`
--

LOCK TABLES `mdl_lesson` WRITE;
/*!40000 ALTER TABLE `mdl_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_answers`
--

LOCK TABLES `mdl_lesson_answers` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_attempts`
--

LOCK TABLES `mdl_lesson_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_branch`
--

LOCK TABLES `mdl_lesson_branch` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_grades`
--

LOCK TABLES `mdl_lesson_grades` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_high_scores`
--

DROP TABLE IF EXISTS `mdl_lesson_high_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_high_scores`
--

LOCK TABLES `mdl_lesson_high_scores` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_high_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_pages`
--

LOCK TABLES `mdl_lesson_pages` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lesson_timer`
--

LOCK TABLES `mdl_lesson_timer` WRITE;
/*!40000 ALTER TABLE `mdl_lesson_timer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lesson_timer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_license`
--

LOCK TABLES `mdl_license` WRITE;
/*!40000 ALTER TABLE `mdl_license` DISABLE KEYS */;
INSERT INTO `mdl_license` VALUES (1,'unknown','Unknown license','',1,2010033100),(2,'allrightsreserved','All rights reserved','http://en.wikipedia.org/wiki/All_rights_reserved',1,2010033100),(3,'public','Public Domain','http://creativecommons.org/licenses/publicdomain/',1,2010033100),(4,'cc','Creative Commons','http://creativecommons.org/licenses/by/3.0/',1,2010033100),(5,'cc-nd','Creative Commons - NoDerivs','http://creativecommons.org/licenses/by-nd/3.0/',1,2010033100),(6,'cc-nc-nd','Creative Commons - No Commercial NoDerivs','http://creativecommons.org/licenses/by-nc-nd/3.0/',1,2010033100),(7,'cc-nc','Creative Commons - No Commercial','http://creativecommons.org/licenses/by-nc/3.0/',1,2013051500),(8,'cc-nc-sa','Creative Commons - No Commercial ShareAlike','http://creativecommons.org/licenses/by-nc-sa/3.0/',1,2010033100),(9,'cc-sa','Creative Commons - ShareAlike','http://creativecommons.org/licenses/by-sa/3.0/',1,2010033100);
/*!40000 ALTER TABLE `mdl_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log`
--

LOCK TABLES `mdl_log` WRITE;
/*!40000 ALTER TABLE `mdl_log` DISABLE KEYS */;
INSERT INTO `mdl_log` VALUES (1,1372421535,2,'127.0.0.1',1,'user',0,'update','view.php?id=2&course=1',''),(2,1372421717,2,'127.0.0.1',1,'course',0,'view','view.php?id=1','1'),(3,1372424107,2,'127.0.0.1',1,'user',0,'logout','view.php?id=2&course=1','2'),(4,1372424124,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(5,1372424131,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(6,1372424446,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(7,1372424451,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(8,1372424459,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(9,1372424491,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(10,1372424506,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(11,1372424651,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(12,1372424672,0,'127.0.0.1',1,'login',0,'error','index.php','admin'),(13,1372425261,2,'127.0.0.1',1,'user',0,'login','view.php?id=0&course=1','2'),(14,1372425305,2,'127.0.0.1',1,'course',0,'new','view.php?id=2','Тестовый курс (ID 2)'),(15,1372425313,2,'127.0.0.1',1,'user',0,'logout','view.php?id=2&course=1','2'),(16,1372425327,1,'127.0.0.1',1,'user',0,'login','view.php?id=0&course=1','1'),(17,1372425328,1,'127.0.0.1',1,'course',0,'view','view.php?id=1','1'),(18,1372425333,1,'127.0.0.1',1,'course',0,'view','view.php?id=1','1'),(19,1372430301,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(20,1372430308,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(21,1372430313,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(22,1372430320,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(23,1372430324,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(24,1372430337,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(25,1372430473,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(26,1372430478,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(27,1372430508,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(28,1372430527,0,'10.7.0.26',1,'library',0,'mailer','http://imld.ru/moodle/login/forgot_password.php','ERROR: Could not instantiate mail function.'),(29,1372430605,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(30,1372430679,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(31,1372430687,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(32,1372430693,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(33,1372430775,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(34,1372430778,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(35,1372430785,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(36,1372430790,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(37,1372431465,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(38,1372431480,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(39,1372431482,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(40,1372431498,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(41,1372431510,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(42,1372431514,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(43,1372431645,0,'10.7.0.26',1,'login',0,'error','index.php','guest'),(44,1372431650,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(45,1372431656,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(46,1372431670,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(47,1372431673,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(48,1372431676,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(49,1372431950,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(50,1372431953,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(51,1372431954,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(52,1372432050,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(53,1372432053,2,'10.7.0.26',1,'user',0,'logout','view.php?id=2&course=1','2'),(54,1372432060,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(55,1372432060,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(56,1372432459,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(57,1372432496,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(58,1372432502,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(59,1372432504,2,'10.7.0.26',1,'user',0,'logout','view.php?id=2&course=1','2'),(60,1372432512,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(61,1372432527,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(62,1372432527,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(63,1372432749,2,'10.7.0.26',1,'user',0,'logout','view.php?id=2&course=1','2'),(64,1372432764,1,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','1'),(65,1372432765,1,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(66,1372432777,1,'10.7.0.26',1,'user',0,'logout','view.php?id=1&course=1','1'),(67,1372659822,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(68,1372659823,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(69,1372659830,2,'10.7.0.26',1,'user',0,'logout','view.php?id=2&course=1','2'),(70,1372665007,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(71,1372665008,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(72,1372671470,0,'10.7.0.247',1,'login',0,'error','index.php','admin'),(73,1372686794,0,'10.7.0.26',1,'login',0,'error','index.php','admin1'),(74,1372686801,0,'10.7.0.26',1,'login',0,'error','index.php','admin'),(75,1372686807,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(76,1372686807,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(77,1372686833,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(78,1372686875,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(79,1372686878,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1'),(80,1372687967,2,'10.7.0.26',1,'user',0,'login','view.php?id=0&course=1','2'),(81,1372687967,2,'10.7.0.26',1,'course',0,'view','view.php?id=1','1');
/*!40000 ALTER TABLE `mdl_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_display`
--

LOCK TABLES `mdl_log_display` WRITE;
/*!40000 ALTER TABLE `mdl_log_display` DISABLE KEYS */;
INSERT INTO `mdl_log_display` VALUES (1,'course','user report','user','CONCAT(firstname, \' \', lastname)','moodle'),(2,'course','view','course','fullname','moodle'),(3,'course','view section','course_sections','name','moodle'),(4,'course','update','course','fullname','moodle'),(5,'course','hide','course','fullname','moodle'),(6,'course','show','course','fullname','moodle'),(7,'course','move','course','fullname','moodle'),(8,'course','enrol','course','fullname','moodle'),(9,'course','unenrol','course','fullname','moodle'),(10,'course','report log','course','fullname','moodle'),(11,'course','report live','course','fullname','moodle'),(12,'course','report outline','course','fullname','moodle'),(13,'course','report participation','course','fullname','moodle'),(14,'course','report stats','course','fullname','moodle'),(15,'category','add','course_categories','name','moodle'),(16,'category','hide','course_categories','name','moodle'),(17,'category','move','course_categories','name','moodle'),(18,'category','show','course_categories','name','moodle'),(19,'category','update','course_categories','name','moodle'),(20,'message','write','user','CONCAT(firstname, \' \', lastname)','moodle'),(21,'message','read','user','CONCAT(firstname, \' \', lastname)','moodle'),(22,'message','add contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(23,'message','remove contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(24,'message','block contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(25,'message','unblock contact','user','CONCAT(firstname, \' \', lastname)','moodle'),(26,'group','view','groups','name','moodle'),(27,'tag','update','tag','name','moodle'),(28,'tag','flag','tag','name','moodle'),(29,'user','view','user','CONCAT(firstname, \' \', lastname)','moodle'),(30,'assign','add','assign','name','mod_assign'),(31,'assign','delete mod','assign','name','mod_assign'),(32,'assign','download all submissions','assign','name','mod_assign'),(33,'assign','grade submission','assign','name','mod_assign'),(34,'assign','lock submission','assign','name','mod_assign'),(35,'assign','reveal identities','assign','name','mod_assign'),(36,'assign','revert submission to draft','assign','name','mod_assign'),(37,'assign','submission statement accepted','assign','name','mod_assign'),(38,'assign','submit','assign','name','mod_assign'),(39,'assign','submit for grading','assign','name','mod_assign'),(40,'assign','unlock submission','assign','name','mod_assign'),(41,'assign','update','assign','name','mod_assign'),(42,'assign','upload','assign','name','mod_assign'),(43,'assign','view','assign','name','mod_assign'),(44,'assign','view all','course','fullname','mod_assign'),(45,'assign','view confirm submit assignment form','assign','name','mod_assign'),(46,'assign','view grading form','assign','name','mod_assign'),(47,'assign','view submission','assign','name','mod_assign'),(48,'assign','view submission grading table','assign','name','mod_assign'),(49,'assign','view submit assignment form','assign','name','mod_assign'),(50,'assign','view feedback','assign','name','mod_assign'),(51,'assignment','view','assignment','name','mod_assignment'),(52,'assignment','add','assignment','name','mod_assignment'),(53,'assignment','update','assignment','name','mod_assignment'),(54,'assignment','view submission','assignment','name','mod_assignment'),(55,'assignment','upload','assignment','name','mod_assignment'),(56,'book','add','book','name','mod_book'),(57,'book','update','book','name','mod_book'),(58,'book','view','book','name','mod_book'),(59,'book','add chapter','book_chapters','title','mod_book'),(60,'book','update chapter','book_chapters','title','mod_book'),(61,'book','view chapter','book_chapters','title','mod_book'),(62,'chat','view','chat','name','mod_chat'),(63,'chat','add','chat','name','mod_chat'),(64,'chat','update','chat','name','mod_chat'),(65,'chat','report','chat','name','mod_chat'),(66,'chat','talk','chat','name','mod_chat'),(67,'choice','view','choice','name','mod_choice'),(68,'choice','update','choice','name','mod_choice'),(69,'choice','add','choice','name','mod_choice'),(70,'choice','report','choice','name','mod_choice'),(71,'choice','choose','choice','name','mod_choice'),(72,'choice','choose again','choice','name','mod_choice'),(73,'data','view','data','name','mod_data'),(74,'data','add','data','name','mod_data'),(75,'data','update','data','name','mod_data'),(76,'data','record delete','data','name','mod_data'),(77,'data','fields add','data_fields','name','mod_data'),(78,'data','fields update','data_fields','name','mod_data'),(79,'data','templates saved','data','name','mod_data'),(80,'data','templates def','data','name','mod_data'),(81,'feedback','startcomplete','feedback','name','mod_feedback'),(82,'feedback','submit','feedback','name','mod_feedback'),(83,'feedback','delete','feedback','name','mod_feedback'),(84,'feedback','view','feedback','name','mod_feedback'),(85,'feedback','view all','course','shortname','mod_feedback'),(86,'folder','view','folder','name','mod_folder'),(87,'folder','view all','folder','name','mod_folder'),(88,'folder','update','folder','name','mod_folder'),(89,'folder','add','folder','name','mod_folder'),(90,'forum','add','forum','name','mod_forum'),(91,'forum','update','forum','name','mod_forum'),(92,'forum','add discussion','forum_discussions','name','mod_forum'),(93,'forum','add post','forum_posts','subject','mod_forum'),(94,'forum','update post','forum_posts','subject','mod_forum'),(95,'forum','user report','user','CONCAT(firstname, \' \', lastname)','mod_forum'),(96,'forum','move discussion','forum_discussions','name','mod_forum'),(97,'forum','view subscribers','forum','name','mod_forum'),(98,'forum','view discussion','forum_discussions','name','mod_forum'),(99,'forum','view forum','forum','name','mod_forum'),(100,'forum','subscribe','forum','name','mod_forum'),(101,'forum','unsubscribe','forum','name','mod_forum'),(102,'glossary','add','glossary','name','mod_glossary'),(103,'glossary','update','glossary','name','mod_glossary'),(104,'glossary','view','glossary','name','mod_glossary'),(105,'glossary','view all','glossary','name','mod_glossary'),(106,'glossary','add entry','glossary','name','mod_glossary'),(107,'glossary','update entry','glossary','name','mod_glossary'),(108,'glossary','add category','glossary','name','mod_glossary'),(109,'glossary','update category','glossary','name','mod_glossary'),(110,'glossary','delete category','glossary','name','mod_glossary'),(111,'glossary','approve entry','glossary','name','mod_glossary'),(112,'glossary','view entry','glossary_entries','concept','mod_glossary'),(113,'imscp','view','imscp','name','mod_imscp'),(114,'imscp','view all','imscp','name','mod_imscp'),(115,'imscp','update','imscp','name','mod_imscp'),(116,'imscp','add','imscp','name','mod_imscp'),(117,'label','add','label','name','mod_label'),(118,'label','update','label','name','mod_label'),(119,'lesson','start','lesson','name','mod_lesson'),(120,'lesson','end','lesson','name','mod_lesson'),(121,'lesson','view','lesson_pages','title','mod_lesson'),(122,'lti','view','lti','name','mod_lti'),(123,'lti','launch','lti','name','mod_lti'),(124,'lti','view all','lti','name','mod_lti'),(125,'page','view','page','name','mod_page'),(126,'page','view all','page','name','mod_page'),(127,'page','update','page','name','mod_page'),(128,'page','add','page','name','mod_page'),(129,'quiz','add','quiz','name','mod_quiz'),(130,'quiz','update','quiz','name','mod_quiz'),(131,'quiz','view','quiz','name','mod_quiz'),(132,'quiz','report','quiz','name','mod_quiz'),(133,'quiz','attempt','quiz','name','mod_quiz'),(134,'quiz','submit','quiz','name','mod_quiz'),(135,'quiz','review','quiz','name','mod_quiz'),(136,'quiz','editquestions','quiz','name','mod_quiz'),(137,'quiz','preview','quiz','name','mod_quiz'),(138,'quiz','start attempt','quiz','name','mod_quiz'),(139,'quiz','close attempt','quiz','name','mod_quiz'),(140,'quiz','continue attempt','quiz','name','mod_quiz'),(141,'quiz','edit override','quiz','name','mod_quiz'),(142,'quiz','delete override','quiz','name','mod_quiz'),(143,'resource','view','resource','name','mod_resource'),(144,'resource','view all','resource','name','mod_resource'),(145,'resource','update','resource','name','mod_resource'),(146,'resource','add','resource','name','mod_resource'),(147,'scorm','view','scorm','name','mod_scorm'),(148,'scorm','review','scorm','name','mod_scorm'),(149,'scorm','update','scorm','name','mod_scorm'),(150,'scorm','add','scorm','name','mod_scorm'),(151,'survey','add','survey','name','mod_survey'),(152,'survey','update','survey','name','mod_survey'),(153,'survey','download','survey','name','mod_survey'),(154,'survey','view form','survey','name','mod_survey'),(155,'survey','view graph','survey','name','mod_survey'),(156,'survey','view report','survey','name','mod_survey'),(157,'survey','submit','survey','name','mod_survey'),(158,'url','view','url','name','mod_url'),(159,'url','view all','url','name','mod_url'),(160,'url','update','url','name','mod_url'),(161,'url','add','url','name','mod_url'),(162,'workshop','add','workshop','name','mod_workshop'),(163,'workshop','update','workshop','name','mod_workshop'),(164,'workshop','view','workshop','name','mod_workshop'),(165,'workshop','view all','workshop','name','mod_workshop'),(166,'workshop','add submission','workshop_submissions','title','mod_workshop'),(167,'workshop','update submission','workshop_submissions','title','mod_workshop'),(168,'workshop','view submission','workshop_submissions','title','mod_workshop'),(169,'workshop','add assessment','workshop_submissions','title','mod_workshop'),(170,'workshop','update assessment','workshop_submissions','title','mod_workshop'),(171,'workshop','add example','workshop_submissions','title','mod_workshop'),(172,'workshop','update example','workshop_submissions','title','mod_workshop'),(173,'workshop','view example','workshop_submissions','title','mod_workshop'),(174,'workshop','add reference assessment','workshop_submissions','title','mod_workshop'),(175,'workshop','update reference assessment','workshop_submissions','title','mod_workshop'),(176,'workshop','add example assessment','workshop_submissions','title','mod_workshop'),(177,'workshop','update example assessment','workshop_submissions','title','mod_workshop'),(178,'workshop','update aggregate grades','workshop','name','mod_workshop'),(179,'workshop','update clear aggregated grades','workshop','name','mod_workshop'),(180,'workshop','update clear assessments','workshop','name','mod_workshop'),(181,'book','exportimscp','book','name','booktool_exportimscp'),(182,'book','print','book','name','booktool_print'),(183,'book','print chapter','book_chapters','title','booktool_print'),(184,'autoview','view','autoview','name','mod_autoview'),(185,'autoview','view all','autoview','name','mod_autoview'),(186,'autoview','update','autoview','name','mod_autoview'),(187,'autoview','add','autoview','name','mod_autoview'),(188,'autoview','edit','autoview','name','mod_autoview'),(189,'autoview','flash play','autoview','name','mod_autoview'),(190,'autoview','flash play and rec','autoview','name','mod_autoview');
/*!40000 ALTER TABLE `mdl_log_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_log_queries`
--

LOCK TABLES `mdl_log_queries` WRITE;
/*!40000 ALTER TABLE `mdl_log_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_log_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti`
--

LOCK TABLES `mdl_lti` WRITE;
/*!40000 ALTER TABLE `mdl_lti` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_submission`
--

LOCK TABLES `mdl_lti_submission` WRITE;
/*!40000 ALTER TABLE `mdl_lti_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types`
--

LOCK TABLES `mdl_lti_types` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_lti_types_config`
--

LOCK TABLES `mdl_lti_types_config` WRITE;
/*!40000 ALTER TABLE `mdl_lti_types_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_lti_types_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message`
--

LOCK TABLES `mdl_message` WRITE;
/*!40000 ALTER TABLE `mdl_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_contacts`
--

LOCK TABLES `mdl_message_contacts` WRITE;
/*!40000 ALTER TABLE `mdl_message_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_processors`
--

LOCK TABLES `mdl_message_processors` WRITE;
/*!40000 ALTER TABLE `mdl_message_processors` DISABLE KEYS */;
INSERT INTO `mdl_message_processors` VALUES (1,'email',1),(2,'jabber',1),(3,'popup',1);
/*!40000 ALTER TABLE `mdl_message_processors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_providers`
--

LOCK TABLES `mdl_message_providers` WRITE;
/*!40000 ALTER TABLE `mdl_message_providers` DISABLE KEYS */;
INSERT INTO `mdl_message_providers` VALUES (1,'notices','moodle','moodle/site:config'),(2,'errors','moodle','moodle/site:config'),(3,'availableupdate','moodle','moodle/site:config'),(4,'instantmessage','moodle',NULL),(5,'backup','moodle','moodle/site:config'),(6,'courserequested','moodle','moodle/site:approvecourse'),(7,'courserequestapproved','moodle','moodle/course:request'),(8,'courserequestrejected','moodle','moodle/course:request'),(9,'assign_notification','mod_assign',NULL),(10,'assignment_updates','mod_assignment',NULL),(11,'submission','mod_feedback',NULL),(12,'message','mod_feedback',NULL),(13,'posts','mod_forum',NULL),(14,'graded_essay','mod_lesson',NULL),(15,'submission','mod_quiz','mod/quiz:emailnotifysubmission'),(16,'confirmation','mod_quiz','mod/quiz:emailconfirmsubmission'),(17,'attempt_overdue','mod_quiz','mod/quiz:emailwarnoverdue'),(18,'authorize_enrolment','enrol_authorize',NULL),(19,'flatfile_enrolment','enrol_flatfile',NULL),(20,'imsenterprise_enrolment','enrol_imsenterprise',NULL),(21,'expiry_notification','enrol_manual',NULL),(22,'paypal_enrolment','enrol_paypal',NULL),(23,'expiry_notification','enrol_self',NULL);
/*!40000 ALTER TABLE `mdl_message_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_read`
--

LOCK TABLES `mdl_message_read` WRITE;
/*!40000 ALTER TABLE `mdl_message_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_message_working`
--

LOCK TABLES `mdl_message_working` WRITE;
/*!40000 ALTER TABLE `mdl_message_working` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_message_working` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_application`
--

LOCK TABLES `mdl_mnet_application` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_application` DISABLE KEYS */;
INSERT INTO `mdl_mnet_application` VALUES (1,'moodle','Moodle','/mnet/xmlrpc/server.php','/auth/mnet/land.php','/auth/mnet/jump.php'),(2,'mahara','Mahara','/api/xmlrpc/server.php','/auth/xmlrpc/land.php','/auth/xmlrpc/jump.php');
/*!40000 ALTER TABLE `mdl_mnet_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host`
--

LOCK TABLES `mdl_mnet_host` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host` DISABLE KEYS */;
INSERT INTO `mdl_mnet_host` VALUES (1,0,'http://localhost.com:8080/moodle25','127.0.0.1','','',0,0,0,0,0,0,NULL,1),(2,0,'','','All Hosts','',0,0,0,0,0,0,NULL,1);
/*!40000 ALTER TABLE `mdl_mnet_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_host2service`
--

LOCK TABLES `mdl_mnet_host2service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_host2service` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_host2service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_log`
--

LOCK TABLES `mdl_mnet_log` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

LOCK TABLES `mdl_mnet_remote_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1),(15,'send_content_intent','portfolio/mahara/lib.php/send_content_intent','portfolio','mahara',1),(16,'send_content_ready','portfolio/mahara/lib.php/send_content_ready','portfolio','mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_remote_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

LOCK TABLES `mdl_mnet_remote_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_remote_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15),(16,4,16);
/*!40000 ALTER TABLE `mdl_mnet_remote_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_rpc`
--

LOCK TABLES `mdl_mnet_rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_rpc` VALUES (1,'user_authorise','auth/mnet/auth.php/user_authorise','auth','mnet',1,'Return user data for the provided token, compare with user_agent string.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:37:\"The unique ID provided by remotehost.\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:44:\"$userdata Array of user info for remote host\";}}','auth.php','auth_plugin_mnet',0),(2,'keepalive_server','auth/mnet/auth.php/keepalive_server','auth','mnet',1,'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(3,'kill_children','auth/mnet/auth.php/kill_children','auth','mnet',1,'The IdP uses this function to kill child sessions on other hosts','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:39:\"A plaintext report of what has happened\";}}','auth.php','auth_plugin_mnet',0),(4,'refresh_log','auth/mnet/auth.php/refresh_log','auth','mnet',1,'Receives an array of log entries from an SP and adds them to the mnet_log\ntable','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"array\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:21:\"An array of usernames\";}}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"\"All ok\" or an error message\";}}','auth.php','auth_plugin_mnet',0),(5,'fetch_user_image','auth/mnet/auth.php/fetch_user_image','auth','mnet',1,'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:18:\"The id of the user\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:84:\"false if user not found, empty array if no picture exists, array with data otherwise\";}}','auth.php','auth_plugin_mnet',0),(6,'fetch_theme_info','auth/mnet/auth.php/fetch_theme_info','auth','mnet',1,'Returns the theme information and logo url as strings.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:6:\"string\";s:11:\"description\";s:14:\"The theme info\";}}','auth.php','auth_plugin_mnet',0),(7,'update_enrolments','auth/mnet/auth.php/update_enrolments','auth','mnet',1,'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:12:\"The username\";}i:1;a:3:{s:4:\"name\";s:7:\"courses\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(8,'keepalive_client','auth/mnet/auth.php/keepalive_client','auth','mnet',1,'Poll the IdP server to let it know that a user it has authenticated is still\nonline','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','auth.php','auth_plugin_mnet',0),(9,'kill_child','auth/mnet/auth.php/kill_child','auth','mnet',1,'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:28:\"Username for session to kill\";}i:1;a:3:{s:4:\"name\";s:9:\"useragent\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:15:\"True on success\";}}','auth.php','auth_plugin_mnet',0),(10,'available_courses','enrol/mnet/enrol.php/available_courses','enrol','mnet',1,'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(11,'user_enrolments','enrol/mnet/enrol.php/user_enrolments','enrol','mnet',1,'This method has never been implemented in Moodle MNet API','a:2:{s:10:\"parameters\";a:0:{}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:11:\"empty array\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(12,'enrol_user','enrol/mnet/enrol.php/enrol_user','enrol','mnet',1,'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"userdata\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:14:\"user details {\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:19:\"our local course id\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:69:\"true if the enrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(13,'unenrol_user','enrol/mnet/enrol.php/unenrol_user','enrol','mnet',1,'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"username\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:18:\"of the remote user\";}i:1;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"bool\";s:11:\"description\";s:71:\"true if the unenrolment has been successful, throws exception otherwise\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(14,'course_enrolments','enrol/mnet/enrol.php/course_enrolments','enrol','mnet',1,'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.','a:2:{s:10:\"parameters\";a:2:{i:0;a:3:{s:4:\"name\";s:8:\"courseid\";s:4:\"type\";s:3:\"int\";s:11:\"description\";s:16:\"ID of our course\";}i:1;a:3:{s:4:\"name\";s:5:\"roles\";s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}s:6:\"return\";a:2:{s:4:\"type\";s:5:\"array\";s:11:\"description\";s:0:\"\";}}','enrol.php','enrol_mnet_mnetservice_enrol',0),(15,'fetch_file','portfolio/mahara/lib.php/fetch_file','portfolio','mahara',1,'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.','a:2:{s:10:\"parameters\";a:1:{i:0;a:3:{s:4:\"name\";s:5:\"token\";s:4:\"type\";s:6:\"string\";s:11:\"description\";s:56:\"the token recieved previously during send_content_intent\";}}s:6:\"return\";a:2:{s:4:\"type\";s:4:\"void\";s:11:\"description\";s:0:\"\";}}','lib.php','portfolio_plugin_mahara',1);
/*!40000 ALTER TABLE `mdl_mnet_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service`
--

LOCK TABLES `mdl_mnet_service` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service` VALUES (1,'sso_idp','','1',1),(2,'sso_sp','','1',1),(3,'mnet_enrol','','1',1),(4,'pf','','1',1);
/*!40000 ALTER TABLE `mdl_mnet_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

LOCK TABLES `mdl_mnet_service2rpc` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` DISABLE KEYS */;
INSERT INTO `mdl_mnet_service2rpc` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,4,15);
/*!40000 ALTER TABLE `mdl_mnet_service2rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_session`
--

LOCK TABLES `mdl_mnet_session` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnet_sso_access_control`
--

LOCK TABLES `mdl_mnet_sso_access_control` WRITE;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnet_sso_access_control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_courses`
--

LOCK TABLES `mdl_mnetservice_enrol_courses` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_mnetservice_enrol_enrolments`
--

LOCK TABLES `mdl_mnetservice_enrol_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_mnetservice_enrol_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_modules`
--

LOCK TABLES `mdl_modules` WRITE;
/*!40000 ALTER TABLE `mdl_modules` DISABLE KEYS */;
INSERT INTO `mdl_modules` VALUES (1,'assign',2013050100,60,0,'',1),(2,'assignment',2013050100,60,0,'',0),(3,'book',2013050100,0,0,'',1),(4,'chat',2013050100,300,0,'',1),(5,'choice',2013050100,0,0,'',1),(6,'data',2013050100,0,0,'',1),(7,'feedback',2013050100,0,0,'',0),(8,'folder',2013050100,0,0,'',1),(9,'forum',2013050100,60,0,'',1),(10,'glossary',2013050100,0,0,'',1),(11,'imscp',2013050100,0,0,'',1),(12,'label',2013050100,0,0,'',1),(13,'lesson',2013050100,0,0,'',1),(14,'lti',2013050100,0,0,'',1),(15,'page',2013050100,0,0,'',1),(16,'quiz',2013050100,60,0,'',1),(17,'resource',2013050100,0,0,'',1),(18,'scorm',2013050100,300,0,'',1),(19,'survey',2013050100,0,0,'',1),(20,'url',2013050100,0,0,'',1),(21,'wiki',2013050100,0,0,'',1),(22,'workshop',2013050100,60,0,'',1),(23,'autoview',2012100901,300,0,'',1);
/*!40000 ALTER TABLE `mdl_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_my_pages`
--

LOCK TABLES `mdl_my_pages` WRITE;
/*!40000 ALTER TABLE `mdl_my_pages` DISABLE KEYS */;
INSERT INTO `mdl_my_pages` VALUES (1,NULL,'__default',0,0),(2,NULL,'__default',1,0);
/*!40000 ALTER TABLE `mdl_my_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_page`
--

LOCK TABLES `mdl_page` WRITE;
/*!40000 ALTER TABLE `mdl_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance`
--

LOCK TABLES `mdl_portfolio_instance` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_config`
--

LOCK TABLES `mdl_portfolio_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_instance_user`
--

LOCK TABLES `mdl_portfolio_instance_user` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_instance_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_log`
--

LOCK TABLES `mdl_portfolio_log` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_mahara_queue`
--

LOCK TABLES `mdl_portfolio_mahara_queue` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_mahara_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_portfolio_tempdata`
--

LOCK TABLES `mdl_portfolio_tempdata` WRITE;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_portfolio_tempdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_post`
--

LOCK TABLES `mdl_post` WRITE;
/*!40000 ALTER TABLE `mdl_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_profiling`
--

LOCK TABLES `mdl_profiling` WRITE;
/*!40000 ALTER TABLE `mdl_profiling` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_profiling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_essay_options`
--

LOCK TABLES `mdl_qtype_essay_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_essay_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_options`
--

LOCK TABLES `mdl_qtype_match_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

LOCK TABLES `mdl_qtype_match_subquestions` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_match_subquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_qtype_shortanswer_options`
--

LOCK TABLES `mdl_qtype_shortanswer_options` WRITE;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_qtype_shortanswer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question`
--

LOCK TABLES `mdl_question` WRITE;
/*!40000 ALTER TABLE `mdl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_answers`
--

LOCK TABLES `mdl_question_answers` WRITE;
/*!40000 ALTER TABLE `mdl_question_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_step_data`
--

LOCK TABLES `mdl_question_attempt_step_data` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_step_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempt_steps`
--

LOCK TABLES `mdl_question_attempt_steps` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempt_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_attempts`
--

LOCK TABLES `mdl_question_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_question_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated`
--

LOCK TABLES `mdl_question_calculated` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_calculated_options`
--

LOCK TABLES `mdl_question_calculated_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_calculated_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_calculated_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_categories`
--

LOCK TABLES `mdl_question_categories` WRITE;
/*!40000 ALTER TABLE `mdl_question_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_definitions`
--

LOCK TABLES `mdl_question_dataset_definitions` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_dataset_items`
--

LOCK TABLES `mdl_question_dataset_items` WRITE;
/*!40000 ALTER TABLE `mdl_question_dataset_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_dataset_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_datasets`
--

LOCK TABLES `mdl_question_datasets` WRITE;
/*!40000 ALTER TABLE `mdl_question_datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_hints`
--

LOCK TABLES `mdl_question_hints` WRITE;
/*!40000 ALTER TABLE `mdl_question_hints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multianswer`
--

LOCK TABLES `mdl_question_multianswer` WRITE;
/*!40000 ALTER TABLE `mdl_question_multianswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multianswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_multichoice`
--

DROP TABLE IF EXISTS `mdl_question_multichoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_multichoice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_multichoice`
--

LOCK TABLES `mdl_question_multichoice` WRITE;
/*!40000 ALTER TABLE `mdl_question_multichoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_multichoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical`
--

LOCK TABLES `mdl_question_numerical` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_options`
--

LOCK TABLES `mdl_question_numerical_options` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_numerical_units`
--

LOCK TABLES `mdl_question_numerical_units` WRITE;
/*!40000 ALTER TABLE `mdl_question_numerical_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_numerical_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_randomsamatch`
--

DROP TABLE IF EXISTS `mdl_question_randomsamatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_randomsamatch`
--

LOCK TABLES `mdl_question_randomsamatch` WRITE;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_randomsamatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_sessions`
--

DROP TABLE IF EXISTS `mdl_question_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_sessions`
--

LOCK TABLES `mdl_question_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_question_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_states`
--

DROP TABLE IF EXISTS `mdl_question_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_states`
--

LOCK TABLES `mdl_question_states` WRITE;
/*!40000 ALTER TABLE `mdl_question_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_truefalse`
--

LOCK TABLES `mdl_question_truefalse` WRITE;
/*!40000 ALTER TABLE `mdl_question_truefalse` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_truefalse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_question_usages`
--

LOCK TABLES `mdl_question_usages` WRITE;
/*!40000 ALTER TABLE `mdl_question_usages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_question_usages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz`
--

LOCK TABLES `mdl_quiz` WRITE;
/*!40000 ALTER TABLE `mdl_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_attempts`
--

LOCK TABLES `mdl_quiz_attempts` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_feedback`
--

LOCK TABLES `mdl_quiz_feedback` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_grades`
--

LOCK TABLES `mdl_quiz_grades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overrides`
--

LOCK TABLES `mdl_quiz_overrides` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overrides` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overrides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_overview_regrades`
--

LOCK TABLES `mdl_quiz_overview_regrades` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_overview_regrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_instances`
--

DROP TABLE IF EXISTS `mdl_quiz_question_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_instances`
--

LOCK TABLES `mdl_quiz_question_instances` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_response_stats`
--

DROP TABLE IF EXISTS `mdl_quiz_question_response_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_response_stats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quiz question responses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_response_stats`
--

LOCK TABLES `mdl_quiz_question_response_stats` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_response_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_response_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_question_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_question_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_question_statistics`
--

LOCK TABLES `mdl_quiz_question_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_question_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_question_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_reports`
--

LOCK TABLES `mdl_quiz_reports` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_reports` DISABLE KEYS */;
INSERT INTO `mdl_quiz_reports` VALUES (1,'grading',6000,'mod/quiz:grade'),(2,'overview',10000,NULL),(3,'responses',9000,NULL),(4,'statistics',8000,'quiz/statistics:view');
/*!40000 ALTER TABLE `mdl_quiz_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL,
  `allattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_quiz_statistics`
--

LOCK TABLES `mdl_quiz_statistics` WRITE;
/*!40000 ALTER TABLE `mdl_quiz_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_quiz_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_rating`
--

LOCK TABLES `mdl_rating` WRITE;
/*!40000 ALTER TABLE `mdl_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_registration_hubs`
--

LOCK TABLES `mdl_registration_hubs` WRITE;
/*!40000 ALTER TABLE `mdl_registration_hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_registration_hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository`
--

LOCK TABLES `mdl_repository` WRITE;
/*!40000 ALTER TABLE `mdl_repository` DISABLE KEYS */;
INSERT INTO `mdl_repository` VALUES (1,'local',1,1),(2,'recent',1,2),(3,'upload',1,3),(4,'url',1,4),(5,'user',1,5),(6,'wikimedia',1,6),(7,'youtube',1,7);
/*!40000 ALTER TABLE `mdl_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instance_config`
--

LOCK TABLES `mdl_repository_instance_config` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instance_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_repository_instance_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_repository_instances`
--

LOCK TABLES `mdl_repository_instances` WRITE;
/*!40000 ALTER TABLE `mdl_repository_instances` DISABLE KEYS */;
INSERT INTO `mdl_repository_instances` VALUES (1,'',1,0,1,NULL,NULL,1372421329,1372421329,0),(2,'',2,0,1,NULL,NULL,1372421331,1372421331,0),(3,'',3,0,1,NULL,NULL,1372421333,1372421333,0),(4,'',4,0,1,NULL,NULL,1372421335,1372421335,0),(5,'',5,0,1,NULL,NULL,1372421336,1372421336,0),(6,'',6,0,1,NULL,NULL,1372421338,1372421338,0),(7,'',7,0,1,NULL,NULL,1372421339,1372421339,0);
/*!40000 ALTER TABLE `mdl_repository_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource`
--

LOCK TABLES `mdl_resource` WRITE;
/*!40000 ALTER TABLE `mdl_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_resource_old`
--

LOCK TABLES `mdl_resource_old` WRITE;
/*!40000 ALTER TABLE `mdl_resource_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_resource_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role`
--

LOCK TABLES `mdl_role` WRITE;
/*!40000 ALTER TABLE `mdl_role` DISABLE KEYS */;
INSERT INTO `mdl_role` VALUES (1,'','manager','',1,'manager'),(2,'','coursecreator','',2,'coursecreator'),(3,'','editingteacher','',3,'editingteacher'),(4,'','teacher','',4,'teacher'),(5,'','student','',5,'student'),(6,'','guest','',6,'guest'),(7,'','user','',7,'user'),(8,'','frontpage','',8,'frontpage');
/*!40000 ALTER TABLE `mdl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_assign`
--

LOCK TABLES `mdl_role_allow_assign` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_assign` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_assign` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,4),(7,3,5);
/*!40000 ALTER TABLE `mdl_role_allow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_override`
--

LOCK TABLES `mdl_role_allow_override` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_override` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_override` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,3,4),(10,3,5),(11,3,6);
/*!40000 ALTER TABLE `mdl_role_allow_override` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_allow_switch`
--

LOCK TABLES `mdl_role_allow_switch` WRITE;
/*!40000 ALTER TABLE `mdl_role_allow_switch` DISABLE KEYS */;
INSERT INTO `mdl_role_allow_switch` VALUES (1,1,3),(2,1,4),(3,1,5),(4,1,6),(5,3,4),(6,3,5),(7,3,6),(8,4,5),(9,4,6);
/*!40000 ALTER TABLE `mdl_role_allow_switch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_assignments`
--

LOCK TABLES `mdl_role_assignments` WRITE;
/*!40000 ALTER TABLE `mdl_role_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_capabilities`
--

LOCK TABLES `mdl_role_capabilities` WRITE;
/*!40000 ALTER TABLE `mdl_role_capabilities` DISABLE KEYS */;
INSERT INTO `mdl_role_capabilities` VALUES (1,1,1,'moodle/site:readallmessages',1,1372420974,0),(2,1,3,'moodle/site:readallmessages',1,1372420974,0),(3,1,1,'moodle/site:sendmessage',1,1372420974,0),(4,1,7,'moodle/site:sendmessage',1,1372420974,0),(5,1,1,'moodle/site:approvecourse',1,1372420975,0),(6,1,3,'moodle/backup:backupcourse',1,1372420975,0),(7,1,1,'moodle/backup:backupcourse',1,1372420975,0),(8,1,3,'moodle/backup:backupsection',1,1372420975,0),(9,1,1,'moodle/backup:backupsection',1,1372420975,0),(10,1,3,'moodle/backup:backupactivity',1,1372420975,0),(11,1,1,'moodle/backup:backupactivity',1,1372420975,0),(12,1,3,'moodle/backup:backuptargethub',1,1372420975,0),(13,1,1,'moodle/backup:backuptargethub',1,1372420975,0),(14,1,3,'moodle/backup:backuptargetimport',1,1372420975,0),(15,1,1,'moodle/backup:backuptargetimport',1,1372420975,0),(16,1,3,'moodle/backup:downloadfile',1,1372420975,0),(17,1,1,'moodle/backup:downloadfile',1,1372420975,0),(18,1,3,'moodle/backup:configure',1,1372420975,0),(19,1,1,'moodle/backup:configure',1,1372420975,0),(20,1,1,'moodle/backup:userinfo',1,1372420975,0),(21,1,1,'moodle/backup:anonymise',1,1372420975,0),(22,1,3,'moodle/restore:restorecourse',1,1372420975,0),(23,1,1,'moodle/restore:restorecourse',1,1372420976,0),(24,1,3,'moodle/restore:restoresection',1,1372420976,0),(25,1,1,'moodle/restore:restoresection',1,1372420976,0),(26,1,3,'moodle/restore:restoreactivity',1,1372420977,0),(27,1,1,'moodle/restore:restoreactivity',1,1372420977,0),(28,1,3,'moodle/restore:restoretargethub',1,1372420977,0),(29,1,1,'moodle/restore:restoretargethub',1,1372420977,0),(30,1,3,'moodle/restore:restoretargetimport',1,1372420977,0),(31,1,1,'moodle/restore:restoretargetimport',1,1372420977,0),(32,1,3,'moodle/restore:uploadfile',1,1372420978,0),(33,1,1,'moodle/restore:uploadfile',1,1372420978,0),(34,1,3,'moodle/restore:configure',1,1372420978,0),(35,1,1,'moodle/restore:configure',1,1372420978,0),(36,1,2,'moodle/restore:rolldates',1,1372420978,0),(37,1,1,'moodle/restore:rolldates',1,1372420978,0),(38,1,1,'moodle/restore:userinfo',1,1372420979,0),(39,1,1,'moodle/restore:createuser',1,1372420979,0),(40,1,3,'moodle/site:manageblocks',1,1372420979,0),(41,1,1,'moodle/site:manageblocks',1,1372420979,0),(42,1,4,'moodle/site:accessallgroups',1,1372420980,0),(43,1,3,'moodle/site:accessallgroups',1,1372420980,0),(44,1,1,'moodle/site:accessallgroups',1,1372420980,0),(45,1,4,'moodle/site:viewfullnames',1,1372420980,0),(46,1,3,'moodle/site:viewfullnames',1,1372420980,0),(47,1,1,'moodle/site:viewfullnames',1,1372420980,0),(48,1,4,'moodle/site:viewuseridentity',1,1372420980,0),(49,1,3,'moodle/site:viewuseridentity',1,1372420980,0),(50,1,1,'moodle/site:viewuseridentity',1,1372420980,0),(51,1,4,'moodle/site:viewreports',1,1372420980,0),(52,1,3,'moodle/site:viewreports',1,1372420980,0),(53,1,1,'moodle/site:viewreports',1,1372420980,0),(54,1,3,'moodle/site:trustcontent',1,1372420980,0),(55,1,1,'moodle/site:trustcontent',1,1372420980,0),(56,1,1,'moodle/site:uploadusers',1,1372420980,0),(57,1,3,'moodle/filter:manage',1,1372420981,0),(58,1,1,'moodle/filter:manage',1,1372420981,0),(59,1,1,'moodle/user:create',1,1372420981,0),(60,1,1,'moodle/user:delete',1,1372420981,0),(61,1,1,'moodle/user:update',1,1372420981,0),(62,1,6,'moodle/user:viewdetails',1,1372420981,0),(63,1,5,'moodle/user:viewdetails',1,1372420982,0),(64,1,4,'moodle/user:viewdetails',1,1372420982,0),(65,1,3,'moodle/user:viewdetails',1,1372420982,0),(66,1,1,'moodle/user:viewdetails',1,1372420982,0),(67,1,1,'moodle/user:viewalldetails',1,1372420982,0),(68,1,4,'moodle/user:viewhiddendetails',1,1372420982,0),(69,1,3,'moodle/user:viewhiddendetails',1,1372420982,0),(70,1,1,'moodle/user:viewhiddendetails',1,1372420982,0),(71,1,1,'moodle/user:loginas',1,1372420982,0),(72,1,1,'moodle/user:managesyspages',1,1372420982,0),(73,1,7,'moodle/user:manageownblocks',1,1372420982,0),(74,1,7,'moodle/user:manageownfiles',1,1372420982,0),(75,1,1,'moodle/my:configsyspages',1,1372420982,0),(76,1,3,'moodle/role:assign',1,1372420982,0),(77,1,1,'moodle/role:assign',1,1372420983,0),(78,1,4,'moodle/role:review',1,1372420983,0),(79,1,3,'moodle/role:review',1,1372420983,0),(80,1,1,'moodle/role:review',1,1372420983,0),(81,1,1,'moodle/role:override',1,1372420983,0),(82,1,3,'moodle/role:safeoverride',1,1372420983,0),(83,1,1,'moodle/role:manage',1,1372420983,0),(84,1,3,'moodle/role:switchroles',1,1372420983,0),(85,1,1,'moodle/role:switchroles',1,1372420983,0),(86,1,1,'moodle/category:manage',1,1372420983,0),(87,1,2,'moodle/category:viewhiddencategories',1,1372420984,0),(88,1,1,'moodle/category:viewhiddencategories',1,1372420984,0),(89,1,1,'moodle/cohort:manage',1,1372420984,0),(90,1,1,'moodle/cohort:assign',1,1372420984,0),(91,1,3,'moodle/cohort:view',1,1372420984,0),(92,1,1,'moodle/cohort:view',1,1372420984,0),(93,1,2,'moodle/course:create',1,1372420985,0),(94,1,1,'moodle/course:create',1,1372420985,0),(95,1,7,'moodle/course:request',1,1372420985,0),(96,1,1,'moodle/course:delete',1,1372420985,0),(97,1,3,'moodle/course:update',1,1372420985,0),(98,1,1,'moodle/course:update',1,1372420985,0),(99,1,1,'moodle/course:view',1,1372420985,0),(100,1,3,'moodle/course:enrolreview',1,1372420985,0),(101,1,1,'moodle/course:enrolreview',1,1372420985,0),(102,1,3,'moodle/course:enrolconfig',1,1372420985,0),(103,1,1,'moodle/course:enrolconfig',1,1372420985,0),(104,1,4,'moodle/course:bulkmessaging',1,1372420985,0),(105,1,3,'moodle/course:bulkmessaging',1,1372420985,0),(106,1,1,'moodle/course:bulkmessaging',1,1372420985,0),(107,1,4,'moodle/course:viewhiddenuserfields',1,1372420986,0),(108,1,3,'moodle/course:viewhiddenuserfields',1,1372420986,0),(109,1,1,'moodle/course:viewhiddenuserfields',1,1372420986,0),(110,1,2,'moodle/course:viewhiddencourses',1,1372420986,0),(111,1,4,'moodle/course:viewhiddencourses',1,1372420986,0),(112,1,3,'moodle/course:viewhiddencourses',1,1372420986,0),(113,1,1,'moodle/course:viewhiddencourses',1,1372420986,0),(114,1,3,'moodle/course:visibility',1,1372420986,0),(115,1,1,'moodle/course:visibility',1,1372420986,0),(116,1,3,'moodle/course:managefiles',1,1372420986,0),(117,1,1,'moodle/course:managefiles',1,1372420986,0),(118,1,3,'moodle/course:manageactivities',1,1372420986,0),(119,1,1,'moodle/course:manageactivities',1,1372420986,0),(120,1,3,'moodle/course:activityvisibility',1,1372420986,0),(121,1,1,'moodle/course:activityvisibility',1,1372420986,0),(122,1,4,'moodle/course:viewhiddenactivities',1,1372420987,0),(123,1,3,'moodle/course:viewhiddenactivities',1,1372420987,0),(124,1,1,'moodle/course:viewhiddenactivities',1,1372420987,0),(125,1,5,'moodle/course:viewparticipants',1,1372420987,0),(126,1,4,'moodle/course:viewparticipants',1,1372420987,0),(127,1,3,'moodle/course:viewparticipants',1,1372420987,0),(128,1,1,'moodle/course:viewparticipants',1,1372420987,0),(129,1,3,'moodle/course:changefullname',1,1372420987,0),(130,1,1,'moodle/course:changefullname',1,1372420987,0),(131,1,3,'moodle/course:changeshortname',1,1372420987,0),(132,1,1,'moodle/course:changeshortname',1,1372420987,0),(133,1,3,'moodle/course:changeidnumber',1,1372420987,0),(134,1,1,'moodle/course:changeidnumber',1,1372420987,0),(135,1,3,'moodle/course:changecategory',1,1372420987,0),(136,1,1,'moodle/course:changecategory',1,1372420987,0),(137,1,3,'moodle/course:changesummary',1,1372420987,0),(138,1,1,'moodle/course:changesummary',1,1372420988,0),(139,1,1,'moodle/site:viewparticipants',1,1372420988,0),(140,1,5,'moodle/course:isincompletionreports',1,1372420988,0),(141,1,5,'moodle/course:viewscales',1,1372420988,0),(142,1,4,'moodle/course:viewscales',1,1372420988,0),(143,1,3,'moodle/course:viewscales',1,1372420988,0),(144,1,1,'moodle/course:viewscales',1,1372420988,0),(145,1,3,'moodle/course:managescales',1,1372420989,0),(146,1,1,'moodle/course:managescales',1,1372420989,0),(147,1,3,'moodle/course:managegroups',1,1372420989,0),(148,1,1,'moodle/course:managegroups',1,1372420989,0),(149,1,3,'moodle/course:reset',1,1372420989,0),(150,1,1,'moodle/course:reset',1,1372420989,0),(151,1,3,'moodle/course:viewsuspendedusers',1,1372420989,0),(152,1,1,'moodle/course:viewsuspendedusers',1,1372420989,0),(153,1,6,'moodle/blog:view',1,1372420989,0),(154,1,7,'moodle/blog:view',1,1372420989,0),(155,1,5,'moodle/blog:view',1,1372420989,0),(156,1,4,'moodle/blog:view',1,1372420989,0),(157,1,3,'moodle/blog:view',1,1372420989,0),(158,1,1,'moodle/blog:view',1,1372420989,0),(159,1,6,'moodle/blog:search',1,1372420989,0),(160,1,7,'moodle/blog:search',1,1372420990,0),(161,1,5,'moodle/blog:search',1,1372420990,0),(162,1,4,'moodle/blog:search',1,1372420990,0),(163,1,3,'moodle/blog:search',1,1372420990,0),(164,1,1,'moodle/blog:search',1,1372420991,0),(165,1,1,'moodle/blog:viewdrafts',1,1372420991,0),(166,1,7,'moodle/blog:create',1,1372420991,0),(167,1,1,'moodle/blog:create',1,1372420991,0),(168,1,4,'moodle/blog:manageentries',1,1372420991,0),(169,1,3,'moodle/blog:manageentries',1,1372420991,0),(170,1,1,'moodle/blog:manageentries',1,1372420991,0),(171,1,5,'moodle/blog:manageexternal',1,1372420992,0),(172,1,7,'moodle/blog:manageexternal',1,1372420992,0),(173,1,4,'moodle/blog:manageexternal',1,1372420992,0),(174,1,3,'moodle/blog:manageexternal',1,1372420992,0),(175,1,1,'moodle/blog:manageexternal',1,1372420992,0),(176,1,7,'moodle/calendar:manageownentries',1,1372420992,0),(177,1,1,'moodle/calendar:manageownentries',1,1372420992,0),(178,1,4,'moodle/calendar:managegroupentries',1,1372420992,0),(179,1,3,'moodle/calendar:managegroupentries',1,1372420992,0),(180,1,1,'moodle/calendar:managegroupentries',1,1372420992,0),(181,1,4,'moodle/calendar:manageentries',1,1372420992,0),(182,1,3,'moodle/calendar:manageentries',1,1372420992,0),(183,1,1,'moodle/calendar:manageentries',1,1372420992,0),(184,1,1,'moodle/user:editprofile',1,1372420993,0),(185,1,6,'moodle/user:editownprofile',-1000,1372420993,0),(186,1,7,'moodle/user:editownprofile',1,1372420993,0),(187,1,1,'moodle/user:editownprofile',1,1372420993,0),(188,1,6,'moodle/user:changeownpassword',-1000,1372420993,0),(189,1,7,'moodle/user:changeownpassword',1,1372420993,0),(190,1,1,'moodle/user:changeownpassword',1,1372420993,0),(191,1,5,'moodle/user:readuserposts',1,1372420993,0),(192,1,4,'moodle/user:readuserposts',1,1372420993,0),(193,1,3,'moodle/user:readuserposts',1,1372420993,0),(194,1,1,'moodle/user:readuserposts',1,1372420993,0),(195,1,5,'moodle/user:readuserblogs',1,1372420993,0),(196,1,4,'moodle/user:readuserblogs',1,1372420993,0),(197,1,3,'moodle/user:readuserblogs',1,1372420993,0),(198,1,1,'moodle/user:readuserblogs',1,1372420993,0),(199,1,1,'moodle/user:editmessageprofile',1,1372420994,0),(200,1,6,'moodle/user:editownmessageprofile',-1000,1372420994,0),(201,1,7,'moodle/user:editownmessageprofile',1,1372420994,0),(202,1,1,'moodle/user:editownmessageprofile',1,1372420994,0),(203,1,3,'moodle/question:managecategory',1,1372420994,0),(204,1,1,'moodle/question:managecategory',1,1372420994,0),(205,1,3,'moodle/question:add',1,1372420994,0),(206,1,1,'moodle/question:add',1,1372420994,0),(207,1,3,'moodle/question:editmine',1,1372420994,0),(208,1,1,'moodle/question:editmine',1,1372420994,0),(209,1,3,'moodle/question:editall',1,1372420994,0),(210,1,1,'moodle/question:editall',1,1372420994,0),(211,1,3,'moodle/question:viewmine',1,1372420994,0),(212,1,1,'moodle/question:viewmine',1,1372420994,0),(213,1,3,'moodle/question:viewall',1,1372420994,0),(214,1,1,'moodle/question:viewall',1,1372420995,0),(215,1,3,'moodle/question:usemine',1,1372420995,0),(216,1,1,'moodle/question:usemine',1,1372420995,0),(217,1,3,'moodle/question:useall',1,1372420995,0),(218,1,1,'moodle/question:useall',1,1372420995,0),(219,1,3,'moodle/question:movemine',1,1372420995,0),(220,1,1,'moodle/question:movemine',1,1372420995,0),(221,1,3,'moodle/question:moveall',1,1372420995,0),(222,1,1,'moodle/question:moveall',1,1372420995,0),(223,1,1,'moodle/question:config',1,1372420996,0),(224,1,5,'moodle/question:flag',1,1372420996,0),(225,1,4,'moodle/question:flag',1,1372420996,0),(226,1,3,'moodle/question:flag',1,1372420996,0),(227,1,1,'moodle/question:flag',1,1372420996,0),(228,1,4,'moodle/site:doclinks',1,1372420996,0),(229,1,3,'moodle/site:doclinks',1,1372420996,0),(230,1,1,'moodle/site:doclinks',1,1372420996,0),(231,1,3,'moodle/course:sectionvisibility',1,1372420996,0),(232,1,1,'moodle/course:sectionvisibility',1,1372420996,0),(233,1,3,'moodle/course:useremail',1,1372420996,0),(234,1,1,'moodle/course:useremail',1,1372420996,0),(235,1,3,'moodle/course:viewhiddensections',1,1372420996,0),(236,1,1,'moodle/course:viewhiddensections',1,1372420996,0),(237,1,3,'moodle/course:setcurrentsection',1,1372420996,0),(238,1,1,'moodle/course:setcurrentsection',1,1372420996,0),(239,1,3,'moodle/course:movesections',1,1372420996,0),(240,1,1,'moodle/course:movesections',1,1372420996,0),(241,1,4,'moodle/grade:viewall',1,1372420997,0),(242,1,3,'moodle/grade:viewall',1,1372420997,0),(243,1,1,'moodle/grade:viewall',1,1372420997,0),(244,1,5,'moodle/grade:view',1,1372420997,0),(245,1,4,'moodle/grade:viewhidden',1,1372420997,0),(246,1,3,'moodle/grade:viewhidden',1,1372420998,0),(247,1,1,'moodle/grade:viewhidden',1,1372420998,0),(248,1,3,'moodle/grade:import',1,1372420998,0),(249,1,1,'moodle/grade:import',1,1372420998,0),(250,1,4,'moodle/grade:export',1,1372420998,0),(251,1,3,'moodle/grade:export',1,1372420998,0),(252,1,1,'moodle/grade:export',1,1372420998,0),(253,1,3,'moodle/grade:manage',1,1372420998,0),(254,1,1,'moodle/grade:manage',1,1372420998,0),(255,1,3,'moodle/grade:edit',1,1372420999,0),(256,1,1,'moodle/grade:edit',1,1372420999,0),(257,1,3,'moodle/grade:managegradingforms',1,1372420999,0),(258,1,1,'moodle/grade:managegradingforms',1,1372420999,0),(259,1,1,'moodle/grade:sharegradingforms',1,1372420999,0),(260,1,1,'moodle/grade:managesharedforms',1,1372420999,0),(261,1,3,'moodle/grade:manageoutcomes',1,1372420999,0),(262,1,1,'moodle/grade:manageoutcomes',1,1372420999,0),(263,1,3,'moodle/grade:manageletters',1,1372420999,0),(264,1,1,'moodle/grade:manageletters',1,1372420999,0),(265,1,3,'moodle/grade:hide',1,1372420999,0),(266,1,1,'moodle/grade:hide',1,1372420999,0),(267,1,3,'moodle/grade:lock',1,1372421000,0),(268,1,1,'moodle/grade:lock',1,1372421000,0),(269,1,3,'moodle/grade:unlock',1,1372421000,0),(270,1,1,'moodle/grade:unlock',1,1372421000,0),(271,1,7,'moodle/my:manageblocks',1,1372421000,0),(272,1,4,'moodle/notes:view',1,1372421001,0),(273,1,3,'moodle/notes:view',1,1372421001,0),(274,1,1,'moodle/notes:view',1,1372421001,0),(275,1,4,'moodle/notes:manage',1,1372421001,0),(276,1,3,'moodle/notes:manage',1,1372421001,0),(277,1,1,'moodle/notes:manage',1,1372421001,0),(278,1,4,'moodle/tag:manage',1,1372421001,0),(279,1,3,'moodle/tag:manage',1,1372421001,0),(280,1,1,'moodle/tag:manage',1,1372421001,0),(281,1,1,'moodle/tag:create',1,1372421001,0),(282,1,7,'moodle/tag:create',1,1372421001,0),(283,1,1,'moodle/tag:edit',1,1372421001,0),(284,1,7,'moodle/tag:edit',1,1372421001,0),(285,1,1,'moodle/tag:flag',1,1372421001,0),(286,1,7,'moodle/tag:flag',1,1372421001,0),(287,1,4,'moodle/tag:editblocks',1,1372421001,0),(288,1,3,'moodle/tag:editblocks',1,1372421002,0),(289,1,1,'moodle/tag:editblocks',1,1372421002,0),(290,1,6,'moodle/block:view',1,1372421002,0),(291,1,7,'moodle/block:view',1,1372421002,0),(292,1,5,'moodle/block:view',1,1372421002,0),(293,1,4,'moodle/block:view',1,1372421002,0),(294,1,3,'moodle/block:view',1,1372421002,0),(295,1,3,'moodle/block:edit',1,1372421002,0),(296,1,1,'moodle/block:edit',1,1372421002,0),(297,1,7,'moodle/portfolio:export',1,1372421002,0),(298,1,5,'moodle/portfolio:export',1,1372421002,0),(299,1,4,'moodle/portfolio:export',1,1372421002,0),(300,1,3,'moodle/portfolio:export',1,1372421002,0),(301,1,8,'moodle/comment:view',1,1372421002,0),(302,1,6,'moodle/comment:view',1,1372421002,0),(303,1,7,'moodle/comment:view',1,1372421002,0),(304,1,5,'moodle/comment:view',1,1372421002,0),(305,1,4,'moodle/comment:view',1,1372421003,0),(306,1,3,'moodle/comment:view',1,1372421003,0),(307,1,1,'moodle/comment:view',1,1372421003,0),(308,1,7,'moodle/comment:post',1,1372421003,0),(309,1,5,'moodle/comment:post',1,1372421003,0),(310,1,4,'moodle/comment:post',1,1372421003,0),(311,1,3,'moodle/comment:post',1,1372421003,0),(312,1,1,'moodle/comment:post',1,1372421003,0),(313,1,3,'moodle/comment:delete',1,1372421003,0),(314,1,1,'moodle/comment:delete',1,1372421003,0),(315,1,1,'moodle/webservice:createtoken',1,1372421003,0),(316,1,7,'moodle/webservice:createmobiletoken',1,1372421003,0),(317,1,7,'moodle/rating:view',1,1372421004,0),(318,1,5,'moodle/rating:view',1,1372421004,0),(319,1,4,'moodle/rating:view',1,1372421004,0),(320,1,3,'moodle/rating:view',1,1372421004,0),(321,1,1,'moodle/rating:view',1,1372421004,0),(322,1,7,'moodle/rating:viewany',1,1372421004,0),(323,1,5,'moodle/rating:viewany',1,1372421004,0),(324,1,4,'moodle/rating:viewany',1,1372421004,0),(325,1,3,'moodle/rating:viewany',1,1372421004,0),(326,1,1,'moodle/rating:viewany',1,1372421004,0),(327,1,7,'moodle/rating:viewall',1,1372421004,0),(328,1,5,'moodle/rating:viewall',1,1372421004,0),(329,1,4,'moodle/rating:viewall',1,1372421004,0),(330,1,3,'moodle/rating:viewall',1,1372421004,0),(331,1,1,'moodle/rating:viewall',1,1372421005,0),(332,1,7,'moodle/rating:rate',1,1372421005,0),(333,1,5,'moodle/rating:rate',1,1372421005,0),(334,1,4,'moodle/rating:rate',1,1372421005,0),(335,1,3,'moodle/rating:rate',1,1372421005,0),(336,1,1,'moodle/rating:rate',1,1372421005,0),(337,1,1,'moodle/course:publish',1,1372421005,0),(338,1,4,'moodle/course:markcomplete',1,1372421005,0),(339,1,3,'moodle/course:markcomplete',1,1372421005,0),(340,1,1,'moodle/course:markcomplete',1,1372421005,0),(341,1,1,'moodle/community:add',1,1372421005,0),(342,1,4,'moodle/community:add',1,1372421005,0),(343,1,3,'moodle/community:add',1,1372421005,0),(344,1,1,'moodle/community:download',1,1372421005,0),(345,1,3,'moodle/community:download',1,1372421006,0),(346,1,1,'moodle/badges:manageglobalsettings',1,1372421006,0),(347,1,7,'moodle/badges:viewbadges',1,1372421006,0),(348,1,7,'moodle/badges:manageownbadges',1,1372421006,0),(349,1,7,'moodle/badges:viewotherbadges',1,1372421006,0),(350,1,7,'moodle/badges:earnbadge',1,1372421006,0),(351,1,1,'moodle/badges:createbadge',1,1372421006,0),(352,1,3,'moodle/badges:createbadge',1,1372421006,0),(353,1,1,'moodle/badges:deletebadge',1,1372421006,0),(354,1,3,'moodle/badges:deletebadge',1,1372421006,0),(355,1,1,'moodle/badges:configuredetails',1,1372421007,0),(356,1,3,'moodle/badges:configuredetails',1,1372421007,0),(357,1,1,'moodle/badges:configurecriteria',1,1372421007,0),(358,1,3,'moodle/badges:configurecriteria',1,1372421007,0),(359,1,1,'moodle/badges:configuremessages',1,1372421007,0),(360,1,3,'moodle/badges:configuremessages',1,1372421007,0),(361,1,1,'moodle/badges:awardbadge',1,1372421007,0),(362,1,4,'moodle/badges:awardbadge',1,1372421007,0),(363,1,3,'moodle/badges:awardbadge',1,1372421007,0),(364,1,1,'moodle/badges:viewawarded',1,1372421007,0),(365,1,4,'moodle/badges:viewawarded',1,1372421007,0),(366,1,3,'moodle/badges:viewawarded',1,1372421007,0),(367,1,6,'mod/assign:view',1,1372421102,0),(368,1,5,'mod/assign:view',1,1372421102,0),(369,1,4,'mod/assign:view',1,1372421102,0),(370,1,3,'mod/assign:view',1,1372421102,0),(371,1,1,'mod/assign:view',1,1372421102,0),(372,1,5,'mod/assign:submit',1,1372421102,0),(373,1,4,'mod/assign:grade',1,1372421102,0),(374,1,3,'mod/assign:grade',1,1372421102,0),(375,1,1,'mod/assign:grade',1,1372421102,0),(376,1,4,'mod/assign:exportownsubmission',1,1372421102,0),(377,1,3,'mod/assign:exportownsubmission',1,1372421102,0),(378,1,1,'mod/assign:exportownsubmission',1,1372421103,0),(379,1,5,'mod/assign:exportownsubmission',1,1372421103,0),(380,1,3,'mod/assign:addinstance',1,1372421103,0),(381,1,1,'mod/assign:addinstance',1,1372421103,0),(382,1,4,'mod/assign:grantextension',1,1372421103,0),(383,1,3,'mod/assign:grantextension',1,1372421103,0),(384,1,1,'mod/assign:grantextension',1,1372421103,0),(385,1,3,'mod/assign:revealidentities',1,1372421103,0),(386,1,1,'mod/assign:revealidentities',1,1372421103,0),(387,1,6,'mod/assignment:view',1,1372421107,0),(388,1,5,'mod/assignment:view',1,1372421107,0),(389,1,4,'mod/assignment:view',1,1372421107,0),(390,1,3,'mod/assignment:view',1,1372421107,0),(391,1,1,'mod/assignment:view',1,1372421107,0),(392,1,3,'mod/assignment:addinstance',1,1372421107,0),(393,1,1,'mod/assignment:addinstance',1,1372421107,0),(394,1,5,'mod/assignment:submit',1,1372421107,0),(395,1,4,'mod/assignment:grade',1,1372421107,0),(396,1,3,'mod/assignment:grade',1,1372421108,0),(397,1,1,'mod/assignment:grade',1,1372421108,0),(398,1,4,'mod/assignment:exportownsubmission',1,1372421108,0),(399,1,3,'mod/assignment:exportownsubmission',1,1372421108,0),(400,1,1,'mod/assignment:exportownsubmission',1,1372421108,0),(401,1,5,'mod/assignment:exportownsubmission',1,1372421108,0),(402,1,3,'mod/book:addinstance',1,1372421110,0),(403,1,1,'mod/book:addinstance',1,1372421110,0),(404,1,6,'mod/book:read',1,1372421110,0),(405,1,8,'mod/book:read',1,1372421110,0),(406,1,5,'mod/book:read',1,1372421110,0),(407,1,4,'mod/book:read',1,1372421110,0),(408,1,3,'mod/book:read',1,1372421111,0),(409,1,1,'mod/book:read',1,1372421111,0),(410,1,4,'mod/book:viewhiddenchapters',1,1372421111,0),(411,1,3,'mod/book:viewhiddenchapters',1,1372421111,0),(412,1,1,'mod/book:viewhiddenchapters',1,1372421111,0),(413,1,3,'mod/book:edit',1,1372421111,0),(414,1,1,'mod/book:edit',1,1372421111,0),(415,1,3,'mod/chat:addinstance',1,1372421116,0),(416,1,1,'mod/chat:addinstance',1,1372421116,0),(417,1,5,'mod/chat:chat',1,1372421116,0),(418,1,4,'mod/chat:chat',1,1372421116,0),(419,1,3,'mod/chat:chat',1,1372421116,0),(420,1,1,'mod/chat:chat',1,1372421116,0),(421,1,5,'mod/chat:readlog',1,1372421116,0),(422,1,4,'mod/chat:readlog',1,1372421116,0),(423,1,3,'mod/chat:readlog',1,1372421116,0),(424,1,1,'mod/chat:readlog',1,1372421116,0),(425,1,4,'mod/chat:deletelog',1,1372421116,0),(426,1,3,'mod/chat:deletelog',1,1372421116,0),(427,1,1,'mod/chat:deletelog',1,1372421116,0),(428,1,4,'mod/chat:exportparticipatedsession',1,1372421116,0),(429,1,3,'mod/chat:exportparticipatedsession',1,1372421116,0),(430,1,1,'mod/chat:exportparticipatedsession',1,1372421116,0),(431,1,4,'mod/chat:exportsession',1,1372421116,0),(432,1,3,'mod/chat:exportsession',1,1372421116,0),(433,1,1,'mod/chat:exportsession',1,1372421116,0),(434,1,3,'mod/choice:addinstance',1,1372421118,0),(435,1,1,'mod/choice:addinstance',1,1372421118,0),(436,1,5,'mod/choice:choose',1,1372421118,0),(437,1,4,'mod/choice:choose',1,1372421118,0),(438,1,3,'mod/choice:choose',1,1372421118,0),(439,1,4,'mod/choice:readresponses',1,1372421119,0),(440,1,3,'mod/choice:readresponses',1,1372421119,0),(441,1,1,'mod/choice:readresponses',1,1372421119,0),(442,1,4,'mod/choice:deleteresponses',1,1372421119,0),(443,1,3,'mod/choice:deleteresponses',1,1372421119,0),(444,1,1,'mod/choice:deleteresponses',1,1372421119,0),(445,1,4,'mod/choice:downloadresponses',1,1372421119,0),(446,1,3,'mod/choice:downloadresponses',1,1372421119,0),(447,1,1,'mod/choice:downloadresponses',1,1372421119,0),(448,1,3,'mod/data:addinstance',1,1372421122,0),(449,1,1,'mod/data:addinstance',1,1372421122,0),(450,1,8,'mod/data:viewentry',1,1372421122,0),(451,1,6,'mod/data:viewentry',1,1372421123,0),(452,1,5,'mod/data:viewentry',1,1372421123,0),(453,1,4,'mod/data:viewentry',1,1372421123,0),(454,1,3,'mod/data:viewentry',1,1372421123,0),(455,1,1,'mod/data:viewentry',1,1372421123,0),(456,1,5,'mod/data:writeentry',1,1372421123,0),(457,1,4,'mod/data:writeentry',1,1372421123,0),(458,1,3,'mod/data:writeentry',1,1372421123,0),(459,1,1,'mod/data:writeentry',1,1372421123,0),(460,1,5,'mod/data:comment',1,1372421123,0),(461,1,4,'mod/data:comment',1,1372421123,0),(462,1,3,'mod/data:comment',1,1372421123,0),(463,1,1,'mod/data:comment',1,1372421123,0),(464,1,4,'mod/data:rate',1,1372421123,0),(465,1,3,'mod/data:rate',1,1372421124,0),(466,1,1,'mod/data:rate',1,1372421124,0),(467,1,4,'mod/data:viewrating',1,1372421124,0),(468,1,3,'mod/data:viewrating',1,1372421124,0),(469,1,1,'mod/data:viewrating',1,1372421124,0),(470,1,4,'mod/data:viewanyrating',1,1372421124,0),(471,1,3,'mod/data:viewanyrating',1,1372421124,0),(472,1,1,'mod/data:viewanyrating',1,1372421124,0),(473,1,4,'mod/data:viewallratings',1,1372421124,0),(474,1,3,'mod/data:viewallratings',1,1372421124,0),(475,1,1,'mod/data:viewallratings',1,1372421124,0),(476,1,4,'mod/data:approve',1,1372421124,0),(477,1,3,'mod/data:approve',1,1372421124,0),(478,1,1,'mod/data:approve',1,1372421124,0),(479,1,4,'mod/data:manageentries',1,1372421124,0),(480,1,3,'mod/data:manageentries',1,1372421124,0),(481,1,1,'mod/data:manageentries',1,1372421124,0),(482,1,4,'mod/data:managecomments',1,1372421125,0),(483,1,3,'mod/data:managecomments',1,1372421125,0),(484,1,1,'mod/data:managecomments',1,1372421125,0),(485,1,3,'mod/data:managetemplates',1,1372421125,0),(486,1,1,'mod/data:managetemplates',1,1372421125,0),(487,1,4,'mod/data:viewalluserpresets',1,1372421125,0),(488,1,3,'mod/data:viewalluserpresets',1,1372421125,0),(489,1,1,'mod/data:viewalluserpresets',1,1372421125,0),(490,1,1,'mod/data:manageuserpresets',1,1372421125,0),(491,1,1,'mod/data:exportentry',1,1372421125,0),(492,1,4,'mod/data:exportentry',1,1372421125,0),(493,1,3,'mod/data:exportentry',1,1372421125,0),(494,1,1,'mod/data:exportownentry',1,1372421125,0),(495,1,4,'mod/data:exportownentry',1,1372421125,0),(496,1,3,'mod/data:exportownentry',1,1372421125,0),(497,1,5,'mod/data:exportownentry',1,1372421125,0),(498,1,1,'mod/data:exportallentries',1,1372421126,0),(499,1,4,'mod/data:exportallentries',1,1372421126,0),(500,1,3,'mod/data:exportallentries',1,1372421126,0),(501,1,1,'mod/data:exportuserinfo',1,1372421126,0),(502,1,4,'mod/data:exportuserinfo',1,1372421126,0),(503,1,3,'mod/data:exportuserinfo',1,1372421126,0),(504,1,3,'mod/feedback:addinstance',1,1372421132,0),(505,1,1,'mod/feedback:addinstance',1,1372421132,0),(506,1,6,'mod/feedback:view',1,1372421132,0),(507,1,5,'mod/feedback:view',1,1372421132,0),(508,1,4,'mod/feedback:view',1,1372421132,0),(509,1,3,'mod/feedback:view',1,1372421133,0),(510,1,1,'mod/feedback:view',1,1372421133,0),(511,1,5,'mod/feedback:complete',1,1372421133,0),(512,1,5,'mod/feedback:viewanalysepage',1,1372421134,0),(513,1,3,'mod/feedback:viewanalysepage',1,1372421134,0),(514,1,1,'mod/feedback:viewanalysepage',1,1372421134,0),(515,1,3,'mod/feedback:deletesubmissions',1,1372421134,0),(516,1,1,'mod/feedback:deletesubmissions',1,1372421134,0),(517,1,1,'mod/feedback:mapcourse',1,1372421134,0),(518,1,3,'mod/feedback:edititems',1,1372421134,0),(519,1,1,'mod/feedback:edititems',1,1372421134,0),(520,1,3,'mod/feedback:createprivatetemplate',1,1372421134,0),(521,1,1,'mod/feedback:createprivatetemplate',1,1372421134,0),(522,1,3,'mod/feedback:createpublictemplate',1,1372421134,0),(523,1,1,'mod/feedback:createpublictemplate',1,1372421134,0),(524,1,3,'mod/feedback:deletetemplate',1,1372421134,0),(525,1,1,'mod/feedback:deletetemplate',1,1372421134,0),(526,1,4,'mod/feedback:viewreports',1,1372421134,0),(527,1,3,'mod/feedback:viewreports',1,1372421134,0),(528,1,1,'mod/feedback:viewreports',1,1372421134,0),(529,1,4,'mod/feedback:receivemail',1,1372421134,0),(530,1,3,'mod/feedback:receivemail',1,1372421134,0),(531,1,3,'mod/folder:addinstance',1,1372421136,0),(532,1,1,'mod/folder:addinstance',1,1372421136,0),(533,1,6,'mod/folder:view',1,1372421137,0),(534,1,7,'mod/folder:view',1,1372421137,0),(535,1,3,'mod/folder:managefiles',1,1372421137,0),(536,1,3,'mod/forum:addinstance',1,1372421142,0),(537,1,1,'mod/forum:addinstance',1,1372421142,0),(538,1,8,'mod/forum:viewdiscussion',1,1372421142,0),(539,1,6,'mod/forum:viewdiscussion',1,1372421142,0),(540,1,5,'mod/forum:viewdiscussion',1,1372421142,0),(541,1,4,'mod/forum:viewdiscussion',1,1372421142,0),(542,1,3,'mod/forum:viewdiscussion',1,1372421142,0),(543,1,1,'mod/forum:viewdiscussion',1,1372421143,0),(544,1,4,'mod/forum:viewhiddentimedposts',1,1372421143,0),(545,1,3,'mod/forum:viewhiddentimedposts',1,1372421143,0),(546,1,1,'mod/forum:viewhiddentimedposts',1,1372421143,0),(547,1,5,'mod/forum:startdiscussion',1,1372421143,0),(548,1,4,'mod/forum:startdiscussion',1,1372421143,0),(549,1,3,'mod/forum:startdiscussion',1,1372421143,0),(550,1,1,'mod/forum:startdiscussion',1,1372421143,0),(551,1,5,'mod/forum:replypost',1,1372421143,0),(552,1,4,'mod/forum:replypost',1,1372421143,0),(553,1,3,'mod/forum:replypost',1,1372421143,0),(554,1,1,'mod/forum:replypost',1,1372421143,0),(555,1,4,'mod/forum:addnews',1,1372421143,0),(556,1,3,'mod/forum:addnews',1,1372421143,0),(557,1,1,'mod/forum:addnews',1,1372421143,0),(558,1,4,'mod/forum:replynews',1,1372421143,0),(559,1,3,'mod/forum:replynews',1,1372421143,0),(560,1,1,'mod/forum:replynews',1,1372421144,0),(561,1,5,'mod/forum:viewrating',1,1372421144,0),(562,1,4,'mod/forum:viewrating',1,1372421144,0),(563,1,3,'mod/forum:viewrating',1,1372421144,0),(564,1,1,'mod/forum:viewrating',1,1372421145,0),(565,1,4,'mod/forum:viewanyrating',1,1372421145,0),(566,1,3,'mod/forum:viewanyrating',1,1372421145,0),(567,1,1,'mod/forum:viewanyrating',1,1372421145,0),(568,1,4,'mod/forum:viewallratings',1,1372421145,0),(569,1,3,'mod/forum:viewallratings',1,1372421145,0),(570,1,1,'mod/forum:viewallratings',1,1372421145,0),(571,1,4,'mod/forum:rate',1,1372421145,0),(572,1,3,'mod/forum:rate',1,1372421145,0),(573,1,1,'mod/forum:rate',1,1372421145,0),(574,1,5,'mod/forum:createattachment',1,1372421145,0),(575,1,4,'mod/forum:createattachment',1,1372421145,0),(576,1,3,'mod/forum:createattachment',1,1372421145,0),(577,1,1,'mod/forum:createattachment',1,1372421145,0),(578,1,5,'mod/forum:deleteownpost',1,1372421145,0),(579,1,4,'mod/forum:deleteownpost',1,1372421145,0),(580,1,3,'mod/forum:deleteownpost',1,1372421145,0),(581,1,1,'mod/forum:deleteownpost',1,1372421145,0),(582,1,4,'mod/forum:deleteanypost',1,1372421145,0),(583,1,3,'mod/forum:deleteanypost',1,1372421146,0),(584,1,1,'mod/forum:deleteanypost',1,1372421146,0),(585,1,4,'mod/forum:splitdiscussions',1,1372421146,0),(586,1,3,'mod/forum:splitdiscussions',1,1372421146,0),(587,1,1,'mod/forum:splitdiscussions',1,1372421146,0),(588,1,4,'mod/forum:movediscussions',1,1372421146,0),(589,1,3,'mod/forum:movediscussions',1,1372421146,0),(590,1,1,'mod/forum:movediscussions',1,1372421146,0),(591,1,4,'mod/forum:editanypost',1,1372421146,0),(592,1,3,'mod/forum:editanypost',1,1372421146,0),(593,1,1,'mod/forum:editanypost',1,1372421146,0),(594,1,4,'mod/forum:viewqandawithoutposting',1,1372421146,0),(595,1,3,'mod/forum:viewqandawithoutposting',1,1372421146,0),(596,1,1,'mod/forum:viewqandawithoutposting',1,1372421146,0),(597,1,4,'mod/forum:viewsubscribers',1,1372421146,0),(598,1,3,'mod/forum:viewsubscribers',1,1372421146,0),(599,1,1,'mod/forum:viewsubscribers',1,1372421146,0),(600,1,4,'mod/forum:managesubscriptions',1,1372421146,0),(601,1,3,'mod/forum:managesubscriptions',1,1372421146,0),(602,1,1,'mod/forum:managesubscriptions',1,1372421146,0),(603,1,4,'mod/forum:postwithoutthrottling',1,1372421147,0),(604,1,3,'mod/forum:postwithoutthrottling',1,1372421147,0),(605,1,1,'mod/forum:postwithoutthrottling',1,1372421147,0),(606,1,4,'mod/forum:exportdiscussion',1,1372421147,0),(607,1,3,'mod/forum:exportdiscussion',1,1372421147,0),(608,1,1,'mod/forum:exportdiscussion',1,1372421147,0),(609,1,4,'mod/forum:exportpost',1,1372421147,0),(610,1,3,'mod/forum:exportpost',1,1372421147,0),(611,1,1,'mod/forum:exportpost',1,1372421147,0),(612,1,4,'mod/forum:exportownpost',1,1372421147,0),(613,1,3,'mod/forum:exportownpost',1,1372421147,0),(614,1,1,'mod/forum:exportownpost',1,1372421147,0),(615,1,5,'mod/forum:exportownpost',1,1372421147,0),(616,1,4,'mod/forum:addquestion',1,1372421147,0),(617,1,3,'mod/forum:addquestion',1,1372421147,0),(618,1,1,'mod/forum:addquestion',1,1372421147,0),(619,1,5,'mod/forum:allowforcesubscribe',1,1372421147,0),(620,1,4,'mod/forum:allowforcesubscribe',1,1372421147,0),(621,1,3,'mod/forum:allowforcesubscribe',1,1372421147,0),(622,1,8,'mod/forum:allowforcesubscribe',1,1372421147,0),(623,1,3,'mod/glossary:addinstance',1,1372421152,0),(624,1,1,'mod/glossary:addinstance',1,1372421152,0),(625,1,8,'mod/glossary:view',1,1372421153,0),(626,1,6,'mod/glossary:view',1,1372421153,0),(627,1,5,'mod/glossary:view',1,1372421153,0),(628,1,4,'mod/glossary:view',1,1372421153,0),(629,1,3,'mod/glossary:view',1,1372421153,0),(630,1,1,'mod/glossary:view',1,1372421154,0),(631,1,5,'mod/glossary:write',1,1372421154,0),(632,1,4,'mod/glossary:write',1,1372421154,0),(633,1,3,'mod/glossary:write',1,1372421154,0),(634,1,1,'mod/glossary:write',1,1372421154,0),(635,1,4,'mod/glossary:manageentries',1,1372421154,0),(636,1,3,'mod/glossary:manageentries',1,1372421154,0),(637,1,1,'mod/glossary:manageentries',1,1372421154,0),(638,1,4,'mod/glossary:managecategories',1,1372421154,0),(639,1,3,'mod/glossary:managecategories',1,1372421154,0),(640,1,1,'mod/glossary:managecategories',1,1372421154,0),(641,1,5,'mod/glossary:comment',1,1372421154,0),(642,1,4,'mod/glossary:comment',1,1372421154,0),(643,1,3,'mod/glossary:comment',1,1372421154,0),(644,1,1,'mod/glossary:comment',1,1372421154,0),(645,1,4,'mod/glossary:managecomments',1,1372421154,0),(646,1,3,'mod/glossary:managecomments',1,1372421154,0),(647,1,1,'mod/glossary:managecomments',1,1372421154,0),(648,1,4,'mod/glossary:import',1,1372421154,0),(649,1,3,'mod/glossary:import',1,1372421154,0),(650,1,1,'mod/glossary:import',1,1372421154,0),(651,1,4,'mod/glossary:export',1,1372421154,0),(652,1,3,'mod/glossary:export',1,1372421154,0),(653,1,1,'mod/glossary:export',1,1372421155,0),(654,1,4,'mod/glossary:approve',1,1372421155,0),(655,1,3,'mod/glossary:approve',1,1372421155,0),(656,1,1,'mod/glossary:approve',1,1372421156,0),(657,1,4,'mod/glossary:rate',1,1372421156,0),(658,1,3,'mod/glossary:rate',1,1372421156,0),(659,1,1,'mod/glossary:rate',1,1372421156,0),(660,1,4,'mod/glossary:viewrating',1,1372421156,0),(661,1,3,'mod/glossary:viewrating',1,1372421156,0),(662,1,1,'mod/glossary:viewrating',1,1372421156,0),(663,1,4,'mod/glossary:viewanyrating',1,1372421156,0),(664,1,3,'mod/glossary:viewanyrating',1,1372421156,0),(665,1,1,'mod/glossary:viewanyrating',1,1372421157,0),(666,1,4,'mod/glossary:viewallratings',1,1372421157,0),(667,1,3,'mod/glossary:viewallratings',1,1372421157,0),(668,1,1,'mod/glossary:viewallratings',1,1372421157,0),(669,1,4,'mod/glossary:exportentry',1,1372421157,0),(670,1,3,'mod/glossary:exportentry',1,1372421157,0),(671,1,1,'mod/glossary:exportentry',1,1372421157,0),(672,1,4,'mod/glossary:exportownentry',1,1372421157,0),(673,1,3,'mod/glossary:exportownentry',1,1372421157,0),(674,1,1,'mod/glossary:exportownentry',1,1372421157,0),(675,1,5,'mod/glossary:exportownentry',1,1372421157,0),(676,1,6,'mod/imscp:view',1,1372421159,0),(677,1,7,'mod/imscp:view',1,1372421159,0),(678,1,3,'mod/imscp:addinstance',1,1372421159,0),(679,1,1,'mod/imscp:addinstance',1,1372421159,0),(680,1,3,'mod/label:addinstance',1,1372421160,0),(681,1,1,'mod/label:addinstance',1,1372421160,0),(682,1,3,'mod/lesson:addinstance',1,1372421166,0),(683,1,1,'mod/lesson:addinstance',1,1372421166,0),(684,1,3,'mod/lesson:edit',1,1372421166,0),(685,1,1,'mod/lesson:edit',1,1372421166,0),(686,1,4,'mod/lesson:manage',1,1372421167,0),(687,1,3,'mod/lesson:manage',1,1372421167,0),(688,1,1,'mod/lesson:manage',1,1372421167,0),(689,1,6,'mod/lti:view',1,1372421170,0),(690,1,5,'mod/lti:view',1,1372421170,0),(691,1,4,'mod/lti:view',1,1372421170,0),(692,1,3,'mod/lti:view',1,1372421170,0),(693,1,1,'mod/lti:view',1,1372421170,0),(694,1,3,'mod/lti:addinstance',1,1372421170,0),(695,1,1,'mod/lti:addinstance',1,1372421170,0),(696,1,4,'mod/lti:grade',1,1372421170,0),(697,1,3,'mod/lti:grade',1,1372421170,0),(698,1,1,'mod/lti:grade',1,1372421171,0),(699,1,4,'mod/lti:manage',1,1372421171,0),(700,1,3,'mod/lti:manage',1,1372421171,0),(701,1,1,'mod/lti:manage',1,1372421171,0),(702,1,4,'mod/lti:addcoursetool',1,1372421171,0),(703,1,3,'mod/lti:addcoursetool',1,1372421171,0),(704,1,1,'mod/lti:addcoursetool',1,1372421171,0),(705,1,4,'mod/lti:requesttooladd',1,1372421171,0),(706,1,3,'mod/lti:requesttooladd',1,1372421171,0),(707,1,1,'mod/lti:requesttooladd',1,1372421171,0),(708,1,6,'mod/page:view',1,1372421172,0),(709,1,7,'mod/page:view',1,1372421172,0),(710,1,3,'mod/page:addinstance',1,1372421172,0),(711,1,1,'mod/page:addinstance',1,1372421172,0),(712,1,6,'mod/quiz:view',1,1372421177,0),(713,1,5,'mod/quiz:view',1,1372421177,0),(714,1,4,'mod/quiz:view',1,1372421177,0),(715,1,3,'mod/quiz:view',1,1372421177,0),(716,1,1,'mod/quiz:view',1,1372421177,0),(717,1,3,'mod/quiz:addinstance',1,1372421177,0),(718,1,1,'mod/quiz:addinstance',1,1372421178,0),(719,1,5,'mod/quiz:attempt',1,1372421178,0),(720,1,5,'mod/quiz:reviewmyattempts',1,1372421179,0),(721,1,3,'mod/quiz:manage',1,1372421179,0),(722,1,1,'mod/quiz:manage',1,1372421179,0),(723,1,3,'mod/quiz:manageoverrides',1,1372421179,0),(724,1,1,'mod/quiz:manageoverrides',1,1372421179,0),(725,1,4,'mod/quiz:preview',1,1372421179,0),(726,1,3,'mod/quiz:preview',1,1372421179,0),(727,1,1,'mod/quiz:preview',1,1372421179,0),(728,1,4,'mod/quiz:grade',1,1372421179,0),(729,1,3,'mod/quiz:grade',1,1372421179,0),(730,1,1,'mod/quiz:grade',1,1372421179,0),(731,1,4,'mod/quiz:regrade',1,1372421179,0),(732,1,3,'mod/quiz:regrade',1,1372421179,0),(733,1,1,'mod/quiz:regrade',1,1372421179,0),(734,1,4,'mod/quiz:viewreports',1,1372421179,0),(735,1,3,'mod/quiz:viewreports',1,1372421180,0),(736,1,1,'mod/quiz:viewreports',1,1372421180,0),(737,1,3,'mod/quiz:deleteattempts',1,1372421180,0),(738,1,1,'mod/quiz:deleteattempts',1,1372421180,0),(739,1,6,'mod/resource:view',1,1372421183,0),(740,1,7,'mod/resource:view',1,1372421183,0),(741,1,3,'mod/resource:addinstance',1,1372421183,0),(742,1,1,'mod/resource:addinstance',1,1372421183,0),(743,1,3,'mod/scorm:addinstance',1,1372421191,0),(744,1,1,'mod/scorm:addinstance',1,1372421191,0),(745,1,4,'mod/scorm:viewreport',1,1372421191,0),(746,1,3,'mod/scorm:viewreport',1,1372421191,0),(747,1,1,'mod/scorm:viewreport',1,1372421191,0),(748,1,5,'mod/scorm:skipview',1,1372421191,0),(749,1,5,'mod/scorm:savetrack',1,1372421191,0),(750,1,4,'mod/scorm:savetrack',1,1372421191,0),(751,1,3,'mod/scorm:savetrack',1,1372421191,0),(752,1,1,'mod/scorm:savetrack',1,1372421191,0),(753,1,5,'mod/scorm:viewscores',1,1372421191,0),(754,1,4,'mod/scorm:viewscores',1,1372421191,0),(755,1,3,'mod/scorm:viewscores',1,1372421191,0),(756,1,1,'mod/scorm:viewscores',1,1372421191,0),(757,1,4,'mod/scorm:deleteresponses',1,1372421192,0),(758,1,3,'mod/scorm:deleteresponses',1,1372421192,0),(759,1,1,'mod/scorm:deleteresponses',1,1372421192,0),(760,1,3,'mod/survey:addinstance',1,1372421199,0),(761,1,1,'mod/survey:addinstance',1,1372421199,0),(762,1,5,'mod/survey:participate',1,1372421199,0),(763,1,4,'mod/survey:participate',1,1372421199,0),(764,1,3,'mod/survey:participate',1,1372421199,0),(765,1,1,'mod/survey:participate',1,1372421199,0),(766,1,4,'mod/survey:readresponses',1,1372421199,0),(767,1,3,'mod/survey:readresponses',1,1372421199,0),(768,1,1,'mod/survey:readresponses',1,1372421199,0),(769,1,4,'mod/survey:download',1,1372421199,0),(770,1,3,'mod/survey:download',1,1372421199,0),(771,1,1,'mod/survey:download',1,1372421199,0),(772,1,6,'mod/url:view',1,1372421200,0),(773,1,7,'mod/url:view',1,1372421200,0),(774,1,3,'mod/url:addinstance',1,1372421201,0),(775,1,1,'mod/url:addinstance',1,1372421201,0),(776,1,3,'mod/wiki:addinstance',1,1372421204,0),(777,1,1,'mod/wiki:addinstance',1,1372421204,0),(778,1,6,'mod/wiki:viewpage',1,1372421204,0),(779,1,5,'mod/wiki:viewpage',1,1372421205,0),(780,1,4,'mod/wiki:viewpage',1,1372421205,0),(781,1,3,'mod/wiki:viewpage',1,1372421205,0),(782,1,1,'mod/wiki:viewpage',1,1372421205,0),(783,1,5,'mod/wiki:editpage',1,1372421205,0),(784,1,4,'mod/wiki:editpage',1,1372421205,0),(785,1,3,'mod/wiki:editpage',1,1372421205,0),(786,1,1,'mod/wiki:editpage',1,1372421205,0),(787,1,5,'mod/wiki:createpage',1,1372421205,0),(788,1,4,'mod/wiki:createpage',1,1372421205,0),(789,1,3,'mod/wiki:createpage',1,1372421205,0),(790,1,1,'mod/wiki:createpage',1,1372421205,0),(791,1,5,'mod/wiki:viewcomment',1,1372421206,0),(792,1,4,'mod/wiki:viewcomment',1,1372421206,0),(793,1,3,'mod/wiki:viewcomment',1,1372421206,0),(794,1,1,'mod/wiki:viewcomment',1,1372421206,0),(795,1,5,'mod/wiki:editcomment',1,1372421206,0),(796,1,4,'mod/wiki:editcomment',1,1372421206,0),(797,1,3,'mod/wiki:editcomment',1,1372421206,0),(798,1,1,'mod/wiki:editcomment',1,1372421206,0),(799,1,4,'mod/wiki:managecomment',1,1372421206,0),(800,1,3,'mod/wiki:managecomment',1,1372421206,0),(801,1,1,'mod/wiki:managecomment',1,1372421206,0),(802,1,4,'mod/wiki:managefiles',1,1372421206,0),(803,1,3,'mod/wiki:managefiles',1,1372421206,0),(804,1,1,'mod/wiki:managefiles',1,1372421206,0),(805,1,4,'mod/wiki:overridelock',1,1372421206,0),(806,1,3,'mod/wiki:overridelock',1,1372421206,0),(807,1,1,'mod/wiki:overridelock',1,1372421206,0),(808,1,4,'mod/wiki:managewiki',1,1372421206,0),(809,1,3,'mod/wiki:managewiki',1,1372421206,0),(810,1,1,'mod/wiki:managewiki',1,1372421206,0),(811,1,6,'mod/workshop:view',1,1372421216,0),(812,1,5,'mod/workshop:view',1,1372421216,0),(813,1,4,'mod/workshop:view',1,1372421216,0),(814,1,3,'mod/workshop:view',1,1372421217,0),(815,1,1,'mod/workshop:view',1,1372421217,0),(816,1,3,'mod/workshop:addinstance',1,1372421217,0),(817,1,1,'mod/workshop:addinstance',1,1372421217,0),(818,1,4,'mod/workshop:switchphase',1,1372421217,0),(819,1,3,'mod/workshop:switchphase',1,1372421217,0),(820,1,1,'mod/workshop:switchphase',1,1372421217,0),(821,1,3,'mod/workshop:editdimensions',1,1372421217,0),(822,1,1,'mod/workshop:editdimensions',1,1372421217,0),(823,1,5,'mod/workshop:submit',1,1372421217,0),(824,1,5,'mod/workshop:peerassess',1,1372421217,0),(825,1,4,'mod/workshop:manageexamples',1,1372421217,0),(826,1,3,'mod/workshop:manageexamples',1,1372421217,0),(827,1,1,'mod/workshop:manageexamples',1,1372421217,0),(828,1,4,'mod/workshop:allocate',1,1372421218,0),(829,1,3,'mod/workshop:allocate',1,1372421218,0),(830,1,1,'mod/workshop:allocate',1,1372421218,0),(831,1,4,'mod/workshop:publishsubmissions',1,1372421218,0),(832,1,3,'mod/workshop:publishsubmissions',1,1372421218,0),(833,1,1,'mod/workshop:publishsubmissions',1,1372421218,0),(834,1,5,'mod/workshop:viewauthornames',1,1372421218,0),(835,1,4,'mod/workshop:viewauthornames',1,1372421218,0),(836,1,3,'mod/workshop:viewauthornames',1,1372421218,0),(837,1,1,'mod/workshop:viewauthornames',1,1372421218,0),(838,1,4,'mod/workshop:viewreviewernames',1,1372421219,0),(839,1,3,'mod/workshop:viewreviewernames',1,1372421219,0),(840,1,1,'mod/workshop:viewreviewernames',1,1372421219,0),(841,1,4,'mod/workshop:viewallsubmissions',1,1372421219,0),(842,1,3,'mod/workshop:viewallsubmissions',1,1372421219,0),(843,1,1,'mod/workshop:viewallsubmissions',1,1372421219,0),(844,1,5,'mod/workshop:viewpublishedsubmissions',1,1372421219,0),(845,1,4,'mod/workshop:viewpublishedsubmissions',1,1372421219,0),(846,1,3,'mod/workshop:viewpublishedsubmissions',1,1372421219,0),(847,1,1,'mod/workshop:viewpublishedsubmissions',1,1372421219,0),(848,1,5,'mod/workshop:viewauthorpublished',1,1372421219,0),(849,1,4,'mod/workshop:viewauthorpublished',1,1372421219,0),(850,1,3,'mod/workshop:viewauthorpublished',1,1372421219,0),(851,1,1,'mod/workshop:viewauthorpublished',1,1372421219,0),(852,1,4,'mod/workshop:viewallassessments',1,1372421219,0),(853,1,3,'mod/workshop:viewallassessments',1,1372421219,0),(854,1,1,'mod/workshop:viewallassessments',1,1372421219,0),(855,1,4,'mod/workshop:overridegrades',1,1372421219,0),(856,1,3,'mod/workshop:overridegrades',1,1372421219,0),(857,1,1,'mod/workshop:overridegrades',1,1372421219,0),(858,1,4,'mod/workshop:ignoredeadlines',1,1372421219,0),(859,1,3,'mod/workshop:ignoredeadlines',1,1372421219,0),(860,1,1,'mod/workshop:ignoredeadlines',1,1372421220,0),(861,1,1,'enrol/authorize:config',1,1372421236,0),(862,1,1,'enrol/authorize:manage',1,1372421236,0),(863,1,3,'enrol/authorize:manage',1,1372421236,0),(864,1,1,'enrol/authorize:unenrol',1,1372421236,0),(865,1,1,'enrol/authorize:managepayments',1,1372421236,0),(866,1,1,'enrol/authorize:uploadcsv',1,1372421236,0),(867,1,3,'enrol/cohort:config',1,1372421238,0),(868,1,1,'enrol/cohort:config',1,1372421238,0),(869,1,1,'enrol/cohort:unenrol',1,1372421238,0),(870,1,1,'enrol/database:unenrol',1,1372421239,0),(871,1,1,'enrol/guest:config',1,1372421242,0),(872,1,3,'enrol/guest:config',1,1372421242,0),(873,1,1,'enrol/ldap:manage',1,1372421243,0),(874,1,1,'enrol/manual:config',1,1372421244,0),(875,1,1,'enrol/manual:enrol',1,1372421244,0),(876,1,3,'enrol/manual:enrol',1,1372421244,0),(877,1,1,'enrol/manual:manage',1,1372421244,0),(878,1,3,'enrol/manual:manage',1,1372421244,0),(879,1,1,'enrol/manual:unenrol',1,1372421244,0),(880,1,3,'enrol/manual:unenrol',1,1372421244,0),(881,1,1,'enrol/meta:config',1,1372421246,0),(882,1,3,'enrol/meta:config',1,1372421246,0),(883,1,1,'enrol/meta:selectaslinked',1,1372421246,0),(884,1,1,'enrol/meta:unenrol',1,1372421246,0),(885,1,1,'enrol/paypal:config',1,1372421249,0),(886,1,1,'enrol/paypal:manage',1,1372421249,0),(887,1,3,'enrol/paypal:manage',1,1372421249,0),(888,1,1,'enrol/paypal:unenrol',1,1372421249,0),(889,1,3,'enrol/self:config',1,1372421250,0),(890,1,1,'enrol/self:config',1,1372421250,0),(891,1,3,'enrol/self:manage',1,1372421251,0),(892,1,1,'enrol/self:manage',1,1372421251,0),(893,1,5,'enrol/self:unenrolself',1,1372421251,0),(894,1,3,'enrol/self:unenrol',1,1372421251,0),(895,1,1,'enrol/self:unenrol',1,1372421251,0),(896,1,3,'block/activity_modules:addinstance',1,1372421254,0),(897,1,1,'block/activity_modules:addinstance',1,1372421254,0),(898,1,7,'block/admin_bookmarks:myaddinstance',1,1372421255,0),(899,1,3,'block/admin_bookmarks:addinstance',1,1372421255,0),(900,1,1,'block/admin_bookmarks:addinstance',1,1372421255,0),(901,1,3,'block/badges:addinstance',1,1372421255,0),(902,1,1,'block/badges:addinstance',1,1372421255,0),(903,1,7,'block/badges:myaddinstance',1,1372421255,0),(904,1,3,'block/blog_menu:addinstance',1,1372421256,0),(905,1,1,'block/blog_menu:addinstance',1,1372421256,0),(906,1,3,'block/blog_recent:addinstance',1,1372421256,0),(907,1,1,'block/blog_recent:addinstance',1,1372421256,0),(908,1,3,'block/blog_tags:addinstance',1,1372421257,0),(909,1,1,'block/blog_tags:addinstance',1,1372421257,0),(910,1,7,'block/calendar_month:myaddinstance',1,1372421258,0),(911,1,3,'block/calendar_month:addinstance',1,1372421258,0),(912,1,1,'block/calendar_month:addinstance',1,1372421258,0),(913,1,7,'block/calendar_upcoming:myaddinstance',1,1372421259,0),(914,1,3,'block/calendar_upcoming:addinstance',1,1372421259,0),(915,1,1,'block/calendar_upcoming:addinstance',1,1372421259,0),(916,1,7,'block/comments:myaddinstance',1,1372421259,0),(917,1,3,'block/comments:addinstance',1,1372421259,0),(918,1,1,'block/comments:addinstance',1,1372421259,0),(919,1,7,'block/community:myaddinstance',1,1372421260,0),(920,1,3,'block/community:addinstance',1,1372421260,0),(921,1,1,'block/community:addinstance',1,1372421260,0),(922,1,3,'block/completionstatus:addinstance',1,1372421261,0),(923,1,1,'block/completionstatus:addinstance',1,1372421261,0),(924,1,7,'block/course_list:myaddinstance',1,1372421261,0),(925,1,3,'block/course_list:addinstance',1,1372421261,0),(926,1,1,'block/course_list:addinstance',1,1372421261,0),(927,1,7,'block/course_overview:myaddinstance',1,1372421262,0),(928,1,3,'block/course_summary:addinstance',1,1372421263,0),(929,1,1,'block/course_summary:addinstance',1,1372421263,0),(930,1,3,'block/feedback:addinstance',1,1372421264,0),(931,1,1,'block/feedback:addinstance',1,1372421264,0),(932,1,7,'block/glossary_random:myaddinstance',1,1372421264,0),(933,1,3,'block/glossary_random:addinstance',1,1372421264,0),(934,1,1,'block/glossary_random:addinstance',1,1372421264,0),(935,1,7,'block/html:myaddinstance',1,1372421265,0),(936,1,3,'block/html:addinstance',1,1372421265,0),(937,1,1,'block/html:addinstance',1,1372421265,0),(938,1,3,'block/login:addinstance',1,1372421266,0),(939,1,1,'block/login:addinstance',1,1372421266,0),(940,1,7,'block/mentees:myaddinstance',1,1372421266,0),(941,1,3,'block/mentees:addinstance',1,1372421266,0),(942,1,1,'block/mentees:addinstance',1,1372421266,0),(943,1,7,'block/messages:myaddinstance',1,1372421267,0),(944,1,3,'block/messages:addinstance',1,1372421267,0),(945,1,1,'block/messages:addinstance',1,1372421267,0),(946,1,7,'block/mnet_hosts:myaddinstance',1,1372421267,0),(947,1,3,'block/mnet_hosts:addinstance',1,1372421268,0),(948,1,1,'block/mnet_hosts:addinstance',1,1372421268,0),(949,1,7,'block/myprofile:myaddinstance',1,1372421268,0),(950,1,3,'block/myprofile:addinstance',1,1372421268,0),(951,1,1,'block/myprofile:addinstance',1,1372421268,0),(952,1,7,'block/navigation:myaddinstance',1,1372421269,0),(953,1,3,'block/navigation:addinstance',1,1372421269,0),(954,1,1,'block/navigation:addinstance',1,1372421269,0),(955,1,7,'block/news_items:myaddinstance',1,1372421270,0),(956,1,3,'block/news_items:addinstance',1,1372421270,0),(957,1,1,'block/news_items:addinstance',1,1372421270,0),(958,1,7,'block/online_users:myaddinstance',1,1372421271,0),(959,1,3,'block/online_users:addinstance',1,1372421271,0),(960,1,1,'block/online_users:addinstance',1,1372421271,0),(961,1,7,'block/online_users:viewlist',1,1372421271,0),(962,1,6,'block/online_users:viewlist',1,1372421271,0),(963,1,5,'block/online_users:viewlist',1,1372421271,0),(964,1,4,'block/online_users:viewlist',1,1372421271,0),(965,1,3,'block/online_users:viewlist',1,1372421271,0),(966,1,1,'block/online_users:viewlist',1,1372421271,0),(967,1,3,'block/participants:addinstance',1,1372421271,0),(968,1,1,'block/participants:addinstance',1,1372421271,0),(969,1,7,'block/private_files:myaddinstance',1,1372421272,0),(970,1,3,'block/private_files:addinstance',1,1372421272,0),(971,1,1,'block/private_files:addinstance',1,1372421272,0),(972,1,3,'block/quiz_results:addinstance',1,1372421273,0),(973,1,1,'block/quiz_results:addinstance',1,1372421273,0),(974,1,3,'block/recent_activity:addinstance',1,1372421273,0),(975,1,1,'block/recent_activity:addinstance',1,1372421273,0),(976,1,7,'block/rss_client:myaddinstance',1,1372421274,0),(977,1,3,'block/rss_client:addinstance',1,1372421274,0),(978,1,1,'block/rss_client:addinstance',1,1372421274,0),(979,1,4,'block/rss_client:manageownfeeds',1,1372421275,0),(980,1,3,'block/rss_client:manageownfeeds',1,1372421275,0),(981,1,1,'block/rss_client:manageownfeeds',1,1372421275,0),(982,1,1,'block/rss_client:manageanyfeeds',1,1372421275,0),(983,1,3,'block/search_forums:addinstance',1,1372421275,0),(984,1,1,'block/search_forums:addinstance',1,1372421276,0),(985,1,3,'block/section_links:addinstance',1,1372421276,0),(986,1,1,'block/section_links:addinstance',1,1372421276,0),(987,1,3,'block/selfcompletion:addinstance',1,1372421276,0),(988,1,1,'block/selfcompletion:addinstance',1,1372421276,0),(989,1,7,'block/settings:myaddinstance',1,1372421277,0),(990,1,3,'block/settings:addinstance',1,1372421277,0),(991,1,1,'block/settings:addinstance',1,1372421277,0),(992,1,3,'block/site_main_menu:addinstance',1,1372421277,0),(993,1,1,'block/site_main_menu:addinstance',1,1372421277,0),(994,1,3,'block/social_activities:addinstance',1,1372421277,0),(995,1,1,'block/social_activities:addinstance',1,1372421278,0),(996,1,3,'block/tag_flickr:addinstance',1,1372421279,0),(997,1,1,'block/tag_flickr:addinstance',1,1372421279,0),(998,1,3,'block/tag_youtube:addinstance',1,1372421279,0),(999,1,1,'block/tag_youtube:addinstance',1,1372421279,0),(1000,1,7,'block/tags:myaddinstance',1,1372421280,0),(1001,1,3,'block/tags:addinstance',1,1372421280,0),(1002,1,1,'block/tags:addinstance',1,1372421280,0),(1003,1,4,'report/completion:view',1,1372421296,0),(1004,1,3,'report/completion:view',1,1372421296,0),(1005,1,1,'report/completion:view',1,1372421296,0),(1006,1,4,'report/courseoverview:view',1,1372421298,0),(1007,1,3,'report/courseoverview:view',1,1372421298,0),(1008,1,1,'report/courseoverview:view',1,1372421298,0),(1009,1,4,'report/log:view',1,1372421299,0),(1010,1,3,'report/log:view',1,1372421299,0),(1011,1,1,'report/log:view',1,1372421299,0),(1012,1,4,'report/log:viewtoday',1,1372421299,0),(1013,1,3,'report/log:viewtoday',1,1372421299,0),(1014,1,1,'report/log:viewtoday',1,1372421299,0),(1015,1,4,'report/loglive:view',1,1372421300,0),(1016,1,3,'report/loglive:view',1,1372421300,0),(1017,1,1,'report/loglive:view',1,1372421300,0),(1018,1,4,'report/outline:view',1,1372421301,0),(1019,1,3,'report/outline:view',1,1372421302,0),(1020,1,1,'report/outline:view',1,1372421302,0),(1021,1,4,'report/participation:view',1,1372421302,0),(1022,1,3,'report/participation:view',1,1372421302,0),(1023,1,1,'report/participation:view',1,1372421302,0),(1024,1,1,'report/performance:view',1,1372421303,0),(1025,1,4,'report/progress:view',1,1372421303,0),(1026,1,3,'report/progress:view',1,1372421303,0),(1027,1,1,'report/progress:view',1,1372421303,0),(1028,1,1,'report/security:view',1,1372421304,0),(1029,1,4,'report/stats:view',1,1372421305,0),(1030,1,3,'report/stats:view',1,1372421305,0),(1031,1,1,'report/stats:view',1,1372421305,0),(1032,1,4,'gradeexport/ods:view',1,1372421306,0),(1033,1,3,'gradeexport/ods:view',1,1372421306,0),(1034,1,1,'gradeexport/ods:view',1,1372421306,0),(1035,1,1,'gradeexport/ods:publish',1,1372421306,0),(1036,1,4,'gradeexport/txt:view',1,1372421306,0),(1037,1,3,'gradeexport/txt:view',1,1372421306,0),(1038,1,1,'gradeexport/txt:view',1,1372421306,0),(1039,1,1,'gradeexport/txt:publish',1,1372421306,0),(1040,1,4,'gradeexport/xls:view',1,1372421307,0),(1041,1,3,'gradeexport/xls:view',1,1372421307,0),(1042,1,1,'gradeexport/xls:view',1,1372421307,0),(1043,1,1,'gradeexport/xls:publish',1,1372421307,0),(1044,1,4,'gradeexport/xml:view',1,1372421308,0),(1045,1,3,'gradeexport/xml:view',1,1372421309,0),(1046,1,1,'gradeexport/xml:view',1,1372421309,0),(1047,1,1,'gradeexport/xml:publish',1,1372421309,0),(1048,1,3,'gradeimport/csv:view',1,1372421309,0),(1049,1,1,'gradeimport/csv:view',1,1372421309,0),(1050,1,3,'gradeimport/xml:view',1,1372421310,0),(1051,1,1,'gradeimport/xml:view',1,1372421310,0),(1052,1,1,'gradeimport/xml:publish',1,1372421310,0),(1053,1,4,'gradereport/grader:view',1,1372421311,0),(1054,1,3,'gradereport/grader:view',1,1372421311,0),(1055,1,1,'gradereport/grader:view',1,1372421311,0),(1056,1,4,'gradereport/outcomes:view',1,1372421312,0),(1057,1,3,'gradereport/outcomes:view',1,1372421312,0),(1058,1,1,'gradereport/outcomes:view',1,1372421312,0),(1059,1,5,'gradereport/overview:view',1,1372421313,0),(1060,1,1,'gradereport/overview:view',1,1372421313,0),(1061,1,5,'gradereport/user:view',1,1372421313,0),(1062,1,4,'gradereport/user:view',1,1372421313,0),(1063,1,3,'gradereport/user:view',1,1372421313,0),(1064,1,1,'gradereport/user:view',1,1372421313,0),(1065,1,7,'repository/alfresco:view',1,1372421322,0),(1066,1,7,'repository/boxnet:view',1,1372421324,0),(1067,1,2,'repository/coursefiles:view',1,1372421324,0),(1068,1,4,'repository/coursefiles:view',1,1372421324,0),(1069,1,3,'repository/coursefiles:view',1,1372421324,0),(1070,1,1,'repository/coursefiles:view',1,1372421324,0),(1071,1,7,'repository/dropbox:view',1,1372421325,0),(1072,1,7,'repository/equella:view',1,1372421325,0),(1073,1,2,'repository/filesystem:view',1,1372421326,0),(1074,1,4,'repository/filesystem:view',1,1372421326,0),(1075,1,3,'repository/filesystem:view',1,1372421326,0),(1076,1,1,'repository/filesystem:view',1,1372421326,0),(1077,1,7,'repository/flickr:view',1,1372421327,0),(1078,1,7,'repository/flickr_public:view',1,1372421327,0),(1079,1,7,'repository/googledocs:view',1,1372421328,0),(1080,1,2,'repository/local:view',1,1372421329,0),(1081,1,4,'repository/local:view',1,1372421329,0),(1082,1,3,'repository/local:view',1,1372421329,0),(1083,1,1,'repository/local:view',1,1372421329,0),(1084,1,7,'repository/merlot:view',1,1372421330,0),(1085,1,7,'repository/picasa:view',1,1372421330,0),(1086,1,7,'repository/recent:view',1,1372421331,0),(1087,1,7,'repository/s3:view',1,1372421331,0),(1088,1,7,'repository/upload:view',1,1372421333,0),(1089,1,7,'repository/url:view',1,1372421335,0),(1090,1,7,'repository/user:view',1,1372421336,0),(1091,1,2,'repository/webdav:view',1,1372421337,0),(1092,1,4,'repository/webdav:view',1,1372421337,0),(1093,1,3,'repository/webdav:view',1,1372421337,0),(1094,1,1,'repository/webdav:view',1,1372421337,0),(1095,1,7,'repository/wikimedia:view',1,1372421338,0),(1096,1,7,'repository/youtube:view',1,1372421339,0),(1097,1,1,'tool/customlang:view',1,1372421359,0),(1098,1,1,'tool/customlang:edit',1,1372421360,0),(1099,1,3,'booktool/importhtml:import',1,1372421397,0),(1100,1,1,'booktool/importhtml:import',1,1372421397,0),(1101,1,6,'booktool/print:print',1,1372421397,0),(1102,1,8,'booktool/print:print',1,1372421398,0),(1103,1,5,'booktool/print:print',1,1372421398,0),(1104,1,4,'booktool/print:print',1,1372421398,0),(1105,1,3,'booktool/print:print',1,1372421398,0),(1106,1,1,'booktool/print:print',1,1372421398,0),(1107,1,4,'quiz/grading:viewstudentnames',1,1372421407,0),(1108,1,3,'quiz/grading:viewstudentnames',1,1372421407,0),(1109,1,1,'quiz/grading:viewstudentnames',1,1372421407,0),(1110,1,4,'quiz/grading:viewidnumber',1,1372421407,0),(1111,1,3,'quiz/grading:viewidnumber',1,1372421407,0),(1112,1,1,'quiz/grading:viewidnumber',1,1372421407,0),(1113,1,4,'quiz/statistics:view',1,1372421409,0),(1114,1,3,'quiz/statistics:view',1,1372421410,0),(1115,1,1,'quiz/statistics:view',1,1372421410,0),(1116,1,1,'enrol/payanyway:config',1,1372423081,2),(1117,1,1,'enrol/payanyway:manage',1,1372423081,2),(1118,1,3,'enrol/payanyway:manage',1,1372423081,2),(1119,1,1,'enrol/payanyway:unenrol',1,1372423081,2),(1120,1,3,'mod/autoview:canedit',1,1372423805,2),(1121,1,1,'mod/autoview:canedit',1,1372423805,2),(1122,1,3,'mod/autoview:canrecordflash',1,1372423805,2),(1123,1,1,'mod/autoview:canrecordflash',1,1372423805,2),(1124,1,3,'mod/autoview:canbroadcastflash',1,1372423805,2),(1125,1,1,'mod/autoview:canbroadcastflash',1,1372423805,2),(1126,1,3,'mod/autoview:canconvertdocument',1,1372423805,2),(1127,1,1,'mod/autoview:canconvertdocument',1,1372423805,2),(1128,1,6,'mod/autoview:viewpresentation',1,1372423805,2),(1129,1,5,'mod/autoview:viewpresentation',1,1372423805,2),(1130,1,4,'mod/autoview:viewpresentation',1,1372423805,2),(1131,1,3,'mod/autoview:viewpresentation',1,1372423805,2),(1132,1,1,'mod/autoview:viewpresentation',1,1372423805,2),(1133,1,7,'repository/coursefilearea:view',1,1372423807,2),(1134,1,3,'block/repo_filemanager:addinstance',1,1372423808,2),(1135,1,1,'block/repo_filemanager:addinstance',1,1372423808,2);
/*!40000 ALTER TABLE `mdl_role_capabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_context_levels`
--

LOCK TABLES `mdl_role_context_levels` WRITE;
/*!40000 ALTER TABLE `mdl_role_context_levels` DISABLE KEYS */;
INSERT INTO `mdl_role_context_levels` VALUES (1,1,10),(4,2,10),(2,1,40),(5,2,40),(3,1,50),(6,3,50),(8,4,50),(10,5,50),(7,3,70),(9,4,70),(11,5,70);
/*!40000 ALTER TABLE `mdl_role_context_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_names`
--

LOCK TABLES `mdl_role_names` WRITE;
/*!40000 ALTER TABLE `mdl_role_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_role_sortorder`
--

LOCK TABLES `mdl_role_sortorder` WRITE;
/*!40000 ALTER TABLE `mdl_role_sortorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_role_sortorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale`
--

LOCK TABLES `mdl_scale` WRITE;
/*!40000 ALTER TABLE `mdl_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scale_history`
--

LOCK TABLES `mdl_scale_history` WRITE;
/*!40000 ALTER TABLE `mdl_scale_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm`
--

LOCK TABLES `mdl_scorm` WRITE;
/*!40000 ALTER TABLE `mdl_scorm` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_aicc_session`
--

LOCK TABLES `mdl_scorm_aicc_session` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_aicc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes`
--

LOCK TABLES `mdl_scorm_scoes` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_data`
--

LOCK TABLES `mdl_scorm_scoes_data` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_scoes_track`
--

LOCK TABLES `mdl_scorm_scoes_track` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_scoes_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_mapinfo`
--

LOCK TABLES `mdl_scorm_seq_mapinfo` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_mapinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_objective`
--

LOCK TABLES `mdl_scorm_seq_objective` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprule`
--

LOCK TABLES `mdl_scorm_seq_rolluprule` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rolluprulecond`
--

LOCK TABLES `mdl_scorm_seq_rolluprulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rolluprulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_rulecond`
--

LOCK TABLES `mdl_scorm_seq_rulecond` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_rulecond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_scorm_seq_ruleconds`
--

LOCK TABLES `mdl_scorm_seq_ruleconds` WRITE;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_scorm_seq_ruleconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_sessions`
--

LOCK TABLES `mdl_sessions` WRITE;
/*!40000 ALTER TABLE `mdl_sessions` DISABLE KEYS */;
INSERT INTO `mdl_sessions` VALUES (388,0,'g1sjssa252iv4nuet48330dhm7',0,'bWIySi1LMVBqV001ZGxES1BMQ2ZuWEhpMzJhTlgzSUQzUDk2QkltUVhFRFlwMm41eEZZdncwNHdlR2JDWnA3NjNzd1JjZFozMFotRm5aSHNkeHJMQ09IWGVZOXJIWnlqRVYzSVZBVGxOME51TGJ2eHhEUDNKX2s2SE9SamQ1QVhZdEZqYnZQMWJzaXhQa0twS2pzTUoxOVhhTHdUVXhWamIzcXNsTFY5V0dTV1pkdDVWd3czLVFLdE44VzI1SjRwS0gwMXo0OUJSMTlMT0NKTUo5QkxYTkJCcVFScGVuUUxwNzZCbWRWVGJtOEZkZER0UFpQbW0yVEx3WGo1WHkyWkl3WjJIT2dlTXRibDhGOEpENzdBREtiY3JEbVhlZy1FV0oyc29fSjNoNjNnWk50dmp6c0lySllwVlpQR3FwbGQzdEZIR2E5SW9BaHRSdXR6eFAzNUg1YVRjcm1FSTZlT2gyTjlJVkUxUU1hSDVoU1NpSDVCQk9xZHM4WGpERDNUQzlubkl2MkdJWENLdTE3S1NoVkptWWhSMnVtS0pvb2VRaWZGUk52cmt6LUNYb28xMV9tSUVWNUpDZ2FyOHJIemdiYkdKbzMtWWt3M2lHblBpbGpKQWpKZzlUQ3pZendYU2VNZ1VVNlJWQ1VfVGFrZ291SHdldEFLU2FsZ2UxVW9IZm1lcEUybmFReXFoRWVqb2ZxYzl1ZTJ3eERVMHphMUdKa3RzZDZLV1c4UEQybzR2T1NkVl9uWnFZWjhsTHBMMlpWNHR5Ni01ckJlaG84TkNrSk9JeDVmUVhScEFTaHg2bjFoVGctajFWcm5hTmNQNF8yTFVPaVo3aUdYSUg2aHVVUFZpNGVnYm92MUs5clJ3Y2QtckZxeFNWdUFId2RXUHRJOERDTHUxSmhJUXpDMXlicm4zQzJrQ0xzajZySy1aWlpmR3lpUmhxMUdEcXBSVWs0N296aWU2eGsxS0FLaTEwV1hUTjNvQUZBSTlrNUx0N2YwMWQ3UjY5SVFaOUZtM2ZBLVo3S1ZUODExbFJxVGROdnNuZXpBYkNBQjVyQllsOC00RFNIc1hGTXMwYWN1S0NoRXNMQU1aYmU0WlljLTNmTG02aDRCN3FKNzYtcGRvVERDUlc2SS1rWDAycjVnTUxMa19DN2VSbHFWU2psQW5DbF9JNWZEd3ZDV0M5T2hYT3NEb1ZjZTN2dWhvb2dNUGxMbHM5Q09aME56SXp1YUdKcjdVbnRVUFhlNkJfMmtUT250a2tWSE1vRmwzYkZIdmcxUzc4NTdPUTd1S1hLQm9FUnpKaEV6NGJKVUE4SmZJRG0wbER1NVo4bXhSN2ZDanUzS2hfRWE5dFcwTzZlMjVkNXZQZndzYWNucFdWMklvNk5CMUNySzVaRk1yVXpKVGxLbXM0NG4yT2FKbDk0YW5GMENRcEE0b0d6WGNKM0o1S0VXMnFiR0UzbTlEdm41SDlUbjJTRURjVjhoT184Y2VsYWc2WGJYdTdmMjl0aU85NmJ4anV4X3pzaWVpaklRQVN3TFp5RDMxMDFMT19wRFpsQ0VZM3ItRUl4cF9uTjl3WTVuUFdSdHRyV0RpYU56MjRRZDJxaGdKS3pDeXNtTmpDMi03Q2JyQmJMVF9JMWFjajgtakxaekZvMFQ3bzFkNWFIanJUTlNvMzFFWUd0Z1ZvbzlpOVhLRUoyR3Zxam82eFdDWXJVQWlKN0d6dm1SU016UDBlV3oyZGgwQTBVTlBfeFpqWkx6RFU0SnR1aGFVcUJDdi1XSjA2RkZ6MW9nZnA4RS1uN1hRdWkxSjNfUVlEcDRHT3QzSzBPNWxocFdlbzh5Y1RFd0w4NVBwTGVvUXdRUGRab1EwYm90NEY4YzNMeGdVTm1hMFlHVkxPb1ladnhwem0tV3Q1aXZXc3FNWWtCdERLV29Wc1ZOLUJ5ckhQVnQ2cUF2SlM4T3pPNUY3WDlZRXlZb3NYS2I5QlFhZVp4c2pRYUF5NW1kRExveW1YcGVxVkJ3YlYyc1F3TWF2c0Nnb05LYVhoUWJFeGt1MXFOVUFQOTZZYTZBVnhTVWpTRlhSdFd5dWN1RWlnTXJTYzZHbEdZMGNEaC1QajhZd2pFWmRhTjZRSENBUUdMeXcwZ2R0YldyNUJWbnNOTEdjX3Q1R19vSnRLTmxLbmd3ekVnUjdrdUxLN2hMekstaUNYbjNuRG9WS3IzVFVyNWVWbUZlRWJRNWowZzdkSlNmd01HNVNKMFFCcU1hNlNCTzBJUDNXNGo2cVpTSnJSWGxseWpIYk1TSmFkMEZ2VHdHeHZBX3B3SldrZUg0em5teTJkclZheWRaN053QkQ3NzJmOGYxSG5rXzBfNWJ4cXJNb3ZDODc2TmFocmtEUnFwSnJVZm5Ib01xRTF0ZDkwcU5yak81YTNRc3BmdDNRMDJQcDRxTGFjOURTT1J3azVmWDJUdEhPckx5Z3cxNDJsb1lsTHhXT00zNUcyOXJjYS1YQ2JsRzlBZmZUb3BXalEzUVluckE4d01TRy1MbDJVQkhET2tEOHY2YTlDVjcxeGktR3QtV3BXaDdYdER3UkR0d1Brbm91V3hCeTlnRnpEUDd4cnZ6dnpQbE96STBCU2NyamJtYXlvSjZWcEZZTUt1bw==',1372730625,1372730625,'66.249.78.12','66.249.78.12'),(389,0,'bdccgop3or5f27dm169mht65b4',0,'MV82OW51dHZCcVdrM0RyYjRsdTMxenFwRDFnY1BkVXFMSGF6Rnc3RVg0c0duYWxEN1VFS3RXV2hCNDdkdHVBLU15ZEhuc0dDbjlpR0RSejNrV0VsNW9vYjl4OGZMb3ZyX2N4Sy0tTmtyX1Mxdkd2a2xwLTFhcUdlVkdlOVhKZWo5NjdWQlB5RHAtWUpQdV9NRUpkdC1YdzZKOG9vQlRrYVp6WURpQTd1Z2d3TExTZzMxTm5NbEc5VVRFMVdhTFZwcTlOdEpmYUUzZlNIVUdhOXB5NzdKVy1UUm5LUWFwWHdhQ3RaT3hjUzkzeGpqNUpJdVVVRExvOEdEX3BBNWVXc2lmWXFkalppQ0pvWWJnR2Z6dU9vR1JsbnI5RnY3RzdZZzVNTHprZ0l2aWVfRjR5SEd4T1hOYVNxcU5sYmduQ1JXaDVBekx3ZUVXTE9DbXZjU1RpQV8yOGoxRkNmTGI3aFVWWkpNNjJ4WDBZRkZKM20xWVRHZm85cFZ3REFRbjYxcjJPZDJoNDBXUDB1LU5xVlQwZUxqZkpXY1FoU0pRc3lBaFE1bU9Ecml0NEUzbk5JaURRNkgteHNqVHVmSWJ0V0RYTUd5WkVKN2s5MTJfSVp3WER1bTFHdS1CeU5OQmdqaVVjSFdqeE1RbDhDaDBSUi1SWmFWMXJLMXE4SHR0dlROLUx3STN0WlRvZXpWUEJkbWhsWEc5WlRKQWdsVzlSSmF0a0VsRHFSejZhS01pREZ1Q25YWkk4U2hDbjlvS1pzWGp3RE5VRnpycVJESmZGcUI3OXhaRy1fV2RseHNlX0dKaTN5cl95QWZxaVRCdU1PcmI1a0locFUxeUZzakxTN3ZPX3Q2RktvQnhzMEhpTXdNTXJRUVZfMnNCeWM3bXA0U0MwaTA2M2NiUG5iWGp5NUZDSXpQRThrdlVfTzdDQk11cFNZRk9nVFlEeHl6UU1KNHRkeEp3U0c3T3hDbUI1RGM2b3ZTeU5MV3hLRXVYR0xYdGFKZFBDRVlOREQ4Vzc2NzF6b2R0LUQwbnBzZW0wOVpTbHJnYlBSeVNfZTJOZFpoVWVFSmpQLXZ3dmxuSWNJSlNNSXBCeVhyeE9EX1g5ejVDZkZKQ09EaThkMHBpdm42M01aaUM5cXpodGpvc3JyX0FkLTMwVGJtUVFMQjVDLUFxYkVoRXR1WDVYOFlyamFiMTI1LXZSMnluTUxTNDZNYjhEaW9uUUdGRVJCMjctTzQxZUhFNm5FMDYxbTRPM1M3ME8yTFNWVmhjQVpMMUVsOUFPaTdjWE1BM2NPeFl5enBkc3JnM3ljUnl0Q2RUTlFVel9zTXA5THlPTDRvbFI2d21MX1FlcmZjdm54d3J1VEVGYjJuNEpSSjFGTXlIbzZuYjg5a0xQUVllY1dHbmRnMUl6UDNac25QQWYtbmR1a3NvbGlCWkZhUVBKUF9STm5XamRSM0ZjT3AwblBtcms2b0s3bXRROE1jcWtzQTNxMEZfVFU3anp3eFN1c25YOXhtMU5ud25sVUl0U1gyeFE3dWJSVkZ2ajJqX2pBVURFcjUtU1hweml2Wld1R1BnMkVmYTFDQWpQQ0gyMm9yTVpDbS0zdDFBUy13Q3M0OEd5WkhfRzdEcXNyRnVsRmR0MmVHcWt6cWN5WHY4dkdtRnowUUhpTkhJeVNsWVA4S2tKZ1NfdnJDaVFodzNzbWdhdnlseWFPMGlmVC00amg5ZXBzbHhRYmMtYkMyS1ZkM0VoYmFOdGIwb09EcHU2Y0l2OUFHVWhYWDJ2cXEtRmpYLVhGeTNMMFo4R3pFLUw5c2VtQ19PQi1ob1lUNEd4eFNtRWtoNVhmRmN3dWxZV3owQWNiQ1cxU29lY0RROC1DT2l6aVg3UnNjSkdaS0g1LUZ5dzF5Q2pfaU9pclM1VW9IZ3F3b2I4Wm5nX00wSTl2RVhuOGVNMVVsV0V4MDVGY1pDSVNnTEI0N01tSk85RHVwZWw0OE0zZmVidkZRQWhIeTcwR3pvTklLS1NhU3Y5VEtRRFZXcU9RMzlJVUdRc2ZVM3hTRUhic0JTdmtRclJsWVpBY1FhbXU4RFZjeE1ySGRLNXJ6anJxbWlLRlhDZ09BdGgtemlZYTUyaElMa2stRHBDM3NUMmM3T0pWNkNiRE5VWXFPS0hmWTBuRktxUi1SdWlkdjVvbEtzTFJybnM5R2tsVUdlQUswSHZHZ2pjRDU4WkVGNnJ0SW4xSnVVaE1mdUgtLUc1UkxYNzJsdFJJdVhPZHN2MHl6YnVmdS05dnU0dVFTYk1xYlhIOE9MYjJZdTkydTZIaUh1U2QzcGdaV2taQWZrTHVORVlzcC1jMDlyUXVnekVjMDMzNm5rRkZKaGtrZzh0RDNEdXhUNDVLOTRHQzJMdElpNmJycEloMGM2N3NJVV9jUUM4V1pGSWRfZG1VMXp3cEVyWnk0S0g3YWFnTGU4LTJhejI2czAwMm5Jc1N1dVYzTjFGSlE2WFdiczBCYVdWN1FxRUlXbkduMmJwTUs0MGFxUHg4T2Q2LTdaaG0yRkZmZUcyT2M4Vm45cXNKWWRrdEE1UDVDbnVDd0ZQZHVEMlR5bWQ0Z0ZtVElQbE1rZkVHSUJTVHE1b3BFZlZxRzhELWkxR0xJekhEUXBYZA==',1372731803,1372731803,'66.249.78.12','66.249.78.12'),(390,0,'c3je6gs8baq0f7cd94m3m0ivq7',0,'UnB2X2JOTEVKZGhJMjMzTU9qalcta2t5b3FDbUI3bzhJcHFHM3ZIY3l1N2J3ZmhxQWxTenp3a3JxR241dFRabGRBYXRFSzM2dm40NENTZ1FZLTlpczc1bkEyOUJzRTBLZU1jSi15bFlkRTF6YVFtb0ZNNF9tWVcwUy1DYlFTd3VlZDA0bEhPQ09sSXN4QzFTM2pqR3lCRTRVWUcyTXQ4TklXYzI3S0RVVWx3TE9OdGRnRWc1bDVCR3NaOFZXRUNFSmlPOEoyc24xbVdWZFpUeVdpckJsRkNBQ2lnV2JoWFBxQWh3Ylg0c0hleF9MQS1YRVpuVXdXLUFNM2xtb0JyMUNUY3pULUg3V0pJMERhT2tSNzZiNDdReFQwMjlLbkp3bTZjYWRGUzIxSjRybVYwbTdVVFlzVTRXbWU2Y3lmeWV0Qk0zcTFhSnlNbGdQUW1xSkhYTVFmSDY1MlZwZ05rUVdGMEtaakV4Snl0ME1HNU9aTWR2WFR5a095aTRQLUp1ZHdib0NoWERpbjgxcGY5TXBXRWNKUTlJUTJ0eXJLY1pKbGJ3Y1lUd2dTWk95bFQ0b1dMSjhMVWtaQ3k1d29qWS0tNENVRXZQWGcyV0JSMFNQb05jS2l3TlNSamFIbFNzYTJ2eG9PYVhuN3FYNklmTGIzX1FIdkJfdk1jOEp2N1Y3N2pFYlo1VWxzdWduSzRNOHdNYzBtajY2ZFJHa1VnUWFfb21RaFNSY1pSdEIwZlJuRzgtZTJ5bmFpRHRNM25qUFZqWUVxYnhYNHNPaWFPRFRwbl9sM1FNby1NZjFtSTVuZGRFZEozcWpUcU42bVJuYUU0Q2FGdlhvRDRrS1ZnSVBTNWlaRGVTQmxqeU9DN3JIS1dJb3N5X3ZnUmJNX2c2dXlUUXFTYU1Vd2xiaXZNa3FBZEh5UFlGZEtzRm9jSmdTekJKWFFKWG9sSzFKUk5xNnRtSi0xVXB0MWVycGE4Nml0NWsxb3VnYVNWY1U0R3JUOEFjN05STXJRNmVQOTlRc1BkeHdHR0k0TUhxekdOdnhhR0JIRERCSzlPUGd0NzVqMFNUUXpWdFNHc09wMnExbnIyZXdjUTdNcnVmV00tWm5yVGtYVVlOWkhtRXVzZ1RhZnU5T19tRWVVSDdoR2pBbHZJNTZKeDltYk5GaGRYbXZBcTVud2ZiNWF6WXJhZFNCQUJSS2s2bFU5clVGWVF3R3lRRjFIdjNRUXotcFVSUnNnT2E2QnpWcXA5bktyNVBhVG9MTmJ3bThCb1hmNHdpbTF5c29qekdoVXpnS0hraXJ0amdoNGxzSjlqLVlzZGtBN3M5NFpOWDJpQ1hHSFhtdEpUUXJiMWd1bnRuMUJmZnNhMWFXb2lCX2NyaHhJT1JsSG50QkpiWmZJSGZHRjh6TXJiUmVTUkVpTDJvS1NGRnZzdXlVZXpheVpuTjhCUS1PZVk0ZlFYdlAyNWxESnhzS19mNGxnU1dOY2xtTTU5cUMtbjJ0UldmQkpHYTdMbWtIOFdfYy1EbklRRjdkZEIzbWRMdGxkRUE5TFVacnJjeklzMWVsZmpDek9kLTA4d0Zoc2d6TDFONmFNVHBIb2V3OEJXWFZoenU5a24zeXMzcHpEVTVwUVNLSkhRXzdQTGpNcVNQS1M1bndrMHpKaHN5Qk96bmFiNDR4MjVqcm5xR0lUOHFGLS1NQTJmeU5GSmU3MXdWNG9mbjVwQ0RQLWFMdkNGc1o2NFJRZGlHYnA1RW9DbHJHSnNDLUZ0RWZjQk5rajZHU1hENjdTeUNpSkwxbWN6bFJIbzRLaW01OTMyS3c1enRmNE9ZVDRDVlRWcS1NdjhpQU5ud1pyNkE4cEZsNVJkRjJrWkNldEladk9La29rTFFvV28tTC1uV2dMbzduVzRHejJqYklyQm4wd1VBM1RXQ253Qmk3azNFcHJSZjVMREl6SmpUNkFMM0VnMzRZRkZVWUZ0VGIxN0VuVVJ5ZFA0emJ3a0lrOUpQX1lMRm1uWE9FUGdveGRxT2pSUWFXQVZrVXlKRmR6YU5nVEktX25TMWtlYlc3LUpmTU9rVmNucy15Nnpocmd3Y3U3VVJLVlZKN3Q1dW9mTjV0TWpQOWxTaGs2UHlSdnplLVdQRjZDOFA3V3RvaHZpYlpnNTZ3T2duQzFEQ3JWRUwtZ0ZIRGQ4M2dTQm4ycjJxaWU2RWZxci12S3pPVW5ha1Q4SnM2NHNCQVN0WnZsOEx3RlhXSmd1ME8wLXNlVWNjb1hNS3c1R1FUNldxZmhHREQ5cUJodUJ4dWpNVThPM1E5MHVwWVR5alozdzZCUm0yM2h4Y3hmclFoVmxKWm55Rmk3Qzdlc2ZnUTVhZzdnUDhlMkxUYnN5OHdIMzFLWVlpT1g4WGNQX0M1MTJWbnI0T3F1WF90SlRnX08yaTNQTkZGQnA1WDlYZFRrM0FqcTdNWGp3Rlc4NjNWMFBvTy0ydjVmTlhKOXJENTdkM2hpTExaTlNhS3BsZklwRzRoaVd3LVpoMFc1UkRZdFRabGFaVF9pSThkWEhlbUI2Q0FUbnNGVk1JWmRXV19aQW1sbW43RUpCQTROMFJTUkVUVDNGTTFVVlJMcXByNDhPS3pzYmI0OXJpbVI4RFozTHpQbWZQa1JRMw==',1372732892,1372732893,'66.249.78.12','66.249.78.12'),(391,0,'59qhv7435uj5cgar0vjlm2l293',0,'d3VaVkJhTHpST2VDZ01jOU1NbEJZOUlpT0JKQXFRMGRtR2EydzBZVUFKUWJWU1V1WTUzVmYxVURCVmRRWTZveTA1MENzQVNxajU2cXFxamRXdXFHWWVxOEt6V0NqX2k4OENnR21LaGpPOFdtOVdwWm5nT2ZHdFY1YXVlOWVjOEZpTGxpNHZVVVg3d2xfLWhOMXM3QVFkNE5IR1VILW5hQXRia294MjEwUnhMYTV0NnVqN2Fkcjk4bm1leEV0ZWVnNDU2LXBXVUViSnJObW5IUV9Md1BiMHAwZGNKSnNDODNlWEtBQmZEMUh0eDhoVjA2YW5NMmk1RXNpOW9TbW5ad21uNkJUa3FMbWFtYjJRTEVBWUNELS1CamY4T0s0UWRjc1N3UTRFR1d6bm1HTF84ck1LbEhNZ3lhLTV0UXpRTnR5Qk1RYjJESVl6WmEwNUhXbWhNYzBidnZWY25iWWF6a3g0ckdZdFRSRWxqSEQzRnA3SkNOa0VxRGE4SGpvWnBuaEFtSUNuSmhpYkJiazdqY2g2MldmUGZCOE92SEwwMlNPVEpxVnJCYWJ5X1lPS2FfRGdBQ1dhVTJVdlNLQlZIYXZpUFBUZEdtUGRUNm1RTXp4OEZyR0cxQ1N5cFYxSF9jSUtfYllkYnNBSWY1QUV1Ykh6cXVJbDhxLW82dGdsTTJMVTNmLXFrSGZxZHRpazZ1THdTVHVKYU10NFNwSmc3YV85ZE1BYllmRk5CeWtFbFlxOWlWa3BxV0JNMzlUVkpsXzJkU0FGT3otYnRkN2xMbHc4WXVOT0c1WTZCQ3c2dGd5amVrclNMR0NDVS1ycUY5eHJJX09IVVpMMjFWVWdHcm4ydFVSRndEZXNIOFVmelZnaHZROUhGdGs2WjM5R1dVWXpOUzdiMjJSVVdLZFNVTk1YSXl0SnpaaW4tVTQ3eXAwMmpwaUZVd3J0eURpSjdDaFFFNG45WUo3UElwdGZHenltaU9lVnQwd0tNTG1Va2hYNkt0OGduaDlvSHZ2Z2FiVzBTTjNiWThDb00xNmpMbmJYVDE3WjZXd0k0VTBSdHZYcDNiR3J1blQ4UmpwdTB3R3ZYVnNLVFZyNGVfSThHOElmR29MRTNhZzZOVE5HTzVpVW4wOGVIaHNMNnZYY1U5eW0xSmh3NmE2VDRITGNRQ2hUR2RmdUNWMEdqUUttaW1yRjJKem15T3NMMm1rQlBtOGpINmxubEVpWllPMWs5TjRWdm12Z2J6SWxpREpLTnRsRWVzaTBHRXVWRWxIdjFSSWY5by04TjRqdllYSWVJbE1RZklWOUk4TU4wMmxaV0JCSzF2T3hHbDl1aUY1S1ByS25TV2VRaGtkSXhpNjNfRDBINTN1bE11bWxDNmc0Umk4czRTdmdOaVo3N0FqekZ2NjdwUVctQ2FJNlRwRXZBcWRod2Fjc2pkVnc1eG14bl9NVEUwemU1Y2dqclMtbjYxb1dwUUJ1MXZPeGFTWFJuc05jX216X2MyYXZyekhENVFIZ1RwSEpNdDAwVVZCZ0taYWdWZlhwaTh6Y05NNUpsc1p2X2hMMjJjdE1BeFNGVEpMTHpGVUhUbWR3WlhTeFAwNW1Od3NQcWllV05DOEx4eGhyUVdRb0MyeUJUS0thc1BTZ0I1X0xsM1pjSkxEVktidVlSN0dCd2dRYWFEYkc2ZHJ5WDdpOE15RElyTTNRSUJFZHYteVE2d18zR0ZIRXJQdXJyRkh4ZU1LMTN3YUVkYk5haTdqUFFNaUV5a0tmVUc4MEhVbzZSRllNNVl0bWpGaEV1SlBhU0Z3UUdnX2hXTXNfMUh4amtQcjVKUGZfSlZhU1pieDh1RFBnRlEtQjZ5Y2FWRTBXYkFzb1VhdUp6djgxOWdDQ2lJMnViQVh5ZGN3UHNGYzFYQnhkblpSM19LcV91aHpteE9Jd1laZDN6TmEyVFpiQklRWXhyc0pfWmlDMEtMSzMxei0wMFFYdWx1Ti03eFFJanpBenBKWkI2MTA3WHJLTWZ2TGRGNTY4Q091dzFld0lpVGUxdHRWUG82dlVOT1ZtZThqTzZMMkxUdGJDRmRQQUktUzVjY3BHWkcwNGdhQWhqaGVzYmZTVFRzQmJJNWZPZm1oVzVrZXJWMmYtVE1udHUwLThGUmNFWnMyZEE5WktWR0tzZzhkU0tBUnFnLXZJRTk2ZnZfM2c4M0tFWWxlZzlxaVRZN2FzLWNmbk5TZ1dIMGlaYkllY2FJX00yUWdTS0NmZk0xaDZ5cGtZRnBrT0EwQk96Z3VCQjFnUFltWG9GekRKMnRQVjVKV3J4OXlpM0J5V3lZWkpubjAwTi1EbktWeVY0cmtwWktJdW5ReUFUcDY3WXhRczBuWG0zR0NLVHlxVlRWeGtscWhINGE5SGxkMFpRM2gtRkE3bURwajgtdlBqNndEU0EtcG43dkVoTWliTms5REZveVBSaU9fVC1SaWhoR1RpSmdLXy1xYWZid0x4MkVOaEVSU0cyUXp2bTVyY2lJVVJBTnVJRnh6bkF3MlRvMDlsZ0xsR2I4MEl0Ump0b21aSUlnRTdDWnFrRHQwdFdnY3g3ODdDZEhnU0h5SWgyQkIzM1REdmNhYjRVdG1KSWdxNzFWOVdheWx1amUyMkZQMGlPQw==',1372733304,1372733304,'66.249.78.12','66.249.78.12'),(392,0,'2hr875n2svb6u0iptogvo6bvs6',0,'ZW1xQm9MdFpoWlRvR0ZLVjRPZXdhdW91Ym9HM0ZvWVBJR1IzRm4wNnA5QkExMkdLUVB0NFhYRDdXVW5JeWstcU0zZnhrc3NMbDk2cW1PeW5FRW9pRmJZYTJ4N1FKdXB0YTI0Qjc3d0VoUDBNUXZrZUM1Mkx1TGNieFJoRlF0UnlUbVJFOEEzMFlpSFRFdTBsSWVTV0M3NUVoRllwRWVRamdFR0tGYmJNc1g0cTN6MjgtRG50YjlBNlB5Z05OTUtaQXJmenVSZi1NUW8xdXpKWmE2anYzUTZFVmxrLTdkaGFwUklXMndsVzBhQUhvNTZoOV9fbk16dko0ekVWdHlGQUkySXdCN2YxQURfNkRyUXV4Q2RER3Z3LTIwQTJEOS1GczJSQ3RvNnR0R1I0QjdGOUpmT1pQV1NKb3BmLWx0UTdGTDhLYmZOZEdGc1dnT2QzWWhSY2VHcjVHYUFEUXgtcnBsU1RiaC1jYnpfQnNBSFRfQ0hmYVMzZXZ2aUNkVmhRUGp1YWgyY0FNdFNZMnh6V1lwbTlwZVJaVnRwVUlWa1Q4R1A5cExia2JOUmxjUFkzejBqNUt4ZUlIOXQzLTdXaEkwSVRKWVllUWVCVFdDQkdjX25xYnNManBKejRpUE9QWERyMGtRYVN6a0RkbXV5SXotRS1uV1lFc0haMVFBQ0xMUnM1TTlJYVJsR3RmQzdYaTE5aXpsd0twNjgwRzVlLXdscEJKcXl0UEpsdm41M0NwUU85MXdQSGg2dVZBZ0F4aEtoMXl0VzhIcnVPRm9hc3hQc1htdlIwSW1MUzdYVmVBVGhJTlJ3MHhudThVQ0VWNkkwTi1OdUR5QTFJc0ROSUI3cUIzS2l2NTE2eWZOU1BDNmg5VlA3TV8wVE9JVHFnSFR0OWRkN2g0TS1ETlpMMzUtcEZLU0dOR1Jrdlc0WHE1bzRYUjg3M3QtMGpJWl90ZWlielZ6ZTA2MTd4TnVhRGJpdlNjcXk5WEpTbmFBOUxxNDAtMFVRaWtrOWZMQnhWSHhZOXdvSWYzcnRuMUVob1pkRUpRM1JxTWdfZC1pR1dMaGNWZTRkYUNjdF8wMlA0MV9UcVY2ZnMzVEF5Q1FwbG1oWjRESXRNSzRKY0MzVWh3aVFIcExoeXo0a0Vxc3JCZzZMMkVlaFZZV053N0p3ak9HV0RJNzJQSXNFUS1uNTV6bzdFRVNQck0wRlJDQ1hBa1RwaF9KbnBvUTBkcmJINzgwSG9PTHZOS24zaks0TDBBM0VURFFFU2pBUTZDZG9kMVQxMklzLVZ2U0RjUU9pdFdsWG5weEhyd09fb3FLc3RwX2N0dHhQS21Zc0dTeG11RTRPN0FYd0IxNjc5UG5XSWtpNFhwQzkxSGI1YlFHTjRUWjRzc04wRTlZTVlvMnZFWW5JU2tQZHBHYnRrR09raFVZNEd3TEhnejVFQkRFZmpCd1RSV0IybW5JZkN3WF9aLVJuMk5Fdkt1d3NCZEhyT2duNTd5NVNGMnVXczJzRzlUZkt5NDQxem5qa2VyTEpWc1l1eUNaek02UlEwQXdGV05rVE5CS1g4NkNwOUh5X0RtN0N0YTJNRkZTVDZwMVhPTVVKNVFEUHI2LXlpU0VlbnA4NnJ6TGRqRDVReWJHOFBrX1NGRE1jazJRYldBd1BITmxNUWZkV2FVRmVSLXM4VWpyRzZsYWR4VnY1dWlPOXZab1VSMlAtYXI2YmpyUkpqQ0JoLVR1ODBiZXNJeGRJeFRUbUh6UG5yVnl4YmhydDgyOVBIeU1RMjJ6MW1OZ2NKbU16OVRST1F2VGw3SFUxdDhsbDFLbmRGSms2OVctTUhxRmp2bVBtT2JOM3F3UmxOMkYtTW1hMVprOGlKM3NlQXJMRjFIRmVsc0xmNkE0bDZiNEFEeUYtcElHTUVEMTk4UEVNQktzYkZLZXRObk1aNlJOa084U1FaRkluVldBRjdheHlZblNYMGtUcWVFQTluUDAyM0hCZEthU3BzNG9SYTliZDV3QmJodUFwVl9IWVM2N1RyLW1tZi13Z0pvVVkzMDJhcUZNV3djVmxub3BIWFJVanZkT2xBVlB1Ty0xMVFXeFZjMWV2M214Z0kxbDZOdVNFM1p5dnNsbEJ6NDkwa2JfLVRaWXQyTVh1aGpGejAxeVNZOUl1WHNDbWVZdXo1T0FPbDU2YnJrMGVmOUIzQll3UFFITGs2MUhKWDZzTFFqVGdDRV9WNldJTmpOaHM3bHFhVEYydk1ZNjBxZ2R3djJDWWxHRzVYMFRuclBPWGZ2dXVxNC1VcXhpV1FwNkJVS0dBNVptRkdOVlM1Z3FnRzRFdzd2OFZIMnNMb3hVd3NPWVB5N3ZZUlZJSFdaQzh4NEljOVd0X1BaNHVjTVFwclpUQ1pDS0JfNzJUbmNZOG53ZGpidzJpVncyczZocVM1RDNUbnpUTmw0MWFweTNPSkFHUkZvR2F1SFZEQms0emNDQm95SWNlVUlYRnFNUi1lR29zdTREbjQxUk9sVjdqcmtNVHdadWg3ZnhCQWN4SUpMdkhlLW5zYTJISzZIVjgwdFdyRmFDbFBXLW9jVjN3X1FmYTdTMmdVZlFzSDBPaGktY3NpR1ZUdFFpQmJwWThvaks3c0UzUU4tbFJoa0RkOE5CVV9oMDlsRl81MFRlT2JyU214ZjRXN2o4M0tDQjQxa2tXRlFqaENKMzhoY0E1dFJ3bkpteE1JSTdGV2lJSmNhdi03b29PMTN0T21ZVmUwb3gtRkJnSkJQWXJES2ZjUWZfZldxV0lnYjVMUEtHWXp2UDZKN3lpeGM0eDBlQjFEb2FFQk1ZcmduV3F1TEdLTXhfc2Zja2FLTlRQXzJKMGFXcUJzRkotdlhFcy4=',1372733821,1372733821,'66.249.78.12','66.249.78.12'),(393,0,'oftv3aaaqdufgmc8q6126lt6n7',0,'QklTTVFFOGFJdldtdGpJNWxMTVhKZEx0WE5CVmp5UHFWNmZidGg5cjFnZVl3dW9XNDRZRW0zVGV2M0RQbk5jbUJNUG9vVFVpRzM1THJRU3N6RWVSYUZWVkRNREJXRGZ0QTVlZUdMSFk2ZlhTTFlFcHNMcUZxYWpYMTZsR19oTW1NTXAwYWpUOHNkVm9DaEhabnhWSGhDS3RCbzlQLUlGU2ozak5yMW1MX2h2V2hHRHVETFI1UHp5MERMamw5bGdnVkw4WmdsNHZCWlhUX2hSeWdTZWFyeVJxcklSb2M5bXlmUTNoSHRvMmZTV1pTRmFEYmpYam93V0RBeWNNZFU5WUNxbXVMbkRtU1lVZ2FYTEl2UlZRcnREWDJxZThyb1Qtako5cUVBUkpfM18zZDhVaXN0bXlKRXBqSVpGNWJROXB0UHhFVTVueVNHaHoyUGdNMDN5bW1RQWNkeGNLRlNITW1kZzVnZm9xclo5TENPMGJMejBsS0d3WFVHbUNFbXRUUmh6eERfMlVQekpLbUtvTWFiTWJSTjNYeHJkQ3laMWUwcVBaVFM1Mk9ub1NOR3JzazZaTjZxcjgyN3p0TC1zVkNrdXBNUE1kVXJsU1FvZTlXSmtUZEdKZkI4ZFVqSGJJT3ZyVUx4MkFrZFNaLWxVMGhMaU5IMEczalN6cDc3SHk4Nk9sLVRsdkFXWFpjQ3JfcjNvMWZ0Zmh3a09UejBCZGdjVEJvMTFldlNzaXVOMnREdFJmbEJfLVZjM3VYUUVOakloZFptX2JtNHZjeEktaXFzX0ZLU2VmZkRyMWpoZEFBb0Vqd29HNXRsV19JRG80Z3VvMHJ0VC1wckJVVEJNZzlDeDVTbG9ROEJjX2ZfbVhsR05ERW40QldjVW5QM2p2aWlsejhkMWlPejVlQWZjc1V3X2xJNGRQMDJlWG1oWW1XNXRrYnRvenJINjNPRElwZHVXLW5Jd1pUbElhWC13NEZ2VDV1a2dxX0VaeWZUUDFsZ013QlFxcGxEcWxOWEtKZzFhenJkbHRYOHM5OUswa3hTVlo4bGx2TEZ5QXpMcjNUdzNzaGJrUHI5dG1ldi1wMGlIRDZYSWNxc1loRDJ5aHN3cFZDdG9xLUcxQmxIYlpqdXZJUFlOUi1MOFpfOUs0R2hxaVRfV2hGT0JTVl8yY2JCYkkzSFQ0RmZMOWNVYUZDd3JGb3NwVThzVW0ycXRMTncyc0x3bTVtOGZmdWhiS2JBcXJsdEQ3bmF6VEM0TkVkN0F3UTYxY1hoRUMyY3JNX18xbHRSbDhpZHRNOEFsNDdHWnl0QmU3cTh0N0tLVXFfamNHV2RkZUtBWTJ1NGl0VXA1aHZoNGhkM1dqTkw1c25YSURHdzloUEdQdWdvQ0lWZ0lWUUlabWREcjBkbkt1dmcwQkdSSFp6M2YtczE0aDJKdzNnRUpPaTZDdWFoVVNhbmx3X3B5N0FReXBYU0NkS21rdWhZT0dwcGpaUmtlRE1fTjZVTF9QOEdaU1FCQ0Y5OXNSZkdyazVRand6SmNrV0lDTjk1OUJ0bG1zUjU0NDg2dV9MNGVHNFBhQXN4QmVNUVZ0U09lajZlVTEwZHV1bkhPVl9zWDd6Nl9PQ01ZS2ZCc3M2VWxFbEpqZzAwbHRUQjE5dVJDc1VNYXpBQWdkaGxuSUlxQ1VtRTNiM0xvWVZIb2hIQkFiWldCY2hpTERCb3dpM2FyWDd0VF9IMm9ZT1ZFWFBYSFFxZDdNTXNaS3FRNFZjUWNmaU1iV3VlcmxHckM1cHNLVVM1aENYUUU0UnZERlVRcjliUjVncU9xcUxKSHNrX0lBSmRwcy1NeHpHZ0g5Y1JCWjZwNEJqQnVxei03QnNkZXJCM21qbDNtY0JrX1E3d0NKakZDYnE4RWk0T3J6NFBWcV9jdlJmaGozR2NVZUEwZ3ZsTk5sd3JvN0JHd2x2TzZjYnR2LVZLLW1YNUFENURKV0Z5Wkd5ZXJBQ1pXRUdJcGtYdlRpczY4d0pzbnFLZmdBSnVqUHVWLS12WDh0YzZFcjJyZU1RTlVjWXZUU3RHMzFfWlVEM3hsTGtwQXZqN2F1NzhYb0NWNWFvbktHd09sTU0xRE1PNUMtcmJsaVIxN1p5ZDZIQy01ZU05bmNWQXdzM18tYmNqZGZVSUwxVkFYcTRMV3ZLdUp5bl9Xbnh3QjVLTHl3NzEwS2lDNl9mV1RHbkhkcUhFVF8wak5KWlRRT2Zqc2hoLVVBaVp6YWJCRnpQRHppNkttaHplSVRPZk9wdVpuSDRDQkNSdUo0NVRqMk16MEJQNWRLMmVheEF3LVpGQVhSTnpjbVdxSGtpN1BXYnRkYzl3RXM1V2VrNHlBb0J5OFg3Y3FCbkxwYS1VcjZmVlYtX19DSHJobFBzMEVFVTB3YnFyeFJPanoxSEhwVGNpNWxGaTFTRzBfOUN6X19YODBZMkVKV0lDeHFyRTBKcnRoTG5pVWU1VnJCWG54ZTk0MVFrMXMteWgteWV6eWJkWWpxcTZGXy1OV2FrdVNLVEZFbEF5cFZiMlMydjlwUmtXQlBSS2FPRlZMVFZYQm5oYlFXNGxtQ0t5X2RBQ3lSSTlZOVpyaEJmRzRHQXVsNHhGcmgwWWIwemFkZGdfQjBTck00aHl4LXVxY3R6MC1WQVVhRFNHQVlWRms0dnNJWEJjS3ZHMVdVNThvQVc5a0tYcVlDQnFnaWxyYnFNU19qOVRWbEZ5UWhjeGJTdFotMmRRS01wY2NUYnp2X0VaN1gxQ3VQYTlCdkpWUVFjYmVCZktONzFQMldtZ0ttWFc2N202UWNyMFNoSDFENk80ZHhodHItSk1oVVZIYVNxbmlCa2NKYmM3N2dEdWl4RFlKRzgwQS4=',1372734842,1372734842,'66.249.78.12','66.249.78.12'),(394,0,'mhq2p327tkcmf4rb66nqnfuia1',0,'TUhCeWU5OWhUSHRRejc4bGk1VTh2NUJ2U0dHMjJRakdXLWZHWDRqemx1YXpsRTlXQ0dTT2dtSEl2bXRoNVdCSzUzenFoeGtJaUJ0RUxoakNOejl2SDR5S3lYNU5mRDRPWEFSUFJ5VF83aDdONlhzbDFSbjRtOHZ6WldrVXUzVHBWYVg1RUJ6WXJXZXZDbWhMRDlhbFI3SGxHemNCb1d6RUhjbngwWXRsRlk0T3ViTGo4TjNOcXphcnRNdHBlNlRzRnA4WDRCMG5zTXhkQXNLN0RMSDdmVU1Pc3JlWGUyQWU3cF9LTnN5ZlZrYW84Y2RlLUppb2lsN1I5Z2ZvdHVZcjNEdFRxQWNHR091clgydGtBbzB1Tm5Wc3NoNXI5VzVTR2tZUVpCWkwzTVE4MXBrOGR6LTBEUF81SEdBdXFpenpvdzFyUndVdTRGRzNIY2tyQVRYNTlTNExoR0lmT0xFSkowLXZvVnFaRUxFSmtnWHJkLW1SSW1WdjZUeWZLeEVjcm9seTJNQ0E1VGJEOE1xaV9SanVYY2xYbHJSRlpfVnc3UkxDVEVkaWMxcmgxcUJWejJ3MzJacWRfSm5oeENxSUtfSGh6clhhMmdxalJBNnhkQVgwd0IydVlEdXNDY3B3eTRmQ210WUxlRnhxaUk1a1VEbUg4YWRYWVhuM2wyelUwc0JxWHViNmxmZmtDLVJaRVpHZEhJMzNzNUpfMmdlcHNiYXB4cENfV3lUQlI3ZW9NZ1dNOXRBdXZpbFJ3T3MwN3VHbk5TWERubXlvU3dBVU9QUk8xZExzYTJHYnhCZTBCaDZVbl9iby01WVNsUmVUSHVaeXlZOXdFbjBCMGR1bXRVY0ZpeDFQeXpTWkxqWlN2eHNfUFBwSUlNeGVvUWtsajlpQTdWa0t0cjVWbkJsQ25yOTFOcEpLWGd5a0xCYkVHdlNIZExNMzlhVUhXemRpb2xYWHNLOGxZT0Jzc1lTWUpFNEkxVllWX0EyV1E4dzJLT250R21ldWZfbDY1bm9vZFZhOHhBSFh1MEU3enBYU0NnN2pqUl9nU1R4TnNfNUtQMWsxYlg5dXowaXlZQUFsQW5tbk56NGlUTFJJT1Z3bXlrR2t4R2tkUEhPcGJHMjdZZG55NXBWLVdRSER1RG43MVJBMW1lTHBIOGN1T1hUcHJDM1JYN1pNdDdUMllsTWsyNW8wNWswTl9iV1BzeHY2M1dKNVY3b3V4eWFvWWpkVTJnX3NwNi13TkZUTnJvZjBYX1E2NkNrOXpDNE9Ca3dVVDdZRTlCVTVXZm9mYWpLNUhtWUNRNTJ4dk9vNkFPZVlWUC1pSjNoMHRVSUFVOTM2UFVWaERPVlo2NlFRUk1KVDM0ajR0a1YyS2FIZWQ3Snp0ZzJLRV91YlBYT1BjbTJMMUxJWmM0WFp5VVZ0MHZXU25LMW1lWG8xZmxvUnk2RExiTUppbTByMi0wTzhjNHQxS0N1R2s5aW5vUFNPbXZvclBJeTdrVUZsOHFxd2x5U0lQUHR1ZFJiVE1rR2ZuelpmaDVCa2loYjV0dmQzQ203R0xEZkNNZWREYzN2U3lQQUFDTF9UTGNQdHdXbHNRLUo1M2NkSGxub0NjcnVuTzNjUFU1MGJ0bGVkVHJ3ajhtVWk0bTJnVkZKUTJSdEdoRGpERVMwYUhkZEs0OU1lbUU3dGg0TkRyMzNqb3FPQlpBR2RmOGZEczR4ZFRfX3VfQXg2Qy1NOThuZ2dkeVExbTVqdzhsNE4tQkVDQkE1d0djM1hiODdWRk40SjhMTE1LVlczNFRlcWlwcm5ZSFd1MDhfNTdMQ1hmcENuZmtyMjcwd1pUNHVCWjlNUk9fbTE5cVQzXzUxTkNKY2FSR1daNndhTVpBZDhxUGtpcUV1T2lSZTdkSzlWZE5uN3FqNHFUWkg5Zk1BdlFDR21yVnJGQ2cyd3dFZ3N2RTU5enpDR0ctei1DOWhxTzdMaFo2aF9WUFlRcE9qeWRqdGRFTWlOeXlzQXdIeHIxN19QZGdMQ25EOVBjbDBLc1dCLWhLLWxwRG1oVVFMMlFqcUhVc2lUa1lvaE4zeWJKMUlGMjdMZ1pxTV9VbFVwMGFPdDB6aGE3czRfeDc1cjRBY2g5Slo4Sm1sUHpJM3dqMlBuRi1MWktOb3NBSUNITGJ5NDFXaDZ5WEQyV21qSkJLU2Y4dVdMUk52NXFRQXBpdE1zaXFpdDV4blFLdE8yamhCZzNjdnVYZ3F1d3R6YUZwS3RCUFlyTVJpbGN6SHdXYU15U21oWFVpc2hybHN0ZDloenlKY2xyR1E4SGp0SHZSS01Zc21jSm9VbC02VE5aU1I3ajJVZzYyWU1qWjZ0anBzQ0l1UVhLTjdlY204OE90ZEhRWXhHWXo0SGNvbnJ4NWdoa09vck1OUjJBalRrbHFsYTFYbUY1YU1OYlRWMlJsMWlJQy0wYVJ4bkIxRkpoWllRS002bkVxOW92SVlER3YtQmRpRnhUVVc1YUlKaGRFVHlHWnUwaXAySHJfcEtLT181dktvRkxrSEwzZ0lqRS1VWnZoOWNGbEFJWDlUX2RMWGp3WTVKUVRzVUFjV0t0YnpIZ0JHbW1NNVpuRkIzcTRsOTM2UTFhSmFLWGRxTkp1N3dLV1gzX0g0WTRoOGdVNF9ISllIa3JpcXhGclp4blBSVkVkWjd3aUtSUjNlTm56dlZNVnhLa0RJMnpzZi1mM1V3OGI4RDJHZ0s0TXRGejA3ejVwZF9fZWNoLXlibEVqOUVJT0VoYnJfelc3S2h0bnJmanVuR0JVN3BMaU9GT1FvRUQzLWVybHlzdEJRRjIweGpSZTh4UmcxazVFTnB3SHQ0TTNiQm9zMkdoYVVkZFREZmhfSS4=',1372735667,1372735667,'66.249.78.12','66.249.78.12'),(395,0,'0ecgeiec8np2k9843nt1rl1eq0',0,'dWVtR0VfaHdtS0lIRWRfRDluUkhvTldsekNGT19FOFM4UTNVREFLZTZjSTFpRUdWUERKUDRVRmZNajk3X1lqaTVmNDg2MlNGZ0tMMkJwY0Vwc0VNLWh6Y0ZtZ094NW00STNqVHZnM3JCeWpLQzZDcUR1MWZ3YlRyUTU1MTIwMUhoQm8xQkt4UmF5c3BZeDZmeXhCa0M5V0tCNExoNWZ2MGk2Y3dXY2M5U3NNdU1jN21Ud1V6VXJOQk4wdGVtc181WHFaYm5KQWphTGFENC1Kam5aWHY4YlNnMVRLQlVyVE5hdm5TMENsM2RXSVpjaUJPNjJvZXNNSFJva0tqY0RGdWExbEJqX2pkSVM1MlJkbkxHWkdicnZjaFlRd0gtZUhjWlJrbk02N2xVSTRTWFlUMWxDZnN3bXlwdy1oejBvWVJYTzhnTDlFRnA0OUxpWHFfQjVBWU50cjBDLTdKQ3dUbVl3aU1scFNrWWN5dmwwQjBkZ3dpREVOcEU0dFZGMm5NQ0JXLVRScWNmNjZfd1hiUUZGNHIzbm8yMTgzMDlMb09OcFdWTUE1Z2VUUzA1R08zM2hiS05YLVFqcm1EQjdMb0tmZ3MwU3lmUVp6UWZNOXllaGVXUW1OcWJOdmZtLURKY2V6cFdfRWY4VDBvLW1RNS14OERrYnhTcTl0ZWlBNmRVdGE0REpBZTdiRlk1dzJMbHRJV1FlUlpCbUZ6Q25WMWZ5LXJJSExSYmh0X01tTC1ZMGxXU2d3alk4bFBzSE1JUE5kZnNuSElpUWJUMVE2OUoxYmNBckhpbm1uZmhUdzdFT2d2WkdpZnRweXRLRTJ0RThVWHlJNFR2YmROYldwZ2tXNVEtbWpiTXQtcFlJODRCalZ2TERaQ05JZXlyUFFMTjF3SzY5YTJHZWpvVDNUZ2lrSUVFVVY5Z3dqdTVZRElFVGFJNWNLNEVUcTZSanVHWnpGNU0tcFlwN1RtS3RnM2JVd19VZmIwS25lMDB1RjhXeHRKZ1BMWFhaYk5ULVJRMWd3NVNBR21zUENrNEdaWlRuSmFyaEM5MkJaZHR1dVJWTU1TdnJfU2hQSms1UXVPUkhSR2dKVGlXU2VxVDExQjZwTlI3ZHcxRzlSbzhvOVVkZXdlcUJSemhUa2tEYnVqdWp1MlowcHZGTXhnelUzM1ZfdDRQV2VISUJLWHFBV3FfTFRmcWZnNTV6TDNrb0gwYW1vN3g4LTliQ3Vrb1hRNUEzb0s1bU1aN2ZDN01wLUFLUHItZ2FYdHR1X29TeUFsNElOd2lSZk5xUndya29Yd3Q5ZkRGTmtxdm9fQVltRFM1aUVHQXdseEIxMmhGLUJwRTI3SUJlWXZCNDVGSmk3VkszZXRJZWU0VnlxNGVXSzlHUWQybm90UnFUQWJ6VHJFWVc3dzRGRkNiTUZMcF9LRUtPc1hDRFI3RmpjZ0JlZ3pKQ0NWVGdFRGVNZVNzUUxFNzBtUTFPRFJTRFl4V1BoSUFYYmk1M0tMbGR0ZkhVN1ZaVzZwTnVLSm1CRV96UFFiVUxDUDRac1BLdE5mVnBMdzlfOExWLXZfR0M5eF8xdjB1R3lOd3FGWVZnSmJsT09BNEJJSVFQdW92em5oeUlkN2h4NDJwZXdrSUVfMklTU0hvY0dGSk1kOGlNUFBKeU1vYjE5VlNDZFAyaHp4aG1iR2xKSk5HVXJZRnA4RE1xRUhaNzhfVENoZ3dDZkMxSUJ2dHdPZmR3RkZYYjlRYnM3UDd5aXI4cXZwQVZESDZqNjVlX3lCR1pyT01oOWFJTW0xbVRRX0pLbkpET1FPMVR1MUVjQTM1RjNObmhMU0xVWk5HeVZ3WTdYeWQtVDNOWlFqaDZyWVNPYkc0UlJnREpUSFlfREJRWXJzbTF1T21wZEVvTW5LcjlSc2tpWkRFZzUyRHpPWDZIT1RMYmZDenFQVEhNZVhSS3dtTHZZMU55NGFSX01UMHJsWFJpYkpuWktUOU42c2VMUzZTQ1c5ek55LWh6U0pSdGdINmdMZl9QZHU4RjhYR1ZIdXJpd29sNFJMRm9VeTFwbTY5UzVTckxIeFF2Q1pxb1hpYmlCUW5RSThCUzB6WWpkcGJEYVlLMVBSRmlSQXkyTWwyUjRRa3o5XzRkTFBTdFFlSl9wWXZZbDFpWFdhWi15M2taTU5BdEFsUmVublBPajU0LWEwNDM5Szg4V3lqZkxXNmprZUdUcmdsbHNaaWE4a0tkSmRpaE1wZDlOejJWek9wTzJVRGFvMTlmYVlWVm5YRmtGWlpOOVZwVXZkU3oyUTNudGhSZ0kzX3MwT2xkXzVDOVB1cmpsTXVaZ3g5Q3ctMEJwbEtpRTdOYU81LVhSRTVOMFFocEs2bjdmemV3ZXFuekFKNFd6NjdCZFg0Tl9EY3pfeU9wOTRVNmlFNnJfTml4TnhvQlNIX2RrYmZSM2dHQkNjOHNuUGRtdGhZOXowTjg4MS1vQk1BYUJKb0NYRDVHQnBzMjhlMnR4cGs0RUZvUkpvckN0QlE1WFBKQlBKMXJ2ZjZwZThzam1INkpkbVhpV2kxdGxoekg2U3V1MDZXMGJJeDRqVkNpVkd2TlZLYVpWNmpGWVB0T3laUGVVdHNDV1FNQ016VEo4OHFYQjlzMFlrd2stQWxuRHMtZzFxaDdMMGttb0xZRVJFUTVXYlo2NzUteGNHc2hmRnRNenh4d243cHRFX1ZTblc4OVhsNm5BU3dzQjNKc1pFcUNYdFBrV3pacU5aenh5VXZLYjg5T2RaUTJEVVB0UnRYN2o0akZXYWdCRllMZ1NPeHdnVWdva0dnTVJIM0RuWHpYSEgtMXBHVnNaS2JmMFB5UEMxX0dHcTJGZjlYbExHTGczdy1wcy4=',1372736617,1372736617,'66.249.78.12','66.249.78.12'),(396,0,'69dv8hr40ck2pup70544jm5s31',0,'ZjM0SjlXcm1pc3dNb0k3VkRyNUJfLVVsVjVsQ1BxcjBoRDN6SjdGY3M0dFNTaGRoWHpLa1F3YXdtekFaYzVNT3VhcUhHUEM1Yl9LdkVMNmM4R0dFQ0xTRTlKNFotZGZEOV94anpteEhpTTA0NG40OVJ6UlVUT2JCYkY2SkxpTXdIaWpFUUYtUmNrUnBwTTVpZkN4UmNSU0hMSG12XzVZcnFCQ2tjUjR4YTlJRXV6YTZXSVlDZXZIaUlGREZsTS1wUElqMllGQzRLcTJmMVVGTUlKR0JCOW1MQ3kxRnFtdEdLUzFUUGZPOG02aDFsakg1NENQTHpTT1ItVWtDSVJGTVhJYmZ1a2JrbXFrY09XLVJlZ2xMa3g0Ry0xQU44S1pKMXJUSm9WRlRWYUxlRGlhVUI3SDUtYTk4X1ZLNzFmNFo4T0tBa0pnV1RRVXZRRVoxaDd0dDhwQldXdWFWWDFxTmNDUjFuQ0ZiQWktalcxYjBFLXdUWkRvbURZYkk0RDk2R1pGQ0xjd29PREpxejlsY0MzSEhBTklEMmhkbzdyal9hUlk2ZDBjak85dXh1anFrdldjNzFKWkhCa1FaVmVzMVdrZjVFbldGVWJjaFJUR3JvbEdKZzdqQnpNcXdBTEg4RHNIek15aFdudDdFNV9KS1FaYWJ5MWRIQWpOdS1aT1ZqM3U3N2p2dVN6RWNGbHRmZjBSZWIzdnNKZG1yNkRIbE1XSVhYQUViblJSYnZIS1hGeFY2RGt3RkYyYjdERTllQ0Q2akxyY01WMWx4OEF6c1dFNHRjY3ptMWY4VklEM2tGYUcyUHpwS2xPTGZuOXRPN196dXdGbmFFQVhHNXAzU1owbTJ2amV5eFU0akNqQkd1M2NWUS1ubDV1YlZiRlh5S1RNRDdmMnUwTXlrMGJRb09MZmplS0xUMGkxeGltcFB4R3h1aGdNaTRXU2ZaNmtjTUZfVXhsajU3aFVfRGlqZVNCMlBqd0lvck1qcHFRSFpXOGsxNzZDOXlfQjRVWXJuZU05VXVISHVKVmotMUhmNnpPbDZEZXdSdXRKZTgtd0wzWGlKQWtLVGl5SGcxQl9NMGJIdFllMnBjc3IwMGpKaHlFU1lXN2JIY01xRFNxWU5zM0FOOXY4U3JRVXdGc05iRHdwMWhiYk90MS1fNUZPa1JhMmRxM29uQUtleGEyNXVpWTljSkl5cTlhQlcxVm1wQUI5c1R6U1hDNTQ3ZFVGWWJpeGZsWUx0V3FMeHhtcmFKVWVvdUI5d0ItMWxrWWZRRE9xZkxiRlpIUHcwTEhEODFPVVJRMUtpZURhZGVZUGEwZnNCTGFuVnMwUXlYb2tMaVF6RkRUVU9WOWh3ZFBkY1lZd3d6Wnc5RTdQa2luaVB2RGlVVXh4cnhhM2VBSzN6aDlwYjR5SzBFMS16aGl0Ym9Fb3g4c3N2RXhIRVlEbzhLNk42ampYS0VaRW5ZdklXOHN0bmpkYldfQW1fUXRDTUcwYk5pVGFxRmlBNlpEQThqRF9oeG9CYlQ1NXVFa19HdUREQlppbHRUOHRxX1pDOTlZbzlyUUtVM0tycU1HM0F3dGZla3FpZ0p5T013MDV6NFVNcEJZUE1vbkl1c2RUTThMa0ZsY1QycTJaa1VDV3gwQXd3ZUQxQkhoSFZCOW95VUNJQUZiZmxYSTNxanB4ZXUxZ2I0YzR0WjlpUjJKeWpXeEl0S09rSXFVRUVTVUtHUm04ZjNFRlRrSWFTVm9ZMnJBRFkyRU9SZFZaUXpobG40VEZjdlBCcXlhdF94Tk41OEZqb0kzTlAzbnM1VjlBZUhnbEJiNHlGcnVka3pkZ0Z1dEpwTTMzRzNhV2VTTzVHajZHVU81TFhHWmFPVXhDcXdlVmFCWWZkN3JEbXJQdmotN2J2bElVQ3VrSkxiQ0Y0V1M3SDhYWjlKTkE1LWdybW9fYWpna2xFS0d2VDBXY0prR3E1NjhQZXhyU241a3Fqc2wxUjBYUDBnOWtrUDNLd01TUlpMTnUzcVJiUERxSDJWOFVWM25MTUU0c0d1VFoxRVhFaklRTmh5NGlMR1QyNEdzbUtDS1k5RzFkZlRJWVpiV0hGcnZDbG4yc21nQ29lRlB6TlNtZ25CM0dBcmxQX1htMDJoS1Q0VU9rX1FFZWlPZno2eGpiYmY0QnBJWHFKNHJuMFJQMlRlT1RmMW1mWEZBRFJzdjBJY19HRHRDRzZrMW9LdGdZUjVqcWtPNVNWdjlGZW5pZGxKTnFFNjZER0F5YVRRLXdrRDN6czM1cGxZZS1LNHRBQjhGbDhyNVpPMXRCNTlZcEs5UWpCeWk2bkVBTk5PTHBtRVJ0U2cyRW1TTEVMUTlXUE81UGZEVkxuM0xSRVQzdTBONEtwVmszZTZsWWdEenZFaEZ6TEVNUENBRGI5NFlKWGNpUDlyVGt5UEs4b09UX1VaQklNMDYtRmdKWTQwSjlZNWo3TVM0ZjFvendhTjdHc1JSRXBsNnVlNG1Lb1AtUFZqaFd0WUdZeDZoZUY0Uk1oS2dJWlNJX2ViRzZ3a3VvaXFTbFpXY2lLNGdrcDdpSGZQRl9WY0lJdTFrbkdTZTdoVXlDUE5JYWlqdmZwR3k0bmZmdTNvOFZaUDlCQ3FvZ2FXdHpRZFQ0Sg==',1372737812,1372737812,'66.249.78.12','66.249.78.12'),(397,0,'k933mf3ohpuosujfp3aimtkhc2',0,'MkhDbWZhVGJDSy1ENGtvSDR0bFdMM2EyU013TGk5c3EwX1NvTF9Gb3lBRlhqdTVtemNPblJ4ZVgyaWl4bk5LRHdhWHNOaFJDMUM3RnB5bXdxRXdSVWlmU0pVOFVNUlA0WVRkNGMyTl9OLUk1aVZJdkpoMl9NNjVHV29TbDR0WDJVV1dIYkdqQlhSc0ZEZGFkM0RLX18xUFExQ18tMDZQYnYxRVNmcEc0NmRSQUZvTkEwM1U1X1BpUUhvVWk2ZUJnbmM1ak5DRVdYbXd5UWJyNzNZZ3ZyWGc4cVplNFhBaFpWZjRYMVpNb3hpRml0UzJYY0tiNVpxSll1SWxsbGtvRi1hM0xEMWFVMktDZ19XUlZMRHVzLVJIWnVaaksxXzRJNXJoZDgtTm5hQ2syd1VPdzVTQjRkN0hWVkZnclFsaVFwbzlMeDRIWmsxamk2S0FkVng0ZzR1UzhYdGpyZm1ZTmZQcmJnZkNZQ2tlNFB3VnBXYXAtbUhmd0xDdTJ1WksxVEQxWFNfZFBNUXhDMzQxMzlVcFo5ai02QWsyNnZLb29TVVhkbGFlanI0VlBkUkhJMURSNC1qS0tqel9jbDJmRmZKNnoxWERrTnFZYjA2QU9tekdWZFJueFNSblp0U0pseTZFdm8zdU9QN3djcTlxRnpTY0tITWVaSWVIVENwVlB1MzJoRmJJX3cxZDJhY1NrNDRWNC1Dd2RpeGhzWXlwU0I1dWlNNzdHX3FPb0JweTctWE5XUXVHN2piUlVLMFR1Q1BuWDJFdVMtUkctS3lZVWpTMGNSX0hTYl9nanpwZ0E2ZzhkcE9sdFBUbk5kTG1FeVhEOE9jTDhMRlg1MEVrS0R5ckg2VnhVMVNNQWZlWk4xVThRdGg3R0lmYzNwWGlJZmktWGdLSENyYWtlSnNManFYSF9xSE5rdHdzY1lzeldacW5Ndk1rX1R1dDIzXzg5NHNrS3BmeUxPSXNiLTFIQWk3MTRxZjN6Z3NXWTdyZmwtenV4bnBnU3R3VE1lQ2FYdWZyZTBxb2pQUFRzREdyNFJSakxDWWhWYzVxeVN2emZRZy14SHY2MjZmNFJTdEdEZ3FydE1IdmNSajhmY2FSM1BKMURIeEV2c3ptQ0VxR25OMGVDenE4amJraVJSbHNxUWRmazhRaU93SlBmV3pMdkNWX1pnNHl0SVNsWWd2QktVcTRyWUVjUDFSTldCY2pfR2VTTVpZcWRWRXNreFFJU20wTmNLQU5oTnZxUFpsVVpCNWRRM3FETHZtbmdsTmN4cFQwR1VqaDQwckltdkUtSlVXcHBHanFlRF93SkUwVENYVFlmTEQ0TUFYcDFST3lWU2Yxd090bTZNYVNvVmY3aWxBdFVJMDc4XzBrNm16UUNxNlFYTHA5Wmc1SlI2bUVzZ2NBTEpWVUNhUy05OE5yUHF6ZTR3cnZaamtsTWdKSWNEUHNVOHRta05DRUxTZ0ZvQmtHQ2tMNDRmaXNPdkxDQ0V2WXJsWEFwYjNRV1ZwWGZwV3A0Y2xHNmJaN21uNFFfblVqTTlCVVNraVlydHNuZmZWcWV2M01xcjdXM3BUdDdPMFRLS2tVa1lZb3BsQVJseHhyV1hoSngzV2RhUGFtVWxySEY4bk0zbjM4cFZ6VlpIaU4wM1NmUXpvdDNkNW93WlNYSlRJN0t3SE5vUUVnc3o0VElyRWVpd2JaT0l1YmZtZUp5MEY0OXFka09ieTM0cEhvMmJLVGgtU01ndU9yendSbWFTRFVNNGRBVGtTUW03R3E1Rkc4MUlWbEs2V1VKbjAxaHM0ek1BZHhJUUV2elpoMUtFMFZCdnRqRFoyZV9tZncxSGpnUVZPYld5NUFld1FkMXZUenJNTE43d1VXMl81M1NqZlFnaFhTY3NsbnJ6aGVJNG5jUGpNNmZUY2QtQTdibW5manJTN1hNRjBNXzVITXVmZ0swNWt3SGpmZXhhX0dYOUNhVFpTQVVQM0VqUk9JZjE3WnpKZTNrakJzbDlZQnR3OXBBMEt3TENpeG91SjZXQVpmZC11RXVLTGVtcVJWWWJ5VlNiT0R6VEpQNi16aWtxZmkxQXlBTklBM2I0dUNwdG9XRkZBYTFVbWF2OEEyN1p1bUJKWE1fODQ2Nm5aNGpXalZzOVBuWlE2dFhVelRRZkVSX1FOQ0pJcEpVa1JfT25xaUVHLVUtclBaVE5PRmxkRjdvMXYxd0pGNm1QSzNidk14dmpHY3BFNHZabTdybmU3aDlsNXVTcS11LXQwdHBKX0N5TlhoSmZZQ3NSWUVpdkM1aDlWNHFpRUw3eUp0X3EtaUJnd3BkdXo1Nm0xTTJWUjJtUnpNcjJUWFV0LUFMZndtMGw3WmRpcVdXQldQYlMzaW50ODFINmwxMTJVenhFSEN6TUFCMjdHX3RqcUVKMlJxTmNSNmVJWWFuU3NhMHVZV1RqRzhyd2JsRFFSMFV5TUVneEVaR2xLM19oMWlMZy1XVWVjd3d6VGpSU0huY0pqOXBrN3gtMEJ6VTRPb25zVnZyQm00ckRQUXdvMS0tQ1NhSG9yMWFrZ0F6Zk40Wjlxa0RaVTNMVW1LbnMza2dWZDZoY3FsR1JsMkprVVhvVXV0UG93MEZxU3pSbU1DZ2FVVExJYkU3RXhOSA==',1372739060,1372739060,'66.249.78.12','66.249.78.12'),(398,0,'k79ruprclegad6sap3nuf4lo24',0,'RHdhVWUwWmJIN1FheXJ1ZVd5dGdtelYzVFI2YlZRSXBkMzBrSEdjOHM4RzhNZFI2Si0wc1llbnpJbklxYm5tenhvRlk1b01lckhMbDViTGdxdDFrbWNkTFA1UHJveExuVUg2ZnJ2eWZMdUl4V3BPQmVfUF9XWDdseHFYOXhlY0JueENtUXNSOWdRVW43Wm8xRXNGNzJjcDlvUFRLdTRLRlp4YXhJSDUwSnBnWGx0alNiZWFnbWdOMENycDc1ZzZyN3hYcEdxY3hESGpHdW9LRGdnMkgzbF9Odk51cS13enhVVVFVcWE3VUJIM1dpbU5tTlBFcjczYWhIb3l3ZXpuX0U2aExKeWQxaEFQeUt3ekV4NjZQN0pFNXZYdnJKbU1HN3FxakRxaE82ZWxWcGRmVGlwd1Vra0RDU0pETGM5LWY2ck1aNXVZcUpKUnRUd2dCeFQ4LW5wM0szMEg5dl93ZVY5a0lrakQ5TjhPbERTb2dHdnNnWU5XcVUtZm1GOTcyZEFGd2VEZEFfVEtDVDZXOV9FX0RnRjlacHEtaFhfNVRSakUwd0dLWjdHVXRBWmRBSXQ2ekhrN0k2YzM2SE82ZGpQc2NaU0Z1cjIxTW8weUpaOXNTNlJRSTNjemZ5Q3VIY1JvNEdNRHZYNHZqallST2t0cGdzU2h4MXJzRWJUTGpONjlBY1lpdWdRR0ZJRzJDeEZMNE9laEF6dXBqM1BXQ0Jib3gyNHJ2d0NIcWxHNFlZYlR1WHR4M0EzU2JXQ2prT2FwU1RrenJENDNqYkZhRWhzVDFYd2VmUV9uR0lvTTVHaVluQkVMc00xOTB6LVQyQjY3RE9hWFdIQUNhc19sRnZ0bXJvcVphTUNieGd5LU5tdmhUX3BVT2xNN1h4NU9xZngySGEycnZHWGtVTzQxLXBRODVWNEg4R3pncERSVWE5RHJYeGh0cU5SVlhZVTZpSnVTSUV5SEVOMHU4ejNPeHRTQ0J1NmNvOW1EemgzZWdDeWxRdkpJMXRseUREMlVCcUp2TU5hUUF6b2Zyb0F2VnpMbk91SEI4aVBsVW42SDgwb1hiSEU2U1RwazRwcjZCOVYxQVc5cUtBY0llaFJsdEs5WVJmQ3lpQVREN09WTkR1aU9STVN1UFRqTzhhM2xJM2RuY1hvZGpoTFVSWk0zRG44a091UW44MHU3S01PeGtmNThiRTQtYWhCbWl4LTFxalloV0VPZDQtTWlVS01kcDZ5X2RpNHRiVXdlZ2I5VjZFSmtYNDVGQ2FUd1NzcVNTemFoOGc1a3ZQMHNacWdtdDBMTWk0Wm90RUxaaW1MVHd0TGcwbGtLT0JhMGl6SjloOVVacnozZlBRMko3eGNKUGxUZXBQNzhla1pGOHg0cDF0NGhEaTlLeW5JUGFwOFY0UFFLVlRxMndmd296R2hZWVc5R0pLQ0x4cHI3SXJMdzNLc2lOMzBlajkzZmptYUdqY25tSndUb1MtNDVMWWloeEtkdEJQN2M4dDFwY0JPZVJ6NlEyY3VsY3RtM0Fqb2tENU1KdWdNcmEtVHhvSlZqM19QUU9fbXFkRjNheV9PWVNXUDdJbnUtR21qVUg0ajk5cEF6WW41MTA5ZTM4WURxREFya0xHcDFGVE9YZHZ1eThTaGNHek9aVjg4NGZZLVByQTFKV01YUlBzSFhXUFBuZUdERlBmc1N1NFNqQ1VBUGh3cmd1WExhMXRKbzNzY3pkelV4Qmt3S0doRmdRcHBGUTNtTkNVbmh3c1RfM1hxT0lvbXJIeTN2ekZ2VXgyTS1aSUhxQnU5cldxeXRGbnluOXhFWFA4T3JVUWpTQUwwdGk1ejlqYkRQeEVIdnRMRFNpYTczLWJrVzVyXzdVVXlrcEROeHdkNWFhaS1xX1N0eUlaMFN6ZUIyMWVjamRwQnFCQmhhbUlIRDNLNERmWjZQU2lDZ09PR1FpX24zcWY3Z1MxWWE5cHlNWlgyYm5qTXRCNVdsUHJtejg5cFNKNUZzMy1qanA3bFk1VG5MZnRiTHJZM2h0clBNUUw4dFJxN3FRNE9LREJrSW81c0pqZ3NKR2Fxb3ZMdTMxYWVIcFVoZjNxUjJTZUdMcVhTNDdzOFR5MWtKeUdWa3VEcW1KcjVCN3pLankyeWp6Ym14U2VZVnJVZjVlTDJtRmFfNGRDYlc2UzdnZXhWMEhrTmxJVXctQWNFb1dCT1FibzExRkszamdvdkt0Z05iXzBFNE4tc2ctSlctS1B3bjczVGVfenEzOVpXUTg1aTR6T2hJaVpqM0haem8ycWdDcmQ0WEhvV3F2eTBLN1hEVEhTMHE1MXBoN2R0cVRaTnR6czY1cE81ZWZSNkZ4Q2JhMDJfZzhScDM2YlU4UXNFZVRIQWJ2Yi1CWURVUEJ6RldYOTVwM3VuSmV3QzU1bmdxMWRaZGZCcHZwSkNJYWdDdGR3NnBzTkRvNHNRLVFaRHhlc2QxOG1wRDlOUnJMbWNISzVHcFQ3ZmdtWDFzWW9MWVJjbTBSLWpjLUlJSGNneHlPX25mUHRKblk0VHdLcnNoMHZZTzFRWUVMNjBqRjRGSS11LVQyZUladHlIejRQTGNYdDFMUTBxRGVIeHl0cVVSWEd3SDVueVNTREY5UmNmU25sTlB2QU13QXVmTTdZOWpMcUQyQWkwbURoN25qNEROVE5wd3FGVklWdkFpVWNqLVdJS1N3Uy0zUmNtRDByanF2dlUyYkVXYXdfTnlQUl9IZGJvWUdUMmNjaS1XbGtLWjgzTFA1T2JTOXhHQ1RqR25VRFJaYlpnZnZtdHZqX0xzazBmSjduR0VZNFcyRDd6YzdoNG5CN2ZvX1VpWGFjUndyRVJld3dEVnplQUk5RnQ2eVlqTS4=',1372740253,1372740253,'66.249.78.12','66.249.78.12'),(399,0,'ad323ublhivsprumfaregkqbl6',0,'OGpDdW4tYU91YzNQUnl0dVN2clk0NzhjQVhHRUJ4TXRDNXpJTnQ1VGNzb2dXVVQ5VDJ0TkRkbG4zQlZIYmdZR2ljdlFWTkJ6OHVrbUh4aHhuYVNRUDBZV2VqSmlCcVNmUUNtRGJJNk02bXNQMWZoQVZOMHdTeWw3QjV5d0ludWl3MzlzWmxIWHcyUHRMckJPcTViVXctNHgtOUZ1eGxXZ0UwaGRnSk5wdVNTdE9LYmV6QUpPYzMyS1VKem9QV0ZuM1ExNWxFN2VSUnFDbnJlTWN6dzNjMzlDVE9sT3NrVUMyX2dDaUoxTG9jRXhqd1dsNDRrQ1cwNlFaVWswY1NRU0QxSVRfcFdhSFFvUDVPc05hZXNTVWwwRlpWRDNtRUJ1ME5OQ21kdVB6N2dFd01rZUQ0RTVQZDBXenczbkY4YzJQR1RkWEhHanc1VFlLVXRkMlQ0ZGVXQWFjcU9kRkpkdFZOSExETUZqa2pCbkpZNWQ0VlFwLUtGa3pWa0djRmplZjhfVldyWTB1M2QxNzJDcTVzREdVbk4xODZyeDYzbnpDNGVQQW9OUWZYS1JXN193SGlMYkY0TUVrWDhqUFBERklsaTRyYldCRUJWU0puWHQ2TWRfazF4ek94SHdNZms0OVBqVzBSdXJkczBXcHJ1UHZKV21kRE1ZQkYzR29BZXVhOF83eFRJc3NzRnBRY0dKQmFpVjJzTTNBNXVYaUk1U2NwR0NTdm9Pc1lITGJCS3Z3Uk1FU2M0UktZZnVDcnA4RXJSUXdzYjFncy1QZGxwRGhBdUxNY3lzeEpiTzF2LWh1Yll1eXphZ09mVk9ELVh3Z1Q2amxYdEkxMUxsdEpoMUQ5YVhQRG5NVEZkV090T2pFTzNfR09PWXNEUWN5cEZNeWh6emhhbG1SQ2ttSlBwMHRfSFE5cFRReURKc0dudVJIZTJBa3pkSGtmV3Bjd2xadE1FeVdvMUhqcmN4QUhYRHhOa1NEMUtJeFB2M0Z0UGNMTjF0OGpIVTRVbFl2X2dOM21Qek5VeV90ZFRJcWR5Q09pdVBpR01RYUxzVENNZUVCaUdrbmhkOW9CVUdoZXNKb0Q1SEZlaW8xSTJBNXoyeE1fNlhHQmdjNjVZMVp2MTRXVTZOb0NVSV84VXNYRVJGZVdyb3hic1VoSEFNLVlZU1VxRTFTNnRxUWZsQU5ucWlaTGxpQ0NaQUt4cEdkNWpENWl1d3ZzckxYdWV0VDhnWmVFSFNPeW96VGRBc2ZwRnA5dVJyeTFWNTEwS2x3QWNuSGUwMWZfcVlKY1Nycnl1MHhacndXVHZxemRRMGJPR3VxWEQyYVU3WjJhU1JCaTJBd3kzZEFfUW1jZHNUZW9nSFlXSU9RNWIzSUNPTHpBMHE2VUlGa3FPTjFKanQtS0tiNHdrb09Pd2NQTVI3MS1hSmF4TjdWV0s4Nk1PN0JKYTNHeWZPVWlpWG1pOW5vTDhsTHNUZG8xM01seXZMMC1kNlItRHVwdU5OMXVRcG91bkNGYmhGdV9qUEVtTlFlZ2VRMkJyZ0xvcGhTVUJOTnVFM211dHVmZDZDMEtRbmVROHpjMHZUTnRXMEM2eFVmZ2xGV0hCYU5nRE90NU4ydFk3QkZkbVdMN2Joc3N3NnJOUHp0NEVkenF0YjBrN2dvR2FqMzJHMzY4RTFvXzZfWVc1cE5jQ0hLeTl2N2s2YlcwaDRKRjRGWmJuM2xoa0E4RXRQeGFXTGQtdVV5cFNMTlN4ZkNrd3VmYnN5TWlwRjFxMmg0cEw2ejBXb2xFWW83TnFtbGZhVnY5QnFkSzhoU3V4R21iMTR4cFphUzAwellRTjBxZS1uTkxxWmpRc3RxTWNDVlBWZWpMbGZtNEMtRkd0dkhCa3hGUFB2SHZYX2xZNHlacmJPNG0welpSSmdYS2pBV3NZTy1UT0cwbjFldnR3YjlkNDBJenhiWTlmN1c3U1Fvdy1iQnEyTEpVQlNSTTdqcldqX0tTZmNVY1p1OXNzOEJURXlQWmJncHNNR2RUa181cThqbk40T1lLUnpzQ3h3Vi0tRWk1TUltbVk4OUxwb2IzSXl0TEpTVmVpZHl2MGNOMlFKRlhkYkdkYU9OUDR6MWt3c3ZtYm9pZGxvTkJENnFobHdZdEM2TERPM01RNkZjQXhLNXlEVk9sV3pQX2RjNlBwa3hUM0w1X2J0WXFvODhCc2oxM1EycXdEeUNlMFR5QXBxR2FHTFhWYU1RMkRnYVhlcXZFdzF6SFNieWgzQS1pcnVkbm1QMDFHSkZyeVpjNjRqUk43NHlEUXZDTnRyTy0wQUFSSTJhOW9PRU9Ob0p2d2VOeUpHZGxCZG9FNTQtTVQ0cHNHSTlnYjBLdEl5Z3VfYkViSnktU3Jjajh2VFd1VUl0azRBU2Q0QWJreDZmbVEyc2lNdk5MYXdXek1JOG1zY0dvUGViVlh0WXBxckRCcjdfSy03NmkyRmdXRzhqSjFlNlhlMjRrWlhVQ0lRb0dMeHBnU2RtZE1zcXBKd2s1MVNLYWJpMnk0MEZvNXhpU09HT3BZbm13ZlY3UGpsdmR0Xy1mYU1ZMGg2d1FaMlVMQTBTQnNwYVBMZGpVRlF6R3pJbldEZnJybnNJdnpZSGtlb19fVmswbGozZUZjUg==',1372741298,1372741298,'66.249.78.12','66.249.78.12'),(400,0,'rbe8isvb5vtqdbv9j1m11uav65',0,'NGcxU1VCclBISUdrbU10c0FJQlVCNlRTZkR6SFllTW5PYUpsTmhJWnpuQldMNU9nSEFXaWJyd1VtQ19uZmpLMnFnbFh5NEpCaTRCV1lLdmMwdmQ3N3Z3bEVZYmhna2xDaDUyb0Jla1hzZmpla19TY1Z1b29sVGtOb3hETkpIRURSSHNjLWtVcjFLbDY2amdTVXhkLTZNcnFTZUF2SkhhSVE3cjdPVVN4dDBuRWJXaFF2dEVudjFJQno0YzAtT25zMHc1YjBUMGp4cHkyS1pBb2k1M0NHN2lNZkdYeEtrTFZZU1pLWVZpRzNjWDF6QjNMSHp6MkprcEt2a3JPSEhKdlJ4SGl0NHdWa3Fnc092MWZSWW5EX1lLXzdyVFVGQ0NSWjVsZ1k4dGp0OVdXeTJ5SDdBZVRwWWxaRl84eWpRclh3MGpxc3VWYlpuWDJzaTA1Tnh0N3JXNHVHazYzLTVwekxjcENvQ212ZGEyQWdub19zbnNubWl5YjVOdlVsVkpkYmFKaHd2YnpRc2xpWFVjRUpmamlsbU5ubHdONlVnY3p2TVN1eC1SaU9KUWRQWTc3TnJaWmpLVG5EUzFUbnFMbTRUdFNyTmRvNWJDY2xQYUVsU3ZiN0UzMUpXTF9zOVNOTTZsMHcxLXBPNDE5VWdMTWpKWHVhTmFWeE85YXkwMU0ycjNSQVRqUlk3bWZSY3Vka05qVGNmTGxRaVMxbUdzMVlPbFl5R3V2VFkzeDhSNy1ab0FFdzJuZUluVTVEamdPNFM0TUs4QXpBa0FZY0tlSEJqaU5Yb2xRbjFYRTU2Q0NCemY5UzJGWk9SSFVfbzNuUDB3UFdyVVYtNTJ1YkZEeGtlZUEzSmsyaFp1b0U1WTlWbXRUQTQ2SkFqWXZBNmZ4NGR6Wmx0X1Z5RnBhc3J2aG9md01xUmU0VEZYNVpTdk82Vkt4MHNsRjhIQ3ZCWmZtd1N5OFNfbllsUzRxRzBsZ0VhS0ZIdHNFMFpDdHBLOFU3eE54akVUQkdndF91VVgyUnhiUXhYcWVEdzVvTHpnaXpmcHVWZng3bFZ3TmZheGg4RG51dWs4bEZzVjFNaFRnYU5sNF8yRHNGRXZ3cWREODNBWTZXRjVYZHM2eXJ4ZEViSW5iOGk3SmRRSGdEX1FjX0VJckwzS3pqcFBKQ2RPazZnT1NUbnNhV2ktSV9FX2hqNjRwZC1RaGxid3ltbGhOaG95N3RYYS12ZHZiXzBfTjkycWVHRWU4SkRra1lUWGQ5aDk2cnl5WTZEN3JRX2RWUGg3TEVTc081eUl6Q0RPZjVUZGh4T09rS1hhMlpKMTViV1lGWmRDTXU0QWRhTXRBMDFQakVmREViSXV1MmFUSHdycnJZZWhPSl9jejNaTVducjRLYzJRSEZ2dDkzV1p1LUxMcTU1ZTVzX1E4ZnlNdjdDYjJCdnNQamM3RmpPSElJVXRfV25PZXdvYmljcnMyZUU0NWVYV1c0QWloem9UYXpFWVB2X25QV0lodUk4SmpsdTRqNTBIUExXdExZc3BqbHlzXzIwX09LZlIyQkZyZEpVOVZ4U250SDFLMXBfVGtfbTBkLVF5aW81NGFCOWRuWHZITDRkZ0RoNmRUdHV6TGJURmllN3NNbGZtWjB4bEc1MUQwQnhTclNEcXllU2dubU1IRGQwVkxlZWQzZk1MbzRmX3lncnpEOE5aRjlOUzczZXhJUXNtcHV6OWhJN2JLejA2V0xTdGlNNTRkVEhNS1F1Z3BoVXhnUGlYZ3ZsMUpIYlN4T29YU2FfMTZTVThUdTlFTWpBazFHTFdDMHhDZFdkUC0xZzEwZ1I5S3lxbVpFbnppMHl0V1RxR0wwYjhZdktzbVRMajhMYmRPUDBLaWJwbTNCb0oxSWVrdTJJZHptOU5BTkJadE5Jb2NRb1hJbkQzXzFKVnVfVm5HS0YwQXZwcEhiSmV4Uy1jMG5UZ0ZqQ3huZXNQc09IQklTbWdoVXR2a19tUlBoU05SaTZkVzNoSzdIYlpCaTRBeWt2WFNLVVFjLWwtSXdQU3prQ3R4TzhHLW9fM2hQdDFyWTFERkd6blZjeDNwU2pEZGJUdVAzaUN2TjQ3ajVxZkxOMHlaZC11cVJtVjRfM2Z5VVdSNHVlQ1c5YlQtNzZ5WkU5S2xaeFBoZHlfemNwcjNoRk9mX2tOdldGd1IyQjlSMF9USW1oZ1FveW9Zb1BzSGtQZnRCRngwdjdsMkFSc3Z5S2ZUZHpMUlQtbTcxeV9hZEZRb2hsQTREX1Z1akR5OVB3bkRzWTNhTm5kSEFVYlh0X3pUQkJaWXhXZVR1ZEVGV1NnSVVkWFpxT0VVVnh4cHQwRkowTVhEemNuNHhFWlRza296TUwwUDE4VVlCZFcwN2t4X0toTWRZUGt4cmZRVVhoWmRTSk83QmlMVnNkNE5VYTRZUVNkSzJrbS05VUQ1WXRDbWd3T01JYmI4TEhwT2puOUp0bW1naEFtX1Q5ekZhR3l4QTJ1em9RX0hmWlNqc3A1YkNaYl9vNXJJLU8tQVpaWjBBZzRaa1Y2UHhKQmRkS25VYnNoYmVtX3JKQ3BBbnpIek8ybDVtOEMtUGdDRkxkcjhIM2xxYTRsTlNfMFVwZkRzZGlFZnpsUW9sRi1pejl5QQ==',1372742371,1372742371,'66.249.78.12','66.249.78.12'),(401,0,'mgq6ic3jfh88iu8ehamgbhfkh2',0,'NkRjX0s0LUJvQTlnTlR0ekZac091TnlXaU1SVG9obTE4c0Iyb25DeTVPdjRadEtLbUROeGFOMlN6UHVnelVQUVQyTFlneVUyQ1JXS2ExTUUzUElLU1MycVhvZ1lRU0xUWjFycWpCQmo3S2Jfdy1SOF9IZlpLOEE2a0VvaExpOHg4OFJWbDV3clVoQXVaTXdWYlVMNTB0OUJPaDJlNW5zTldyeUdYMnM1QVlpNUdwbmIzOXo2bm1hTkxhUEh1NGwycGdBbHhmWURUbnV2c0RPSzdvY2JTcVQ1bEdGYWFQRFlPX2tyelQ3WGRLZlJSMWtrOEFHWGxfcFlWelBkQkZid1pQaHhjSWhOWjNFSjRGblBoTEFVdlppU1NGS0RWSm1JUWt5NjR1QmVvNEQxa2ZweVY0ajN4X2Z2YTEwS1Q2YWJwQlI0Um5zR2haZTdnQ0tuNjItd1BxeFI5ZDI3WG1VbmxjZF9oZlplSnUwTm9hdko3YUdmUkFlMnhyOFBjdTFxdWJtWV9reHprNEp3TjN2Z3pPRFpqV19ZRmViSGd3cksxYlRYVlEzRS1sTjNKUkZKTU04OWJhaXZRVnp2REkxRFYta1BxQ3VOTGptV2ZvdVNiOHVsZC1STXdqVDlfako5ODZkSFhRdnZCSW1YTG02Rnk4Y0Z6RFAyV05NOHVodjJ6NjNvS2dicjhhOXBBZkFLY203VUxDSUIyNTdKSk5QRk9FQWRVUTNuM2wzeFk2UDA2cExqRjNBbnFDSENoQ0dVaWptNG1LcWF5bG8wcHc2U245b2lXVG5oT0l5cFAybkJ4TmZEREhZZjZfNUlCc2U4eWk2X0VCYWZNd0IzOFBmd2FfNWpoNVd3ZFRSbVVsX1A1bVlJRThqQUg4c1pmcHh0LUs5UWxocHZpU3gtOEdqWHRGYXk1M19vcjlHaDhCZDV2T3dIZFB0ZVRBdkJzRXRpZjhiUV9sUVlXSlEwTko0dEZXRjdUbVpxXzgxdzhLcDRQakk2TnlkS013aDhVNmNnTzRsWWZ2a2l1OEVwMnFyOFRJMGlYMFBZR2h0bWI5VzgxMkJ1VlpPUVJFSlZCRFpuTUZMcjNiQzYxcEkzV1dLb3IxdGZoRG5NSFpueG1GS3ZNUFlqRkhPX1FjbEcteTFvZVFtQWo2X2R3MHpfNmpNby1QcW02MkVXbnc5Q2lvSTVBMXY0dTM5TFFoajFQWHl4RDNKUnV1VjRMYWVUV0NOZW1ZLTVFWG05bTVLeHJ0MFpIeVlLLVhOR0NwWFpRaV9zLUVTSjloR3BRV0ExX3Yydm83eTVnR3ZkbEF1QkxwbGlKbWl4UU13VFJYcFhpSmxvWHBTcU93eHJvTXcxYkRRa1BuMGhRRzB6MVU4NzRMRHhGYllyQ1h5b2J0NEQ1V2ZLQU8yYzFiSTBoNlFmXzJyN0FGdUNUY1hmTXpacWh4a0l3N1pZeTlxdUM3Uy1pdWxzanU5bFptVTVHT0R4X1hhTmdUWUhQdlE1aVVPNW5nbE1qZlpDSi00cnNYM2Z1RmkzN3g4M0N3YnZaNmdVQzJSZjc1WUFQclQtcFRrOE9QUTE4U1NtSko2UE5kWl9nM0wyeDNfVW51Qi11bVVOSUNFN1RLVmVmOENBbDRDYl9ZZElLM1pQcGUzZjk3N2EtdTUxWGJydlNSNjNvMEwwNlZUNmVNdWxINmtqaWVGVDJGTGU0MFNKRjJEVmlkNVN2TUNWbVV0R0ltMnpWWWc1dkdaWlpVNzJNYm9oZWdhWkF5c2FnQXhra2JncmZxZmZ6ZmJkM19nQXhwSWo4ZDBnRlJNMmhQSXRnYWNzd0theU5HdTY2ekRGbkk1N25xQ1QtNlJkNUozZ2l5NGs0aGQxLXFOLUc1cEpDSGdMWUwxWTZtckhHODlKWUxXUDcxN1NyYjhKY2tUQTZuQ0l4Q3BBeWlkbVA5emNRRC1WdlZpdURnWTlCUGcxMGsydnYyaHVQLWhzR1JES2t6eHlHSFdSWnY3R05vTXRVbEk2UUxGM3NHYm5NSWxLR1gwUE95YnU4MGdrNEtCZ2hFbVkwSVlYOG9lX19meDIxa19QQUl2M2JMdWJ4dEdNbEN0cTRqX2lBaFRBN1NjR0FaZW11V0ptSXVwbzJJWU1oY18xOWVaWW93THpxUnRVTnljcHp0T0F6VVZ4TTRzYTNiT3N0QUlvWllDOFJ5RWpSVk1hclh5Z3VBbmJ3N0hVc3BOWkhCYUdvaFF2SER3aDFnYW1vWndJLWR5WDA1NnVNR0dOMmozTExYdGREbjBnS3N2UmJqbk5kUjRIdXpuaGJtdTZoLXBzSHJDVEh6bXdYbzRJQ1VIRTV2RVlGblNfdXZSTTUxTkd4VGtWa3RUWlNhckhhSklzcmYySXRWalBmQTVoSU1aYjg3TnVMdmh3LTg2Vjh5cnpFZkg0V0RER1NqYlRfMjlxLVo5b2Y5RXRqbjZiQlY1bHZyQng4Q1FKZThuNkxrVVJISzhaVlpMazdFb1hvcWpSOTJzcE9ENnMwZ1lrOHUwU0ppdElyRmJ2bWE2RlUwX0RsUjNKQWhGZXJOVXM3b2VCTDlLaXdFMXJTMEpGcEN6bXFfM0NmQnVLelRMRGp5bjUtTmZ5Zk9qTFY1MXdRWnRwRHcyNA==',1372743809,1372743809,'66.249.78.12','66.249.78.12'),(402,0,'10ovtci70cs34pcl8j87p1u2b3',0,'VURuc1FEZ0IyUDl5akR4aVZxQ2hjbkp1WTRuOVdIeXBqQnlkV0EwRTFReXlnWi1yczRTZ1FoS2ZpUElLMldUQ0ZFejhaMXRCbWkxRGpqR05qaEM3eE1tdUNjcDgxT3RweUZ5anBVVGF2ZHZZSWVqWFNnNURwZW5vdFpvUVhfVEhzM0FuUlRIWGZYelNqVlNFS2E5YnUta2VRMDM2NFY3V0l2WXVGcWNxUXhRbmViMElSMkxVRjhENXR3bTRMOHA4akhIcWV0QnAwRTVYWmJKeWRnNmx5YUVXQVB1c21CTk1IOWNGR1FSLWxncWpyM092MlFrdXpqZUdmZkNtM3BUaTlONk1mWW9QbU16bWZZWW9IYnlaM0lIVTZTc2dIaENsWjhkdk5OMjFnSXFmMFNOazdFaXdaQkI4Y3o4endlcm94NjF4NUxETlBfWFF1SjhKZFd3N0lpa29BbVh4SEVKT3doc3dwdmZiVXp5WTNOelU5Y2hLNkF1ZDVmdU5RemNLaHREVmpLelJXSVJmUUVEYzFpeThEQUVuOFllUUJJMVdRNkNmQk5HZlVPUS1zdlkzVlhqSllUQzh3cjZPWXN4dlZlSkpvanp6VUlNd2NPSTEweVBzeFlWdV9USHJVZkM3YWRnTVJ1d05WTF9fRkFCSm5PbWtRVnBNSHlGN24xQURudS1rVVladlFnOGRpYW9GX0swVng1WjhNNkxjdWJ3YTlfZThWSlJfaWpyVVYyTXpOdjV2OWVJcWRQTll6cFcxb1B6TVNyUmkzZFZHalhxYWozaFRnQVpWZlgwNFhnM1RDZkNCbTZwZF82YTNEVVc1a2JZdTVrS2V2SW1MN2tXTVFxSFl0UEVHelJjTnhQUVVoS3R3X1Z4ZTRySWU2YnhwWFB4NnZqdjc4YUhuaWphWEFYemtVWk9FaXZjaVF3R195cmFLMjVsVEhZSGZlb3N0R1YzMlY0Z3lZYmFXcXN6ZWdlYklfdFA2X1ZrZlNUSmVNaUp1RHJKREVrSWZTaXVtcXlab0NvUGsyTGl1TzdFbkNhbV9OS090akt1ak9SbjJnSDBYdWw4dlZvdHU0MUlYMHVGNXVlOXFsMk5KZjM0TzRtN19McHJHaHN2VEUzcThFRmVWU2s0cU9uWmFRdkd4N0IyZXJPOHVrNlVyR3FITDgzak41a0VZbFJmMFh4V19tWUVGQUZVODVRNGlEdjRZSE5UbmRBOTUtVzFfeHpxdVVKSmtBY2lQdEdVYjNiVkxxd2ZwU05CUWZSQVVSM2R6aS1vTG9qMkJYRjFDck9tX2lhZG15cUh6RGNZTVNUdUN3OUdYYVFfWi1wVXA5TnlQVk9YSmVxTGduUkxaTmo3S1JLVjlBTklYeExxaEZBSTB1ejdzREw5M1Y4OUJaUmxkdnB2TS15NUc1MjlzZ0JmMUw3aTVVRk1SUDJkeVNacmI1TjhXQzJGMGplSFJMcDZTSGdXX000RlpKWnVlZ1hCbjVFZnRiVlVzV1o3eFFXWEJEZFhfQlJxOXJzNDViOEtFNFZuUThZZHYyaXdxcTFwQkN6QXVQdFlJcU9mR1NQQXFTRUkyTjMzcElBRnNReUx1WGNObDFYV1FQM2NHNk1PWHpmLThVdklXTmV1ci1KLWtpcjZ4aENNdFNLME5vYzlVRUF2R3Q4dWFxb0tfNGF4blRJcW1laExzcUptTFBPXzJKRExEcXFVMnk1V3JKUGtEMUgtaFJpbWt1LXppV19YMHF2RDFNb0tuaDIxTEVaTGpob3pmanRzZjRLazIwendmRHBwZ09LRlZpd3d1OVBSU1NKUmd3WFhwbHlTdURGRXFXVGRpcG1Eb1V6R2FUMDJmT2VXV0RPU1Rta1NWREV0alhkeENESTRCaEVJSEt3TGZjeU5BRlcxS2pBUWRxNTh5QWdMdGxneXdyQklGYjJjLWY1ZlBnaWxWV3dmV2FZTGxrMERLLWNWYThkN0VsSDBSSzFHN1JSNzZDRHk2TlJTaXJYbDk1cUU0clNHb0laTU5ydnV1OElsVkFBOUNCNXZQbUtmVVBTcW9wLXlkRDg3d3cxT0lmb0pZNFJFR1FtcnhnRjZMVloxQ3Q3bmFuaUdfWG8wNjA3bkNKRjBuMmZTOE1UZXE4M1pqU240WjBIUDc0Wk56aGxLb2ZsVVpva19OYmYwQ0pDc0NVcUY0LUZpYmJTU2tpbFMwTnV6YUpjRHhhVTJCdmtzR2RzZVJDS3NvbVFUNVhZYi1telNqajhrOXMwMVFUZ2pjUUdNa25SaDl2elprRHUxNnhEbTBRWnVLeVF5REdtZlJFSHRJTk9FN3pHUV9Qd3RuOEUzUkVUTnNfSkhzcll6Sk5KamZJT1NBeXk5cm51VGhEUXBqd3lmeW85SUlZeXNOdy1veGZjdE5qVl93VFMwOWZVS3dxdzhPVHMzWkMySXBNeUY2eE1qRXBjRlNpUExRN3ZlcHVFRkdsWEZvZ0tkREU5MENEbzVGcFV2UGNsMlJNTXVOSndhUGhpNlZyNGtaV0pMZGN5X3A3SHJCd0VMS0pKTWNvVVQwc1MwRk5xVzdzcDhPbDEydkEzb0drQTNRRF9oYWJEOFFDU29VZVRfVUJsWXpQcDlWendrQ3VEZURTR2RHZUVvVUsyRGF6dmU3VGtzdnZaLUVBWmc3U09ZV1d0M3Y2eXlsWC1abFVtLXBkanVLaV9MQWdiejlGTkRNV252NGZTdHpqeEtnV0RuUnJ0bFQxSlExdWdrR1p4eEZJRUloUzZrS3RUb1NfWFM5Y3RsQkxpWEhId1I3ZlVIc3JTY0xXUkZmV0czLVVXbXEyUHFWeXNXZ1h3ZlczMk9iSkZZNmlTSVRCeGZxTGNWcVpEdy4=',1372745095,1372745095,'66.249.78.12','66.249.78.12'),(403,0,'l2lie1jh25rrc8rebh4ah3bep2',0,'U2I5bjJNaEtUV0k5WHN0eFphc20tLW9XSDFFa2I3M3REQWRpUTFCNW5teElURXd4Nm8wS3VlUFdFWWFyMEU5ek9GWEVIUlFzYzdOSEFIY2RUaGIzNkkxbGtWT3NYalBLbTZEM2R1Mm5tNTN4VzkwY2g5YllWYV85SDRidmxZUWE3elhTVGlSbTBPVS1GU3dwZXM3XzhPWk1Udk0xSWwxdVViYkZnOXVTV1E2WTdybzZyemVPV0NfMEpYNk9xN1M1NWZIUDd4eUN3c3paYmtlZUdWa0JCaUhFV29CbUl5dURGZmhuN3duQmNlU292ZUoyVUtZc1hxX1JOWDkyYmNhQUF5VG0zWXNkWkx4ZVZXZ1I4YmN4NnBQOTVLdmZWNGpmeUNGWDVqWGMtM2gtVlhEajFUWXdneE95WXNBbzdJRVVUUTVyMm9fNGJDa2pYMmlvMWM1ajFHa3cxM00yQldwVzQzUVRBZXhyTEVwVXVQd0dFbDJmX2lIdzdLTDJSZDJ2c0psbVRKZHNrZTZJT1Y0dUNvN0dXdjNsYW1JbkRpWFJsLXVhUHFOX2JUTEdiRno2UDVnc2VpRG85emlxZm9wWmtIX3dJZGNHWlhoWjk4NnZUMTZKRWlhMXJrZ0Z6bHUzdzlGTWg1UzIwUFBGU2lMclBWa0ZYOGR6eDM3QVVWNnZaWW81UlF4QS1kdGhMMUxWQVhJSkoyOTlRZWQwTGZDaWdpN1VqY0xkZHRwd3pKNmhuY0NOVHRMcmx0VlZGb1JYSG8wTHJJMERuSXVVUVBBQldiQjBjM3lfV2RrUm9ITExwMEllbncwSzRpZ19MalQxemVuTlZGSlJPSXVVbENPWF96ZmdlQlFRcHBJMXdSbnBFa0lMb0RmQ2lEMXE0LXdPWGpOUHhZU21FeGNFQjFJUDVRbzE4QlMxVWZxSEFNdXZ4Q21PMXVYTzhPeFVLZlBpZzZjblZLYi1jQ2VTb3RDeHIzNm1YWWtJbkRBZzQtcVlaX25seFBkZUNGZXk2ODBVdy1iZk42WWVabUNKcUNVYXkwaDFVNklpSDVTMm5oSm92ZG1mb2ZYeDZUQi1yNmxRVVBBR0pMUmNfMWYteDY1akk0bmNYUHhiQXNzMzZ3TmlvdE5iUEZuQV8tYUNYaHo0bHFackxuRVE4aVhYLTYtNXBVWF9nUExRUzRSQ0Etcy1jX1c0M1VYT3d6blFBYUtSZXlCVnVoNlVMQ2I4SnNTejROQUhMZVRRS3A0cFhqRzlEQWd5MTNPSTl3OGpyQ3hGRkNBQnFiNFVQdms5R3IxcGZ5THlGbkxCY2lGNUpIUjZyeEg5bnJzZmVueG5jOEhUbzhKY3hsalRveHZYM1dIaUdocUxodzd0S2NFTGxRdTFBRmozTl82a2h2Z1NmZ0hwZzFSLUhoVFI3UFB2cnQtOVljR3hCN1JjaF9XZjJEeXgtMHZIa1BhMHQ0cEt5Y3pLX3ZaSlNEczRTdFIzN2xCTjM3WkVlaGZQWHVUclY5NmVOcnlXOUFJUGtwS0lRVUktVEpMTXVodlVXWlRWTXdfOWNzcmprZDRNamJVOWFCMUV4MGVkOXdRWnc5NU9WZWliajRVaEstU0EycEp2YmFzVDlpU1VJek82ckt3X0pTd0I1QzhsaUhQYnR5YWJyUWRsaThVZ2hWSUFjdjVJbFVFanRubUpyazkyTC01anFEclduWnMzb2RMWURvanItc04xODgxbDkwSURIZEYyZ0lsUlljYTY0SzdXRGFEN1NKOTlQY1lUenhzYzNOVUI3TGd0dVNXTWMzY2tQeFpLa29qa2pIenh0MG13N2Z3WEZmb0lycW1IQ3Z4X1NCZldqbHpIa2pyejJaRjRqclNhSlk5WFVMeDIxRWFqNEZxLTdOMDBIT2s0M1hoR0wtUHpUMWVxOUllWWNiVXl3bmlHcHJFVUpySnRSeVNHQzhPdy1OOXdjcGdwVFhSM1c1OTk5dkQ5SGJMSTZuem9QOWZYR0VjYmRfaW43LUZUVnJxRzFfb3ZtOTFUdXdha2xKR1ZUMHZ6T0c2Ykw0SUQ2Z3BORDEyNWluTldiNkhzWTBMbFNuRVpVNWZZZVpha0l1c3c5d3hOZkQzazdMdEd3S1dJNjlVcENyT3RZU05Ram42OUxIM2duZE84ZGtQeXJpenR6SkY4ZkxqSHdVMXFoNkZHNThnR2JNS1pnU3ZNN2NEcmR3bDlpMy05REJhb20xcVoyUlVqX19YZTBEUHk5R2haaWlSZHE3TUhpbzF1UW1QemVIM3BKQldheXJybS02UXdlMV9NV1BSamxRR3JCOFMyd2hxUTVNc2xPTkdhbkNSUXR3eHlBT255UDFVdWlBVmRhYjVYZGRabVFSeDJCNmJxMFJCbmVXZURlZk1WN29qZ3p6dDJod3FMdnNhZUd6Uk9uUEVrM3ZPMjdHNjFMMV9ZTHIwLXM1Ylc1SmVkMDJ2VmlHeFRFdnpsRlVkTHprdjVlck5yblVMUjdlbElLTU9UQ21obXhZbUpVY2hFOUJveFhVWG4zLVVvZnl1YlRYSW9hc3lyZzhLa2ZNbEk3RmJXX3U2Tl9lbGNMR1VMUGRjZTFuMzU1enIyVG1NVjBxbHFZNE5hRkdiNktMUWg2a1NZRlNERVpyaVBaeWc1ZkZsM1JZVmpBUXQtdzJBMDZxdldqMkZuUDFqX3lieVNyOWpqVkhWTXk1T04tZ3VhVE15d1hVTXpZNjBCbUdlSUNRTldodHZkeENaZWFYTmRSaVJhcThZckU0Q0N5VlFGLWYyYWFkU1dYV2I3MTd3M01aSzJXTE1zSEttXzFTQWs2YWZ0Z1gyQ1VGMmkzQlBoZG1WUGZEQmRrNG4xVGFoTFpXby4=',1372745932,1372745932,'66.249.78.12','66.249.78.12'),(404,0,'13env5huo9flom7h1pvmte1vk5',0,'SHBkMzZrYy1mU2FqUlJ3Ym95N29lc1gtcjFmUlFVVmhMR0o5UlFUaGxfdDdGMVFqdk1rbnMzU2R6cktYUTZGM0V5b2ctaFoyd0MtY211ZU5iOFJQaUNsTUtNaElNc0tTR2FVeExmZWxoQm1aSExmakxBOE5pSmcxVzY3TFZvU3JIbnVMQVB1ZTRjUkM3cTFuSlNOQzZseWJpVVV5eUcyODd4R3FMMUR1bTZzUGIyNmZhQnB6M2ZsNjVSdGNtaXpoRjYtVndrUXhjR1dNZXBQd2R1clBxbTZUcjNmQmVESV96SDFrSDVZNTR2QmtXNzcyRlV6SDdFZ3REdXdhU2pIbFBXbHZ3cUpHNVUzSk1NNm5UMFdQYzJEbW12WFVTQkk2ZzFnc1hQWE9VNWE3X2RqVnFtYWZUM3BrN0FYeWttQkN2WE9iT2tEb21TSkozT1dQcW9IMnlvcnlxRlVmaVBveEphVHFzTE9pOFd5TWtPUkE0NjdMNkNvc0dKSXl6MVM5RHZTbTYxNnpPMzRKSVo0RGF6QVk1OHdDMlVsUGRxb0NGMU9objg1aG9ISk04N2FaNzJVcEJ6SUhYMzNfczh3YTdtX2lsaTdOaG94d2tVV2F3ZWxpQ0VXM2xRWmNnR0dPaDdPaGtWZTk2cDhkMGlnZTBzc0pyZlFBRUs5enExVUdJR0ZDQmcyTGJCYVp4V1N6YTZwUFJwVzVLVjJsQTZKZ2FVN0g5MnhrbWxsSUJORndsY2lQbG9Sd1BFVzU2b1NDLUVYZlluN3FCSVZGV0xkRXc3ZkU5SFNrOUVEZnlmNFlwUWktQ1hkdzNyOTZfOE9aWkk5bnVhVElTZ0FEZHU5bU1pZThsampJd3lXclN0Nnd5YlgxMGVlblhQSE1aazlIQ2I0ZkJrQmJBWV9CYkVXLUhIbHZuS0ZBUDFrTnFSZGVaUXpmYlNscnliY1hYcDRZT214cGpOWXprT2hoWjBtY2l0NUdjYkRhck1pVzdkUDgyOW16R0o5N1ozUC1OY1J3UVV4bWloU194QWZweDNLOEU3WkZfNTk2MVNXUjlMMjB6MnVEQkxjRUpleXF4aGIyWG03VlZWcjE1bTFtTDFCWlNPdlRUX1g2UEpOX1BlcHo4Z0NnVHFVRWhWelN6c2Q5LS1RcGMxZVFuNEFJcDlNdDlLa1NFTHV4aXA3ckZrVzE5RktYOVdtVzdBdE9XMk9NUnMtMF9FbjE3UE5Sb2t1bHBqbHRtQ1k5QXh0Umd5dnBLYkdDN1dpa0V4RVZNOTBzdkRDRHNJTXFCdlpHdzZFelZHNXg3a282VUFWU0FMMi11S2haaUlOOHJfM0ZJRk9Wb1lRbnhzWlFlM1pRc3lvazhGZFZSQnRCeTZHUTktVGU3Z1BtMU1ISVZKQU9lb2F2ZWk4Z081dC1WM3ZOWFBqNExYYUtHa1Y3UlFyaUZHRWhsMXZPRktqWnFRWm5GRHF6ZFNXLUNYeWtnOHlNdmRuZWFLX093THVjNHRab0hHTVREZHVRc0laQWhTSUJZRk1hcmpxNXd0bklCcnVqYVBYZzBmZllRQnVxN3RMaGUtRTZhTUY3ZE5SN2ZfaHM4MC1vVjNEUzVVb2NjVmFRczBKaUY0bUFmVVBnTkt5b2kwZ3ptb1J3dXlqOUdqSW4zNHlRN01memxXSVh4OWkyVlhrNEk4VDFidV9wVEZBMmtDbEpYZ2N6bU13U3NwcTRKd3E5RHNiRktNWnBITmhDazlyNm9tZkJ1Ukd2ZjdEdWs3R09FWjE5dWhmV2dES0pLYlZuWW9QU1RKV0Q1ZkFwTW1BZ2NadTJ4UlI3TTJqOXZGdGVfcTBJVWFTa0ZJUjZXTTJzWDJWTHdCdzNoUFpWeVFfVERNeFVzVXQwWmpTM1BRTWNCSGdxWmhaZ2lrYnNtV3NFM2tfSHMxZVZ3eDlBakIwX2lJMGFOeTVoR2NJcnNJSVFEVzA2MFN3OU1hU1p3UkF2Zmc0Zk1aM0hqV3RIRS12LThObTBfbkwtRUNWMVNJM0tjaXlvRzc3LTdLWUJPNUxUSHZXNmxJTzBvMVVrdE4zTllDOW1sSUtPbVY2M2V1NnVyeXY0dmJ0ZzZCUm8yRHFmd3NmOGpSOVdrMjg0cUJCcWY5dXlzbUFpYlkxZWo4NVZBcDNvbV81MURpbnZNdTFjR2Zvai14MGFBQm8xcGNqbFN4RjFpRW4yUEg2MnNRZjE1T080a0tIc3RKVF9IWEViaTdmQzRHVjBPektHN0UzN2daUTZXYVBVTkV1ZFhYSHV5elJRVTZGYzV5c29sRVJOQk1XNGVYdEJyNlFkcHQ4WUdUSmZ4Y1FUM0Z1SXdyYmNpS1g4bkNINXJsdTZxbENZS0pSTHlBRWZ3c2g2cjhPVFQzZmZtZGR2bnhnUU9TZk81eTBSNUVHLVo5MHh3ajIwc2RDMHNHQmRNYzZIUmhCN3B4Y2pfSWRvVEVaY1hJRVFtN3JwX1o3bjhtalozM3VqdXZ5ZWNXcHNHUm9sZ0tjUUNHaGRnbzZwRTlUWTNBdGE5Q0lQT3pVRk83MFFiV0h3dnFoTjRHcWZDVVEtQzg5MjBteHJmUldxdFljakVMSXFCelhZaUN3cXlzUlh3MWxnZklVNmd3NHhJdVVLZm9vNWhWVVJTSEF2WjRSUHZlQ1hPcFphUFQ5d1N6YmpTX1dQdEhuWVltYjJtb0didndfckdBMk9uUDNjTGQ2VzhRbEdHUWxCS1ZsaUVqZGMyNUlwS2JZbjRZajd4amFZdE5IUndJRWd5cVF5MVlIM1pqSEtxZmlsSENaREt4MjBSX1E4S3hhTW9iLXdubER0TGlOblZ1ZUxyU3FhQ2pyd1UyV3JzM29CZ0g1dGRuby4=',1372746997,1372746997,'66.249.78.12','66.249.78.12'),(405,0,'nlafhv6mp0tj8t59eemoulod01',0,'c1V6N21pVGlqVmVaZHF1V1JreEEyNGw5QzQ4d2t0VkFWQmwwR1hRR3NWaTN1dFlENDZQaE5QR21vMTZ3R19jZzZYU0plTmlsQmloWUd3TWNTdUV1LUI5SnI0Q1MtZUtDV2dfa0JCSFEtemt4M1JDQTE5QlYwUGZsVThvNU85cGJGVTdCeDFENEgyYzhTQnJ0VHFkcnNpZDl2YXlISzVGeWJ4RTlMT0FJOF9rMHNaUEZTLWJkSTNXWXdHYlppeDU1a3NhaDd0dFA4VlRnZ3hLRFNMUVFYQlVOWW5ROW4wV2UzLTRqTkNxdzlJVHBQX2dERlZzX2g2TnVEQ1l6TkFkaDdjR2hIbTY3N2NnM2NHQkNZRG5hVUxEUmFrdWRYZUFBTXpLeVNtRDdfZm9oSVZWV2tNQWlqNi1qOVlVNmV0NVNlanMzQ2hpU0djU28yYXQ2YllMUkloU2FKZWZJVjdSZnJuVWh0YTJ2aEFrM283ZEdqendtT292amxWZ3pKNWlIVERWNndISnhtMENhUnJUNEtXckZHSGR5Qy1oZTh1cVBpczNoV1h6VGtWVm1lQy1CSTdwcFN3d0lVbWtZS1ZFdFY3cHhOMEo3Rl9GSEYzcGt0X1hseDBEclg1S2EyMkxzaERzNFBvZVNhZF8yeEhuTXpKd3NkSTVwaUZmbEx6QzZZSkZ1YWwxVUVZYlQ3V3dZWVpPY0RQU25XcEZHVnlma2h1dFduSU11TVVZM3MyN1RXQndzcnZtY0Z4ZlJLUmRkR0tPLWZhdlJ1MUFqTlBmRWNHVHFvbHRMMFY4dG1RXzA1ZTJ1WU93eTBSVERDdFFCRUV0T0lkanAwZ1VxZmdzT28xbVdSYVN4SDFnUzYycmVYbzNFaS1tZEg2UTlXc05yYlA2alo4WWtoM3ducUtsR2JhYkNIWGotdUhUSjgwZlBpZHBuZWVuV2VIUElNUE9YdnRSZEtDQmNyQVk0aDhTZ25nUVdrWVFpVGl3VG0xbEtIQWpKV0RBTzZILTV4Wk1NbWFZZHVSd3I0cGw0SFRETkktcWg2dGVlTzFoZFd0eWVLUlloMHhXMnN5aUxpOHdVVVd6d09XOFpOekIwQ1ZSU01HbHBJWnhGN21QcXpHVlJIemhwOXFya3p6eENQTVAyNXZJSVllTmRCbUZRSXVTRmlWMkd5Y1FQQ05QUmVQZDNkMGhXLU1GZGd6VnpOdHJMU3k4THlCNldkX1F1aUlVYjQtaDhwQjBQMU9vVWgzOFhXRWVuNklyTDJIYjRNQnJxNHM4aldfQTNxd1FPUjE1Nk0yTDVoQXU3b2ViSWdyMjhHTFZzTmlMaGstYkpkbGwwTGREY2tSbTctci0yM1h1bmlaRzVWM1ZKWkZTM0dpUFpVMkVSNWNDb0xSZldKbGM1MzJoNXlZdDlwaXJrWWtTYThpUVBPajk2ZmNxWHVzaWpXQXVvYmRhNXA4dll6UmU5N3hMYk1OVmstMWpHVmx5THJBSWxYeDNZNXV5TjQ1TTg2TXlKNmduckI4UFNOeUZaekt4X1VueEJzbUdpZG9YazZMdDkwaDREX0xyTHZFRVpVMDRDVmsyOXhWSk5aR3FScnF4MFpJQXI5WnJwUmdXaHcxRnlEWVo1a1QwaUlpVHQ0T3FNRXVFLXhIaTBzcHpzSEc3TnBlY2JwRl9FakpNY3U5al9Oc1JyX0V5bmtvQ2k5NVU2eFZiZk1sekhxQ19WNk4yQ1Bfb1RKUVRzYnVoVXp6WTVTUFhEZUF6WFlodWVaNENDZTZYZDBGdVlqRlFBRlREOTlLaWlWaXNTQzNHejZBRTdoQ3VycTRJYVNoSmdaQ0NOT0xvLU5uLUQzaHNQZ2xxOEJieU1qMDVFWFlZekVnZWFPY2xjREhaTXFhcEdrYVZMTlhtczJqNUNkZUIyVlVJSl9FMzVVN2FSNk1HcVFwNDZ2emhyenpTcmg0ZC1PZExVNUNIWnVWYkRRLVJHVHBKbXNJbWJwQi1EQ0llNjE2dWlCMU9DekJGNjNiSkNIa256dWpUdXBkbm1zbXhESlNTblJ2WVdDMElEOWpDNEVYZkhQejRsT3ZLRUY3VlVLQjk3WFdJSGp6QUVsRGQ3ZThVU3U0V3pVQU5zcXpVeUxtTURZczRCdGphS1ptT285SlRtcGNHVXRNSXcySGlnTTRzWlRUaC1uRlgtalRSeXo5S2VKVGZXVFc4X3JnRWdHWHhrT1dGM2hKUFVJSEFlNUhGckJGRnpZYzlHU3g4dXdtWWtHeFVnV3hqTUxEYjh6UHhPYTBrTlVuWnQta1JjTWd0S0ZiVVgtWG5YbWhfb2cwQWFkOXMwR3ROa0FGejcxMzdxWjhIM29kOWZEcVpEdUtPWEhZWWxvejBRNVFZaHdCd2kxLXhEZzVyVnFuUzRITFF6YzNDWEQyOGJiUzliRTVLNndaa0pFWlN0WjVHVmROelFhQVI3bUpyWFlha1FUNnZfRTJIdnYzS2tUbW5zRnpfeFEtel9WRWhlZUVFRS1wVDZ6c1lTWmRiMTFiODhVS3BvUGFjNlNuS3lBcG9WZm93eF92XzJSZ0k2UlU4ejdLUXBKcTYxLUJ5czNLVkxqaGpnV3N2SFdvM09IYktCY2NQUXlxTDdESk1wa2NCbg==',1372747840,1372747840,'66.249.78.12','66.249.78.12'),(406,0,'cefdhnkr2vb3bmgcbtnarmh960',0,'VzV0X1M1SVVmZW54NEJEMUhtLS1hMk9mUU1PbERWbk1xVFktS3hUcktOTUp0QUE1VHVQWVBtSGlUUVo1dFIxcFUyZG5LSEsxbnFXVEMyVXIwbEdNWnVoMFFqSkk2VWF4a3NRZzRLbW9OWnJTbVQ0b3lzaWZ5R1AwYzlZRHc3U3RKZ2paaHpLUVZtRGpYS2wxYVdUa0x2QzhMT1dNMGJ6M1JiNUJiSmRqMzg0T3RQa21VdkJMekFOUTVYYXlkTDdLUUk4Vlo2cnU0eW1kcjJXb1RBMmF2U3IyWVJSU0xSNE5YUnBjaEk0TGZXcFVNbGs1RkhlTmZFX0RTdXdrcDlKdHFqdHNTbG12ek9vbzI5MXhlZGlfdkxWSnhrdmtETjR6WDE2aE8wS3lQTDNMdTdTU1dLbVpTU1dsbE9hN2g5US1xSlRRaUNoSFhxNjljUmxTci1heklnQVRIQ09tMUtRYTh0ZFk2X3UyMVREVnhUWFlZbFJscURhaXphUkV2d3AyRUxnMmNzdU9ZN1dPMC1KNEZRaEZCTXZ0NEdfWXZSWFdTSWRvN05fQVRwU0ZtT0VlNkNYSVNHTG1ILUVZaHd1NW0tbE1aUFFyUVFqT0cyOFM5MkdDUXNOOFdBSk9US2UySl9NVVJES3F5MndTeUswa2ZhZVlaMVFWd05uSE1ZaXRQTnB3N2o2Y0lJUmNadnEyb1ctTUZiX2VJbkxWakhBM1Y4TFhVM1FFOVVIck5rLVpxV3ZJRGRTdXhqVmFSY1F6cFdLTnRUM1dWTnR2RThac0tWMlFCOWl1ODM3dU9TVlJFUzAyUnB2R1hVLS1vMVFqeGk2Q2FSbjQwQ2pJQ3B5S2FhUDdiYmZuZXNFcGZkMUdBVnNSZzF1TmtlZlo0T3A4QkdvRURrcUxOdEZpaHR1VDk2VGVURTZSdHlYQ2JsVzVUZmg5T2dDX2Rqb2U5ZTFKQTFEcl9qeW9PVnpVWm5pUUhCNzJoc1h1OURjT0llZ25wNG9WdjB1NW1Oclg3eTdvX1c1QmpMXzFNTG0ya2lVRGhHNk1vVm5hQk5rMk0weDJtQjFJTWU0LU9yMTNLTVUwQk4wQmxoZ3QzR19iUUppSUw0SFkxWmVKTWEya0w4YjJXWHhPYklPT2NiTHVsY05xZl9uV3Z5azBoUWdYdmpkWVJXbUE5YkJUOG5OWlhRWXNXVmZyR05ORUthMEZHc28xUnJGRUZPYTAwdzhsMmJ6VFFEMHE4azdOSnk1Y0NOREttMnkwTlpkSk13Y0ZzOGd2S0ppaDc2S3ZtRndCbkxxMDdiOEs4d3Zzd2xHY2NVcEZncmlJNWZaYjZZQ1pLTTlDTGhacnlaQjNCVG9qYUt6S1RyUmxLaklMWUFDdFdxUVRYS1NMbVRWTUxPNGZYUnQtdDhZMmc0cFFXWDkwSzZHTG80U3F0Z2Q2cDV4d3FZdk1yZVBQZVRWcklYUjNUMW52eHpZVEZhOHV1M2NkLWFFN0dUZ3Ntd1UtOTRSeTh5X2pUR0dsQ0hJNDl1TVRaS2NCeUZyWDZMSmQ0aTJVOTNEd0o2bTZrcnNSeTUyQXBGamo1ZU9pdjRfOWJCQU9tMy0wNi1PWFB1Z1hsTVZXX3lzY0lUTVBCS29JTWFCRllQMDRRUjVjajVackJ1MGQ3Vk5FUTB6UHh6SG1MY2VJYWM2MjhTeFRDRmtmQnRyZWducDFXNXlybUZfUGJ2VXdVTUFGTGkwVjZMN0JLaXhyMGNlOHNMVlo2VHlBZktIdmNiQmctMUlZU0N3Rld6aVl4OHNKRlVmME1ZYXpFOF9DR1BlR3JsNnUwVG0ycWNidGFpOUxMVkZERmFwNjl3dlBORENlbE94MmV1aExMa2IxTFQwdjVXV0d3ODdEckZxTndSU1pJNVJnMTRnWXBtREZIbnRNQ3liclRlQV9od3Q3b05uV2l3OTRGRFI3d0llTktFYU43QXl5ek1EZjRMNTA4NmowYWFtbkdIRENNdmlvQVFLb1ljSlJxeEVMZ3FBRWl6S0JfTnlIMlNuT2ljbE94WlNkNHdMZ1dnOWlWR0VCMTNSZ1JfTGNHOEtuN21IeXpMRHF1V0ZyNmd4M05hZTVHbWZpTXR4aVg4M2l3dEhvUHlDNXVmZ2RmY0w1U0JwYTkta254QmxhZG5YMk9XN25mNGozc3VabTZRNnhhTmlJU1lGNkJTdHBnYmd6RE1YeTN3S09iSVE4Qjc1OXR3XzVldUlBdXM5aHl0Nk4xbVlBdVF4Q084bzlSLUViWjhtTEZJdE5CUjNxWXJqUjZSU3phQ0RGMFRsc1lrQVBjTnFrdkJCS01IRzhsQXZIb3c5VjdVUkNtVWFRQ3FDOXlpbjBTSDNuY3dOWTZkTmdaZHN0VFVrSTBDb25Ec25FLTBnTWxiMFhkcVlDblNIYUJybkJ0cDhud1RhNDYtWjdRSVRtVndRY1FyWHhJbEV0VUw2T2JVNWxWbkNBUmx0MmdSZXNBNWV1SUZCUzlYRUd6bmlqcktVejEyaFIwdklHWm02M1hEMXJIdC1pRnZBeDZMQkEzT0NiYklqZk9tSjdfVGxEMU1Ma0xOcFZ4U01yNjdiX01RMFkwSFc0TlhYVDd4VktaZl9XX0NsY05obkVHV2REc3NHcQ==',1372748735,1372748736,'66.249.78.12','66.249.78.12'),(407,0,'c7s798o82idlrhl6avsg90eeg1',0,'eFl6V2pYSnlRanpaSW10QUlNOHYxbFdTQ0NBT1dhZS1ieTBqVmdFNlRlQUJyUzIyV0ZxWHFVakh0Z2pTd21Uc0hfTDU5VTVTaWpkZTRpUTRFbVZXd2FSMFBqUXRRM3NfdXY1NlpaeFZCUVZpMWtjTl92VUIzU2tidnVDYU9LTU1OUW1MUEU5TTNVaFJOVm9HQ0h5SUxTUF9QTlNMaXYybEtWUlNJTjh0QlFEZDdLWFl5QXhncHlRdmQtNmM5a1Axazd5QjU2MmFjQVhDTVVrdmhJcTlaT3JwVTZGMXRBTHdUSHB3N2kzRFNxd0hnTno3NFBoUk5kTFRxNEdROExiWGNxelAzWWlJR3I4bGZxanFESS1WVzhaU1FDY2NYMklyanp6ZVdmbmlqUXRLSVZaNlpWN2Z1d0dLdUp0M3UwNDNwM0tBbHNQdnRNOEV0bnNwZ1NEREl4Mm1UUzFKOUo1dGxUZ1Q3RUR6WTcyWHRwenFGS29Vck1YNnBQTzY2YmxUQmg1VXNwSTk1cFpON3dEY0V2ZjB1Ykx4c3dnR0Z0SEdwbWlNUlRqenlXLS1jbmw4RW5ack9hbFo0ZXVfeHlhU1lieEY1dDlmWXo2ejktcFIwaExCcnI0UWNJV0ZoRFNjSlFDbExSQTJ3RWczMUdveVExanRGQlU3RFJIajN2eTl6dWRyM3pvdmljQjM3Y3pBUmljZDhEaXpsZU00YnhQbVY1WGZveEQzOTZjc3VjWFBPeUJ4LXkwdk9JeHJCeFZkcWhCeFpyWW55UkdFQlk1SGl3WlFUYnRYQnJWOXdKczhtbzVtRHNjTkpNWkxheWxoY1pCWGNwWjVxbjVRbUJiZEF3MFo4RlFvQlhkNkltUS01N0wwNGtVV014bEN3YXI5SklpcE5TTU14TVRUOWpKZ0x1SXFJZmJVMnFGUW5HbFFNTDZXRUMydE8tRVh5OVJGeTEwNW9qQUs5dWNNMHJSVThoVFJCSHJ4eE5xTjhmdEtNaU53aTRqRHlHSlJ0SWZ0U0hSY28tOGVuZjE3ZzY3SEo1Rm5qa1g5c3FRU0MzMVpyZHF2V0lGaHBvaWlSR21VTDdkSXU3T0E2RHBiT2dqZTk5UEJfNFkxZ0VwRDNjSHhJWHV3ZDJJU3FoQjdMYUU3TV83VkY4MEoyd2hHMDhqbnZvU0pBNEU0dU8ybEFMUHhwUlVOdVRfUHpqTGQxdjIxenJoQzhxbzQ5c2NhM2hMVU5oTjI0VEtJZkxUTXlibE4tR2ZOSFpUR0dBbE1fREFmZHlXWF9vUC1wMThqUkNva08xTWNaTEdoWUp4WlM0ZVRnOUJWYldYY1FuVWRzY3RrSFlvdlk2N21lUXhHMzVPNFh1aU5wZGtFLTQzaFhLS19QYWt5NmFmM0xCMTd0dmVKM2h2S3cwbGlma2duRnFvVW9TNTFBc21aN3o2YkluckRNVVgtVlVaQUtJU3loNVFnQmJYSmpQOFJWSXJUT2lramVfd0stOWYwV2RlQkR0eDB6ZEM0bjNkc045eHBCa3hFbGNvZ19DZFQ3blNTbE55dTdyZmNlNXJSY25reUJtS21ZMHNIajk1TzlabThHTTZYQ3BQak5RUUJUWVpxUGtPS2t5WmlKN0FmUGwxNkl6VHdBYUtSZFVvYjE1N092UWRUd1pGZkpaMDVHUmszU0twV25QV29NejJfd3BTdDZjbTc2Ti1RdThXejltZmNSNXhaRWdoTmNpb3lVcmsyeVg2TU9IUDNFa0VKbUc2WW1wdjAwMjE1NlQwWEJPNnBWNzZvU1JzU29wMmQxOWkwa0dWSUZOMXRPUUh3MWNlR05Bci13elFQQnd5STlRWXo1alhSbHdWVzhyajc1Vmc0OS1KVFRjYkJQOFpqWU1mc2h3cjFwc0diMG5zdXQyNlVXbHU5YW5RaUVQclNVNGZQRE9HY3kzYUZSWTZudjRwNXhxZjBRYkg0UEVRdy1Yd1YyWHVyaldUVDhVRFk4OTZhdnNaSXVtaXlGU3Y1OTRIUE9jUjhleUNiYlpDc1ZwNTZ5aU5DQzducExIdTNVQkc1Rk1Fa2FLU3lhNWNkdXROQk1mbXEzb1dheDhhU1lKVmdpcmxLRHpFLVV6OE16cjJVNHZEWXlZZ2dZNUo5a0VnWVNBV2NxY3F5R3JWSUtoTTNUcVNnWjJLaTlPc2VZUFhpckllTTA5cmpuQlZISHk3M0VTR3B1ZGE3aDQ3Zmw2TEJOR1ByWTh6Rm55Y2RiRHpxVFRSc25Hc2NodnpoUzFBMGEyZDNuQTRlLXBUU1oyZkYtTzVCS1lwNVhBVVo2SWJVb3JSSTlFOFRSTTRGcy1MQjFrazA5Qm1JQW13TjNXMXVEY0hIaXFSbG1wMEU1OEdnYlozb2RzNlIxeFJraklTRjk4OWZIbEFTUjN6bURUTkh4ZHVTcTFKbUpobEg3akJhRkVEN0VQaWxoYWdrbGxSUzU5akM1S3hsYkZHdUc5bnNCMGxPeFNyaTBlbTBiakdfRjZKVzNUb0dlWVFVSnlSTnhDTlUtMWJKQlNENXE2VXlGdEhfbGFvVWxJT0xUZXhXNDZXOFdNRjljUTFrTjI5VDhsbXR2N01KTVpoZzJjX1kwQmVJMVk1Y3dMSWd5YVNqWUZfSw==',1372749542,1372749542,'66.249.78.12','66.249.78.12');
/*!40000 ALTER TABLE `mdl_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_daily`
--

LOCK TABLES `mdl_stats_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_monthly`
--

LOCK TABLES `mdl_stats_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_daily`
--

LOCK TABLES `mdl_stats_user_daily` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_monthly`
--

LOCK TABLES `mdl_stats_user_monthly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_user_weekly`
--

LOCK TABLES `mdl_stats_user_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_user_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_stats_weekly`
--

LOCK TABLES `mdl_stats_weekly` WRITE;
/*!40000 ALTER TABLE `mdl_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey`
--

LOCK TABLES `mdl_survey` WRITE;
/*!40000 ALTER TABLE `mdl_survey` DISABLE KEYS */;
INSERT INTO `mdl_survey` VALUES (1,0,0,0,985017600,985017600,'collesaname','collesaintro',0,'25,26,27,28,29,30,43,44'),(2,0,0,0,985017600,985017600,'collespname','collespintro',0,'31,32,33,34,35,36,43,44'),(3,0,0,0,985017600,985017600,'collesapname','collesapintro',0,'37,38,39,40,41,42,43,44'),(4,0,0,0,985017600,985017600,'attlsname','attlsintro',0,'65,67,68'),(5,0,0,0,985017600,985017600,'ciqname','ciqintro',0,'69,70,71,72,73');
/*!40000 ALTER TABLE `mdl_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_analysis`
--

LOCK TABLES `mdl_survey_analysis` WRITE;
/*!40000 ALTER TABLE `mdl_survey_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_answers`
--

LOCK TABLES `mdl_survey_answers` WRITE;
/*!40000 ALTER TABLE `mdl_survey_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_survey_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_survey_questions`
--

LOCK TABLES `mdl_survey_questions` WRITE;
/*!40000 ALTER TABLE `mdl_survey_questions` DISABLE KEYS */;
INSERT INTO `mdl_survey_questions` VALUES (1,'colles1','colles1short','','',1,'scaletimes5'),(2,'colles2','colles2short','','',1,'scaletimes5'),(3,'colles3','colles3short','','',1,'scaletimes5'),(4,'colles4','colles4short','','',1,'scaletimes5'),(5,'colles5','colles5short','','',1,'scaletimes5'),(6,'colles6','colles6short','','',1,'scaletimes5'),(7,'colles7','colles7short','','',1,'scaletimes5'),(8,'colles8','colles8short','','',1,'scaletimes5'),(9,'colles9','colles9short','','',1,'scaletimes5'),(10,'colles10','colles10short','','',1,'scaletimes5'),(11,'colles11','colles11short','','',1,'scaletimes5'),(12,'colles12','colles12short','','',1,'scaletimes5'),(13,'colles13','colles13short','','',1,'scaletimes5'),(14,'colles14','colles14short','','',1,'scaletimes5'),(15,'colles15','colles15short','','',1,'scaletimes5'),(16,'colles16','colles16short','','',1,'scaletimes5'),(17,'colles17','colles17short','','',1,'scaletimes5'),(18,'colles18','colles18short','','',1,'scaletimes5'),(19,'colles19','colles19short','','',1,'scaletimes5'),(20,'colles20','colles20short','','',1,'scaletimes5'),(21,'colles21','colles21short','','',1,'scaletimes5'),(22,'colles22','colles22short','','',1,'scaletimes5'),(23,'colles23','colles23short','','',1,'scaletimes5'),(24,'colles24','colles24short','','',1,'scaletimes5'),(25,'collesm1','collesm1short','1,2,3,4','collesmintro',1,'scaletimes5'),(26,'collesm2','collesm2short','5,6,7,8','collesmintro',1,'scaletimes5'),(27,'collesm3','collesm3short','9,10,11,12','collesmintro',1,'scaletimes5'),(28,'collesm4','collesm4short','13,14,15,16','collesmintro',1,'scaletimes5'),(29,'collesm5','collesm5short','17,18,19,20','collesmintro',1,'scaletimes5'),(30,'collesm6','collesm6short','21,22,23,24','collesmintro',1,'scaletimes5'),(31,'collesm1','collesm1short','1,2,3,4','collesmintro',2,'scaletimes5'),(32,'collesm2','collesm2short','5,6,7,8','collesmintro',2,'scaletimes5'),(33,'collesm3','collesm3short','9,10,11,12','collesmintro',2,'scaletimes5'),(34,'collesm4','collesm4short','13,14,15,16','collesmintro',2,'scaletimes5'),(35,'collesm5','collesm5short','17,18,19,20','collesmintro',2,'scaletimes5'),(36,'collesm6','collesm6short','21,22,23,24','collesmintro',2,'scaletimes5'),(37,'collesm1','collesm1short','1,2,3,4','collesmintro',3,'scaletimes5'),(38,'collesm2','collesm2short','5,6,7,8','collesmintro',3,'scaletimes5'),(39,'collesm3','collesm3short','9,10,11,12','collesmintro',3,'scaletimes5'),(40,'collesm4','collesm4short','13,14,15,16','collesmintro',3,'scaletimes5'),(41,'collesm5','collesm5short','17,18,19,20','collesmintro',3,'scaletimes5'),(42,'collesm6','collesm6short','21,22,23,24','collesmintro',3,'scaletimes5'),(43,'howlong','','','',1,'howlongoptions'),(44,'othercomments','','','',0,NULL),(45,'attls1','attls1short','','',1,'scaleagree5'),(46,'attls2','attls2short','','',1,'scaleagree5'),(47,'attls3','attls3short','','',1,'scaleagree5'),(48,'attls4','attls4short','','',1,'scaleagree5'),(49,'attls5','attls5short','','',1,'scaleagree5'),(50,'attls6','attls6short','','',1,'scaleagree5'),(51,'attls7','attls7short','','',1,'scaleagree5'),(52,'attls8','attls8short','','',1,'scaleagree5'),(53,'attls9','attls9short','','',1,'scaleagree5'),(54,'attls10','attls10short','','',1,'scaleagree5'),(55,'attls11','attls11short','','',1,'scaleagree5'),(56,'attls12','attls12short','','',1,'scaleagree5'),(57,'attls13','attls13short','','',1,'scaleagree5'),(58,'attls14','attls14short','','',1,'scaleagree5'),(59,'attls15','attls15short','','',1,'scaleagree5'),(60,'attls16','attls16short','','',1,'scaleagree5'),(61,'attls17','attls17short','','',1,'scaleagree5'),(62,'attls18','attls18short','','',1,'scaleagree5'),(63,'attls19','attls19short','','',1,'scaleagree5'),(64,'attls20','attls20short','','',1,'scaleagree5'),(65,'attlsm1','attlsm1','45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64','attlsmintro',1,'scaleagree5'),(66,'-','-','-','-',0,'-'),(67,'attlsm2','attlsm2','63,62,59,57,55,49,52,50,48,47','attlsmintro',-1,'scaleagree5'),(68,'attlsm3','attlsm3','46,54,45,51,60,53,56,58,61,64','attlsmintro',-1,'scaleagree5'),(69,'ciq1','ciq1short','','',0,NULL),(70,'ciq2','ciq2short','','',0,NULL),(71,'ciq3','ciq3short','','',0,NULL),(72,'ciq4','ciq4short','','',0,NULL),(73,'ciq5','ciq5short','','',0,NULL);
/*!40000 ALTER TABLE `mdl_survey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag`
--

LOCK TABLES `mdl_tag` WRITE;
/*!40000 ALTER TABLE `mdl_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_correlation`
--

LOCK TABLES `mdl_tag_correlation` WRITE;
/*!40000 ALTER TABLE `mdl_tag_correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tag_instance`
--

LOCK TABLES `mdl_tag_instance` WRITE;
/*!40000 ALTER TABLE `mdl_tag_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tag_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_temp_enroled_template`
--

DROP TABLE IF EXISTS `mdl_temp_enroled_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_temp_enroled_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tempenrotemp_use_ix` (`userid`),
  KEY `mdl_tempenrotemp_cou_ix` (`courseid`),
  KEY `mdl_tempenrotemp_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary storage for course enrolments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_temp_enroled_template`
--

LOCK TABLES `mdl_temp_enroled_template` WRITE;
/*!40000 ALTER TABLE `mdl_temp_enroled_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_temp_enroled_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_temp_log_template`
--

DROP TABLE IF EXISTS `mdl_temp_log_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_temp_log_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_templogtemp_act_ix` (`action`),
  KEY `mdl_templogtemp_cou_ix` (`course`),
  KEY `mdl_templogtemp_use_ix` (`userid`),
  KEY `mdl_templogtemp_usecouact_ix` (`userid`,`course`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary storage for daily logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_temp_log_template`
--

LOCK TABLES `mdl_temp_log_template` WRITE;
/*!40000 ALTER TABLE `mdl_temp_log_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_temp_log_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_timezone`
--

DROP TABLE IF EXISTS `mdl_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_timezone`
--

LOCK TABLES `mdl_timezone` WRITE;
/*!40000 ALTER TABLE `mdl_timezone` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang`
--

LOCK TABLES `mdl_tool_customlang` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_tool_customlang_components`
--

LOCK TABLES `mdl_tool_customlang_components` WRITE;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_tool_customlang_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_upgrade_log`
--

LOCK TABLES `mdl_upgrade_log` WRITE;
/*!40000 ALTER TABLE `mdl_upgrade_log` DISABLE KEYS */;
INSERT INTO `mdl_upgrade_log` VALUES (1,0,'core','2013051400.08','2013051400.08','Upgrade savepoint reached',NULL,'',0,1372421010),(2,0,'core','2013051400.08','2013051400.08','Core installed',NULL,'',0,1372421082),(3,0,'qtype_calculated',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421082),(4,0,'qtype_calculated','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421084),(5,0,'qtype_calculated','2013050100','2013050100','Plugin installed',NULL,'',0,1372421085),(6,0,'qtype_calculatedmulti',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421085),(7,0,'qtype_calculatedmulti','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421085),(8,0,'qtype_calculatedmulti','2013050100','2013050100','Plugin installed',NULL,'',0,1372421085),(9,0,'qtype_calculatedsimple',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421085),(10,0,'qtype_calculatedsimple','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421085),(11,0,'qtype_calculatedsimple','2013050100','2013050100','Plugin installed',NULL,'',0,1372421086),(12,0,'qtype_description',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421086),(13,0,'qtype_description','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421086),(14,0,'qtype_description','2013050100','2013050100','Plugin installed',NULL,'',0,1372421086),(15,0,'qtype_essay',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421086),(16,0,'qtype_essay','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421087),(17,0,'qtype_essay','2013050100','2013050100','Plugin installed',NULL,'',0,1372421087),(18,0,'qtype_match',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421087),(19,0,'qtype_match','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421088),(20,0,'qtype_match','2013050100','2013050100','Plugin installed',NULL,'',0,1372421089),(21,0,'qtype_missingtype',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421089),(22,0,'qtype_missingtype','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421089),(23,0,'qtype_missingtype','2013050100','2013050100','Plugin installed',NULL,'',0,1372421090),(24,0,'qtype_multianswer',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421090),(25,0,'qtype_multianswer','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421090),(26,0,'qtype_multianswer','2013050100','2013050100','Plugin installed',NULL,'',0,1372421091),(27,0,'qtype_multichoice',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421091),(28,0,'qtype_multichoice','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421091),(29,0,'qtype_multichoice','2013050100','2013050100','Plugin installed',NULL,'',0,1372421091),(30,0,'qtype_numerical',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421091),(31,0,'qtype_numerical','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421094),(32,0,'qtype_numerical','2013050100','2013050100','Plugin installed',NULL,'',0,1372421094),(33,0,'qtype_random',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421094),(34,0,'qtype_random','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421094),(35,0,'qtype_random','2013050100','2013050100','Plugin installed',NULL,'',0,1372421094),(36,0,'qtype_randomsamatch',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421094),(37,0,'qtype_randomsamatch','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421095),(38,0,'qtype_randomsamatch','2013050100','2013050100','Plugin installed',NULL,'',0,1372421095),(39,0,'qtype_shortanswer',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421095),(40,0,'qtype_shortanswer','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421095),(41,0,'qtype_shortanswer','2013050100','2013050100','Plugin installed',NULL,'',0,1372421096),(42,0,'qtype_truefalse',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421096),(43,0,'qtype_truefalse','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421096),(44,0,'qtype_truefalse','2013050100','2013050100','Plugin installed',NULL,'',0,1372421097),(45,0,'mod_assign',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421097),(46,0,'mod_assign','2013050100','2013050100','Plugin installed',NULL,'',0,1372421105),(47,0,'mod_assignment',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421105),(48,0,'mod_assignment','2013050100','2013050100','Plugin installed',NULL,'',0,1372421109),(49,0,'mod_book',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421109),(50,0,'mod_book','2013050100','2013050100','Plugin installed',NULL,'',0,1372421112),(51,0,'mod_chat',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421112),(52,0,'mod_chat','2013050100','2013050100','Plugin installed',NULL,'',0,1372421117),(53,0,'mod_choice',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421117),(54,0,'mod_choice','2013050100','2013050100','Plugin installed',NULL,'',0,1372421120),(55,0,'mod_data',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421120),(56,0,'mod_data','2013050100','2013050100','Plugin installed',NULL,'',0,1372421126),(57,0,'mod_feedback',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421126),(58,0,'mod_feedback','2013050100','2013050100','Plugin installed',NULL,'',0,1372421136),(59,0,'mod_folder',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421136),(60,0,'mod_folder','2013050100','2013050100','Plugin installed',NULL,'',0,1372421137),(61,0,'mod_forum',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421137),(62,0,'mod_forum','2013050100','2013050100','Plugin installed',NULL,'',0,1372421149),(63,0,'mod_glossary',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421149),(64,0,'mod_glossary','2013050100','2013050100','Plugin installed',NULL,'',0,1372421158),(65,0,'mod_imscp',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421158),(66,0,'mod_imscp','2013050100','2013050100','Plugin installed',NULL,'',0,1372421160),(67,0,'mod_label',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421160),(68,0,'mod_label','2013050100','2013050100','Plugin installed',NULL,'',0,1372421161),(69,0,'mod_lesson',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421161),(70,0,'mod_lesson','2013050100','2013050100','Plugin installed',NULL,'',0,1372421168),(71,0,'mod_lti',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421168),(72,0,'mod_lti','2013050100','2013050100','Plugin installed',NULL,'',0,1372421172),(73,0,'mod_page',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421172),(74,0,'mod_page','2013050100','2013050100','Plugin installed',NULL,'',0,1372421173),(75,0,'mod_quiz',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421173),(76,0,'mod_quiz','2013050100','2013050100','Plugin installed',NULL,'',0,1372421182),(77,0,'mod_resource',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421182),(78,0,'mod_resource','2013050100','2013050100','Plugin installed',NULL,'',0,1372421184),(79,0,'mod_scorm',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421184),(80,0,'mod_scorm','2013050100','2013050100','Plugin installed',NULL,'',0,1372421192),(81,0,'mod_survey',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421192),(82,0,'mod_survey','2013050100','2013050100','Plugin installed',NULL,'',0,1372421200),(83,0,'mod_url',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421200),(84,0,'mod_url','2013050100','2013050100','Plugin installed',NULL,'',0,1372421202),(85,0,'mod_wiki',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421202),(86,0,'mod_wiki','2013050100','2013050100','Plugin installed',NULL,'',0,1372421207),(87,0,'mod_workshop',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421207),(88,0,'mod_workshop','2013050100','2013050100','Plugin installed',NULL,'',0,1372421220),(89,0,'auth_cas',NULL,'2013052100','Starting plugin installation',NULL,'',0,1372421221),(90,0,'auth_cas','2013052100','2013052100','Upgrade savepoint reached',NULL,'',0,1372421221),(91,0,'auth_cas','2013052100','2013052100','Plugin installed',NULL,'',0,1372421221),(92,0,'auth_db',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421221),(93,0,'auth_db','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421222),(94,0,'auth_db','2013050100','2013050100','Plugin installed',NULL,'',0,1372421222),(95,0,'auth_email',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421222),(96,0,'auth_email','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421222),(97,0,'auth_email','2013050100','2013050100','Plugin installed',NULL,'',0,1372421222),(98,0,'auth_fc',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421222),(99,0,'auth_fc','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421223),(100,0,'auth_fc','2013050100','2013050100','Plugin installed',NULL,'',0,1372421224),(101,0,'auth_imap',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421224),(102,0,'auth_imap','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421224),(103,0,'auth_imap','2013050100','2013050100','Plugin installed',NULL,'',0,1372421225),(104,0,'auth_ldap',NULL,'2013052100','Starting plugin installation',NULL,'',0,1372421225),(105,0,'auth_ldap','2013052100','2013052100','Upgrade savepoint reached',NULL,'',0,1372421225),(106,0,'auth_ldap','2013052100','2013052100','Plugin installed',NULL,'',0,1372421225),(107,0,'auth_manual',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421225),(108,0,'auth_manual','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421225),(109,0,'auth_manual','2013050100','2013050100','Plugin installed',NULL,'',0,1372421225),(110,0,'auth_mnet',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421225),(111,0,'auth_mnet','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421226),(112,0,'auth_mnet','2013050100','2013050100','Plugin installed',NULL,'',0,1372421229),(113,0,'auth_nntp',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421229),(114,0,'auth_nntp','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421229),(115,0,'auth_nntp','2013050100','2013050100','Plugin installed',NULL,'',0,1372421230),(116,0,'auth_nologin',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421230),(117,0,'auth_nologin','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421230),(118,0,'auth_nologin','2013050100','2013050100','Plugin installed',NULL,'',0,1372421231),(119,0,'auth_none',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421231),(120,0,'auth_none','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421231),(121,0,'auth_none','2013050100','2013050100','Plugin installed',NULL,'',0,1372421231),(122,0,'auth_pam',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421231),(123,0,'auth_pam','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421231),(124,0,'auth_pam','2013050100','2013050100','Plugin installed',NULL,'',0,1372421231),(125,0,'auth_pop3',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421232),(126,0,'auth_pop3','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421232),(127,0,'auth_pop3','2013050100','2013050100','Plugin installed',NULL,'',0,1372421232),(128,0,'auth_radius',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421232),(129,0,'auth_radius','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421232),(130,0,'auth_radius','2013050100','2013050100','Plugin installed',NULL,'',0,1372421233),(131,0,'auth_shibboleth',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421233),(132,0,'auth_shibboleth','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421233),(133,0,'auth_shibboleth','2013050100','2013050100','Plugin installed',NULL,'',0,1372421234),(134,0,'auth_webservice',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421234),(135,0,'auth_webservice','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421234),(136,0,'auth_webservice','2013050100','2013050100','Plugin installed',NULL,'',0,1372421234),(137,0,'enrol_authorize',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421234),(138,0,'enrol_authorize','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421236),(139,0,'enrol_authorize','2013050100','2013050100','Plugin installed',NULL,'',0,1372421237),(140,0,'enrol_category',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421237),(141,0,'enrol_category','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421237),(142,0,'enrol_category','2013050100','2013050100','Plugin installed',NULL,'',0,1372421237),(143,0,'enrol_cohort',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421237),(144,0,'enrol_cohort','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421237),(145,0,'enrol_cohort','2013050100','2013050100','Plugin installed',NULL,'',0,1372421239),(146,0,'enrol_database',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421239),(147,0,'enrol_database','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421239),(148,0,'enrol_database','2013050100','2013050100','Plugin installed',NULL,'',0,1372421240),(149,0,'enrol_flatfile',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421240),(150,0,'enrol_flatfile','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421241),(151,0,'enrol_flatfile','2013050100','2013050100','Plugin installed',NULL,'',0,1372421241),(152,0,'enrol_guest',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421242),(153,0,'enrol_guest','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421242),(154,0,'enrol_guest','2013050100','2013050100','Plugin installed',NULL,'',0,1372421242),(155,0,'enrol_imsenterprise',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421242),(156,0,'enrol_imsenterprise','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421242),(157,0,'enrol_imsenterprise','2013050100','2013050100','Plugin installed',NULL,'',0,1372421243),(158,0,'enrol_ldap',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421243),(159,0,'enrol_ldap','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421243),(160,0,'enrol_ldap','2013050100','2013050100','Plugin installed',NULL,'',0,1372421243),(161,0,'enrol_manual',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421243),(162,0,'enrol_manual','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421243),(163,0,'enrol_manual','2013050100','2013050100','Plugin installed',NULL,'',0,1372421245),(164,0,'enrol_meta',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421245),(165,0,'enrol_meta','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421246),(166,0,'enrol_meta','2013050100','2013050100','Plugin installed',NULL,'',0,1372421246),(167,0,'enrol_mnet',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421247),(168,0,'enrol_mnet','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421247),(169,0,'enrol_mnet','2013050100','2013050100','Plugin installed',NULL,'',0,1372421249),(170,0,'enrol_paypal',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421249),(171,0,'enrol_paypal','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421249),(172,0,'enrol_paypal','2013050100','2013050100','Plugin installed',NULL,'',0,1372421250),(173,0,'enrol_self',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421250),(174,0,'enrol_self','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421250),(175,0,'enrol_self','2013050100','2013050100','Plugin installed',NULL,'',0,1372421251),(176,0,'message_email',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421251),(177,0,'message_email','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421251),(178,0,'message_email','2013050100','2013050100','Plugin installed',NULL,'',0,1372421252),(179,0,'message_jabber',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421252),(180,0,'message_jabber','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421252),(181,0,'message_jabber','2013050100','2013050100','Plugin installed',NULL,'',0,1372421253),(182,0,'message_popup',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421253),(183,0,'message_popup','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421253),(184,0,'message_popup','2013050100','2013050100','Plugin installed',NULL,'',0,1372421254),(185,0,'block_activity_modules',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421254),(186,0,'block_activity_modules','2013050100','2013050100','Plugin installed',NULL,'',0,1372421254),(187,0,'block_admin_bookmarks',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421255),(188,0,'block_admin_bookmarks','2013050100','2013050100','Plugin installed',NULL,'',0,1372421255),(189,0,'block_badges',NULL,'2013050101','Starting plugin installation',NULL,'',0,1372421255),(190,0,'block_badges','2013050101','2013050101','Plugin installed',NULL,'',0,1372421255),(191,0,'block_blog_menu',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421255),(192,0,'block_blog_menu','2013050100','2013050100','Plugin installed',NULL,'',0,1372421256),(193,0,'block_blog_recent',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421256),(194,0,'block_blog_recent','2013050100','2013050100','Plugin installed',NULL,'',0,1372421257),(195,0,'block_blog_tags',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421257),(196,0,'block_blog_tags','2013050100','2013050100','Plugin installed',NULL,'',0,1372421257),(197,0,'block_calendar_month',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421257),(198,0,'block_calendar_month','2013050100','2013050100','Plugin installed',NULL,'',0,1372421258),(199,0,'block_calendar_upcoming',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421258),(200,0,'block_calendar_upcoming','2013050100','2013050100','Plugin installed',NULL,'',0,1372421259),(201,0,'block_comments',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421259),(202,0,'block_comments','2013050100','2013050100','Plugin installed',NULL,'',0,1372421259),(203,0,'block_community',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421259),(204,0,'block_community','2013050100','2013050100','Plugin installed',NULL,'',0,1372421261),(205,0,'block_completionstatus',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421261),(206,0,'block_completionstatus','2013050100','2013050100','Plugin installed',NULL,'',0,1372421261),(207,0,'block_course_list',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421261),(208,0,'block_course_list','2013050100','2013050100','Plugin installed',NULL,'',0,1372421262),(209,0,'block_course_overview',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421262),(210,0,'block_course_overview','2013050100','2013050100','Plugin installed',NULL,'',0,1372421263),(211,0,'block_course_summary',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421263),(212,0,'block_course_summary','2013050100','2013050100','Plugin installed',NULL,'',0,1372421263),(213,0,'block_feedback',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421263),(214,0,'block_feedback','2013050100','2013050100','Plugin installed',NULL,'',0,1372421264),(215,0,'block_glossary_random',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421264),(216,0,'block_glossary_random','2013050100','2013050100','Plugin installed',NULL,'',0,1372421265),(217,0,'block_html',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421265),(218,0,'block_html','2013050100','2013050100','Plugin installed',NULL,'',0,1372421266),(219,0,'block_login',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421266),(220,0,'block_login','2013050100','2013050100','Plugin installed',NULL,'',0,1372421266),(221,0,'block_mentees',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421266),(222,0,'block_mentees','2013050100','2013050100','Plugin installed',NULL,'',0,1372421266),(223,0,'block_messages',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421266),(224,0,'block_messages','2013050100','2013050100','Plugin installed',NULL,'',0,1372421267),(225,0,'block_mnet_hosts',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421267),(226,0,'block_mnet_hosts','2013050100','2013050100','Plugin installed',NULL,'',0,1372421268),(227,0,'block_myprofile',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421268),(228,0,'block_myprofile','2013050100','2013050100','Plugin installed',NULL,'',0,1372421268),(229,0,'block_navigation',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421268),(230,0,'block_navigation','2013050100','2013050100','Plugin installed',NULL,'',0,1372421270),(231,0,'block_news_items',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421270),(232,0,'block_news_items','2013050100','2013050100','Plugin installed',NULL,'',0,1372421271),(233,0,'block_online_users',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421271),(234,0,'block_online_users','2013050100','2013050100','Plugin installed',NULL,'',0,1372421271),(235,0,'block_participants',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421271),(236,0,'block_participants','2013050100','2013050100','Plugin installed',NULL,'',0,1372421272),(237,0,'block_private_files',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421272),(238,0,'block_private_files','2013050100','2013050100','Plugin installed',NULL,'',0,1372421272),(239,0,'block_quiz_results',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421272),(240,0,'block_quiz_results','2013050100','2013050100','Plugin installed',NULL,'',0,1372421273),(241,0,'block_recent_activity',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421273),(242,0,'block_recent_activity','2013050100','2013050100','Plugin installed',NULL,'',0,1372421273),(243,0,'block_rss_client',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421274),(244,0,'block_rss_client','2013050100','2013050100','Plugin installed',NULL,'',0,1372421275),(245,0,'block_search_forums',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421275),(246,0,'block_search_forums','2013050100','2013050100','Plugin installed',NULL,'',0,1372421276),(247,0,'block_section_links',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421276),(248,0,'block_section_links','2013050100','2013050100','Plugin installed',NULL,'',0,1372421276),(249,0,'block_selfcompletion',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421276),(250,0,'block_selfcompletion','2013050100','2013050100','Plugin installed',NULL,'',0,1372421276),(251,0,'block_settings',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421277),(252,0,'block_settings','2013050100','2013050100','Plugin installed',NULL,'',0,1372421277),(253,0,'block_site_main_menu',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421277),(254,0,'block_site_main_menu','2013050100','2013050100','Plugin installed',NULL,'',0,1372421277),(255,0,'block_social_activities',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421277),(256,0,'block_social_activities','2013050100','2013050100','Plugin installed',NULL,'',0,1372421278),(257,0,'block_tag_flickr',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421278),(258,0,'block_tag_flickr','2013050100','2013050100','Plugin installed',NULL,'',0,1372421279),(259,0,'block_tag_youtube',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421279),(260,0,'block_tag_youtube','2013050100','2013050100','Plugin installed',NULL,'',0,1372421280),(261,0,'block_tags',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421280),(262,0,'block_tags','2013050100','2013050100','Plugin installed',NULL,'',0,1372421280),(263,0,'filter_activitynames',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421282),(264,0,'filter_activitynames','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421282),(265,0,'filter_activitynames','2013050100','2013050100','Plugin installed',NULL,'',0,1372421282),(266,0,'filter_algebra',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421282),(267,0,'filter_algebra','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421282),(268,0,'filter_algebra','2013050100','2013050100','Plugin installed',NULL,'',0,1372421282),(269,0,'filter_censor',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421282),(270,0,'filter_censor','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421283),(271,0,'filter_censor','2013050100','2013050100','Plugin installed',NULL,'',0,1372421283),(272,0,'filter_data',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421283),(273,0,'filter_data','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421283),(274,0,'filter_data','2013050100','2013050100','Plugin installed',NULL,'',0,1372421284),(275,0,'filter_emailprotect',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421284),(276,0,'filter_emailprotect','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421284),(277,0,'filter_emailprotect','2013050100','2013050100','Plugin installed',NULL,'',0,1372421284),(278,0,'filter_emoticon',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421284),(279,0,'filter_emoticon','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421285),(280,0,'filter_emoticon','2013050100','2013050100','Plugin installed',NULL,'',0,1372421285),(281,0,'filter_glossary',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421285),(282,0,'filter_glossary','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421285),(283,0,'filter_glossary','2013050100','2013050100','Plugin installed',NULL,'',0,1372421286),(284,0,'filter_mediaplugin',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421286),(285,0,'filter_mediaplugin','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421286),(286,0,'filter_mediaplugin','2013050100','2013050100','Plugin installed',NULL,'',0,1372421287),(287,0,'filter_multilang',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421287),(288,0,'filter_multilang','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421287),(289,0,'filter_multilang','2013050100','2013050100','Plugin installed',NULL,'',0,1372421287),(290,0,'filter_tex',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421288),(291,0,'filter_tex','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421288),(292,0,'filter_tex','2013050100','2013050100','Plugin installed',NULL,'',0,1372421288),(293,0,'filter_tidy',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421288),(294,0,'filter_tidy','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421288),(295,0,'filter_tidy','2013050100','2013050100','Plugin installed',NULL,'',0,1372421288),(296,0,'filter_urltolink',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421288),(297,0,'filter_urltolink','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421289),(298,0,'filter_urltolink','2013050100','2013050100','Plugin installed',NULL,'',0,1372421289),(299,0,'editor_textarea',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421289),(300,0,'editor_textarea','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421289),(301,0,'editor_textarea','2013050100','2013050100','Plugin installed',NULL,'',0,1372421291),(302,0,'editor_tinymce',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421291),(303,0,'editor_tinymce','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421291),(304,0,'editor_tinymce','2013050100','2013050100','Plugin installed',NULL,'',0,1372421291),(305,0,'format_scorm',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421291),(306,0,'format_scorm','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421291),(307,0,'format_scorm','2013050100','2013050100','Plugin installed',NULL,'',0,1372421291),(308,0,'format_social',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421291),(309,0,'format_social','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421292),(310,0,'format_social','2013050100','2013050100','Plugin installed',NULL,'',0,1372421292),(311,0,'format_topics',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421292),(312,0,'format_topics','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421292),(313,0,'format_topics','2013050100','2013050100','Plugin installed',NULL,'',0,1372421292),(314,0,'format_weeks',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421292),(315,0,'format_weeks','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421292),(316,0,'format_weeks','2013050100','2013050100','Plugin installed',NULL,'',0,1372421293),(317,0,'profilefield_checkbox',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421293),(318,0,'profilefield_checkbox','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421293),(319,0,'profilefield_checkbox','2013050100','2013050100','Plugin installed',NULL,'',0,1372421293),(320,0,'profilefield_datetime',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421294),(321,0,'profilefield_datetime','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421294),(322,0,'profilefield_datetime','2013050100','2013050100','Plugin installed',NULL,'',0,1372421294),(323,0,'profilefield_menu',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421294),(324,0,'profilefield_menu','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421294),(325,0,'profilefield_menu','2013050100','2013050100','Plugin installed',NULL,'',0,1372421294),(326,0,'profilefield_text',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421294),(327,0,'profilefield_text','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421294),(328,0,'profilefield_text','2013050100','2013050100','Plugin installed',NULL,'',0,1372421295),(329,0,'profilefield_textarea',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421295),(330,0,'profilefield_textarea','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421295),(331,0,'profilefield_textarea','2013050100','2013050100','Plugin installed',NULL,'',0,1372421296),(332,0,'report_backups',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421296),(333,0,'report_backups','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421296),(334,0,'report_backups','2013050100','2013050100','Plugin installed',NULL,'',0,1372421296),(335,0,'report_completion',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421296),(336,0,'report_completion','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421296),(337,0,'report_completion','2013050100','2013050100','Plugin installed',NULL,'',0,1372421297),(338,0,'report_configlog',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421297),(339,0,'report_configlog','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421297),(340,0,'report_configlog','2013050100','2013050100','Plugin installed',NULL,'',0,1372421298),(341,0,'report_courseoverview',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421298),(342,0,'report_courseoverview','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421298),(343,0,'report_courseoverview','2013050100','2013050100','Plugin installed',NULL,'',0,1372421298),(344,0,'report_log',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421298),(345,0,'report_log','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421299),(346,0,'report_log','2013050100','2013050100','Plugin installed',NULL,'',0,1372421299),(347,0,'report_loglive',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421299),(348,0,'report_loglive','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421299),(349,0,'report_loglive','2013050100','2013050100','Plugin installed',NULL,'',0,1372421300),(350,0,'report_outline',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421300),(351,0,'report_outline','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421300),(352,0,'report_outline','2013050100','2013050100','Plugin installed',NULL,'',0,1372421302),(353,0,'report_participation',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421302),(354,0,'report_participation','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421302),(355,0,'report_participation','2013050100','2013050100','Plugin installed',NULL,'',0,1372421302),(356,0,'report_performance',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421303),(357,0,'report_performance','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421303),(358,0,'report_performance','2013050100','2013050100','Plugin installed',NULL,'',0,1372421303),(359,0,'report_progress',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421303),(360,0,'report_progress','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421303),(361,0,'report_progress','2013050100','2013050100','Plugin installed',NULL,'',0,1372421304),(362,0,'report_questioninstances',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421304),(363,0,'report_questioninstances','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421304),(364,0,'report_questioninstances','2013050100','2013050100','Plugin installed',NULL,'',0,1372421304),(365,0,'report_security',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421304),(366,0,'report_security','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421304),(367,0,'report_security','2013050100','2013050100','Plugin installed',NULL,'',0,1372421304),(368,0,'report_stats',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421304),(369,0,'report_stats','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421305),(370,0,'report_stats','2013050100','2013050100','Plugin installed',NULL,'',0,1372421305),(371,0,'gradeexport_ods',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421305),(372,0,'gradeexport_ods','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421305),(373,0,'gradeexport_ods','2013050100','2013050100','Plugin installed',NULL,'',0,1372421306),(374,0,'gradeexport_txt',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421306),(375,0,'gradeexport_txt','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421306),(376,0,'gradeexport_txt','2013050100','2013050100','Plugin installed',NULL,'',0,1372421307),(377,0,'gradeexport_xls',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421307),(378,0,'gradeexport_xls','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421307),(379,0,'gradeexport_xls','2013050100','2013050100','Plugin installed',NULL,'',0,1372421308),(380,0,'gradeexport_xml',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421308),(381,0,'gradeexport_xml','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421308),(382,0,'gradeexport_xml','2013050100','2013050100','Plugin installed',NULL,'',0,1372421309),(383,0,'gradeimport_csv',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421309),(384,0,'gradeimport_csv','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421309),(385,0,'gradeimport_csv','2013050100','2013050100','Plugin installed',NULL,'',0,1372421310),(386,0,'gradeimport_xml',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421310),(387,0,'gradeimport_xml','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421310),(388,0,'gradeimport_xml','2013050100','2013050100','Plugin installed',NULL,'',0,1372421310),(389,0,'gradereport_grader',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421310),(390,0,'gradereport_grader','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421311),(391,0,'gradereport_grader','2013050100','2013050100','Plugin installed',NULL,'',0,1372421311),(392,0,'gradereport_outcomes',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421311),(393,0,'gradereport_outcomes','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421311),(394,0,'gradereport_outcomes','2013050100','2013050100','Plugin installed',NULL,'',0,1372421312),(395,0,'gradereport_overview',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421312),(396,0,'gradereport_overview','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421313),(397,0,'gradereport_overview','2013050100','2013050100','Plugin installed',NULL,'',0,1372421313),(398,0,'gradereport_user',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421313),(399,0,'gradereport_user','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421313),(400,0,'gradereport_user','2013050100','2013050100','Plugin installed',NULL,'',0,1372421313),(401,0,'gradingform_guide',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421314),(402,0,'gradingform_guide','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421315),(403,0,'gradingform_guide','2013050100','2013050100','Plugin installed',NULL,'',0,1372421315),(404,0,'gradingform_rubric',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421315),(405,0,'gradingform_rubric','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421317),(406,0,'gradingform_rubric','2013050100','2013050100','Plugin installed',NULL,'',0,1372421318),(407,0,'mnetservice_enrol',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421318),(408,0,'mnetservice_enrol','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421319),(409,0,'mnetservice_enrol','2013050100','2013050100','Plugin installed',NULL,'',0,1372421319),(410,0,'webservice_amf',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421319),(411,0,'webservice_amf','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421319),(412,0,'webservice_amf','2013050100','2013050100','Plugin installed',NULL,'',0,1372421320),(413,0,'webservice_rest',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421320),(414,0,'webservice_rest','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421320),(415,0,'webservice_rest','2013050100','2013050100','Plugin installed',NULL,'',0,1372421321),(416,0,'webservice_soap',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421321),(417,0,'webservice_soap','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421321),(418,0,'webservice_soap','2013050100','2013050100','Plugin installed',NULL,'',0,1372421321),(419,0,'webservice_xmlrpc',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421321),(420,0,'webservice_xmlrpc','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421321),(421,0,'webservice_xmlrpc','2013050100','2013050100','Plugin installed',NULL,'',0,1372421322),(422,0,'repository_alfresco',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421322),(423,0,'repository_alfresco','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421322),(424,0,'repository_alfresco','2013050100','2013050100','Plugin installed',NULL,'',0,1372421323),(425,0,'repository_boxnet',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421323),(426,0,'repository_boxnet','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421323),(427,0,'repository_boxnet','2013050100','2013050100','Plugin installed',NULL,'',0,1372421324),(428,0,'repository_coursefiles',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421324),(429,0,'repository_coursefiles','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421324),(430,0,'repository_coursefiles','2013050100','2013050100','Plugin installed',NULL,'',0,1372421324),(431,0,'repository_dropbox',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421324),(432,0,'repository_dropbox','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421324),(433,0,'repository_dropbox','2013050100','2013050100','Plugin installed',NULL,'',0,1372421325),(434,0,'repository_equella',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421325),(435,0,'repository_equella','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421325),(436,0,'repository_equella','2013050100','2013050100','Plugin installed',NULL,'',0,1372421326),(437,0,'repository_filesystem',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421326),(438,0,'repository_filesystem','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421326),(439,0,'repository_filesystem','2013050100','2013050100','Plugin installed',NULL,'',0,1372421327),(440,0,'repository_flickr',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421327),(441,0,'repository_flickr','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421327),(442,0,'repository_flickr','2013050100','2013050100','Plugin installed',NULL,'',0,1372421327),(443,0,'repository_flickr_public',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421327),(444,0,'repository_flickr_public','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421327),(445,0,'repository_flickr_public','2013050100','2013050100','Plugin installed',NULL,'',0,1372421328),(446,0,'repository_googledocs',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421328),(447,0,'repository_googledocs','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421328),(448,0,'repository_googledocs','2013050100','2013050100','Plugin installed',NULL,'',0,1372421329),(449,0,'repository_local',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421329),(450,0,'repository_local','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421329),(451,0,'repository_local','2013050100','2013050100','Plugin installed',NULL,'',0,1372421329),(452,0,'repository_merlot',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421330),(453,0,'repository_merlot','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421330),(454,0,'repository_merlot','2013050100','2013050100','Plugin installed',NULL,'',0,1372421330),(455,0,'repository_picasa',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421330),(456,0,'repository_picasa','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421330),(457,0,'repository_picasa','2013050100','2013050100','Plugin installed',NULL,'',0,1372421330),(458,0,'repository_recent',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421330),(459,0,'repository_recent','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421331),(460,0,'repository_recent','2013050100','2013050100','Plugin installed',NULL,'',0,1372421331),(461,0,'repository_s3',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421331),(462,0,'repository_s3','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421331),(463,0,'repository_s3','2013050100','2013050100','Plugin installed',NULL,'',0,1372421332),(464,0,'repository_upload',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421332),(465,0,'repository_upload','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421332),(466,0,'repository_upload','2013050100','2013050100','Plugin installed',NULL,'',0,1372421333),(467,0,'repository_url',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421334),(468,0,'repository_url','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421334),(469,0,'repository_url','2013050100','2013050100','Plugin installed',NULL,'',0,1372421336),(470,0,'repository_user',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421336),(471,0,'repository_user','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421336),(472,0,'repository_user','2013050100','2013050100','Plugin installed',NULL,'',0,1372421336),(473,0,'repository_webdav',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421336),(474,0,'repository_webdav','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421337),(475,0,'repository_webdav','2013050100','2013050100','Plugin installed',NULL,'',0,1372421338),(476,0,'repository_wikimedia',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421338),(477,0,'repository_wikimedia','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421338),(478,0,'repository_wikimedia','2013050100','2013050100','Plugin installed',NULL,'',0,1372421338),(479,0,'repository_youtube',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421338),(480,0,'repository_youtube','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421338),(481,0,'repository_youtube','2013050100','2013050100','Plugin installed',NULL,'',0,1372421339),(482,0,'portfolio_boxnet',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421339),(483,0,'portfolio_boxnet','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421340),(484,0,'portfolio_boxnet','2013050100','2013050100','Plugin installed',NULL,'',0,1372421340),(485,0,'portfolio_download',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421340),(486,0,'portfolio_download','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421340),(487,0,'portfolio_download','2013050100','2013050100','Plugin installed',NULL,'',0,1372421340),(488,0,'portfolio_flickr',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421340),(489,0,'portfolio_flickr','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421340),(490,0,'portfolio_flickr','2013050100','2013050100','Plugin installed',NULL,'',0,1372421341),(491,0,'portfolio_googledocs',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421341),(492,0,'portfolio_googledocs','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421341),(493,0,'portfolio_googledocs','2013050100','2013050100','Plugin installed',NULL,'',0,1372421341),(494,0,'portfolio_mahara',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421341),(495,0,'portfolio_mahara','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421342),(496,0,'portfolio_mahara','2013050100','2013050100','Plugin installed',NULL,'',0,1372421343),(497,0,'portfolio_picasa',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421343),(498,0,'portfolio_picasa','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421343),(499,0,'portfolio_picasa','2013050100','2013050100','Plugin installed',NULL,'',0,1372421344),(500,0,'qbehaviour_adaptive',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421344),(501,0,'qbehaviour_adaptive','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421344),(502,0,'qbehaviour_adaptive','2013050100','2013050100','Plugin installed',NULL,'',0,1372421344),(503,0,'qbehaviour_adaptivenopenalty',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421344),(504,0,'qbehaviour_adaptivenopenalty','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421344),(505,0,'qbehaviour_adaptivenopenalty','2013050100','2013050100','Plugin installed',NULL,'',0,1372421344),(506,0,'qbehaviour_deferredcbm',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421344),(507,0,'qbehaviour_deferredcbm','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421344),(508,0,'qbehaviour_deferredcbm','2013050100','2013050100','Plugin installed',NULL,'',0,1372421345),(509,0,'qbehaviour_deferredfeedback',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421345),(510,0,'qbehaviour_deferredfeedback','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421346),(511,0,'qbehaviour_deferredfeedback','2013050100','2013050100','Plugin installed',NULL,'',0,1372421347),(512,0,'qbehaviour_immediatecbm',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421347),(513,0,'qbehaviour_immediatecbm','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421347),(514,0,'qbehaviour_immediatecbm','2013050100','2013050100','Plugin installed',NULL,'',0,1372421347),(515,0,'qbehaviour_immediatefeedback',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421347),(516,0,'qbehaviour_immediatefeedback','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421347),(517,0,'qbehaviour_immediatefeedback','2013050100','2013050100','Plugin installed',NULL,'',0,1372421348),(518,0,'qbehaviour_informationitem',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421348),(519,0,'qbehaviour_informationitem','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421348),(520,0,'qbehaviour_informationitem','2013050100','2013050100','Plugin installed',NULL,'',0,1372421348),(521,0,'qbehaviour_interactive',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421348),(522,0,'qbehaviour_interactive','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421348),(523,0,'qbehaviour_interactive','2013050100','2013050100','Plugin installed',NULL,'',0,1372421349),(524,0,'qbehaviour_interactivecountback',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421349),(525,0,'qbehaviour_interactivecountback','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421349),(526,0,'qbehaviour_interactivecountback','2013050100','2013050100','Plugin installed',NULL,'',0,1372421349),(527,0,'qbehaviour_manualgraded',NULL,'2013050800','Starting plugin installation',NULL,'',0,1372421349),(528,0,'qbehaviour_manualgraded','2013050800','2013050800','Upgrade savepoint reached',NULL,'',0,1372421349),(529,0,'qbehaviour_manualgraded','2013050800','2013050800','Plugin installed',NULL,'',0,1372421350),(530,0,'qbehaviour_missing',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421350),(531,0,'qbehaviour_missing','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421350),(532,0,'qbehaviour_missing','2013050100','2013050100','Plugin installed',NULL,'',0,1372421350),(533,0,'qformat_aiken',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421350),(534,0,'qformat_aiken','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421351),(535,0,'qformat_aiken','2013050100','2013050100','Plugin installed',NULL,'',0,1372421351),(536,0,'qformat_blackboard_six',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421351),(537,0,'qformat_blackboard_six','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421351),(538,0,'qformat_blackboard_six','2013050100','2013050100','Plugin installed',NULL,'',0,1372421351),(539,0,'qformat_examview',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421351),(540,0,'qformat_examview','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421351),(541,0,'qformat_examview','2013050100','2013050100','Plugin installed',NULL,'',0,1372421352),(542,0,'qformat_gift',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421352),(543,0,'qformat_gift','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421352),(544,0,'qformat_gift','2013050100','2013050100','Plugin installed',NULL,'',0,1372421353),(545,0,'qformat_learnwise',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421353),(546,0,'qformat_learnwise','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421353),(547,0,'qformat_learnwise','2013050100','2013050100','Plugin installed',NULL,'',0,1372421353),(548,0,'qformat_missingword',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421353),(549,0,'qformat_missingword','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421353),(550,0,'qformat_missingword','2013050100','2013050100','Plugin installed',NULL,'',0,1372421354),(551,0,'qformat_multianswer',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421354),(552,0,'qformat_multianswer','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421354),(553,0,'qformat_multianswer','2013050100','2013050100','Plugin installed',NULL,'',0,1372421354),(554,0,'qformat_webct',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421354),(555,0,'qformat_webct','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421354),(556,0,'qformat_webct','2013050100','2013050100','Plugin installed',NULL,'',0,1372421354),(557,0,'qformat_xhtml',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421355),(558,0,'qformat_xhtml','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421355),(559,0,'qformat_xhtml','2013050100','2013050100','Plugin installed',NULL,'',0,1372421355),(560,0,'qformat_xml',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421355),(561,0,'qformat_xml','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421355),(562,0,'qformat_xml','2013050100','2013050100','Plugin installed',NULL,'',0,1372421355),(563,0,'tool_assignmentupgrade',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421355),(564,0,'tool_assignmentupgrade','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421355),(565,0,'tool_assignmentupgrade','2013050100','2013050100','Plugin installed',NULL,'',0,1372421356),(566,0,'tool_behat',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421356),(567,0,'tool_behat','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421356),(568,0,'tool_behat','2013050100','2013050100','Plugin installed',NULL,'',0,1372421356),(569,0,'tool_capability',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421356),(570,0,'tool_capability','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421357),(571,0,'tool_capability','2013050100','2013050100','Plugin installed',NULL,'',0,1372421358),(572,0,'tool_customlang',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421358),(573,0,'tool_customlang','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421359),(574,0,'tool_customlang','2013050100','2013050100','Plugin installed',NULL,'',0,1372421360),(575,0,'tool_dbtransfer',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421360),(576,0,'tool_dbtransfer','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421360),(577,0,'tool_dbtransfer','2013050100','2013050100','Plugin installed',NULL,'',0,1372421360),(578,0,'tool_generator',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421360),(579,0,'tool_generator','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421360),(580,0,'tool_generator','2013050100','2013050100','Plugin installed',NULL,'',0,1372421361),(581,0,'tool_health',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421361),(582,0,'tool_health','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421361),(583,0,'tool_health','2013050100','2013050100','Plugin installed',NULL,'',0,1372421361),(584,0,'tool_innodb',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421361),(585,0,'tool_innodb','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421361),(586,0,'tool_innodb','2013050100','2013050100','Plugin installed',NULL,'',0,1372421361),(587,0,'tool_installaddon',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421361),(588,0,'tool_installaddon','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421361),(589,0,'tool_installaddon','2013050100','2013050100','Plugin installed',NULL,'',0,1372421362),(590,0,'tool_langimport',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421362),(591,0,'tool_langimport','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421362),(592,0,'tool_langimport','2013050100','2013050100','Plugin installed',NULL,'',0,1372421362),(593,0,'tool_multilangupgrade',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421362),(594,0,'tool_multilangupgrade','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421362),(595,0,'tool_multilangupgrade','2013050100','2013050100','Plugin installed',NULL,'',0,1372421363),(596,0,'tool_phpunit',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421363),(597,0,'tool_phpunit','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421363),(598,0,'tool_phpunit','2013050100','2013050100','Plugin installed',NULL,'',0,1372421364),(599,0,'tool_profiling',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421364),(600,0,'tool_profiling','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421364),(601,0,'tool_profiling','2013050100','2013050100','Plugin installed',NULL,'',0,1372421364),(602,0,'tool_qeupgradehelper',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421364),(603,0,'tool_qeupgradehelper','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421364),(604,0,'tool_qeupgradehelper','2013050100','2013050100','Plugin installed',NULL,'',0,1372421365),(605,0,'tool_replace',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421365),(606,0,'tool_replace','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421365),(607,0,'tool_replace','2013050100','2013050100','Plugin installed',NULL,'',0,1372421365),(608,0,'tool_spamcleaner',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421365),(609,0,'tool_spamcleaner','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421365),(610,0,'tool_spamcleaner','2013050100','2013050100','Plugin installed',NULL,'',0,1372421366),(611,0,'tool_timezoneimport',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421366),(612,0,'tool_timezoneimport','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421366),(613,0,'tool_timezoneimport','2013050100','2013050100','Plugin installed',NULL,'',0,1372421366),(614,0,'tool_unsuproles',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421366),(615,0,'tool_unsuproles','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421366),(616,0,'tool_unsuproles','2013050100','2013050100','Plugin installed',NULL,'',0,1372421367),(617,0,'tool_uploaduser',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421367),(618,0,'tool_uploaduser','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421367),(619,0,'tool_uploaduser','2013050100','2013050100','Plugin installed',NULL,'',0,1372421368),(620,0,'tool_xmldb',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421368),(621,0,'tool_xmldb','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421368),(622,0,'tool_xmldb','2013050100','2013050100','Plugin installed',NULL,'',0,1372421368),(623,0,'cachestore_file',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421368),(624,0,'cachestore_file','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421368),(625,0,'cachestore_file','2013050100','2013050100','Plugin installed',NULL,'',0,1372421370),(626,0,'cachestore_memcache',NULL,'2013050700','Starting plugin installation',NULL,'',0,1372421370),(627,0,'cachestore_memcache','2013050700','2013050700','Upgrade savepoint reached',NULL,'',0,1372421370),(628,0,'cachestore_memcache','2013050700','2013050700','Plugin installed',NULL,'',0,1372421371),(629,0,'cachestore_memcached',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421371),(630,0,'cachestore_memcached','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421371),(631,0,'cachestore_memcached','2013050100','2013050100','Plugin installed',NULL,'',0,1372421371),(632,0,'cachestore_mongodb',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421371),(633,0,'cachestore_mongodb','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421371),(634,0,'cachestore_mongodb','2013050100','2013050100','Plugin installed',NULL,'',0,1372421371),(635,0,'cachestore_session',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421371),(636,0,'cachestore_session','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421371),(637,0,'cachestore_session','2013050100','2013050100','Plugin installed',NULL,'',0,1372421372),(638,0,'cachestore_static',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421372),(639,0,'cachestore_static','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421372),(640,0,'cachestore_static','2013050100','2013050100','Plugin installed',NULL,'',0,1372421372),(641,0,'theme_afterburner',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421372),(642,0,'theme_afterburner','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421372),(643,0,'theme_afterburner','2013050100','2013050100','Plugin installed',NULL,'',0,1372421373),(644,0,'theme_anomaly',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421373),(645,0,'theme_anomaly','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421373),(646,0,'theme_anomaly','2013050100','2013050100','Plugin installed',NULL,'',0,1372421373),(647,0,'theme_arialist',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421373),(648,0,'theme_arialist','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421374),(649,0,'theme_arialist','2013050100','2013050100','Plugin installed',NULL,'',0,1372421374),(650,0,'theme_base',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421374),(651,0,'theme_base','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421374),(652,0,'theme_base','2013050100','2013050100','Plugin installed',NULL,'',0,1372421374),(653,0,'theme_binarius',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421374),(654,0,'theme_binarius','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421375),(655,0,'theme_binarius','2013050100','2013050100','Plugin installed',NULL,'',0,1372421375),(656,0,'theme_bootstrapbase',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421375),(657,0,'theme_bootstrapbase','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421375),(658,0,'theme_bootstrapbase','2013050100','2013050100','Plugin installed',NULL,'',0,1372421376),(659,0,'theme_boxxie',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421376),(660,0,'theme_boxxie','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421376),(661,0,'theme_boxxie','2013050100','2013050100','Plugin installed',NULL,'',0,1372421376),(662,0,'theme_brick',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421376),(663,0,'theme_brick','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421376),(664,0,'theme_brick','2013050100','2013050100','Plugin installed',NULL,'',0,1372421377),(665,0,'theme_canvas',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421377),(666,0,'theme_canvas','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421377),(667,0,'theme_canvas','2013050100','2013050100','Plugin installed',NULL,'',0,1372421377),(668,0,'theme_clean',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421377),(669,0,'theme_clean','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421377),(670,0,'theme_clean','2013050100','2013050100','Plugin installed',NULL,'',0,1372421377),(671,0,'theme_formal_white',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421377),(672,0,'theme_formal_white','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421378),(673,0,'theme_formal_white','2013050100','2013050100','Plugin installed',NULL,'',0,1372421378),(674,0,'theme_formfactor',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421378),(675,0,'theme_formfactor','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421378),(676,0,'theme_formfactor','2013050100','2013050100','Plugin installed',NULL,'',0,1372421379),(677,0,'theme_fusion',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421379),(678,0,'theme_fusion','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421379),(679,0,'theme_fusion','2013050100','2013050100','Plugin installed',NULL,'',0,1372421379),(680,0,'theme_leatherbound',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421379),(681,0,'theme_leatherbound','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421379),(682,0,'theme_leatherbound','2013050100','2013050100','Plugin installed',NULL,'',0,1372421380),(683,0,'theme_magazine',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421380),(684,0,'theme_magazine','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421380),(685,0,'theme_magazine','2013050100','2013050100','Plugin installed',NULL,'',0,1372421381),(686,0,'theme_mymobile',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421381),(687,0,'theme_mymobile','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421381),(688,0,'theme_mymobile','2013050100','2013050100','Plugin installed',NULL,'',0,1372421382),(689,0,'theme_nimble',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421382),(690,0,'theme_nimble','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421382),(691,0,'theme_nimble','2013050100','2013050100','Plugin installed',NULL,'',0,1372421383),(692,0,'theme_nonzero',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421383),(693,0,'theme_nonzero','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421383),(694,0,'theme_nonzero','2013050100','2013050100','Plugin installed',NULL,'',0,1372421383),(695,0,'theme_overlay',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421383),(696,0,'theme_overlay','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421383),(697,0,'theme_overlay','2013050100','2013050100','Plugin installed',NULL,'',0,1372421383),(698,0,'theme_serenity',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421383),(699,0,'theme_serenity','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421384),(700,0,'theme_serenity','2013050100','2013050100','Plugin installed',NULL,'',0,1372421384),(701,0,'theme_sky_high',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421384),(702,0,'theme_sky_high','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421384),(703,0,'theme_sky_high','2013050100','2013050100','Plugin installed',NULL,'',0,1372421384),(704,0,'theme_splash',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421384),(705,0,'theme_splash','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421384),(706,0,'theme_splash','2013050100','2013050100','Plugin installed',NULL,'',0,1372421385),(707,0,'theme_standard',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421385),(708,0,'theme_standard','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421385),(709,0,'theme_standard','2013050100','2013050100','Plugin installed',NULL,'',0,1372421386),(710,0,'theme_standardold',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421386),(711,0,'theme_standardold','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421386),(712,0,'theme_standardold','2013050100','2013050100','Plugin installed',NULL,'',0,1372421386),(713,0,'assignsubmission_comments',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421386),(714,0,'assignsubmission_comments','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421386),(715,0,'assignsubmission_comments','2013050100','2013050100','Plugin installed',NULL,'',0,1372421387),(716,0,'assignsubmission_file',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421387),(717,0,'assignsubmission_file','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421388),(718,0,'assignsubmission_file','2013050100','2013050100','Plugin installed',NULL,'',0,1372421388),(719,0,'assignsubmission_onlinetext',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421388),(720,0,'assignsubmission_onlinetext','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421389),(721,0,'assignsubmission_onlinetext','2013050100','2013050100','Plugin installed',NULL,'',0,1372421390),(722,0,'assignfeedback_comments',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421390),(723,0,'assignfeedback_comments','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421390),(724,0,'assignfeedback_comments','2013050100','2013050100','Plugin installed',NULL,'',0,1372421391),(725,0,'assignfeedback_file',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421391),(726,0,'assignfeedback_file','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421391),(727,0,'assignfeedback_file','2013050100','2013050100','Plugin installed',NULL,'',0,1372421392),(728,0,'assignfeedback_offline',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421392),(729,0,'assignfeedback_offline','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421392),(730,0,'assignfeedback_offline','2013050100','2013050100','Plugin installed',NULL,'',0,1372421394),(731,0,'assignment_offline',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421394),(732,0,'assignment_offline','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421394),(733,0,'assignment_offline','2013050100','2013050100','Plugin installed',NULL,'',0,1372421394),(734,0,'assignment_online',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421394),(735,0,'assignment_online','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421394),(736,0,'assignment_online','2013050100','2013050100','Plugin installed',NULL,'',0,1372421395),(737,0,'assignment_upload',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421395),(738,0,'assignment_upload','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421395),(739,0,'assignment_upload','2013050100','2013050100','Plugin installed',NULL,'',0,1372421396),(740,0,'assignment_uploadsingle',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421396),(741,0,'assignment_uploadsingle','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421396),(742,0,'assignment_uploadsingle','2013050100','2013050100','Plugin installed',NULL,'',0,1372421396),(743,0,'booktool_exportimscp',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421396),(744,0,'booktool_exportimscp','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421396),(745,0,'booktool_exportimscp','2013050100','2013050100','Plugin installed',NULL,'',0,1372421396),(746,0,'booktool_importhtml',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421396),(747,0,'booktool_importhtml','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421397),(748,0,'booktool_importhtml','2013050100','2013050100','Plugin installed',NULL,'',0,1372421397),(749,0,'booktool_print',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421397),(750,0,'booktool_print','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421397),(751,0,'booktool_print','2013050100','2013050100','Plugin installed',NULL,'',0,1372421398),(752,0,'datafield_checkbox',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421399),(753,0,'datafield_checkbox','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421399),(754,0,'datafield_checkbox','2013050100','2013050100','Plugin installed',NULL,'',0,1372421399),(755,0,'datafield_date',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421399),(756,0,'datafield_date','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421399),(757,0,'datafield_date','2013050100','2013050100','Plugin installed',NULL,'',0,1372421400),(758,0,'datafield_file',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421400),(759,0,'datafield_file','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421400),(760,0,'datafield_file','2013050100','2013050100','Plugin installed',NULL,'',0,1372421400),(761,0,'datafield_latlong',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421400),(762,0,'datafield_latlong','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421400),(763,0,'datafield_latlong','2013050100','2013050100','Plugin installed',NULL,'',0,1372421401),(764,0,'datafield_menu',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421401),(765,0,'datafield_menu','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421401),(766,0,'datafield_menu','2013050100','2013050100','Plugin installed',NULL,'',0,1372421401),(767,0,'datafield_multimenu',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421401),(768,0,'datafield_multimenu','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421401),(769,0,'datafield_multimenu','2013050100','2013050100','Plugin installed',NULL,'',0,1372421401),(770,0,'datafield_number',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421401),(771,0,'datafield_number','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421401),(772,0,'datafield_number','2013050100','2013050100','Plugin installed',NULL,'',0,1372421402),(773,0,'datafield_picture',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421402),(774,0,'datafield_picture','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421402),(775,0,'datafield_picture','2013050100','2013050100','Plugin installed',NULL,'',0,1372421402),(776,0,'datafield_radiobutton',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421402),(777,0,'datafield_radiobutton','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421402),(778,0,'datafield_radiobutton','2013050100','2013050100','Plugin installed',NULL,'',0,1372421403),(779,0,'datafield_text',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421403),(780,0,'datafield_text','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421403),(781,0,'datafield_text','2013050100','2013050100','Plugin installed',NULL,'',0,1372421404),(782,0,'datafield_textarea',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421404),(783,0,'datafield_textarea','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421405),(784,0,'datafield_textarea','2013050100','2013050100','Plugin installed',NULL,'',0,1372421405),(785,0,'datafield_url',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421405),(786,0,'datafield_url','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421405),(787,0,'datafield_url','2013050100','2013050100','Plugin installed',NULL,'',0,1372421406),(788,0,'datapreset_imagegallery',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421406),(789,0,'datapreset_imagegallery','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421406),(790,0,'datapreset_imagegallery','2013050100','2013050100','Plugin installed',NULL,'',0,1372421406),(791,0,'quiz_grading',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421406),(792,0,'quiz_grading','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421407),(793,0,'quiz_grading','2013050100','2013050100','Plugin installed',NULL,'',0,1372421407),(794,0,'quiz_overview',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421407),(795,0,'quiz_overview','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421407),(796,0,'quiz_overview','2013050100','2013050100','Plugin installed',NULL,'',0,1372421408),(797,0,'quiz_responses',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421408),(798,0,'quiz_responses','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421408),(799,0,'quiz_responses','2013050100','2013050100','Plugin installed',NULL,'',0,1372421408),(800,0,'quiz_statistics',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421408),(801,0,'quiz_statistics','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421409),(802,0,'quiz_statistics','2013050100','2013050100','Plugin installed',NULL,'',0,1372421410),(803,0,'quizaccess_delaybetweenattempts',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421410),(804,0,'quizaccess_delaybetweenattempts','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421410),(805,0,'quizaccess_delaybetweenattempts','2013050100','2013050100','Plugin installed',NULL,'',0,1372421411),(806,0,'quizaccess_ipaddress',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421411),(807,0,'quizaccess_ipaddress','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421411),(808,0,'quizaccess_ipaddress','2013050100','2013050100','Plugin installed',NULL,'',0,1372421411),(809,0,'quizaccess_numattempts',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421411),(810,0,'quizaccess_numattempts','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421411),(811,0,'quizaccess_numattempts','2013050100','2013050100','Plugin installed',NULL,'',0,1372421411),(812,0,'quizaccess_openclosedate',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421411),(813,0,'quizaccess_openclosedate','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421411),(814,0,'quizaccess_openclosedate','2013050100','2013050100','Plugin installed',NULL,'',0,1372421412),(815,0,'quizaccess_password',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421412),(816,0,'quizaccess_password','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421412),(817,0,'quizaccess_password','2013050100','2013050100','Plugin installed',NULL,'',0,1372421412),(818,0,'quizaccess_safebrowser',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421412),(819,0,'quizaccess_safebrowser','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421412),(820,0,'quizaccess_safebrowser','2013050100','2013050100','Plugin installed',NULL,'',0,1372421412),(821,0,'quizaccess_securewindow',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421413),(822,0,'quizaccess_securewindow','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421413),(823,0,'quizaccess_securewindow','2013050100','2013050100','Plugin installed',NULL,'',0,1372421413),(824,0,'quizaccess_timelimit',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421413),(825,0,'quizaccess_timelimit','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421413),(826,0,'quizaccess_timelimit','2013050100','2013050100','Plugin installed',NULL,'',0,1372421413),(827,0,'scormreport_basic',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421413),(828,0,'scormreport_basic','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421413),(829,0,'scormreport_basic','2013050100','2013050100','Plugin installed',NULL,'',0,1372421414),(830,0,'scormreport_graphs',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421414),(831,0,'scormreport_graphs','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421414),(832,0,'scormreport_graphs','2013050100','2013050100','Plugin installed',NULL,'',0,1372421415),(833,0,'scormreport_interactions',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421415),(834,0,'scormreport_interactions','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421415),(835,0,'scormreport_interactions','2013050100','2013050100','Plugin installed',NULL,'',0,1372421416),(836,0,'workshopform_accumulative',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421416),(837,0,'workshopform_accumulative','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421417),(838,0,'workshopform_accumulative','2013050100','2013050100','Plugin installed',NULL,'',0,1372421418),(839,0,'workshopform_comments',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421418),(840,0,'workshopform_comments','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421418),(841,0,'workshopform_comments','2013050100','2013050100','Plugin installed',NULL,'',0,1372421418),(842,0,'workshopform_numerrors',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421418),(843,0,'workshopform_numerrors','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421419),(844,0,'workshopform_numerrors','2013050100','2013050100','Plugin installed',NULL,'',0,1372421420),(845,0,'workshopform_rubric',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421420),(846,0,'workshopform_rubric','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421421),(847,0,'workshopform_rubric','2013050100','2013050100','Plugin installed',NULL,'',0,1372421421),(848,0,'workshopallocation_manual',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421421),(849,0,'workshopallocation_manual','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421422),(850,0,'workshopallocation_manual','2013050100','2013050100','Plugin installed',NULL,'',0,1372421422),(851,0,'workshopallocation_random',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421422),(852,0,'workshopallocation_random','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421422),(853,0,'workshopallocation_random','2013050100','2013050100','Plugin installed',NULL,'',0,1372421423),(854,0,'workshopallocation_scheduled',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421423),(855,0,'workshopallocation_scheduled','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421423),(856,0,'workshopallocation_scheduled','2013050100','2013050100','Plugin installed',NULL,'',0,1372421424),(857,0,'workshopeval_best',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421424),(858,0,'workshopeval_best','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421424),(859,0,'workshopeval_best','2013050100','2013050100','Plugin installed',NULL,'',0,1372421424),(860,0,'tinymce_ctrlhelp',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421424),(861,0,'tinymce_ctrlhelp','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421424),(862,0,'tinymce_ctrlhelp','2013050100','2013050100','Plugin installed',NULL,'',0,1372421425),(863,0,'tinymce_dragmath',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421425),(864,0,'tinymce_dragmath','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421425),(865,0,'tinymce_dragmath','2013050100','2013050100','Plugin installed',NULL,'',0,1372421425),(866,0,'tinymce_moodleemoticon',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421425),(867,0,'tinymce_moodleemoticon','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421425),(868,0,'tinymce_moodleemoticon','2013050100','2013050100','Plugin installed',NULL,'',0,1372421425),(869,0,'tinymce_moodleimage',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421425),(870,0,'tinymce_moodleimage','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421426),(871,0,'tinymce_moodleimage','2013050100','2013050100','Plugin installed',NULL,'',0,1372421426),(872,0,'tinymce_moodlemedia',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421426),(873,0,'tinymce_moodlemedia','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421427),(874,0,'tinymce_moodlemedia','2013050100','2013050100','Plugin installed',NULL,'',0,1372421428),(875,0,'tinymce_moodlenolink',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421428),(876,0,'tinymce_moodlenolink','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421428),(877,0,'tinymce_moodlenolink','2013050100','2013050100','Plugin installed',NULL,'',0,1372421428),(878,0,'tinymce_spellchecker',NULL,'2013050100','Starting plugin installation',NULL,'',0,1372421428),(879,0,'tinymce_spellchecker','2013050100','2013050100','Upgrade savepoint reached',NULL,'',0,1372421428),(880,0,'tinymce_spellchecker','2013050100','2013050100','Plugin installed',NULL,'',0,1372421429),(881,0,'theme_academy',NULL,'2013050100','Starting plugin installation',NULL,'',2,1372422547),(882,0,'theme_academy','2013050100','2013050100','Upgrade savepoint reached',NULL,'',2,1372422547),(883,0,'theme_academy','2013050100','2013050100','Plugin installed',NULL,'',2,1372422548),(884,0,'enrol_payanyway',NULL,'2011121300','Starting plugin installation',NULL,'',2,1372423081),(885,0,'enrol_payanyway','2011121300','2011121300','Upgrade savepoint reached',NULL,'',2,1372423081),(886,0,'enrol_payanyway','2011121300','2011121300','Plugin installed',NULL,'',2,1372423082),(887,0,'mod_autoview',NULL,'2012100901','Starting plugin installation',NULL,'',2,1372423804),(888,0,'mod_autoview','2012100901','2012100901','Plugin installed',NULL,'',2,1372423806),(889,0,'repository_coursefilearea',NULL,'2013020301','Starting plugin installation',NULL,'',2,1372423807),(890,0,'repository_coursefilearea','2013020301','2013020301','Upgrade savepoint reached',NULL,'',2,1372423807),(891,0,'repository_coursefilearea','2013020301','2013020301','Plugin installed',NULL,'',2,1372423808),(892,0,'repository_repo_filemanager',NULL,'2013020301','Starting plugin installation',NULL,'',2,1372423808),(893,0,'repository_repo_filemanager','2013020301','2013020301','Upgrade savepoint reached',NULL,'',2,1372423808),(894,0,'repository_repo_filemanager','2013020301','2013020301','Plugin installed',NULL,'',2,1372423808);
/*!40000 ALTER TABLE `mdl_upgrade_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_url`
--

LOCK TABLES `mdl_url` WRITE;
/*!40000 ALTER TABLE `mdl_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user`
--

LOCK TABLES `mdl_user` WRITE;
/*!40000 ALTER TABLE `mdl_user` DISABLE KEYS */;
INSERT INTO `mdl_user` VALUES (1,'manual',1,0,0,0,1,'guest','c4e1d8dd474afc64eb02785f22fe82c7','','Гость',' ','root@localhost',0,'','','','','','','','','','','','','ru','','99',0,0,0,0,'','',0,'','Этот - специальный пользователь, которому разрешён доступ только на чтение к некоторым курсам.',1,1,0,2,1,1,0,0,1372420974,0,NULL),(2,'manual',1,0,0,0,1,'admin','f93fbe061b3209d3d378394df6012498','','Администратор','Пользователь','groundsale@yandex.ru',0,'','','','','','','','','','','Саратов','RU','ru','','99',1372421435,1372687967,1372686807,1372687967,'10.7.0.26','prsrmarEeceapY9',0,'','',1,1,0,0,1,0,0,0,1372421534,0,NULL);
/*!40000 ALTER TABLE `mdl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_enrolments`
--

LOCK TABLES `mdl_user_enrolments` WRITE;
/*!40000 ALTER TABLE `mdl_user_enrolments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_enrolments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_category`
--

LOCK TABLES `mdl_user_info_category` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_data`
--

LOCK TABLES `mdl_user_info_data` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_info_field`
--

LOCK TABLES `mdl_user_info_field` WRITE;
/*!40000 ALTER TABLE `mdl_user_info_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_info_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_lastaccess`
--

LOCK TABLES `mdl_user_lastaccess` WRITE;
/*!40000 ALTER TABLE `mdl_user_lastaccess` DISABLE KEYS */;
INSERT INTO `mdl_user_lastaccess` VALUES (1,2,2,1372425305);
/*!40000 ALTER TABLE `mdl_user_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_preferences`
--

LOCK TABLES `mdl_user_preferences` WRITE;
/*!40000 ALTER TABLE `mdl_user_preferences` DISABLE KEYS */;
INSERT INTO `mdl_user_preferences` VALUES (1,2,'email_bounce_count','1'),(2,2,'email_send_count','3');
/*!40000 ALTER TABLE `mdl_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_user_private_key`
--

LOCK TABLES `mdl_user_private_key` WRITE;
/*!40000 ALTER TABLE `mdl_user_private_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_user_private_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_webdav_locks`
--

DROP TABLE IF EXISTS `mdl_webdav_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_webdav_locks`
--

LOCK TABLES `mdl_webdav_locks` WRITE;
/*!40000 ALTER TABLE `mdl_webdav_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_webdav_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki`
--

LOCK TABLES `mdl_wiki` WRITE;
/*!40000 ALTER TABLE `mdl_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_links`
--

LOCK TABLES `mdl_wiki_links` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_locks`
--

LOCK TABLES `mdl_wiki_locks` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_pages`
--

LOCK TABLES `mdl_wiki_pages` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_subwikis`
--

LOCK TABLES `mdl_wiki_subwikis` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_subwikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_synonyms`
--

LOCK TABLES `mdl_wiki_synonyms` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_wiki_versions`
--

LOCK TABLES `mdl_wiki_versions` WRITE;
/*!40000 ALTER TABLE `mdl_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_wiki_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop`
--

LOCK TABLES `mdl_workshop` WRITE;
/*!40000 ALTER TABLE `mdl_workshop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_aggregations`
--

LOCK TABLES `mdl_workshop_aggregations` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_aggregations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments`
--

LOCK TABLES `mdl_workshop_assessments` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_assessments_old`
--

LOCK TABLES `mdl_workshop_assessments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_assessments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_comments_old`
--

LOCK TABLES `mdl_workshop_comments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_comments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_elements_old`
--

LOCK TABLES `mdl_workshop_elements_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_elements_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades`
--

LOCK TABLES `mdl_workshop_grades` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_grades_old`
--

LOCK TABLES `mdl_workshop_grades_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_grades_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_old`
--

LOCK TABLES `mdl_workshop_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_rubrics_old`
--

LOCK TABLES `mdl_workshop_rubrics_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_rubrics_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_stockcomments_old`
--

LOCK TABLES `mdl_workshop_stockcomments_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_stockcomments_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions`
--

LOCK TABLES `mdl_workshop_submissions` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshop_submissions_old`
--

LOCK TABLES `mdl_workshop_submissions_old` WRITE;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshop_submissions_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopallocation_scheduled`
--

LOCK TABLES `mdl_workshopallocation_scheduled` WRITE;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopallocation_scheduled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopeval_best_settings`
--

LOCK TABLES `mdl_workshopeval_best_settings` WRITE;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopeval_best_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_accumulative`
--

LOCK TABLES `mdl_workshopform_accumulative` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_accumulative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_comments`
--

LOCK TABLES `mdl_workshopform_comments` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors`
--

LOCK TABLES `mdl_workshopform_numerrors` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_numerrors_map`
--

LOCK TABLES `mdl_workshopform_numerrors_map` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_numerrors_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric`
--

LOCK TABLES `mdl_workshopform_rubric` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_config`
--

LOCK TABLES `mdl_workshopform_rubric_config` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdl_workshopform_rubric_levels`
--

LOCK TABLES `mdl_workshopform_rubric_levels` WRITE;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdl_workshopform_rubric_levels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-02 11:20:02