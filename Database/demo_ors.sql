/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.0.24-community-nt : Database - demo_ors
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo_ors` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `demo_ors`;

/*Table structure for table `st_college` */

DROP TABLE IF EXISTS `st_college`;

CREATE TABLE `st_college` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) default NULL,
  `ADDRESS` varchar(255) default NULL,
  `STATE` varchar(255) default NULL,
  `CITY` varchar(255) default NULL,
  `PHONE_NO` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_DATE_TIME` datetime default NULL,
  `MODIFIED_DATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `NAME_IDX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_college` */

insert  into `st_college`(`ID`,`NAME`,`ADDRESS`,`STATE`,`CITY`,`PHONE_NO`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,'SVITS','Indore','M.P','Indore','2555','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(2,'Truba','Indore','M.P','Indore','999999','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(3,'SVIM','Gumasta Nagar','M.P','Indore','9999999999','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:42:17','2014-07-22 13:44:40'),
(5,'NIT BORAWAN','Indore Road Rau','M.P','Indore','8578485858','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:06:17','2021-09-24 02:06:17'),
(6,'IPS','Khandwa Road','M.P','Indore','9857485858','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:09:41','2021-09-24 02:09:41'),
(7,'Astral','Indore','M.P','Indore','9999999999','asolanki@gmail.com','asolanki@gmail.com','2014-07-31 16:47:09','2014-07-31 16:47:09'),
(8,'RGTU','Bhopal','M.P','Bhopal','23584645','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(9,'JIT','Indore','M.P','Indore','999999999','asolanki@gmail.com','asolanki@gmail.com','2014-08-09 17:11:55','2014-08-09 17:11:55'),
(11,'NRI','Raisen','M.P','Bhopal','966465689889','asolanki@gmail.com','asolanki@gmail.com','2014-08-23 12:27:01','2014-08-23 12:29:02'),
(12,'TIT','Bhopal','M.P','Bhopal','4567891234','asolanki@gmail.com','asolanki@gmail.com','2014-09-04 19:32:05','2014-09-04 19:32:05'),
(13,'LNCT','Indore','M.P','Indore','9876543210','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:22:28','2014-09-29 19:22:28'),
(14,'GYAN GANGA','Jabalpur','M.P','Jabalpur','9876543210','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:23:29','2014-09-29 19:23:29'),
(15,'Ranjeet Singh','Indore','M.P','Indore','6958748596','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:10:43','2021-09-24 02:10:43');

/*Table structure for table `st_course` */

DROP TABLE IF EXISTS `st_course`;

CREATE TABLE `st_course` (
  `ID` bigint(50) NOT NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `DESCRIPTION` varchar(50) default NULL,
  `DURATION` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATE_TIME` timestamp NULL default CURRENT_TIMESTAMP,
  `MODIFIED_DATE_TIME` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_course` */

insert  into `st_course`(`ID`,`COURSE_NAME`,`DESCRIPTION`,`DURATION`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,'B.com','Bachelor','4 year','asolanki@gmail.com','asolanki@gmail.com','2020-11-04 12:34:14','2020-11-04 12:34:14'),
(2,'BE','Bachelor','4 year','asolanki@gmail.com','asolanki@gmail.com','2020-11-04 12:36:00','2020-11-04 12:36:00'),
(3,'CA','Good','4Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:34:48','2021-09-24 02:34:48'),
(4,'B.tech','Engineering','4Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:19:33','2021-09-23 17:19:33'),
(5,'BSC','Science','3Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:19:53','2021-09-23 17:19:53'),
(6,'BCA','Computer Application','3Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:20:16','2021-09-23 17:20:16'),
(7,'MCA','Master of Computer Application','2Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:20:46','2021-09-23 17:20:46'),
(8,'BBA','Business','3Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:21:01','2021-09-23 17:21:01'),
(9,'B.pharma','Medical','4Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:21:15','2021-09-23 17:21:15'),
(10,'M.pharma','Master of Pharma','2Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:21:38','2021-09-23 17:21:38'),
(11,'M.tech','Master of Technology','2Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:22:05','2021-09-23 17:22:05'),
(12,'PHD','Computer Science','2Year','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:23:42','2021-09-23 17:23:42');

/*Table structure for table `st_faculty` */

DROP TABLE IF EXISTS `st_faculty`;

CREATE TABLE `st_faculty` (
  `ID` int(50) NOT NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `GENDER` varchar(50) default NULL,
  `JOINING_DATE` date default NULL,
  `QUALIFICATION` varchar(50) default NULL,
  `EMAIL_ID` varchar(50) default NULL,
  `MOBILE_NO` varchar(50) default NULL,
  `COLLEGE_ID` varchar(50) default NULL,
  `COLLEGE_NAME` varchar(50) default NULL,
  `COURSE_ID` bigint(50) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `SUBJECT_ID` bigint(50) default NULL,
  `SUBJECT_NAME` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATE_TIME` timestamp NULL default NULL,
  `MODIFIED_DATE_TIME` timestamp NULL default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_faculty` */

insert  into `st_faculty`(`ID`,`FIRST_NAME`,`LAST_NAME`,`GENDER`,`JOINING_DATE`,`QUALIFICATION`,`EMAIL_ID`,`MOBILE_NO`,`COLLEGE_ID`,`COLLEGE_NAME`,`COURSE_ID`,`COURSE_NAME`,`SUBJECT_ID`,`SUBJECT_NAME`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,'Ankit','Jain','Male','2017-05-11','Graduate','ajain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:41:37','2021-09-23 17:12:54'),
(2,'Priya','Jain','Male','2017-05-11','Graduate','pjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:41:46','2021-09-23 17:13:11'),
(3,'Sourabh','Jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:41:51','2021-09-23 17:13:26'),
(4,'Aryan','Jain','Male','2017-05-11','Graduate','ajain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:41:57','2021-09-23 17:13:45'),
(5,'Shyam','Jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:42:03','2021-09-23 17:14:01'),
(6,'Neelam','Jain','Male','2017-05-11','Graduate','njain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:42:12','2021-09-23 17:14:19'),
(7,'Sandhya','Jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:42:19','2021-09-23 17:14:36'),
(8,'Neeraj','Bhadoriya','Male','2017-05-11','Graduate','njain@gmail.com','9898989897','7','Astral',3,'CA',7,'English','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:42:25','2021-09-24 02:35:35'),
(9,'vipin','Mishra','Male','2021-05-12','Graduate','vmishra@gmail.com','9565656543','11','NRI',2,'BE',6,'Tocs','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:03:45','2021-09-23 17:15:17'),
(13,'Ankit','Sharma','Male','2022-12-12','Graduate','akas3e3h@gmail.com','9399502158','6','Prestige',14,'MA',4,'Networking','asolanki@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:06:35','2020-12-19 01:06:35'),
(15,'Kajal','Solanki','Male','2022-12-12','Graduate','akas3e3h@gmail.com','9399502159','6','Prestige',14,'MA',4,'Networking','asolanki@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:07:17','2020-12-19 01:07:17'),
(16,'Arun','Singh','Male','2020-11-05','Commerce','asingh@gmail.com','8785962333','10','Rnjeet Sing',8,'BBA',7,'English','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:17:30','2021-09-23 17:17:30');

/*Table structure for table `st_marksheet` */

DROP TABLE IF EXISTS `st_marksheet`;

CREATE TABLE `st_marksheet` (
  `ID` bigint(20) NOT NULL,
  `ROLL_NO` varchar(255) default NULL,
  `STUDENT_ID` bigint(20) default NULL,
  `NAME` varchar(255) default NULL,
  `PHYSICS` int(11) default NULL,
  `CHEMISTRY` int(11) default NULL,
  `MATHS` int(11) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fk_STUDENT_ID_idx` (`STUDENT_ID`),
  CONSTRAINT `fk_STUDENT_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_marksheet` */

