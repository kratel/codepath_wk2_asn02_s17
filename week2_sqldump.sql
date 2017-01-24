-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.19-MariaDB

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'United States','US'),(2,'Canada','CA'),(6,'Neverland','PPLOST');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salespeople`
--

DROP TABLE IF EXISTS `salespeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salespeople` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salespeople`
--

LOCK TABLES `salespeople` WRITE;
/*!40000 ALTER TABLE `salespeople` DISABLE KEYS */;
INSERT INTO `salespeople` VALUES (1,'Daron','Burke','555-925-3685','dburke@salesperson.com'),(2,'Sherry','Trevino','555-435-1036','strevino@salesperson.com'),(3,'Irene','Boling','555-736-2301','iboling@salesperson.com'),(4,'Robert','Hamilton','555-866-6131','rhamilton@salesperson.com'),(5,'R\'obin','Barker','555-352-9654','kbarker@salesperson.com'),(6,'Elizabeth','Olson','555-532-3209','eolson@salesperson.com'),(7,'Samuel','Hunter','555-682-7543','shunter@salesperson.com'),(8,'Kim','Stanley','555-302-7805','kstanley@salesperson.com'),(9,'Barbara','Hinckley','555-437-1355','bhinckley@salesperson.com'),(10,'R\'obin','H\'ood','(718)450-1234','rhood-num@sales.com'),(11,'Mi\'key','Cri\'key Rat','(614)123-456','rat@sales.com'),(12,'Short Stay\'n','Shhh','(123)456-7890','short@sales.com'),(13,'Short','shortest St\'ynNew','(614)123-8976','shortest@sales.com');
/*!40000 ALTER TABLE `salespeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salespeople_territories`
--

DROP TABLE IF EXISTS `salespeople_territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salespeople_territories` (
  `territory_id` int(11) DEFAULT NULL,
  `salesperson_id` int(11) DEFAULT NULL,
  KEY `territory_id` (`territory_id`),
  KEY `salesperson_id` (`salesperson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salespeople_territories`
--

LOCK TABLES `salespeople_territories` WRITE;
/*!40000 ALTER TABLE `salespeople_territories` DISABLE KEYS */;
INSERT INTO `salespeople_territories` VALUES (1,1),(2,4),(3,3),(4,6),(5,4),(6,2),(7,3),(8,9),(9,9),(10,1),(11,1),(12,3),(13,3),(14,2),(15,5),(16,7),(17,5),(18,8),(19,7),(20,6),(21,9),(22,9),(24,7),(25,5),(26,1),(27,1),(28,5),(29,3),(30,8),(31,2),(32,3),(33,9),(34,9),(35,2),(36,3),(38,9),(39,1),(40,8),(41,7),(42,6),(43,4),(44,7),(45,2),(46,9),(47,1),(48,8),(49,1),(50,6),(51,3),(52,9),(53,2),(54,1),(55,4),(56,7),(57,5),(58,3),(37,9),(37,2),(59,4),(60,7),(61,5),(62,9);
/*!40000 ALTER TABLE `salespeople_territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_terr_ref`
--

DROP TABLE IF EXISTS `state_terr_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_terr_ref` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `occupied` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `fips_state` varchar(255) DEFAULT NULL,
  `assoc_press` varchar(255) DEFAULT NULL,
  `standard_federal_region` varchar(255) DEFAULT NULL,
  `census_region` varchar(255) DEFAULT NULL,
  `census_region_name` varchar(255) DEFAULT NULL,
  `census_division` varchar(255) DEFAULT NULL,
  `census_division_name` varchar(255) DEFAULT NULL,
  `circuit_court` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_terr_ref`
--

LOCK TABLES `state_terr_ref` WRITE;
/*!40000 ALTER TABLE `state_terr_ref` DISABLE KEYS */;
INSERT INTO `state_terr_ref` VALUES (1,'Alabama','AL','USA','state',10,'current','occupied','','1','Ala.','IV','3','South','6','East South Central','11'),(2,'Alaska','AK','USA','state',10,'current','occupied','','2','Alaska','X','4','West','9','Pacific','9'),(3,'Arizona','AZ','USA','state',10,'current','occupied','','4','Ariz.','IX','4','West','8','Mountain','9'),(4,'Arkansas','AR','USA','state',10,'current','occupied','','5','Ark.','VI','3','South','7','West South Central','8'),(5,'California','CA','USA','state',10,'current','occupied','','6','Calif.','IX','4','West','9','Pacific','9'),(6,'Colorado','CO','USA','state',10,'current','occupied','','8','Colo.','VIII','4','West','8','Mountain','10'),(7,'Connecticut','CT','USA','state',10,'current','occupied','','9','Conn.','I','1','Northeast','1','New England','2'),(8,'Delaware','DE','USA','state',10,'current','occupied','','10','Del.','III','3','South','5','South Atlantic','3'),(9,'Florida','FL','USA','state',10,'current','occupied','','12','Fla.','IV','3','South','5','South Atlantic','11'),(10,'Georgia','GA','USA','state',10,'current','occupied','','13','Ga.','IV','3','South','5','South Atlantic','11'),(11,'Hawaii','HI','USA','state',10,'current','occupied','','15','Hawaii','IX','4','West','9','Pacific','9'),(12,'Idaho','ID','USA','state',10,'current','occupied','','16','Idaho','X','4','West','8','Mountain','9'),(13,'Illinois','IL','USA','state',10,'current','occupied','','17','Ill.','V','2','Midwest','3','East North Central','7'),(14,'Indiana','IN','USA','state',10,'current','occupied','','18','Ind.','V','2','Midwest','3','East North Central','7'),(15,'Iowa','IA','USA','state',10,'current','occupied','','19','Iowa','VII','2','Midwest','4','West North Central','8'),(16,'Kansas','KS','USA','state',10,'current','occupied','','20','Kan.','VII','2','Midwest','4','West North Central','10'),(17,'Kentucky','KY','USA','state',10,'current','occupied','','21','Ky.','IV','3','South','6','East South Central','6'),(18,'Louisiana','LA','USA','state',10,'current','occupied','','22','La.','VI','3','South','7','West South Central','5'),(19,'Maine','ME','USA','state',10,'current','occupied','','23','Maine','I','1','Northeast','1','New England','1'),(20,'Maryland','MD','USA','state',10,'current','occupied','','24','Md.','III','3','South','5','South Atlantic','4'),(21,'Massachusetts','MA','USA','state',10,'current','occupied','','25','Mass.','I','1','Northeast','1','New England','1'),(22,'Michigan','MI','USA','state',10,'current','occupied','','26','Mich.','V','2','Midwest','3','East North Central','6'),(23,'Minnesota','MN','USA','state',10,'current','occupied','','27','Minn.','V','2','Midwest','4','West North Central','8'),(24,'Mississippi','MS','USA','state',10,'current','occupied','','28','Miss.','IV','3','South','6','East South Central','5'),(25,'Missouri','MO','USA','state',10,'current','occupied','','29','Mo.','VII','2','Midwest','4','West North Central','8'),(26,'Montana','MT','USA','state',10,'current','occupied','','30','Mont.','VIII','4','West','8','Mountain','9'),(27,'Nebraska','NE','USA','state',10,'current','occupied','','31','Neb.','VII','2','Midwest','4','West North Central','8'),(28,'Nevada','NV','USA','state',10,'current','occupied','','32','Nev.','IX','4','West','8','Mountain','9'),(29,'New Hampshire','NH','USA','state',10,'current','occupied','','33','N.H.','I','1','Northeast','1','New England','1'),(30,'New Jersey','NJ','USA','state',10,'current','occupied','','34','N.J.','II','1','Northeast','2','Mid-Atlantic','3'),(31,'New Mexico','NM','USA','state',10,'current','occupied','','35','N.M.','VI','4','West','8','Mountain','10'),(32,'New York','NY','USA','state',10,'current','occupied','','36','N.Y.','II','1','Northeast','2','Mid-Atlantic','2'),(33,'North Carolina','NC','USA','state',10,'current','occupied','','37','N.C.','IV','3','South','5','South Atlantic','4'),(34,'North Dakota','ND','USA','state',10,'current','occupied','','38','N.D.','VIII','2','Midwest','4','West North Central','8'),(35,'Ohio','OH','USA','state',10,'current','occupied','','39','Ohio','V','2','Midwest','3','East North Central','6'),(36,'Oklahoma','OK','USA','state',10,'current','occupied','','40','Okla.','VI','3','South','7','West South Central','10'),(37,'Oregon','OR','USA','state',10,'current','occupied','','41','Ore.','X','4','West','9','Pacific','9'),(38,'Pennsylvania','PA','USA','state',10,'current','occupied','','42','Pa.','III','1','Northeast','2','Mid-Atlantic','3'),(39,'Rhode Island','RI','USA','state',10,'current','occupied','','44','R.I.','I','1','Northeast','1','New England','1'),(40,'South Carolina','SC','USA','state',10,'current','occupied','','45','S.C.','IV','3','South','5','South Atlantic','4'),(41,'South Dakota','SD','USA','state',10,'current','occupied','','46','S.D.','VIII','2','Midwest','4','West North Central','8'),(42,'Tennessee','TN','USA','state',10,'current','occupied','','47','Tenn.','IV','3','South','6','East South Central','6'),(43,'Texas','TX','USA','state',10,'current','occupied','','48','Texas','VI','3','South','7','West South Central','5'),(44,'Utah','UT','USA','state',10,'current','occupied','','49','Utah','VIII','4','West','8','Mountain','10'),(45,'Vermont','VT','USA','state',10,'current','occupied','','50','Vt.','I','1','Northeast','1','New England','2'),(46,'Virginia','VA','USA','state',10,'current','occupied','','51','Va.','III','3','South','5','South Atlantic','4'),(47,'Washington','WA','USA','state',10,'current','occupied','','53','Wash.','X','4','West','9','Pacific','9'),(48,'West Virginia','WV','USA','state',10,'current','occupied','','54','W.Va.','III','3','South','5','South Atlantic','4'),(49,'Wisconsin','WI','USA','state',10,'current','occupied','','55','Wis.','V','2','Midwest','3','East North Central','7'),(50,'Wyoming','WY','USA','state',10,'current','occupied','','56','Wyo.','VIII','4','West','8','Mountain','10'),(51,'Washington DC','DC','USA','capitol',10,'current','occupied','','11','','III','3','South','5','South Atlantic','D.C.'),(52,'Puerto Rico','PR','USA','commonwealth',20,'current','occupied','','72','','II','','','','','1'),(53,'U.S. Virgin Islands','VI','USA','territory',20,'current','occupied','','78','','II','','','','','3'),(54,'American Samoa','AS','USA','territory',20,'current','occupied','','60','','IX','','','','',''),(55,'Guam','GU','USA','territory',20,'current','occupied','','66','','IX','','','','','9'),(56,'Northern Mariana Islands','MP','USA','commonwealth',20,'current','occupied','','69','','IX','','','','','9'),(60,'Alberta','AB','Canada','province',30,'current','occupied','','','','','','','','',''),(61,'British Columbia','BC','Canada','province',30,'current','occupied','','','','','','','','',''),(62,'Manitoba','MB','Canada','province',30,'current','occupied','','','','','','','','',''),(63,'New Brunswick','NB','Canada','province',30,'current','occupied','','','','','','','','',''),(64,'Newfoundland and Labrador','NL','Canada','province',30,'current','occupied','','','','','','','','',''),(65,'Nova Scotia','NS','Canada','province',30,'current','occupied','','','','','','','','',''),(66,'Ontario','ON','Canada','province',30,'current','occupied','','','','','','','','',''),(67,'Prince Edward Island','PE','Canada','province',30,'current','occupied','','','','','','','','',''),(68,'Quebec','QC','Canada','province',30,'current','occupied','','','','','','','','',''),(69,'Saskatchewan','SK','Canada','province',30,'current','occupied','','','','','','','','',''),(70,'Northwest Territories','NT','Canada','territory',40,'current','occupied','','','','','','','','',''),(71,'Nunavut','NU','Canada','territory',40,'current','occupied','','','','','','','','',''),(72,'Yukon Territory','YT','Canada','territory',40,'current','occupied','','','','','','','','',''),(73,'Baker Island','','USA','minor',50,'current','unoccupied','Part of “US Minor Outlying Islands”','81','','','','','','',''),(74,'Howland Island','','USA','minor',51,'current','unoccupied','Part of “US Minor Outlying Islands”','84','','','','','','',''),(75,'Jarvis Island','','USA','minor',52,'current','unoccupied','Part of “US Minor Outlying Islands”','86','','','','','','',''),(76,'Johnston Atoll','','USA','minor',53,'current','unoccupied','Part of “US Minor Outlying Islands”','67','','','','','','',''),(77,'Midway Islands','','USA','minor',54,'current','unoccupied','Part of “US Minor Outlying Islands”','71','','','','','','',''),(78,'Wake Island','','USA','minor',55,'current','unoccupied','Part of “US Minor Outlying Islands”. Claimed by Marshall Islands.','79','','','','','','',''),(79,'Palmyra Atoll','','USA','minor',56,'current','occupied','Part of “US Minor Outlying Islands”. Owned and Managed by The Nature Conservatory','95','','','','','','',''),(80,'Kingman Reef','','USA','minor',57,'current','unoccupied','Part of “US Minor Outlying Islands”','89','','','','','','',''),(81,'Navassa Island','','USA','minor',58,'current','unoccupied','Part of “US Minor Outlying Islands”. Claimed by Haiti.','76','','','','','','',''),(82,'Serranilla Bank','','USA','minor',59,'current','occupied','Lighthouse is inhabited, but occupants are unknown','','','','','','','',''),(83,'Bajo Nuevo Bank','','USA','minor',60,'current','unoccupied','Disputed with Colombia.  Lighthouse possibly occupied.','','','','','','','','');
/*!40000 ALTER TABLE `state_terr_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Alabama','AL',1),(2,'Alaska','AK',1),(3,'Arizona','AZ',1),(4,'Arkansas','AR',1),(5,'California','CA',1),(6,'Colorado','CO',1),(7,'Connecticut','CT',1),(8,'Delaware','DE',1),(9,'Florida','FL',1),(10,'Georgia','GA',1),(11,'Hawaii','HI',1),(12,'Idaho','ID',1),(13,'Illinois','IL',1),(14,'Indiana','IN',1),(15,'Iowa','IA',1),(16,'Kansas','KS',1),(17,'Kentucky','KY',1),(18,'Louisiana','LA',1),(19,'Maine','ME',1),(20,'Maryland','MD',1),(21,'Massachusetts','MA',1),(22,'Michigan','MI',1),(23,'Minnesota','MN',1),(24,'Mississippi','MS',1),(25,'Missouri','MO',1),(26,'Montana','MT',1),(27,'Nebraska','NE',1),(28,'Nevada','NV',1),(29,'New Hampshire','NH',1),(30,'New Jersey','NJ',1),(31,'New Mexico','NM',1),(32,'New York','NY',1),(33,'North Carolina','NC',1),(34,'North Dakota','ND',1),(35,'Ohio','OH',1),(36,'Oklahoma','OK',1),(37,'Oregon','OR',1),(38,'Pennsylvania','PA',1),(39,'Rhode Island','RI',1),(40,'South Carolina','SC',1),(41,'South Dakota','SD',1),(42,'Tennessee','TN',1),(43,'Texas','TX',1),(44,'Utah','UT',1),(45,'Vermont','VT',1),(46,'Virginia','VA',1),(47,'Washington','WA',1),(48,'West Virginia','WV',1),(49,'Wisconsin','WI',1),(50,'Wyoming','WY',1),(51,'British Columbia','BC',2),(52,'Ontario','ON',2),(53,'Quebec','QC',2),(57,'Treasure Islands','TI',6);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `territories`
--

DROP TABLE IF EXISTS `territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `territories`
--

LOCK TABLES `territories` WRITE;
/*!40000 ALTER TABLE `territories` DISABLE KEYS */;
INSERT INTO `territories` VALUES (1,'Alabama',1,1),(2,'Alaska',2,1),(3,'Arizona',3,1),(4,'Arkansas',4,1),(5,'Northern California',5,1),(6,'Southern California',5,2),(7,'Colorado',6,1),(8,'Connecticut',7,1),(9,'Delaware',8,1),(10,'Florida',9,1),(11,'Georgia',10,1),(12,'Hawaii',11,1),(13,'Idaho',12,1),(14,'Chicago Metro',13,1),(15,'Outside Chicago',13,1),(16,'Indiana',14,1),(17,'Iowa',15,1),(18,'Kansas',16,1),(19,'Kentucky',17,1),(20,'Louisiana',18,1),(21,'Maine',19,1),(22,'Maryland',20,1),(23,'Massachusetts',21,1),(24,'Michigan',22,1),(25,'Minnesota',23,1),(26,'Mississippi',24,1),(27,'St. Louis Area',25,1),(28,'Kansas City Area',25,2),(29,'Montana',26,1),(30,'Nebraska',27,1),(31,'Las Vegas',28,1),(32,'Outside Las Vegas',28,1),(33,'New Hampshire',29,1),(34,'Northern New Jersey',30,1),(35,'Southern New Jersey',30,1),(36,'New Mexico',31,1),(37,'New York City',32,1),(38,'Outside New York City',32,1),(39,'North Carolina',33,1),(40,'North Dakota',34,1),(41,'Ohio',35,1),(42,'Oklahoma',36,1),(43,'Oregon',37,1),(44,'Western Pennsylvania',38,1),(45,'Eastern Pennsylvania',38,2),(46,'Rhode Island',39,1),(47,'South Carolina',40,1),(48,'South Dakota',41,1),(49,'Tennessee',42,1),(50,'Texas',43,1),(51,'Utah',44,1),(52,'Vermont',45,1),(53,'Northern Virginia',46,1),(54,'Southern Virginia',46,1),(55,'Washington',47,1),(56,'West Virginia',48,1),(57,'Wisconsin',49,1),(58,'Wyoming',50,1),(59,'British Columbia',51,1),(60,'Western Ontario',52,1),(61,'Eastern Ontario',52,2),(62,'Quebec',53,1),(65,'X Marks Ye\'Spot',57,2);
/*!40000 ALTER TABLE `territories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Larry','Fowler','lf@example.com','lfowler99','2016-06-01 08:15:45'),(3,'Brian','Salt','obsalt@user.com','obsalt','2017-01-22 17:47:04'),(5,'L\'ast','T\'est','fincrossed@user.com','forsinq','2017-01-22 17:56:22'),(11,'Test','Ing','testunique@user.com','obsalt_unique','2017-01-24 02:14:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-24 18:03:37
