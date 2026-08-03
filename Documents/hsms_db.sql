/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - hsms_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hsms_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `hsms_db`;

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(10) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `classes` */

insert  into `classes`(`class_id`,`class_name`) values 
(1,'Class 1'),
(2,'Class 2'),
(3,'Class 3'),
(4,'Class 4'),
(5,'Class 5'),
(6,'Class 6'),
(7,'Class 7'),
(8,'Class 8'),
(9,'Class 9'),
(10,'Class 10');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(1) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `sections` */

insert  into `sections`(`section_id`,`section_name`) values 
(1,'A'),
(2,'B'),
(3,'C');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `guardian_name` varchar(255) DEFAULT NULL,
  `guardian_phone` varchar(15) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `blood_group` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `students` */

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `subject_code` (`subject_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `subjects` */

insert  into `subjects`(`subject_id`,`subject_name`,`subject_code`) values 
(1,'Mathematics','MATH101'),
(2,'Science','SCI201'),
(3,'English','ENG301'),
(4,'History','HIST401'),
(5,'ICT','ICT501'),
(6,'Bangla','BANGL601'),
(7,'Religion','RELIG701'),
(8,'Biology','BIO801'),
(9,'Physics','PHYS901'),
(10,'Chemistry','CHEM1001');

/*Table structure for table `teacher_designations` */

DROP TABLE IF EXISTS `teacher_designations`;

CREATE TABLE `teacher_designations` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(255) NOT NULL,
  PRIMARY KEY (`designation_id`),
  UNIQUE KEY `designation_name` (`designation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `teacher_designations` */

insert  into `teacher_designations`(`designation_id`,`designation_name`) values 
(5,'Counselor'),
(2,'Head Teacher'),
(3,'Instructor'),
(4,'Librarian'),
(1,'Principal');

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  KEY `designation_id` (`designation_id`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `teachers_ibfk_3` FOREIGN KEY (`designation_id`) REFERENCES `teacher_designations` (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `teachers` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('student','teacher','admin','accounts') NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`user_type`,`registration_date`) values 
(1,'Md. Nur A Alam','fiverr.com.nur@gmail.com','202cb962ac59075b964b07152d234b70','teacher','2023-10-06 17:57:40'),
(2,'MD.kayes','kayes.bd32@gmail.com','306241d400574f6fcee180eb1687b119','student','2023-10-06 20:09:53'),
(3,'Israt Jahan Risha','isratjahanrisha03@gmail.com','d3375f1855a388355c1b44e914f4c2ec','student','2023-10-06 20:10:18'),
(4,'Prapti Nandi','praptinandi19@gmail.com','23aa89ab63cbed7fd8844af75ce523da','student','2023-10-06 20:10:43'),
(5,'Md abdul high sharif','Sujohn379@gmail.com','000bb123d49929ff50572103511a1c72','student','2023-10-06 20:11:11'),
(6,'Mounota Islam','mounota638@gmail.com','dfc78177f9367ffd9fc0af527efbf385','student','2023-10-06 20:11:35'),
(7,'Dip Karmakar','rdip42810@gmail.com','e1fa039b68e258737e3e5f742b3e177b','student','2023-10-06 20:11:59'),
(8,'Mousumi Monera Khatun','ibnatrahmanrahman@gmail.com','ca46d540b00f7a1cbad97fad4c168858','student','2023-10-06 20:13:13'),
(9,'Mahin Reza','mahinreza333@gmail.com','e21642add94e50a744bcc60dd4b7ed19','student','2023-10-06 20:21:53'),
(10,'Sharifa Rahman Sweety ','sharifarahamnsweety@gmail.com','1d474077cce9818295929995f60c5c99','student','2023-10-06 20:22:14'),
(11,'Ifti Haque','ifti.baust.cse.020@gmail.com','2709023981e0111a3912d1f8e5b4fad9','student','2023-10-06 20:22:31'),
(12,'Md. Nihad Hossain','nihadgo75@gmail.com','4ee84762d9e4c1070a9fe1810717e1fc','student','2023-10-06 20:22:47'),
(13,'Most.Sadia parveen','sadiaparveensadia321@gmail.com','85590258530e10cb21d8745f2b9d606a','student','2023-10-06 20:23:08'),
(14,'Sk.Md Abir Hasan Imran','abirhashan16@gmail.com','b07770b3b43f421797a0dcb92ebb442a','student','2023-10-06 20:24:09'),
(15,'Shariful hasan mondal','sharifulhasan817@gmail.com','92c57b9a04797a1a09637b39adea8e4f','student','2023-10-06 20:24:22'),
(16,'MD Fahmid Foisal','foisalfahim032@gmail.com','6c3eea88cddda2c89466f81f2a854b9c','student','2023-10-06 20:24:39'),
(17,'Sumaiya islam suchi ','210201031sumaiyaislamsuchi@gmail.com','b0538760742874e109039e1eecf10980','student','2023-10-06 20:25:11'),
(18,'Rownak E Ikram','razor149876197@gmail.com','bfd53f3d627def131dfbded3c4a438f9','student','2023-10-06 20:26:04'),
(19,'Rayhan Sarkar Roman','roman59155@gmail.com','fc18ea4c094e1bd1a69b440e0217f041','student','2023-10-06 20:26:19'),
(20,'Fatema Tuj Zohora ','www.atmsfatema@gmail.com','cea83ce58abb068623283a30add97bd8','student','2023-10-06 20:28:17'),
(21,'Shadekujjaman Anik','shadekujjamananik@gmail.com','eee7f9134f8e199e87acac4af7e6f49e','student','2023-10-06 20:29:29'),
(22,'Harisa Mumtahena ','esitaakther143@gmail.com','4cd2b10b6072991539f8e01141206d79','student','2023-10-06 20:30:05'),
(23,'MD, NUR A ALAM','mdnuralam2812@gmail.com','7ac55335bf8e6f68487cdef1fad050c5','student','2023-10-06 20:30:26'),
(24,'Rakib Hasan Fahim ','rakibhasanfahim3@gmail.com','b0373c556cd303f46d2c1a5ce16d1e97','student','2023-10-06 20:30:43'),
(25,'Suraiya Akter Shorna','suraiyashorna67@gmail.com','c47b7dd921ff9ff518dde9e57a16b74d','student','2023-10-06 20:31:07'),
(26,'Seam Nur','seamnur@gmail.com','827ccb0eea8a706c4c34a16891f84e7b','admin','2023-10-07 01:18:43'),
(27,'Tasnimujjaman Tasin','tasnimujjamantasin@gmail.com','f80407c0e56ec16722578ac8084cb3b0','student','2023-10-07 02:18:11'),
(28,'Hasan Mohammad Kafi','kafi@gmail.com','827ccb0eea8a706c4c34a16891f84e7b','teacher','2023-10-07 04:01:02'),
(29,'Al Hasan','alhasan@gmail.com','827ccb0eea8a706c4c34a16891f84e7b','teacher','2023-10-07 04:08:56');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