insert  into `st_marksheet`(`ID`,`ROLL_NO`,`STUDENT_ID`,`NAME`,`PHYSICS`,`CHEMISTRY`,`MATHS`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values 
(2,'01IT02',3,'Ashish Nehra',89,75,88,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 16:13:21','2021-09-24 16:13:21'),
(3,'01IT03',2,'Manish Sharma',87,72,80,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 16:21:20','2021-09-24 16:21:20'),
(4,'01IT04',15,'Pankaj Sahu',69,84,73,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 16:21:45','2021-09-24 16:21:45'),
(5,'01IT05',13,'Bhavesh Mathur',87,54,86,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 00:56:05','2021-09-25 00:56:05'),
(6,'01IT01',23,'Abhi Gaur',28,30,32,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 00:56:48','2021-09-25 00:56:48'),
(7,'01IT06',19,'Harry Potter',68,33,87,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 00:57:39','2021-09-25 00:57:39'),
(8,'01IT07',22,'Hemant Sharma',56,87,95,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:13:40','2021-09-25 01:13:40'),
(9,'01IT08',14,'Ishan Shrivastava',87,85,86,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:13:59','2021-09-25 01:13:59'),
(10,'01IT09',21,'Kamlesh Modi',20,37,25,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:14:33','2021-09-25 01:14:33'),
(11,'01IT10',2,'Manish Sharma',95,97,93,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:15:37','2021-09-25 01:15:37'),
(12,'01IT11',6,'Mohan Lal',65,84,72,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:16:09','2021-09-25 01:16:09'),
(13,'01IT12',24,'Neel Nitin',97,84,67,'asolanki@gmail.com','asolanki@gmail.com','2021-09-25 01:16:34','2021-09-25 01:16:34');

/*Table structure for table `st_role` */

DROP TABLE IF EXISTS `st_role`;

CREATE TABLE `st_role` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_DATETIME` timestamp NULL default CURRENT_TIMESTAMP,
  `MODIFIED_DATETIME` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `NAME_IDX` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_role` */

insert  into `st_role`(`ID`,`NAME`,`DESCRIPTION`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values 
(1,'Admin','Administrator Role','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:13:36','2014-07-19 17:13:36'),
(2,'Student','Student Role Test','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:19:09','2014-07-22 18:59:16'),
(3,'College','College Role','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:19:30','2014-07-19 17:19:30'),
(4,'KIOSK','KIOSK Role','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:19:48','2014-09-02 17:04:22'),
(5,'House Keeping','House Keeping Staff','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(6,'Manager','Manager','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(7,'Transport','Transport','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 22:57:59','2021-09-23 22:57:59'),
(8,'Tempory Lecturar','Tempory Lecturar','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:04:02','2021-09-23 17:04:02'),
(9,'Marketing','Marketing Staff','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 22:51:58','2021-09-23 22:51:58'),
(10,'Sports','Sports','asolanki@gmail.com',NULL,'2021-09-24 15:07:48','0000-00-00 00:00:00'),
(11,'Health','Health','asolanki@gmail.com',NULL,'2021-09-24 15:08:05','0000-00-00 00:00:00'),
(12,'Entertainment','Entertainment','asolanki@gmail.com',NULL,'2021-09-24 15:08:24','0000-00-00 00:00:00');

/*Table structure for table `st_student` */

DROP TABLE IF EXISTS `st_student`;

CREATE TABLE `st_student` (
  `ID` bigint(50) NOT NULL,
  `COLLEGE_ID` bigint(50) default NULL,
  `COLLEGE_NAME` varchar(50) default NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `DATE_OF_BIRTH` date default NULL,
  `MOBILE_NO` varchar(50) default NULL,
  `EMAIL` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATE_TIME` timestamp NULL default CURRENT_TIMESTAMP,
  `MODIFIED_DATE_TIME` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_student` */

insert  into `st_student`(`ID`,`COLLEGE_ID`,`COLLEGE_NAME`,`FIRST_NAME`,`LAST_NAME`,`DATE_OF_BIRTH`,`MOBILE_NO`,`EMAIL`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,1,'Truba','Ajay','Singh','2000-01-01','9087654567','ajay@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-10-31 18:17:42','2020-10-31 18:17:42'),
(2,1,'LNCT','Ankit','Singh','2000-01-01','9087654567','Ankit@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-10-31 18:18:58','2020-10-31 18:18:58'),
(4,2,'Aurobindo','Ajay','Mishra','1990-11-19','9898989890','mayankmishra661@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-11-04 14:17:59','2020-11-19 16:31:16'),
(6,5,'MGM','Shyam','Sunder','2020-11-24','9989898989','mayankmishra666@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-11-23 17:58:52','2020-11-23 17:58:57'),
(7,2,'Gujrati','Paras','Mishra','1994-11-09','9898989899','Paras@GMAIL.COM','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:50:27','2020-11-24 22:50:27'),
(8,2,'Gujrati','Shivam','Dubey','1994-11-09','9898989899','Shivam@GMAIL.COM','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:50:27','2020-11-24 22:50:54'),
(9,2,'Gujrati','Arpit','Dubey','1994-11-09','9898989899','Arpit@GMAIL.COM','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:50:27','2020-11-24 22:51:12'),
(10,2,'Gujrati','Shri','Dubey','1994-11-09','9898989899','Shri@GMAIL.COM','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:50:27','2020-11-24 22:51:26'),
(11,5,'SOFTVISION','Sonam','Jain','1989-11-08','9898989899','deechavhan.098@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:07'),
(12,5,'SOFTVISION','Shristi','Jain','1989-11-08','9898989899','sxsx098@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:16'),
(13,5,'SOFTVISION','Ankit','Singh','1989-11-08','9898989899','sxsxWSWXS8@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:21');

/*Table structure for table `st_subject` */

DROP TABLE IF EXISTS `st_subject`;

CREATE TABLE `st_subject` (
  `ID` bigint(50) NOT NULL,
  `SUBJECT_NAME` varchar(50) default NULL,
  `DESCRIPTION` varchar(50) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `COURSE_ID` bigint(50) default NULL,
  `SUBJECT_ID` bigint(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATE_TIME` timestamp NULL default CURRENT_TIMESTAMP,
  `MODIFIED_DATE_TIME` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_subject` */

insert  into `st_subject`(`ID`,`SUBJECT_NAME`,`DESCRIPTION`,`COURSE_NAME`,`COURSE_ID`,`SUBJECT_ID`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,'Complier','Complier','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:37:58'),
(2,'Micro','Micro','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:38:04'),
(3,'DBMS','DBMS','M.tech',11,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-25 23:31:19'),
(4,'Networking','Networking','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-27 15:53:04'),
(5,'CSO','CSO','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:38:29'),
(7,'English','English','BBA',8,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:09'),
(8,'Hindi','Hindi','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:15'),
(9,'Botany','Science Subject','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:32:27','2021-09-24 02:32:27'),
(10,'Maths','Engineering','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:24:47','2021-09-23 17:24:47'),
(11,'Sanskrit','Sanskrit','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:31'),
(12,'AWS','AWS','PHD',12,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:39:53','2020-11-24 21:39:55'),
(13,'Hadoop','Hadoop','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:13:48'),
(14,'Data Science','Data Science','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:13:54'),
(15,'Python','Python','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:14:10'),
(17,'Micro Processor','Micro Processor','PHD',12,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:37:04','2021-09-23 17:37:04'),
(18,'CCNA','Networking','M.tech',11,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:38:57','2021-09-23 17:38:57');

/*Table structure for table `st_timetable` */

DROP TABLE IF EXISTS `st_timetable`;

CREATE TABLE `st_timetable` (
  `ID` bigint(50) NOT NULL,
  `SUB_ID` bigint(50) default NULL,
  `SUB_NAME` varchar(50) default NULL,
  `COURSE_ID` bigint(50) default NULL,
  `COURSE_NAME` varchar(50) default NULL,
  `SEMESTER` varchar(50) default NULL,
  `EXAM_DATE` date default NULL,
  `EXAM_TIME` varchar(50) default NULL,
  `DESCRIPTION` varchar(50) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATE_TIME` timestamp NULL default CURRENT_TIMESTAMP,
  `MODIFIED_DATE_TIME` timestamp NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_timetable` */

insert  into `st_timetable`(`ID`,`SUB_ID`,`SUB_NAME`,`COURSE_ID`,`COURSE_NAME`,`SEMESTER`,`EXAM_DATE`,`EXAM_TIME`,`DESCRIPTION`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(2,2,'Maths',8,'MSC9','5','2022-01-11','3:00PM to 6:00PM','Maths','asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:43:43','2020-11-24 21:43:43'),
(6,5,'CSO',9,'B.pharma','3','2022-05-12','08:00 AM to 11:00 AM','CSO','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 00:59:47','2020-12-19 00:59:47'),
(7,4,'Networking',9,'B.pharma','2','2021-12-12','3:00PM to 6:00PM','Networking','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:00:48','2020-12-19 01:00:48'),
(8,7,'English',4,'B.tech','5','2021-10-12','3:00PM to 6:00PM','English','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:01:06','2020-12-19 01:01:06'),
(9,3,'DBMS',6,'BCA','7','2022-02-12','12:00PM to 3:00PM','DBMS','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:01:29','2020-12-19 01:01:29'),
(10,2,'Micro',5,'BSC','6','2022-04-12','08:00 AM to 11:00 AM','Micro','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:01:47','2020-12-19 01:01:47'),
(11,8,'Hindi',4,'B.tech','2','2022-05-12','12:00PM to 3:00PM','Hindi','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:02:08','2020-12-19 01:02:08'),
(13,4,'Networking',3,'CA','6','2021-12-12','12:00PM to 3:00PM','Networking','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 11:54:47','2021-09-24 02:38:03'),
(14,11,'Sanskrit',2,'BE','7','2021-10-12','3:00PM to 6:00PM','BE','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 11:55:40','2021-09-24 01:15:23'),
(15,12,'Urdu',13,'MBA','8','2021-11-12','3:00PM to 6:00PM','Urdu','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 21:39:59','2020-12-19 21:39:59'),
(16,9,'Nursing',13,'MBA','9','2022-01-12','3:00PM to 6:00PM','Nursing','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 21:40:20','2020-12-19 21:40:20'),
(17,10,'Maths',2,'BE','6','2021-12-12','08:00 AM to 11:00 AM','Maths','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 21:42:08','2020-12-19 21:42:08'),
(18,15,'Python',6,'BCA','5','2029-09-12','12:00PM to 3:00PM','Phython','asolanki@gmail.com','asolanki@gmail.com','2020-12-19 21:42:49','2020-12-19 21:42:49');

/*Table structure for table `st_user` */

DROP TABLE IF EXISTS `st_user`;

CREATE TABLE `st_user` (
  `ID` bigint(20) NOT NULL,
  `FIRST_NAME` varchar(255) default NULL,
  `LAST_NAME` varchar(255) default NULL,
  `LOGIN` varchar(255) default NULL,
  `PASSWORD` varchar(255) default NULL,
  `DOB` datetime default NULL,
  `MOBILE_NO` varchar(255) default NULL,
  `ROLE_ID` bigint(20) default NULL,
  `UNSUCCESSFULL_LOGIN` int(11) default NULL,
  `GENDER` varchar(255) NOT NULL,
  `LAST_LOGIN` datetime default NULL,
  `LOCK` varchar(255) default NULL,
  `REGISTERED_IP` varchar(255) default NULL,
  `LAST_LOGIN_IP` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_DATE_TIME` datetime default NULL,
  `MODIFIED_DATE_TIME` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fk_ROLE_ID_idx` (`ROLE_ID`),
  KEY `MOBILE_NO_IDX` (`MOBILE_NO`),
  KEY `FIRST_LAST_NAME_IDX` (`FIRST_NAME`,`LAST_NAME`),
  CONSTRAINT `fk_ROLE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `st_role` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_user` */

insert  into `st_user`(`ID`,`FIRST_NAME`,`LAST_NAME`,`LOGIN`,`PASSWORD`,`DOB`,`MOBILE_NO`,`ROLE_ID`,`UNSUCCESSFULL_LOGIN`,`GENDER`,`LAST_LOGIN`,`LOCK`,`REGISTERED_IP`,`LAST_LOGIN_IP`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATE_TIME`,`MODIFIED_DATE_TIME`) values 
(1,'Arvind','Solanki','asolanki@gmail.com','Solanki@123','2014-07-18 00:00:00','8120871155',1,0,'Male','2014-09-29 19:30:52','Inactive','0:0:0:0:0:0:0:1','192.168.1.17','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 17:39:20','2014-07-19 18:29:23'),
(5,'vipin','chandore','vipin.chandore1452@gmail.com','456','1991-08-08 00:00:00','9165254357',2,0,'F',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(9,'Ram','Verma','rverma@gmail.com','rr','2014-07-28 00:00:00','9999999999',2,0,'Male','2014-08-13 17:57:33','Inactive','192.168.1.12','192.168.1.12','asolanki@gmail.com','asolanki@gmail.com','2014-08-13 14:24:00','2014-08-13 14:24:00'),
(10,'Shubham','Sharma','ssharma@gmail.com','pp','2014-08-27 00:00:00','3544355436',2,0,'Male',NULL,'Inactive','192.168.1.12','192.168.1.12','asolanki@gmail.com','asolanki@gmail.com','2014-08-13 18:22:32','2014-08-13 18:22:32'),
(14,'Ranjeet','Singh','rsingh@gmail.com','rr','2014-08-14 00:00:00','9856565655',2,0,'Male',NULL,'Inactive','192.168.1.9','192.168.1.9','asolanki@gmail.com','asolanki@gmail.com','2014-08-26 19:45:42','2014-08-26 19:45:42'),
(15,'Rahul','sahu','rsahu@gmail.com','rr','2014-08-18 00:00:00','1656689852',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','asolanki@gmail.com','asolanki@gmail.com','2014-08-26 20:01:18','2014-08-26 20:01:42'),
(16,'Ranjana','choudhary','r@gmail.com','rr','1970-01-14 00:00:00','9456936545',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','asolanki@gmail.com','asolanki@gmail.com','2014-08-30 11:39:18','2014-08-30 12:23:40'),
(17,'Arpit','Sharma','asharma@gmail.com','rr','1995-08-14 00:00:00','8748596254',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','asolanki@gmail.com','asolanki@gmail.com','2014-08-30 11:45:31','2021-09-24 01:59:05'),
(18,'Vikas','Madhuwani','vmadhwani@gmail.com','rr','2014-08-14 00:00:00','9874546123',2,0,'F',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-08-30 12:30:40','2014-08-30 12:30:40'),
(19,'Prabal','Jain','pjain@gmail.com','pass1234','2014-09-01 00:00:00','9827360504',2,0,'M','2014-09-22 19:23:09','Inactive',NULL,'122.168.194.184','asolanki@gmail.com','asolanki@gmail.com','2014-09-01 13:34:16','2014-09-01 13:34:48'),
(20,'Lakhan','choudhary','lchoudhary@gmail.com','rr','2014-09-18 00:00:00',NULL,1,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-01 17:58:16','2014-09-01 18:41:20'),
(21,'Trinity','Toppo','tt@gmail.com','karisma123','1986-11-07 00:00:00','9827568186',1,0,'Male','2014-09-02 15:27:09','Inactive','','192.168.1.22','asolanki@gmail.com','asolanki@gmail.com','2014-09-01 19:50:04','2014-09-01 19:56:54'),
(22,'Pankaj','Sahu','psahu@gmail.com','123456','1986-11-07 00:00:00','9827568186',2,0,'Male','2014-09-02 16:55:49','Inactive','192.168.1.22','192.168.1.22','asolanki@gmail.com','asolanki@gmail.com','2014-09-01 20:00:44','2014-09-01 20:00:44'),
(25,'Mohammad','Imran','imranmohammed875@gmail.com','120891','1991-08-12 00:00:00','9981095676',2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-18 12:12:27','2014-09-18 12:12:27'),
(26,'Arif','Khan','khan123arif@gmail.com','newkhandon786','1985-05-08 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-21 15:48:58','2014-09-21 15:48:58'),
(27,'Richa','Trivedi','trivedi.richa88@gmail.com','123456','1988-01-27 00:00:00',NULL,2,0,'F',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-22 08:29:50','2014-09-22 08:29:50'),
(29,'Abhiraj Singh','Chouhan','abhiraj2201@gmail.com','abhiraj','1989-01-22 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-23 22:43:34','2014-09-23 22:43:34'),
(30,'Deepak','Prajapat','deepak.prajapat99@gmail.com','deepak','1992-09-23 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-24 16:07:16','2014-09-24 16:07:16'),
(31,'Asheesh','Patel','asheesh.patel@gmail.com','123456789','1990-01-11 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-26 12:19:03','2014-09-26 12:19:03'),
(32,'Shubham','Tiwari','shubhamtiwari@gmail.com','justbitit','2014-07-27 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-27 14:06:08','2014-09-27 14:06:08'),
(33,'Harsh','Dubey','hdubey29@gmail.com','124','1993-07-29 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2014-09-29 11:15:41','2014-09-29 11:15:41'),
(37,'jay','Jay','jay@gmail.com','pass1234','2014-09-03 00:00:00','9876543210',2,0,'Male',NULL,'Inactive','192.168.1.17','192.168.1.17','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:40:35','2014-09-29 19:40:35'),
(38,'Ananya','Pandey','dk@gmail.com','pass1234','2000-09-09 00:00:00','9876543210',2,0,'Male',NULL,'Inactive','192.168.1.17','192.168.1.17','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:41:43','2014-09-29 19:41:43'),
(39,'Mona','Singh','msingh@gmail.com','Msingh@123','1992-09-08 00:00:00','6985858585',6,0,'Female',NULL,NULL,NULL,NULL,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 05:25:40','2021-09-24 05:25:40');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `ID` bigint(20) NOT NULL,
  `COLLEGE_ID` bigint(20) default NULL,
  `COLLEGE_NAME` varchar(255) default NULL,
  `FIRST_NAME` varchar(255) default NULL,
  `LAST_NAME` varchar(255) default NULL,
  `DATE_OF_BIRTH` datetime default NULL,
  `MOBILE_NO` varchar(255) default NULL,
  `EMAIL` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `MODIFIED_BY` varchar(255) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`ID`,`COLLEGE_ID`,`COLLEGE_NAME`,`FIRST_NAME`,`LAST_NAME`,`DATE_OF_BIRTH`,`MOBILE_NO`,`EMAIL`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values 
(1,1,'SVITS','Rahul','Sahu','2014-07-17 00:00:00','999999','rahul@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:32','2014-08-25 17:27:32'),
(2,3,'SVIM','Manish','Sharma','2014-07-18 00:00:00','9999999999','manish@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-07-19 20:38:57','2014-08-25 17:27:29'),
(3,1,'SVITS','Ashish','Nehra','2014-06-30 00:00:00','999','ashish@nehra.com','asolanki@gmail.com','asolanki@gmail.com','2014-07-22 13:40:39','2014-08-25 17:27:26'),
(5,2,'Truba','Abhijeet','Jain','1986-11-20 00:00:00','95635265','ajain@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:23','2014-08-25 17:27:23'),
(6,1,'SVITS','Mohan','Lal','1986-11-20 00:00:00','9999999999','mohanlal@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:20','2014-08-25 17:27:20'),
(7,1,'SVITS','Rajesh','Sharma','1986-11-20 00:00:00','98565656565','rsharma@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:17','2014-08-25 17:27:17'),
(8,2,'Truba','Asha','choudhary','1986-11-20 00:00:00','9425496405','achoudhary@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:15','2014-08-25 17:27:15'),
(9,2,'Truba','Raju','Dholakiya','1991-12-05 00:00:00','123456789','rdholikya@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:12','2014-08-25 17:27:12'),
(10,1,'SVITS','Rajesh','Meena','1989-09-05 00:00:00','6874859625','rmeena@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-25 17:27:10','2021-09-24 02:00:19'),
(11,3,'SVIM','Rajkumar','Verma','2014-08-21 00:00:00','98956','rverma@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-23 11:44:21','2014-08-25 17:27:05'),
(12,1,'SVITS','Tarun','Kaushik','1991-08-15 00:00:00','9898','tkaushik@gmail.com','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(13,8,'RGTU','Bhavesh','Mathur','2014-08-29 00:00:00','235688466','bmathur@gmail.com','asolanki@gmail.com','asolanki@gmail.com',NULL,NULL),
(14,1,'SVITS','Ishan','Shrivastava','2014-08-20 00:00:00','5656565','ramkumar_choudhary1@yahoo.com','asolanki@gmail.com','asolanki@gmail.com','2014-08-23 12:32:32','2014-08-25 17:27:00'),
(15,8,'RGTU','Pankaj','Sahu','1986-11-07 00:00:00','9827568186','sahu.pankaj07@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-01 20:06:35','2014-09-02 15:27:45'),
(16,13,'LNCT','Ram','Gupta','2000-09-17 00:00:00','9876543210','ramgupta@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:24:50','2014-09-29 19:25:00'),
(17,13,'LNCT','Shyam','Gupta','1999-09-02 00:00:00','987654332','shyam@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:25:42','2014-09-29 19:25:42'),
(18,13,'LNCT','Prabal','Jain','2000-09-16 00:00:00','9876543210','pjain@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:27:16','2014-09-29 19:27:16'),
(19,13,'LNCT','Harry','Potter','2014-09-23 00:00:00','9876543210','hpotter@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:29:01','2014-09-29 19:29:01'),
(20,13,'LNCT','Pankaj','Verma','2014-09-17 00:00:00','9876543210','pverma@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:29:51','2014-09-29 19:29:51'),
(21,14,'GYAN GANGA','Kamlesh','Modi','2000-09-16 00:00:00','9876543210','kalesh@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:35:12','2014-09-29 19:35:12'),
(22,14,'GYAN GANGA','Hemant','Sharma','1998-09-23 00:00:00','9876543210','hemant@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:35:48','2014-09-29 19:35:48'),
(23,14,'GYAN GANGA','Abhi','Gaur','1996-09-15 00:00:00','9876543210','abhi@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:36:21','2014-09-29 19:36:21'),
(24,14,'GYAN GANGA','Neel','Nitin','1995-09-15 00:00:00','9876543210','neel@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:36:54','2014-09-29 19:36:54'),
(25,14,'GYAN GANGA','Rahul','Solanki','1995-09-04 00:00:00','9876543210','rahul@gmail.com','asolanki@gmail.com','asolanki@gmail.com','2014-09-29 19:37:30','2014-09-29 19:37:30');
