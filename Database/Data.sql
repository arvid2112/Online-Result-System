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
(1,'SVITS','Indore','MP','Indore','2555',NULL,NULL,NULL,NULL),
(2,'Truba','Indore','mp','Indore','999999',NULL,NULL,NULL,NULL),
(3,'SVIM','Gumasta Nagar','Madhya Pradesh','Indore','9999999999','Rahul Sahu','rahul.sahu@nenosystems.com','2014-07-19 17:42:17','2014-07-22 13:44:40'),
(5,'NIT BORAWAN','Indore Road Rau','Madhya Pradesh','Indore','8578485858','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:06:17','2021-09-24 02:06:17'),
(6,'IPS','Khandwa Road','M.P','Indore','9857485858','asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:09:41','2021-09-24 02:09:41'),
(7,'Astral','Indore','MP','Indore','9999999999','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-07-31 16:47:09','2014-07-31 16:47:09'),
(8,'RGTU','Bhopal','mp','Bhopal','23584645',NULL,NULL,NULL,NULL),
(9,'JIT','Indore','MP','Indore','999999999','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-09 17:11:55','2014-08-09 17:11:55'),
(11,'NRI','raysen','mp','bhopal','966465689889','null','rahul.sahu@nenosystems.com','2014-08-23 12:27:01','2014-08-23 12:29:02'),
(12,'test','pune','mh','opu','4567891234','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-09-04 19:32:05','2014-09-04 19:32:05'),
(13,'LNCT','INDORE','mp','Indore','9876543210','superadmin@gmail.com','superadmin@gmail.com','2014-09-29 19:22:28','2014-09-29 19:22:28'),
(14,'GYAN GANGA','JABALPUR','MP','JABALPUR','9876543210','superadmin@gmail.com','superadmin@gmail.com','2014-09-29 19:23:29','2014-09-29 19:23:29'),
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
(1,'B.com','Bachelor','4 year',NULL,NULL,'2020-11-04 12:34:14','2020-11-04 12:34:14'),
(2,'BE','Bachelor','4 year',NULL,NULL,'2020-11-04 12:36:00','2020-11-04 12:36:00'),
(3,'CA','Good','4Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-24 02:34:48','2021-09-24 02:34:48'),
(4,'B.tech','Engineering','4Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:19:33','2021-09-23 17:19:33'),
(5,'BSC','Science','3Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:19:53','2021-09-23 17:19:53'),
(6,'BCA','Computer Application','3Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:20:16','2021-09-23 17:20:16'),
(7,'MCA','Master of Computer Application','2Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:20:46','2021-09-23 17:20:46'),
(8,'BBA','Business','3Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:21:01','2021-09-23 17:21:01'),
(9,'B.pharma','Medical','4Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:21:15','2021-09-23 17:21:15'),
(10,'M.pharma','Master of Pharma','2Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:21:38','2021-09-23 17:21:38'),
(11,'M.tech','Master of Technology','2Year','mayankmishra661@gmail.com','asolanki@gmail.com','2021-09-23 17:22:05','2021-09-23 17:22:05'),
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
(1,'Ankit','jain','Male','2017-05-11','Graduate','ajain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:41:37','2021-09-23 17:12:54'),
(2,'Priya','jain','Male','2017-05-11','Graduate','pjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:41:46','2021-09-23 17:13:11'),
(3,'Sourabh','jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:41:51','2021-09-23 17:13:26'),
(4,'Aryan','jain','Male','2017-05-11','Graduate','ajain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:41:57','2021-09-23 17:13:45'),
(5,'Shyam','jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:42:03','2021-09-23 17:14:01'),
(6,'Neelam','jain','Male','2017-05-11','Graduate','njain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:42:12','2021-09-23 17:14:19'),
(7,'Sandhya','jain','Male','2017-05-11','Graduate','sjain@gmail.com','9898989897','7','Astral',3,'CA',8,'hindi','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:42:19','2021-09-23 17:14:36'),
(8,'Neeraj','Bhadoriya','Male','2017-05-11','Graduate','njain@gmail.com','9898989897','7','Astral',3,'CA',7,'English','mayankmishra661@gmail.com','asolanki@gmail.com','2020-11-24 21:42:25','2021-09-24 02:35:35'),
(9,'vipin','mishra','Male','2021-05-12','Graduate','vmishra@gmail.com','9565656543','11','NRI',2,'BE',6,'Tocs','mayankmishra661@gmail.com','asolanki@gmail.com','2020-12-19 01:03:45','2021-09-23 17:15:17'),
(13,'Ankitsad','sharma','Male','2022-12-12','Graduate','akas3e3h@gmail.com','9399502158','6','Prestige',14,'MA',4,'Networking','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:06:35','2020-12-19 01:06:35'),
(15,'kajal','sharma','Male','2022-12-12','Graduate','akas3e3h@gmail.com','9399502159','6','Prestige',14,'MA',4,'Networking','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:07:17','2020-12-19 01:07:17'),
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
(1,'01IT01',16,'RAM GUPTA',77,66,45,'ramgupta@gmail.com','ramgupta@gmail.com','2014-09-02 15:28:23',NULL),
(2,'01IT02',3,'AshishNehra',78,80,89,'superadmin@gmail.com','asolanki@gmail.com','2021-09-24 01:22:10','2021-09-24 01:22:10'),
(3,'01IT03',17,'shyam gupta',87,56,67,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:54:29','2014-09-29 20:54:29'),
(5,'01IT05',18,'mohan lnct',33,78,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:55:28','2014-09-29 20:55:28'),
(7,'01IT07',19,'hari lnct',56,89,78,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:56:33','2014-09-29 20:56:33'),
(9,'01IT09',20,'pankaj lnct',67,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:57:45','2014-09-29 20:57:45'),
(11,'01IT11',21,'kamlesh gyanganga',33,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:58:23','2014-09-29 20:58:23');

/*Table structure for table `st_marksheet_log` */

DROP TABLE IF EXISTS `st_marksheet_log`;

CREATE TABLE `st_marksheet_log` (
  `ID` bigint(20) NOT NULL,
  `ROLL_NO` varchar(15) default NULL,
  `STUDENT_ID` bigint(20) default NULL,
  `NAME` varchar(50) default NULL,
  `PHYSICS` int(11) default NULL,
  `CHEMISTRY` int(11) default NULL,
  `MATHS` int(11) default NULL,
  `CREATED_BY` varchar(50) default NULL,
  `MODIFIED_BY` varchar(50) default NULL,
  `CREATED_DATETIME` datetime default NULL,
  `MODIFIED_DATETIME` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `fk_ST_STUDENT_ID_idx` (`STUDENT_ID`),
  CONSTRAINT `fk_ST_STUDENT_ID` FOREIGN KEY (`STUDENT_ID`) REFERENCES `student` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_marksheet_log` */

insert  into `st_marksheet_log`(`ID`,`ROLL_NO`,`STUDENT_ID`,`NAME`,`PHYSICS`,`CHEMISTRY`,`MATHS`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values 
(9,'009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,'010',1,'test test',77,77,77,'test@gmail.com','test@gmail.com','2014-09-16 14:10:14',NULL),
(20,'0808cs101',16,'RAM GUPTA',77,66,45,'ramgupta@gmail.com','ramgupta@gmail.com','2014-09-02 15:28:23',NULL),
(21,'0808cs102',16,'RAM GUPTA',78,78,89,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:52:47','2014-09-29 20:54:01'),
(22,'0808cs103',17,'shyam gupta',87,56,67,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:54:29','2014-09-29 20:54:29'),
(23,'0808cs104',17,'shyam gupta',45,67,98,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:54:55','2014-09-29 20:54:55'),
(24,'0808cs105',18,'mohan lnct',33,78,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:55:28','2014-09-29 20:55:28'),
(25,'0808cs106',18,'mohan lnct',78,67,89,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:56:04','2014-09-29 20:56:04'),
(26,'0808cs107',19,'hari lnct',56,89,78,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:56:33','2014-09-29 20:56:33'),
(27,'0808cs108',19,'hari lnct',67,56,78,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:56:50','2014-09-29 20:56:50'),
(28,'0808cs109',20,'pankaj lnct',67,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:57:45','2014-09-29 20:57:45'),
(29,'0808cs110',20,'pankaj lnct',33,89,79,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:57:59','2014-09-29 20:57:59'),
(30,'0808cs111',21,'kamlesh gyanganga',33,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:58:23','2014-09-29 20:58:23'),
(31,'0808cs112',21,'kamlesh gyanganga',78,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:58:37','2014-09-29 20:58:37'),
(32,'0808cs113',21,'kamlesh gyanganga',78,78,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:58:51','2014-09-29 20:58:51'),
(33,'0808cs114',22,'hemant gyanganga',33,89,89,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:59:23','2014-09-29 20:59:23'),
(34,'0808cs115',22,'hemant gyanganga',45,56,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 20:59:36','2014-09-29 20:59:36'),
(35,'0808cs116',23,'abhi gyanganga',45,78,78,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 21:00:00','2014-09-29 21:00:00'),
(36,'0808cs117',23,'abhi gyanganga',33,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 21:00:23','2014-09-29 21:00:23'),
(37,'0808cs118',24,'neel gyanganga',78,78,79,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 21:00:50','2014-09-29 21:00:50'),
(38,'0808cs119',24,'neel gyanganga',67,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 21:01:16','2014-09-29 21:01:16'),
(39,'0808cs120',25,'rahul gyanganga',33,89,76,'superadmin@gmail.com','superadmin@gmail.com','2014-09-29 21:01:38','2014-09-29 21:01:38');

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
(1,'Admin','Administrator Role','Admin','Admin','2014-07-19 17:13:36','2014-07-19 17:13:36'),
(2,'Student','Student Role Test','Rahul Sahu','rahul.sahu@nenosystems.com','2014-07-19 17:19:09','2014-07-22 18:59:16'),
(3,'College','College Role','Rahul Sahu','Rahul Sahu','2014-07-19 17:19:30','2014-07-19 17:19:30'),
(4,'KIOSK','KIOSK Role','Rahul Sahu','pankaj.sahu@nenosystems.com','2014-07-19 17:19:48','2014-09-02 17:04:22'),
(5,'rrkkk','hh',NULL,NULL,NULL,NULL),
(6,'Manager','fgfg ffggffgfgf',NULL,NULL,NULL,NULL),
(7,'hh','Hello','rahul.sahu@nenosystems.com','asolanki@gmail.com','2021-09-23 22:57:59','2021-09-23 22:57:59'),
(8,'Tempory Lecturar','Tempory Lecturar','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:04:02','2021-09-23 17:04:02'),
(9,'Ban Gaya','Ban Gaya','asolanki@gmail.com','asolanki@gmail.com','2021-09-23 22:51:58','2021-09-23 22:51:58');

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
(1,1,'gacc','Ajay','Singh','2000-01-01','9087654567','ajay@gmail.com','admin','admin','2020-10-31 18:17:42','2020-10-31 18:17:42'),
(2,1,'gacc','Ankit','Singh','2000-01-01','9087654567','Ankit@gmail.com','admin','admin','2020-10-31 18:18:58','2020-10-31 18:18:58'),
(3,1,'gacc','Ankit','Singh','2000-01-01','9087654567','Ankit@gmail.com','admin','admin','2020-10-31 18:19:42','2020-10-31 18:19:42'),
(4,2,'Sgs','ajjay','mishra','1990-11-19','9898989890','mayankmishra661@gmail.com','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-04 14:17:59','2020-11-19 16:31:16'),
(6,5,'MGM','Shyam','s','2020-11-24','9989898989','mayankmishra666@gmail.com','mayankmishra666@gmail.com','mayankmishra666@gmail.com','2020-11-23 17:58:52','2020-11-23 17:58:57'),
(7,2,'Gujrati','paras','mishra','1994-11-09','9898989899','Paras@GMAIL.COM','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:50:27','2020-11-24 22:50:27'),
(8,2,'Gujrati','Shivam','Dubey','1994-11-09','9898989899','Shivam@GMAIL.COM','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:50:27','2020-11-24 22:50:54'),
(9,2,'Gujrati','Arpit','Dubey','1994-11-09','9898989899','Arpit@GMAIL.COM','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:50:27','2020-11-24 22:51:12'),
(10,2,'Gujrati','Shri','Dubey','1994-11-09','9898989899','Shri@GMAIL.COM','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:50:27','2020-11-24 22:51:26'),
(11,5,'SOFTVISION','Sonam','jain','1989-11-08','9898989899','deechavhan.098@gmail.com','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:07'),
(12,5,'SOFTVISION','Sonam','jain','1989-11-08','9898989899','sxsx098@gmail.com','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:16'),
(13,5,'SOFTVISION','Sonam','jain','1989-11-08','9898989899','sxsxWSWXS8@gmail.com','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 22:51:50','2020-11-24 22:52:21');

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
(1,'Complier','sas','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:37:58'),
(2,'Micro','sas','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:38:04'),
(3,'DBMS','sas','M.tech',11,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-25 23:31:19'),
(4,'Networking','sasffe','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-27 15:53:04'),
(5,'CSO','sas','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:38:29'),
(7,'English','sas','BBA',8,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:09'),
(8,'hindi','sas','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:15'),
(9,'Botany','Science Subject','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-24 02:32:27','2021-09-24 02:32:27'),
(10,'Maths','Engineering','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2021-09-23 17:24:47','2021-09-23 17:24:47'),
(11,'sanskrit','sas','B.pharma',9,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:37:58','2020-11-24 21:39:31'),
(12,'urdu','dwqd','PHD',12,0,'asolanki@gmail.com','asolanki@gmail.com','2020-11-24 21:39:53','2020-11-24 21:39:55'),
(13,'c','dcdcdc','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:13:48'),
(14,'c#','dcdcdc','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:13:54'),
(15,'Python','dcdcdc','B.tech',4,0,'asolanki@gmail.com','asolanki@gmail.com','2020-12-19 01:13:48','2020-12-19 01:14:10'),
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
(2,2,'Maths2',8,'MSC9','5','2022-01-11','3:00PM to 6:00PM','xx','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-11-24 21:43:43','2020-11-24 21:43:43'),
(6,5,'CSO',9,'B.pharma','3','2022-05-12','08:00 AM to 11:00 AM','fvdvdf','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 00:59:47','2020-12-19 00:59:47'),
(7,4,'Networking',9,'B.pharma','2','2021-12-12','3:00PM to 6:00PM','fvvfvfv','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:00:48','2020-12-19 01:00:48'),
(8,7,'English',4,'B.tech','5','2021-10-12','3:00PM to 6:00PM','fvfvfv','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:01:06','2020-12-19 01:01:06'),
(9,3,'DBMS',6,'BCA','7','2022-02-12','12:00PM to 3:00PM','fvfvfvdedede','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:01:29','2020-12-19 01:01:29'),
(10,2,'Micro',5,'BSC','6','2022-04-12','08:00 AM to 11:00 AM','eewedwedw','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:01:47','2020-12-19 01:01:47'),
(11,8,'hindi',4,'B.tech','2','2022-05-12','12:00PM to 3:00PM','eded323e','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 01:02:08','2020-12-19 01:02:08'),
(13,4,'Networking',3,'CA','6','2021-12-12','12:00PM to 3:00PM','Networking','mayankmishra661@gmail.com','asolanki@gmail.com','2020-12-19 11:54:47','2021-09-24 02:38:03'),
(14,11,'sanskrit',2,'BE','7','2021-10-12','3:00PM to 6:00PM','BE','mayankmishra661@gmail.com','asolanki@gmail.com','2020-12-19 11:55:40','2021-09-24 01:15:23'),
(15,12,'urdu',13,'MBA','8','2021-11-12','3:00PM to 6:00PM','mmmmm','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 21:39:59','2020-12-19 21:39:59'),
(16,9,'nursing',13,'MBA','9','2022-01-12','3:00PM to 6:00PM','jhjhjhj','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 21:40:20','2020-12-19 21:40:20'),
(17,10,'maths',2,'BE','6','2021-12-12','08:00 AM to 11:00 AM','iuiuiu','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 21:42:08','2020-12-19 21:42:08'),
(18,15,'Python',6,'BCA','5','2029-09-12','12:00PM to 3:00PM','mm','mayankmishra661@gmail.com','mayankmishra661@gmail.com','2020-12-19 21:42:49','2020-12-19 21:42:49');

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
(1,'Arvind','Solanki','asolanki@gmail.com','Solanki@123','2014-07-18 00:00:00','8120871155',1,0,'Male','2014-09-29 19:30:52','Inactive','0:0:0:0:0:0:0:1','192.168.1.17','Rahul Sahu','Rahul Sahu','2014-07-19 17:39:20','2014-07-19 18:29:23'),
(5,'vipin','chandore','vipin.chandore1452@gmail.com','456','1991-08-08 00:00:00','9165254357',2,0,'F',NULL,'Inactive',NULL,NULL,NULL,NULL,NULL,NULL),
(9,'Ram','Laxman','rr','rr','2014-07-28 00:00:00','9999999999',2,0,'Male','2014-08-13 17:57:33','Inactive','192.168.1.12','192.168.1.12','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-13 14:24:00','2014-08-13 14:24:00'),
(10,'kjk','pp','pp','pp','2014-08-27 00:00:00','3544355436',2,0,'Male',NULL,'Inactive','192.168.1.12','192.168.1.12','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-13 18:22:32','2014-08-13 18:22:32'),
(14,'ranjit','rr','k@g.co','rr','2014-08-14 00:00:00','9856565655',2,0,'Male',NULL,'Inactive','192.168.1.9','192.168.1.9','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-26 19:45:42','2014-08-26 19:45:42'),
(15,'rkj','ghgh','rahul.sahu12@nenosystems.com','rr','2014-08-18 00:00:00','1656689852',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','','','2014-08-26 20:01:18','2014-08-26 20:01:42'),
(16,'ranjit','choudhary','r@gmail.com','rr','1970-01-14 00:00:00','9456936545',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-30 11:39:18','2014-08-30 12:23:40'),
(17,'ranjit','choudhary','ranjitchoudhary210@gmail.com','rr','1995-08-14 00:00:00','8748596254',2,0,'Male',NULL,'Inactive','192.168.1.13','192.168.1.13','rahul.sahu@nenosystems.com','asolanki@gmail.com','2014-08-30 11:45:31','2021-09-24 01:59:05'),
(18,'ranjit','rr','a@g.co','rr','2014-08-14 00:00:00','9874546123',2,0,'F',NULL,'Inactive',NULL,NULL,'root','root','2014-08-30 12:30:40','2014-08-30 12:30:40'),
(19,'Sunil','Sahu','sunil.sahu@nenosystems.com','pass1234','2014-09-01 00:00:00','9827360504',2,0,'M','2014-09-22 19:23:09','Inactive',NULL,'122.168.194.184','root','root','2014-09-01 13:34:16','2014-09-01 13:34:48'),
(20,'ranjit','choudhary','ranjitchoudhary20@gmail.com','rr','2014-09-18 00:00:00',NULL,1,0,'M',NULL,'Inactive',NULL,NULL,'root','rahul.sahu@nenosystems.com','2014-09-01 17:58:16','2014-09-01 18:41:20'),
(21,'Pankaj','Sahu','pankaj.sahu@nenosystems.com','karisma123','1986-11-07 00:00:00','9827568186',1,0,'Male','2014-09-02 15:27:09','Inactive','','192.168.1.22','root','rahul.sahu@nenosystems.com','2014-09-01 19:50:04','2014-09-01 19:56:54'),
(22,'pankaj','sahu','sahu.pankaj07@gmail.com','123456','1986-11-07 00:00:00','9827568186',2,0,'Male','2014-09-02 16:55:49','Inactive','192.168.1.22','192.168.1.22','','','2014-09-01 20:00:44','2014-09-01 20:00:44'),
(23,'MP','Online','ksahu044@gmail.com','123456','2010-02-11 00:00:00','9827568186',4,0,'M',NULL,'Inactive',NULL,NULL,'root','pankaj.sahu@nenosystems.com','2014-09-02 17:11:19','2014-09-02 17:15:58'),
(24,'test','test','test@gmail.com','pass1234','2014-09-03 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-04 19:17:46','2014-09-04 19:17:51'),
(25,'mohammed','imran','imranmohammed875@gmail.com','120891','1991-08-12 00:00:00','9981095676',2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-18 12:12:27','2014-09-18 12:12:27'),
(26,'arif','khan','khan123arif@gmail.com','newkhandon786','1985-05-08 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-21 15:48:58','2014-09-21 15:48:58'),
(27,'richa','trivedi','trivedi.richa88@gmail.com','123456','1988-01-27 00:00:00',NULL,2,0,'F',NULL,'Inactive',NULL,NULL,'root','root','2014-09-22 08:29:50','2014-09-22 08:29:50'),
(29,'Abhiraj Singh','Chouhan','abhiraj2201@gmail.com','abhiraj','1989-01-22 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-23 22:43:34','2014-09-23 22:43:34'),
(30,'Deepak','Prajapat','deepak.prajapat99@gmail.com','deepak','1992-09-23 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-24 16:07:16','2014-09-24 16:07:16'),
(31,'Asheesh','Patel','asheesh.patel@gmail.com','123456789','1990-01-11 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-26 12:19:03','2014-09-26 12:19:03'),
(32,'shubham','tiwari','shubhamtiwari@gmail.com','justbitit','2014-07-27 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-27 14:06:08','2014-09-27 14:06:08'),
(33,'harsh','dubey','hdubey29@gmail.com','124','1993-07-29 00:00:00',NULL,2,0,'M',NULL,'Inactive',NULL,NULL,'root','root','2014-09-29 11:15:41','2014-09-29 11:15:41'),
(35,'superadmin','superadmin','superadmin@gmail.com','pass1234','2000-09-24 00:00:00','9876543210',1,0,'Male','2014-09-29 19:42:47','Inactive','192.168.1.17','192.168.1.17','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-09-29 19:14:10',NULL),
(36,'admin','admin','admin@gmail.com','pass1234','2000-09-24 00:00:00','9876543210',1,0,'Male','2014-09-29 19:34:18','Inactive','192.168.1.17','192.168.1.17','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-09-29 19:14:10',NULL),
(37,'jay','jay','jay@gmail.com','pass1234','2014-09-03 00:00:00','9876543210',2,0,'Male',NULL,'Inactive','192.168.1.17','192.168.1.17','superadmin@gmail.com','superadmin@gmail.com','2014-09-29 19:40:35','2014-09-29 19:40:35'),
(38,'dk','pandey','dk@gmail.com','pass1234','2000-09-09 00:00:00','9876543210',2,0,'Male',NULL,'Inactive','192.168.1.17','192.168.1.17','superadmin@gmail.com','superadmin@gmail.com','2014-09-29 19:41:43','2014-09-29 19:41:43'),
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
  PRIMARY KEY  (`ID`),
  KEY `MOBILE_NO_IDX` (`MOBILE_NO`),
  KEY `fk_COLLEGE_ID_idx` (`COLLEGE_ID`),
  KEY `FIRST_LAST_NAME_IDX` (`FIRST_NAME`,`LAST_NAME`),
  CONSTRAINT `fk_COLLEGE_ID` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `st_college` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`ID`,`COLLEGE_ID`,`COLLEGE_NAME`,`FIRST_NAME`,`LAST_NAME`,`DATE_OF_BIRTH`,`MOBILE_NO`,`EMAIL`,`CREATED_BY`,`MODIFIED_BY`,`CREATED_DATETIME`,`MODIFIED_DATETIME`) values 
(1,1,'SVITS','Rahul','Sahu','2014-07-17 00:00:00','999999','ram@gmail.com','Rahul Sahu','rahul.sahu@nenosystems.com','2014-08-25 17:27:32','2014-08-25 17:27:32'),
(2,3,'SVIM','Manish','Sharma','2014-07-18 00:00:00','9999999999','manish@gmail.com','Rahul Sahu','rahul.sahu@nenosystems.com','2014-07-19 20:38:57','2014-08-25 17:27:29'),
(3,1,'SVITS','Ashish','Nehra','2014-06-30 00:00:00','999','ashish@nehra.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-07-22 13:40:39','2014-08-25 17:27:26'),
(5,2,'Truba','hfghhfg','fgd','1986-11-20 00:00:00','95635265','5@g.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-25 17:27:23','2014-08-25 17:27:23'),
(6,1,'SVITS','mohan','lal','1986-11-20 00:00:00','9999999999','R@f.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-25 17:27:20','2014-08-25 17:27:20'),
(7,1,'SVITS','rajesh','sharma','1986-11-20 00:00:00','98565656565','55@g.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-25 17:27:17','2014-08-25 17:27:17'),
(8,2,'Truba','t','choudhary','1986-11-20 00:00:00','9425496405','t@g.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-25 17:27:15','2014-08-25 17:27:15'),
(9,2,'Truba','raju','mali','1991-12-05 00:00:00','123456789','b@gmail.com','rahul.sahu@nenosystems.com','rahul.sahu@nenosystems.com','2014-08-25 17:27:12','2014-08-25 17:27:12'),
(10,1,'SVITS','Rajesh','Meena','1989-09-05 00:00:00','6874859625','a@g.co','rahul.sahu@nenosystems.com','asolanki@gmail.com','2014-08-25 17:27:10','2021-09-24 02:00:19')