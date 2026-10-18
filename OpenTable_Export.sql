-- MySQL dump 10.13  Distrib 8.4.8, for macos15 (arm64)
--
-- Host: localhost    Database: OpenTable
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alcoholType`
--

DROP TABLE IF EXISTS `alcoholType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcoholType` (
  `restID` int NOT NULL,
  `alcoholName` varchar(50) NOT NULL,
  PRIMARY KEY (`restID`,`alcoholName`),
  CONSTRAINT `alcohol_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcoholType`
--

LOCK TABLES `alcoholType` WRITE;
/*!40000 ALTER TABLE `alcoholType` DISABLE KEYS */;
INSERT INTO `alcoholType` VALUES (1,'Beer'),(1,'Wine'),(2,'Champagne'),(2,'White Wine'),(3,'Red Wine'),(3,'Whiskey'),(4,'Gin'),(4,'Vodka'),(5,'Mezcal'),(5,'Tequila'),(6,'Cognac'),(6,'Red Wine'),(7,'Sake'),(7,'Soju'),(8,'Prosecco'),(8,'Rum'),(9,'Beer'),(9,'Bourbon'),(10,'Margarita Base'),(10,'Tequila Shot');
/*!40000 ALTER TABLE `alcoholType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `restID` int NOT NULL,
  `awardName` varchar(100) NOT NULL,
  PRIMARY KEY (`restID`,`awardName`),
  CONSTRAINT `awards_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (2,'Michelin Star'),(7,'Top 50 US Restaurants'),(9,'Best NYC Dining'),(13,'Best Seafood Award'),(16,'Michelin Star'),(17,'Best Bay Area Dining'),(22,'Top Coastal Restaurant'),(27,'Chef Excellence Award'),(33,'Luxury Dining Award'),(46,'Michelin Star');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `cuisineID` int NOT NULL AUTO_INCREMENT,
  `cuisineName` varchar(50) NOT NULL,
  PRIMARY KEY (`cuisineID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES (1,'American'),(2,'Seafood'),(3,'Steakhouse'),(4,'Contemporary'),(5,'Tex-Mex'),(6,'French'),(7,'Californian'),(8,'Latin'),(9,'Italian'),(10,'BBQ'),(11,'Deli'),(12,'Asian Fusion'),(13,'Mexican'),(14,'Fusion'),(15,'Modern'),(16,'Fine Dining');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details` (
  `detailID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `execChef` varchar(100) DEFAULT NULL,
  `diningStyle` enum('Casual Dining','Fine Dining','Fast Casual','Upscale Casual','Family Style') DEFAULT NULL,
  `access` enum('Wheelchair Accessible','Not Accessible','Partially Accessible') DEFAULT NULL,
  `parkDetail` enum('Street Parking','Valet','Parking Lot','Garage','No Parking') DEFAULT NULL,
  `paymentOptions` enum('Cash Only','Credit Cards','Digital Wallet','All Payment Types') DEFAULT NULL,
  `dressCode` enum('Casual','Business Casual','Smart Casual','Formal','No Dress Code') DEFAULT NULL,
  `transit` varchar(100) DEFAULT NULL,
  `priceRange` enum('$','$$','$$$','$$$$') DEFAULT NULL,
  `neighborhood` varchar(50) DEFAULT NULL,
  `privateParty` enum('Available','Not Available','By Request') DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`detailID`),
  KEY `details_rest_fk` (`restID`),
  CONSTRAINT `details_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,1,'Marco Ruiz','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','CTA Nearby','$','Lincoln Park','Available','auroragrill.com'),(2,2,'Lena Park','Fine Dining','Wheelchair Accessible','Valet','All Payment Types','Formal','BART Nearby','$$$$','Fisherman Wharf','Available','blueharbor.com'),(3,3,'David Cole','Fine Dining','Wheelchair Accessible','Street Parking','All Payment Types','Business Casual','Metro Bus','$$$','South Beach','Not Available','sunsetsteak.com'),(4,4,'Emma Stone','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','Subway','$','Midtown','Available','urbantable.com'),(5,5,'Carlos Vega','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus Line','$','Downtown','Available','lonestareatery.com'),(6,6,'Hiro Tanaka','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$','River North','Available','lakefrontbistro.com'),(7,7,'Sofia Lin','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Smart Casual','BART','$$$$','SoMa','Available','goldengate.com'),(8,8,'Mateo Cruz','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Casual','Metro','$','Miami Beach','Available','oceanbreeze.com'),(9,9,'James Lee','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Manhattan','Available','manhattaneats.com'),(10,10,'Riley Adams','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinsmoke.com'),(11,11,'Anna Kim','Fast Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','CTA','$','Loop','Not Available','windycitydeli.com'),(12,12,'Marco Silva','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','BART','$$$','Mission','Available','bayfusion.com'),(13,13,'Isabella Rossi','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','Metro','$$$$','Brickell','Available','coralreef.com'),(14,14,'Ethan Brooks','Upscale Casual','Wheelchair Accessible','Street Parking','All Payment Types','Business Casual','Subway','$$','Upper East','Available','empiredining.com'),(15,15,'Noah Miller','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','South Congress','Available','hillcountrybbq.com'),(16,16,'Olivia Chen','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Magnificent Mile','Available','chicagoprime.com'),(17,17,'Daniel Kim','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','Embarcadero','Available','pacifictable.com'),(18,18,'Sophia Nguyen','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','South Beach','Available','miamispice.com'),(19,19,'William Scott','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Business Casual','Subway','$$','Central Park','Available','centralparkeats.com'),(20,20,'Lucas White','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinurbanbbq.com'),(21,21,'Mia Johnson','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','CTA','$','North Side','Not Available','northsidegrill.com'),(22,22,'Ethan Green','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','BART','$$$$','Bay Area','Available','sfcoastal.com'),(23,23,'Ava Davis','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','mianinights.com'),(24,24,'Noah Brown','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Midtown','Available','nyclassic.com'),(25,25,'Emma Wilson','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinflame.com'),(26,26,'Liam Thomas','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','CTA','$$$$','River North','Available','chicagoharbor.com'),(27,27,'Olivia Martinez','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Business Casual','BART','$$$','SoMa','Available','goldenspoon.com'),(28,28,'James Anderson','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','South Beach','Available','southbeachgrill.com'),(29,29,'Sophia Taylor','Casual Dining','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','Subway','$$','Brooklyn','Available','brooklyneats.com'),(30,30,'Ethan Clark','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','texasflamehouse.com'),(31,31,'Isabella Lewis','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Lakefront','Available','lakemichbistro.com'),(32,32,'Lucas Walker','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','SF Heights','Available','sfskyline.com'),(33,33,'Mia Hall','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Metro','$$$$','Miami Beach','Available','miamiluxe.com'),(34,34,'Daniel Allen','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Subway','$','Midtown','Available','nymidtown.com'),(35,35,'Ava Young','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','austinprime.com'),(36,36,'Noah King','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Business Casual','CTA','$$$','River North','Available','bistro77.com'),(37,37,'Emma Scott','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$$','SF Bay','Available','harboreats.com'),(38,38,'Liam Green','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','sunsetkitchen.com'),(39,39,'Olivia Baker','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$','Upper East','Available','eastsidetable.com'),(40,40,'James Nelson','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','southgrill.com'),(41,41,'Sophia Carter','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','CTA','$$$$','Riverfront','Available','riverdining.com'),(42,42,'Ethan Mitchell','Upscale Casual','Wheelchair Accessible','Garage','All Payment Types','Smart Casual','BART','$$$','SF Market','Available','markettable.com'),(43,43,'Mia Perez','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Formal','Metro','$$$$','Miami Beach','Available','oceanprime.com'),(44,44,'Lucas Rogers','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Subway','$','Midtown','Available','uptowngrill.com'),(45,45,'Emma Reed','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','riversmoke.com'),(46,46,'Noah Cook','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','CTA','$$$$','Gold Coast','Available','goldfork.com'),(47,47,'Ava Morgan','Upscale Casual','Wheelchair Accessible','Valet','All Payment Types','Smart Casual','BART','$$$','Bay Area','Available','bayviewgrill.com'),(48,48,'Liam Bell','Upscale Casual','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Metro','$','Miami Beach','Available','beachhouse.com'),(49,49,'Olivia Murphy','Fine Dining','Wheelchair Accessible','Garage','All Payment Types','Formal','Subway','$$$$','Manhattan','Available','grandtable.com'),(50,50,'James Bailey','Casual Dining','Wheelchair Accessible','Street Parking','Credit Cards','Casual','Bus','$','Austin','Available','legacybbq.com');
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkType`
--

DROP TABLE IF EXISTS `drinkType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinkType` (
  `restID` int NOT NULL,
  `drinkName` varchar(50) NOT NULL,
  PRIMARY KEY (`restID`,`drinkName`),
  CONSTRAINT `drink_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkType`
--

LOCK TABLES `drinkType` WRITE;
/*!40000 ALTER TABLE `drinkType` DISABLE KEYS */;
INSERT INTO `drinkType` VALUES (1,'Coke'),(1,'Lemonade'),(2,'Iced Tea'),(2,'Sparkling Water'),(3,'Club Soda'),(3,'Ginger Ale'),(4,'Cold Brew'),(4,'Espresso'),(5,'Horchata'),(5,'Jarritos'),(6,'Mint Tea'),(6,'Tea'),(7,'Green Tea'),(7,'Matcha'),(8,'Coconut Water'),(8,'Lime Soda'),(9,'Cola'),(9,'Root Beer'),(10,'Arnold Palmer'),(10,'Sweet Tea');
/*!40000 ALTER TABLE `drinkType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expDates`
--

DROP TABLE IF EXISTS `expDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expDates` (
  `expID` int NOT NULL,
  `dateName` date NOT NULL,
  PRIMARY KEY (`expID`,`dateName`),
  CONSTRAINT `expdate_exp_fk` FOREIGN KEY (`expID`) REFERENCES `experience` (`expID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expDates`
--

LOCK TABLES `expDates` WRITE;
/*!40000 ALTER TABLE `expDates` DISABLE KEYS */;
INSERT INTO `expDates` VALUES (1,'2026-02-01'),(1,'2026-02-02'),(2,'2026-02-10'),(2,'2026-02-11'),(3,'2026-03-01'),(3,'2026-03-02'),(4,'2026-03-15'),(4,'2026-03-16'),(5,'2026-04-01'),(5,'2026-04-02'),(6,'2026-04-10'),(6,'2026-04-11'),(7,'2026-05-01'),(7,'2026-05-02'),(8,'2026-05-10'),(8,'2026-05-11'),(9,'2026-06-01'),(9,'2026-06-02'),(10,'2026-06-10'),(10,'2026-06-11'),(11,'2026-07-01'),(11,'2026-07-02'),(12,'2026-07-10'),(12,'2026-07-11');
/*!40000 ALTER TABLE `expDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `expID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `partySize` int DEFAULT NULL,
  `description` text,
  `price` decimal(8,2) DEFAULT NULL,
  `prePaymentRequired` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`expID`),
  KEY `exp_rest_fk` (`restID`),
  CONSTRAINT `exp_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,2,'Ocean Tasting Experience',4,'Chef curated seafood journey',120.00,1),(2,4,'Rooftop Chef Table',2,'Exclusive skyline dining',150.00,1),(3,7,'Sushi Omakase',2,'Chef selection tasting',180.00,1),(4,9,'NYC Signature Experience',4,'Multi-course luxury menu',140.00,1),(5,13,'Coral Reef Feast',6,'Seafood banquet experience',160.00,1),(6,16,'Steak Masterclass Dinner',2,'Premium cuts tasting',170.00,1),(7,17,'Bay Sunset Experience',4,'Waterfront dining package',155.00,1),(8,22,'Pacific Tasting Menu',2,'High-end seafood course',190.00,1),(9,27,'Golden Spoon Chef Experience',4,'Modern tasting menu',175.00,1),(10,33,'Luxury Dining Event',2,'Fine dining curated menu',200.00,1),(11,41,'Riverfront Chef Table',4,'Exclusive river dining',165.00,1),(12,46,'Michelin Tasting Experience',2,'Award-winning chef menu',220.00,1);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `faqID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `question` text NOT NULL,
  `answer` text,
  PRIMARY KEY (`faqID`),
  KEY `faqs_rest_fk` (`restID`),
  CONSTRAINT `faqs_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,1,'Do you take reservations?','Yes, online only'),(2,1,'Parking available?','Street parking available'),(3,2,'Do you offer tasting menu?','Yes seasonal tasting menu'),(4,2,'Is seafood fresh?','Daily sourced'),(5,3,'Do you have valet?','Yes'),(6,3,'Dress code?','Business casual recommended'),(7,4,'Outdoor seating?','Yes rooftop available'),(8,4,'Vegetarian options?','Limited but available'),(9,5,'Do you offer catering?','Yes full service'),(10,6,'Is it kid friendly?','Yes'),(11,7,'Wine selection?','Extensive cellar'),(12,8,'Ocean view seating?','Yes'),(13,9,'Private dining?','Available'),(14,10,'Live music nights?','Weekends'),(15,11,'Takeout available?','Yes'),(16,12,'Is sushi available?','Yes fusion sushi'),(17,13,'Dress code?','Formal'),(18,14,'Parking?','Garage available'),(19,15,'BBQ smoked in-house?','Yes'),(20,16,'Michelin rating?','One star'),(21,17,'Seafood fresh?','Daily'),(22,18,'Outdoor seating?','Yes'),(23,19,'Reservations needed?','Recommended'),(24,20,'Spicy food level?','Customizable'),(25,21,'Do you accept walk-ins?','Yes limited seating'),(26,22,'Is this restaurant waterfront?','Yes bay view dining'),(27,23,'Do you have vegan options?','Yes small selection'),(28,24,'Do you offer private rooms?','Yes'),(29,25,'Is BBQ smoked onsite?','Yes traditional smoking'),(30,26,'Do you offer reservations?','Yes required on weekends'),(31,27,'Do you have tasting menu?','Yes seasonal chef menu'),(32,28,'Is outdoor seating available?','Yes patio seating'),(33,29,'Do you accept credit cards?','Yes all major cards'),(34,30,'Is parking available?','Street parking only'),(35,31,'Do you offer seafood specials?','Yes daily specials'),(36,32,'Is rooftop seating available?','Yes city views'),(37,33,'Do you have dress code?','Formal required'),(38,34,'Do you serve lunch?','Yes weekdays only'),(39,35,'Is BBQ spicy?','Custom spice levels available'),(40,36,'Do you offer catering?','Yes large events'),(41,37,'Is seafood fresh daily?','Yes locally sourced'),(42,38,'Do you have live music?','Weekend nights'),(43,39,'Do you offer private dining?','Yes limited rooms'),(44,40,'Is this restaurant family friendly?','Yes all ages welcome'),(45,41,'Do you have valet parking?','Yes available'),(46,42,'Is sushi on the menu?','Yes fusion sushi dishes'),(47,43,'Do you require reservations?','Recommended'),(48,44,'Do you have vegan options?','Yes curated menu'),(49,45,'Is BBQ wood smoked?','Yes traditional pits'),(50,46,'Do you have Michelin recognition?','Yes awarded'),(51,47,'Is waterfront seating available?','Yes full view'),(52,48,'Do you accept walk-ins?','Yes but limited'),(53,49,'Do you offer wine pairing?','Yes curated list'),(54,50,'Do you offer catering?','Yes full BBQ catering');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featuredIn`
--

DROP TABLE IF EXISTS `featuredIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featuredIn` (
  `restID` int NOT NULL,
  `featuredIName` varchar(100) NOT NULL,
  PRIMARY KEY (`restID`,`featuredIName`),
  CONSTRAINT `feat_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featuredIn`
--

LOCK TABLES `featuredIn` WRITE;
/*!40000 ALTER TABLE `featuredIn` DISABLE KEYS */;
INSERT INTO `featuredIn` VALUES (2,'NY Times Top Picks'),(7,'Food & Wine Best'),(9,'Forbes Dining List'),(13,'Travel + Leisure'),(16,'Michelin Guide'),(17,'Eater SF Top 10'),(22,'Gourmet Weekly'),(27,'Top Chef Feature'),(33,'Luxury Magazine'),(46,'Michelin Guide');
/*!40000 ALTER TABLE `featuredIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isAvailable`
--

DROP TABLE IF EXISTS `isAvailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isAvailable` (
  `reservationID` int NOT NULL,
  `tableID` int NOT NULL,
  PRIMARY KEY (`reservationID`,`tableID`),
  KEY `tableID` (`tableID`),
  CONSTRAINT `isavailable_ibfk_1` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`),
  CONSTRAINT `isavailable_ibfk_2` FOREIGN KEY (`tableID`) REFERENCES `restaurantTable` (`tableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isAvailable`
--

LOCK TABLES `isAvailable` WRITE;
/*!40000 ALTER TABLE `isAvailable` DISABLE KEYS */;
INSERT INTO `isAvailable` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20);
/*!40000 ALTER TABLE `isAvailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `description` text,
  `pdf` varchar(255) DEFAULT NULL,
  `websiteLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  KEY `menu_rest_fk` (`restID`),
  CONSTRAINT `menu_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Modern American Menu','r1.pdf','auroragrill/menu'),(2,2,'Seafood Fine Dining Menu','r2.pdf','blueharbor/menu'),(3,3,'Steakhouse Menu','r3.pdf','sunsetsteak/menu'),(4,4,'Contemporary Menu','r4.pdf','urbantable/menu'),(5,5,'Tex-Mex Menu','r5.pdf','lonestar/menu'),(6,6,'French Menu','r6.pdf','lakefront/menu'),(7,7,'Californian Menu','r7.pdf','goldengate/menu'),(8,8,'Seafood Menu','r8.pdf','oceanbreeze/menu'),(9,9,'American Menu','r9.pdf','manhattan/menu'),(10,10,'BBQ Menu','r10.pdf','austin/menu'),(11,11,'Deli Menu','r11.pdf','windy/menu'),(12,12,'Asian Fusion Menu','r12.pdf','bayfusion/menu'),(13,13,'Seafood Menu','r13.pdf','coral/menu'),(14,14,'Italian Menu','r14.pdf','empire/menu'),(15,15,'BBQ Menu','r15.pdf','hillcountry/menu'),(16,16,'Steak Menu','r16.pdf','chicago/menu'),(17,17,'Seafood Menu','r17.pdf','pacific/menu'),(18,18,'Latin Menu','r18.pdf','miami/menu'),(19,19,'American Menu','r19.pdf','central/menu'),(20,20,'BBQ Menu','r20.pdf','austinbbq/menu'),(21,21,'American Menu','r21.pdf','north/menu'),(22,22,'Seafood Menu','r22.pdf','sfcoastal/menu'),(23,23,'Fusion Menu','r23.pdf','miami/menu'),(24,24,'Italian Menu','r24.pdf','ny/menu'),(25,25,'BBQ Menu','r25.pdf','austin/menu'),(26,26,'Seafood Menu','r26.pdf','chicago/menu'),(27,27,'Contemporary Menu','r27.pdf','sf/menu'),(28,28,'Seafood Menu','r28.pdf','miami/menu'),(29,29,'American Menu','r29.pdf','brooklyn/menu'),(30,30,'BBQ Menu','r30.pdf','texas/menu'),(31,31,'French Menu','r31.pdf','lake/menu'),(32,32,'Fusion Menu','r32.pdf','sf/menu'),(33,33,'Fine Dining Menu','r33.pdf','miami/menu'),(34,34,'American Menu','r34.pdf','ny/menu'),(35,35,'BBQ Menu','r35.pdf','austin/menu'),(36,36,'Modern Menu','r36.pdf','chicago/menu'),(37,37,'Seafood Menu','r37.pdf','sf/menu'),(38,38,'Latin Menu','r38.pdf','miami/menu'),(39,39,'Italian Menu','r39.pdf','ny/menu'),(40,40,'BBQ Menu','r40.pdf','austin/menu'),(41,41,'Seafood Menu','r41.pdf','chicago/menu'),(42,42,'Fusion Menu','r42.pdf','sf/menu'),(43,43,'Seafood Menu','r43.pdf','miami/menu'),(44,44,'American Menu','r44.pdf','ny/menu'),(45,45,'BBQ Menu','r45.pdf','austin/menu'),(46,46,'Fine Dining Menu','r46.pdf','chicago/menu'),(47,47,'Seafood Menu','r47.pdf','sf/menu'),(48,48,'Seafood Menu','r48.pdf','miami/menu'),(49,49,'French Menu','r49.pdf','ny/menu'),(50,50,'BBQ Menu','r50.pdf','austin/menu');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuItem`
--

DROP TABLE IF EXISTS `menuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuItem` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `menuID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`itemID`),
  KEY `item_menu_fk` (`menuID`),
  CONSTRAINT `item_menu_fk` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuItem`
--

LOCK TABLES `menuItem` WRITE;
/*!40000 ALTER TABLE `menuItem` DISABLE KEYS */;
INSERT INTO `menuItem` VALUES (1,1,'Herb Grilled Chicken',14.99,'Classic American entrée'),(2,1,'Truffle Fries',9.99,'Crispy fries with truffle oil'),(3,1,'Caesar Salad',11.99,'Romaine, parmesan, dressing'),(4,2,'Lobster Roll',24.99,'Butter toasted lobster roll'),(5,2,'Clam Chowder',12.99,'Creamy New England style'),(6,2,'Grilled Oysters',18.99,'Garlic butter oysters'),(7,3,'Dry Aged Ribeye',45.99,'Premium steak cut'),(8,3,'Garlic Mashed Potatoes',8.99,'Creamy side dish'),(9,3,'Grilled Asparagus',9.99,'Lightly seasoned'),(10,4,'Truffle Fettuccine',22.99,'Creamy truffle pasta'),(11,4,'Bruschetta Trio',10.99,'Tomato basil crostini'),(12,4,'Wild Mushroom Soup',9.99,'Earthy mushroom blend'),(13,5,'Carne Asada Tacos',13.99,'Grilled beef tacos'),(14,5,'Chicken Quesadilla',12.99,'Cheesy grilled tortilla'),(15,5,'Fresh Guacamole',8.99,'Avocado dip'),(16,6,'Duck Confit',28.99,'Slow cooked duck leg'),(17,6,'French Onion Soup',11.99,'Caramelized onion broth'),(18,6,'Baguette & Butter',6.99,'Fresh baked bread'),(19,7,'Chef Sushi Platter',32.99,'Assorted premium sushi'),(20,7,'Miso Soup',5.99,'Traditional broth'),(21,7,'Edamame Sea Salt',6.99,'Steamed soybeans'),(22,8,'Garlic Shrimp',19.99,'Pan seared shrimp'),(23,8,'Coconut Rice',7.99,'Fragrant rice side'),(24,8,'Seafood Salad',14.99,'Fresh greens & seafood'),(25,9,'Wagyu Burger',21.99,'Premium beef burger'),(26,9,'Sweet Potato Fries',8.99,'Crispy sweet fries'),(27,9,'Vanilla Milkshake',6.99,'Classic shake'),(28,10,'Smoked Brisket',24.99,'12-hour smoked beef'),(29,10,'BBQ Ribs',26.99,'House glazed ribs'),(30,10,'Coleslaw',5.99,'Creamy cabbage slaw'),(31,11,'Turkey Club Sandwich',12.99,'Classic deli sandwich'),(32,11,'Potato Salad',6.99,'Creamy potato mix'),(33,11,'Chicken Noodle Soup',8.99,'Homestyle soup'),(34,12,'Miso Glazed Salmon',23.99,'Asian fusion salmon'),(35,12,'Pork Dumplings',10.99,'Steamed dumplings'),(36,12,'Spicy Tuna Roll',14.99,'Fresh sushi roll'),(37,13,'Grilled Lobster Tail',34.99,'Butter brushed lobster'),(38,13,'Seafood Risotto',25.99,'Creamy rice dish'),(39,13,'Crab Cakes',18.99,'Pan seared cakes'),(40,14,'Spaghetti Carbonara',19.99,'Creamy pancetta pasta'),(41,14,'Margherita Pizza',15.99,'Classic Italian pizza'),(42,14,'Tiramisu',9.99,'Coffee dessert'),(43,15,'Texas Brisket Plate',22.99,'Smoked beef brisket'),(44,15,'Mac & Cheese',8.99,'Creamy baked pasta'),(45,15,'Cornbread',6.99,'Honey glazed'),(46,16,'Filet Mignon',48.99,'Premium steak cut'),(47,16,'Loaded Baked Potato',9.99,'Cheese & bacon'),(48,16,'Creamed Spinach',7.99,'Steakhouse classic'),(49,17,'Seared Tuna Steak',26.99,'Sesame crusted tuna'),(50,17,'Seafood Paella',28.99,'Spanish seafood rice'),(51,17,'Clam Chowder',12.99,'Creamy soup'),(52,18,'Tacos Al Pastor',14.99,'Spiced pork tacos'),(53,18,'Ceviche',13.99,'Citrus seafood'),(54,18,'Churros',7.99,'Cinnamon dessert'),(55,19,'NY Strip Steak',39.99,'Classic steak cut'),(56,19,'Burger Deluxe',18.99,'House burger'),(57,19,'Onion Rings',7.99,'Crispy fried rings'),(58,20,'Smoked Pork Ribs',25.99,'BBQ glazed ribs'),(59,20,'Pulled Pork Sandwich',14.99,'Slow cooked pork'),(60,20,'BBQ Beans',6.99,'Sweet smoky beans'),(61,21,'Grilled Chicken Plate',16.99,'Simple grilled entrée'),(62,21,'House Salad',9.99,'Fresh greens'),(63,21,'Corn Chowder',8.99,'Creamy corn soup'),(64,22,'Oyster Sampler',22.99,'Fresh oysters'),(65,22,'Sea Bass Fillet',29.99,'Pan seared fish'),(66,22,'Lobster Pasta',34.99,'Cream lobster sauce'),(67,23,'Fusion Sushi Roll',15.99,'Chef special roll'),(68,23,'Teriyaki Chicken',18.99,'Sweet soy glaze'),(69,23,'Seaweed Salad',7.99,'Light appetizer'),(70,24,'Truffle Ravioli',24.99,'Stuffed pasta'),(71,24,'Osso Buco',32.99,'Braised veal'),(72,24,'Panna Cotta',8.99,'Cream dessert'),(73,25,'BBQ Chicken Wings',12.99,'Smoked wings'),(74,25,'Beef Brisket',23.99,'Slow smoked'),(75,25,'Corn on the Cob',5.99,'Butter grilled'),(76,26,'Grilled Salmon',21.99,'Atlantic salmon'),(77,26,'Lobster Bisque',13.99,'Cream lobster soup'),(78,26,'Shrimp Cocktail',14.99,'Chilled shrimp'),(79,27,'Chef Tasting Plate',35.99,'Multi-course sampler'),(80,27,'Seared Scallops',26.99,'Pan seared'),(81,27,'Chocolate Lava Cake',9.99,'Dessert'),(82,28,'Fish Tacos',13.99,'Crispy fish'),(83,28,'Coconut Shrimp',16.99,'Sweet fried shrimp'),(84,28,'Mango Salsa',6.99,'Fresh topping'),(85,29,'Classic Cheeseburger',15.99,'Beef burger'),(86,29,'Fries Basket',6.99,'Crispy fries'),(87,29,'Chocolate Shake',7.99,'Thick shake'),(88,30,'Texas BBQ Platter',29.99,'Mixed meats'),(89,30,'Smoked Sausage',14.99,'Spiced sausage'),(90,30,'Baked Beans',5.99,'BBQ beans'),(91,31,'Coq au Vin',27.99,'Wine braised chicken'),(92,31,'French Bread Basket',6.99,'Fresh bread'),(93,31,'Crème Brûlée',9.99,'Caramel dessert'),(94,32,'Fusion Steak Bowl',24.99,'Rice steak bowl'),(95,32,'Wasabi Tuna',18.99,'Spicy tuna'),(96,32,'Ginger Salad',7.99,'Light salad'),(97,33,'Wagyu Tartare',32.99,'Raw beef dish'),(98,33,'Foie Gras',28.99,'Luxury appetizer'),(99,33,'Chocolate Soufflé',11.99,'Warm dessert'),(100,34,'Burger Classic',15.99,'Beef burger'),(101,34,'Chicken Wings',12.99,'Buffalo style'),(102,34,'Mac & Cheese',8.99,'Creamy pasta'),(103,35,'Smoked Brisket Plate',24.99,'Texas style brisket'),(104,35,'BBQ Chicken',16.99,'Grilled chicken'),(105,35,'Coleslaw',5.99,'Creamy slaw'),(106,36,'Grilled Sea Bass',26.99,'Fresh fish'),(107,36,'Risotto Primavera',19.99,'Vegetable risotto'),(108,36,'Tiramisu',9.99,'Coffee dessert'),(109,37,'Lobster Roll Deluxe',25.99,'Butter lobster roll'),(110,37,'Clam Chowder',12.99,'Cream soup'),(111,37,'Crab Legs',34.99,'Steamed crab'),(112,38,'Cuban Sandwich',14.99,'Pressed sandwich'),(113,38,'Plantain Chips',6.99,'Fried banana chips'),(114,38,'Flan Dessert',7.99,'Caramel custard'),(115,39,'Duck Breast',29.99,'Pan seared duck'),(116,39,'Ravioli Stuffed',18.99,'Cheese ravioli'),(117,39,'Espresso Cake',8.99,'Coffee dessert'),(118,40,'BBQ Platter',28.99,'Mixed meats'),(119,40,'Grilled Corn',5.99,'Butter corn'),(120,40,'Pulled Pork Slider',10.99,'Mini sandwich'),(121,41,'Seared Halibut',28.99,'Fresh fish'),(122,41,'Lobster Mac',22.99,'Cream lobster pasta'),(123,41,'Clam Chowder',12.99,'Cream soup'),(124,42,'Fusion Sushi Set',26.99,'Chef selection'),(125,42,'Teriyaki Beef',19.99,'Sweet beef glaze'),(126,42,'Seaweed Salad',7.99,'Light salad'),(127,43,'Grilled Octopus',24.99,'Mediterranean style'),(128,43,'Seafood Tower',39.99,'Luxury seafood platter'),(129,43,'Key Lime Pie',8.99,'Citrus dessert'),(130,44,'Classic Burger',14.99,'Beef burger'),(131,44,'Onion Rings',7.99,'Fried rings'),(132,44,'Chicken Sandwich',13.99,'Grilled chicken'),(133,45,'BBQ Ribs Full Rack',32.99,'Smoked ribs'),(134,45,'Beef Brisket',26.99,'Slow smoked'),(135,45,'Cornbread Muffin',4.99,'Sweet bread'),(136,46,'Filet Mignon',49.99,'Premium steak'),(137,46,'Truffle Mash',12.99,'Mashed potatoes'),(138,46,'Chocolate Tart',10.99,'Dessert'),(139,47,'Grilled Lobster',34.99,'Butter lobster'),(140,47,'Seafood Pasta',27.99,'Cream seafood sauce'),(141,47,'Garlic Shrimp',19.99,'Pan seared'),(142,48,'Jerk Chicken',18.99,'Spicy grilled chicken'),(143,48,'Coconut Rice',7.99,'Fragrant rice'),(144,48,'Plantains',6.99,'Fried sweet banana'),(145,49,'Duck Confit',30.99,'Slow cooked duck'),(146,49,'French Onion Soup',11.99,'Classic soup'),(147,49,'Crème Brûlée',9.99,'Caramel dessert'),(148,50,'Texas BBQ Feast',35.99,'Mixed BBQ platter'),(149,50,'Smoked Sausage',14.99,'Spiced sausage'),(150,50,'BBQ Beans',6.99,'Slow cooked beans');
/*!40000 ALTER TABLE `menuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offers` (
  `offID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `slotID` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `offerType` varchar(50) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `validDates` varchar(100) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `discountAmt` decimal(8,2) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`offID`),
  KEY `offers_rest_fk` (`restID`),
  KEY `offers_slot_fk` (`slotID`),
  CONSTRAINT `offers_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  CONSTRAINT `offers_slot_fk` FOREIGN KEY (`slotID`) REFERENCES `timeslot` (`slotID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (1,1,1,'Early Bird','Discount','2026-01-01 17:00:00','2026-01-01 18:30:00','Jan',25.00,5.00,'Early dining discount'),(2,2,5,'Seafood Night','Promo','2026-02-01 18:00:00','2026-02-01 21:00:00','Feb',120.00,20.00,'Seafood special'),(3,3,10,'Steak Deal','Discount','2026-01-01 18:00:00','2026-01-01 22:00:00','Jan',50.00,10.00,'Steak discount'),(4,4,15,'Rooftop Special','Promo','2026-03-01 18:00:00','2026-03-01 22:00:00','Mar',80.00,15.00,'Skyline dining'),(5,5,20,'Tex-Mex Fiesta','Promo','2026-04-01 18:00:00','2026-04-01 22:00:00','Apr',30.00,5.00,'Party menu');
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payMethod`
--

DROP TABLE IF EXISTS `payMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payMethod` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `userID` int NOT NULL,
  `cardNumber` varchar(19) NOT NULL,
  `cvv` char(4) NOT NULL,
  `expDate` date NOT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `paymethod_user_fk` (`userID`),
  CONSTRAINT `paymethod_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payMethod`
--

LOCK TABLES `payMethod` WRITE;
/*!40000 ALTER TABLE `payMethod` DISABLE KEYS */;
INSERT INTO `payMethod` VALUES (1,1,'4111111111111111','123','2029-01-01','60601'),(2,2,'4111111111111112','234','2028-06-01','94105'),(3,3,'4111111111111113','345','2027-09-01','33139'),(4,4,'4111111111111114','456','2030-03-01','10001'),(5,5,'4111111111111115','567','2028-11-01','73301'),(6,6,'4111111111111116','678','2029-07-01','60602'),(7,7,'4111111111111117','789','2028-05-01','94114'),(8,8,'4111111111111118','890','2027-12-01','33133'),(9,9,'4111111111111119','901','2030-01-01','10005'),(10,10,'4111111111111120','111','2029-02-01','73344'),(11,11,'4111111111111121','222','2028-03-01','60603'),(12,12,'4111111111111122','333','2027-04-01','94103'),(13,13,'4111111111111123','444','2029-05-01','33130'),(14,14,'4111111111111124','555','2028-06-01','10011'),(15,15,'4111111111111125','666','2027-07-01','73301'),(16,16,'4111111111111126','777','2029-08-01','60604'),(17,17,'4111111111111127','888','2028-09-01','94111'),(18,18,'4111111111111128','999','2027-10-01','33141'),(19,19,'4111111111111129','101','2029-11-01','10010'),(20,20,'4111111111111130','202','2028-12-01','73344'),(21,21,'4111111111111131','303','2027-01-01','60605'),(22,22,'4111111111111132','404','2029-02-01','94110'),(23,23,'4111111111111133','505','2028-03-01','33137'),(24,24,'4111111111111134','606','2027-04-01','10016'),(25,25,'4111111111111135','707','2029-05-01','73301'),(26,26,'4111111111111136','808','2028-06-01','60606'),(27,27,'4111111111111137','909','2027-07-01','94102'),(28,28,'4111111111111138','111','2029-08-01','33132'),(29,29,'4111111111111139','222','2028-09-01','10007'),(30,30,'4111111111111140','333','2027-10-01','73301'),(31,31,'4111111111111141','444','2029-11-01','60607'),(32,32,'4111111111111142','555','2028-12-01','94109'),(33,33,'4111111111111143','666','2027-01-01','33131'),(34,34,'4111111111111144','777','2029-02-01','10012'),(35,35,'4111111111111145','888','2028-03-01','73344'),(36,36,'4111111111111146','999','2027-04-01','60608'),(37,37,'4111111111111147','101','2029-05-01','94108'),(38,38,'4111111111111148','202','2028-06-01','33136'),(39,39,'4111111111111149','303','2027-07-01','10009'),(40,40,'4111111111111150','404','2029-08-01','73301');
/*!40000 ALTER TABLE `payMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phoneNumber`
--

DROP TABLE IF EXISTS `phoneNumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phoneNumber` (
  `id` int NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`id`,`phoneNumber`),
  CONSTRAINT `phone_user_fk` FOREIGN KEY (`id`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phoneNumber`
--

LOCK TABLES `phoneNumber` WRITE;
/*!40000 ALTER TABLE `phoneNumber` DISABLE KEYS */;
INSERT INTO `phoneNumber` VALUES (1,'312-111-0001'),(1,'312-111-0002'),(2,'415-222-0001'),(3,'305-333-0001'),(3,'305-333-0002'),(4,'212-444-0001'),(5,'512-555-0001'),(5,'512-555-0002'),(6,'312-666-0001'),(7,'415-777-0001'),(7,'415-777-0002'),(8,'305-888-0001'),(9,'212-999-0001'),(9,'212-999-0002'),(10,'512-101-0001'),(11,'312-111-1001'),(12,'415-222-2001'),(12,'415-222-2002'),(13,'305-333-3001'),(14,'212-444-4001'),(14,'212-444-4002'),(15,'512-555-5001'),(16,'312-666-6001'),(16,'312-666-6002'),(17,'415-777-7001'),(18,'305-888-8001'),(18,'305-888-8002'),(19,'212-999-9001'),(20,'512-101-0101'),(20,'512-101-0102'),(21,'312-111-1101'),(22,'415-222-2201'),(22,'415-222-2202'),(23,'305-333-3301'),(24,'212-444-4401'),(24,'212-444-4402'),(25,'512-555-5501'),(26,'312-666-6601'),(26,'312-666-6602'),(27,'415-777-7701'),(28,'305-888-8801'),(28,'305-888-8802'),(29,'212-999-9901'),(30,'512-101-0201'),(30,'512-101-0202'),(31,'312-111-1201'),(32,'415-222-2301'),(32,'415-222-2302'),(33,'305-333-3401'),(34,'212-444-4501'),(34,'212-444-4502'),(35,'512-555-5601'),(36,'312-666-6701'),(36,'312-666-6702'),(37,'415-777-7801'),(38,'305-888-8901'),(38,'305-888-8902'),(39,'212-999-9101'),(40,'512-101-0301'),(40,'512-101-0302'),(41,'312-111-1301'),(42,'415-222-2401'),(42,'415-222-2402'),(43,'305-333-3501'),(44,'212-444-4601'),(44,'212-444-4602'),(45,'512-555-5701'),(46,'312-666-6801'),(46,'312-666-6802'),(47,'415-777-7901'),(48,'305-888-9001'),(48,'305-888-9002'),(49,'212-999-9201'),(50,'512-101-0401'),(50,'512-101-0402');
/*!40000 ALTER TABLE `phoneNumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popularDishes`
--

DROP TABLE IF EXISTS `popularDishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `popularDishes` (
  `dishID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`dishID`),
  KEY `dish_rest_fk` (`restID`),
  CONSTRAINT `dish_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popularDishes`
--

LOCK TABLES `popularDishes` WRITE;
/*!40000 ALTER TABLE `popularDishes` DISABLE KEYS */;
INSERT INTO `popularDishes` VALUES (1,1,'Grilled Salmon',28.00,'Herb butter salmon'),(2,2,'Lobster Bisque',32.00,'Creamy lobster soup'),(3,3,'Ribeye Steak',45.00,'Dry aged'),(4,4,'Truffle Pasta',30.00,'Cream sauce'),(5,5,'Tacos Al Pastor',18.00,'Spicy pork'),(6,6,'Duck Confit',35.00,'French classic'),(7,7,'Sushi Platter',40.00,'Chef selection'),(8,8,'Grilled Shrimp',26.00,'Garlic butter'),(9,9,'Burger Deluxe',22.00,'Wagyu blend'),(10,10,'Brisket Plate',25.00,'Smoked 12h');
/*!40000 ALTER TABLE `popularDishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preferences`
--

DROP TABLE IF EXISTS `Preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Preferences` (
  `preferenceID` int NOT NULL AUTO_INCREMENT,
  `preferenceName` varchar(50) NOT NULL,
  PRIMARY KEY (`preferenceID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preferences`
--

LOCK TABLES `Preferences` WRITE;
/*!40000 ALTER TABLE `Preferences` DISABLE KEYS */;
INSERT INTO `Preferences` VALUES (1,'Vegan'),(2,'Seafood'),(3,'Steak'),(4,'Vegetarian'),(5,'Spicy'),(6,'Italian'),(7,'Desserts'),(8,'BBQ'),(9,'Healthy'),(10,'Fusion'),(11,'Sushi'),(12,'Mexican');
/*!40000 ALTER TABLE `Preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privateDining`
--

DROP TABLE IF EXISTS `privateDining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privateDining` (
  `roomID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `tableID` int DEFAULT NULL,
  `roomName` varchar(100) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `seating` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`roomID`),
  KEY `room_rest_fk` (`restID`),
  KEY `room_table_fk` (`tableID`),
  CONSTRAINT `room_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  CONSTRAINT `room_table_fk` FOREIGN KEY (`tableID`) REFERENCES `restaurantTable` (`tableID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privateDining`
--

LOCK TABLES `privateDining` WRITE;
/*!40000 ALTER TABLE `privateDining` DISABLE KEYS */;
INSERT INTO `privateDining` VALUES (1,1,NULL,'Chef’s Private Loft',12,'Banquet Style'),(2,2,NULL,'Harbor Glass Suite',20,'Ocean View Banquet'),(3,4,NULL,'Skyline Studio Room',10,'Chef Table Seating'),(4,7,NULL,'Golden Chef Chamber',16,'Tasting Table'),(5,9,NULL,'Manhattan Heritage Room',14,'Formal Dining'),(6,12,NULL,'Zen Fusion Suite',18,'Low Table + Booth Mix'),(7,13,NULL,'Coral Private Reef Room',22,'Banquet Seafood Setup'),(8,16,NULL,'Prime Cut Executive Room',15,'Steak Tasting Table'),(9,17,NULL,'Pacific Horizon Room',24,'Waterfront Banquet'),(10,22,NULL,'Coastal Reserve Suite',20,'Chef Tasting Layout'),(11,27,NULL,'Golden Spoon Atelier',16,'Modern Shared Table'),(12,33,NULL,'Luxe Crystal Chamber',18,'Ultra Formal Banquet'),(13,36,NULL,'Bistro Chef Studio',14,'Interactive Chef Table'),(14,41,NULL,'Riverglass Private Room',20,'River View Dining'),(15,49,NULL,'Grand Heritage Salon',25,'Classic French Banquet');
/*!40000 ALTER TABLE `privateDining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `userID` int NOT NULL,
  `resDate` date DEFAULT NULL,
  `specialReq` text,
  `occasion` varchar(50) DEFAULT NULL,
  `partySize` int DEFAULT NULL,
  `resTime` time DEFAULT NULL,
  `status` enum('Confirmed','Pending','Cancelled','Completed','No-Show') DEFAULT 'Confirmed',
  `attendees` text,
  `bookPolicy` text,
  PRIMARY KEY (`reservationID`),
  KEY `reservation_rest_fk` (`restID`),
  KEY `reservation_user_fk` (`userID`),
  CONSTRAINT `reservation_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  CONSTRAINT `reservation_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'2026-04-01',NULL,NULL,2,'18:00:00','Confirmed',NULL,NULL),(2,1,2,'2026-04-12',NULL,NULL,4,'19:00:00','Confirmed',NULL,NULL),(3,1,3,'2026-04-23',NULL,NULL,2,'18:30:00','Confirmed',NULL,NULL),(4,2,4,'2026-04-11',NULL,NULL,2,'19:00:00','Confirmed',NULL,NULL),(5,2,5,'2026-04-22',NULL,NULL,4,'18:00:00','Confirmed',NULL,NULL),(6,3,6,'2026-04-15',NULL,NULL,2,'19:30:00','Confirmed',NULL,NULL),(7,4,7,'2026-04-21',NULL,NULL,4,'18:00:00','Confirmed',NULL,NULL),(8,4,8,'2026-05-12',NULL,NULL,2,'19:00:00','Confirmed',NULL,NULL),(9,4,9,'2026-05-13',NULL,NULL,6,'18:30:00','Confirmed',NULL,NULL),(10,5,10,'2026-05-11',NULL,NULL,4,'19:00:00','Confirmed',NULL,NULL),(11,5,11,'2026-05-02',NULL,NULL,2,'18:00:00','Confirmed',NULL,NULL),(12,6,12,'2026-04-17',NULL,NULL,2,'19:30:00','Confirmed',NULL,NULL),(13,7,13,'2026-05-03',NULL,NULL,4,'18:00:00','Confirmed',NULL,NULL),(14,8,14,'2026-05-01',NULL,NULL,2,'19:00:00','Confirmed',NULL,NULL),(15,8,15,'2026-05-05',NULL,NULL,4,'18:30:00','Confirmed',NULL,NULL),(16,9,16,'2026-05-01',NULL,NULL,2,'19:00:00','Confirmed',NULL,NULL),(17,10,17,'2026-05-06',NULL,NULL,4,'18:00:00','Confirmed',NULL,NULL),(18,10,18,'2026-03-02',NULL,NULL,2,'19:30:00','Confirmed',NULL,NULL),(19,11,19,'2026-03-11',NULL,NULL,2,'18:00:00','Confirmed',NULL,NULL),(20,12,20,'2026-03-21',NULL,NULL,4,'19:00:00','Confirmed',NULL,NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `respID` int NOT NULL AUTO_INCREMENT,
  `reviewID` int NOT NULL,
  `text_body` text,
  PRIMARY KEY (`respID`),
  KEY `response_review_fk` (`reviewID`),
  CONSTRAINT `response_review_fk` FOREIGN KEY (`reviewID`) REFERENCES `review` (`reviewID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES (1,1,'Thank you for your kind words! We’re glad you enjoyed your experience.'),(2,2,'We appreciate your feedback and will work on improving service speed.'),(3,3,'Happy you loved the rooftop experience! Hope to see you again soon.'),(4,4,'Thank you for dining with us! Fresh seafood is always our priority.'),(5,5,'We appreciate your honesty and are glad you enjoyed the meal.'),(6,6,'We’re honored you enjoyed our steak preparation. Thank you!'),(7,7,'Thank you for your feedback — we’re improving menu variety.'),(8,8,'So glad you enjoyed the rooftop view and dining experience!'),(9,9,'We appreciate your note and will review portion pricing.'),(10,10,'We’re thrilled you enjoyed our Tex-Mex specialties!'),(11,11,'Thank you for your feedback — glad you enjoyed the atmosphere.'),(12,12,'We’re happy you enjoyed our French-inspired cuisine.'),(13,13,'Thank you — we strive for Michelin-level excellence every day.'),(14,14,'We appreciate your feedback on portion sizes and will consider it.'),(15,15,'Glad you enjoyed the tasting menu experience!'),(16,16,'Thank you for your review of our seafood dishes!'),(17,17,'We’re happy you enjoyed the ocean view and service.'),(18,18,'We appreciate your kind words about our NYC dining experience.'),(19,19,'Thank you! We’re proud to be part of Austin’s BBQ culture.'),(20,20,'Glad you enjoyed the smoky flavors — we’ll keep refining them.');
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `capacity` int DEFAULT NULL,
  `specialFeat` text,
  `pictures` varchar(255) DEFAULT NULL,
  `termsCond` text,
  `catering` varchar(50) DEFAULT NULL,
  `description` text,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Aurora Grill',80,'Outdoor Patio,Live Music,Rooftop,Chef Tasting Menu','r1.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),(2,'Blue Harbor',120,'Waterfront View,Wine Cellar,Private Rooms,Michelin Rated','r2.jpg','Standard','Available','Fine Dining',NULL,'San Francisco','CA',NULL),(3,'Sunset Steakhouse',60,'Live Music,Chef Tasting Menu,Historic Venue,Private Rooms','r3.jpg','Standard','Not Available','Fine Dining',NULL,'Miami','FL',NULL),(4,'Urban Table',45,'Open Kitchen,Rooftop,Outdoor Patio,Michelin Rated','r4.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),(5,'Lone Star Eatery',100,'Chef Tasting Menu,Live Music,Outdoor Patio,Wine Cellar','r5.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(6,'Lakefront Bistro',70,'Waterfront View,Private Rooms,Rooftop,Live Music','r6.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),(7,'Golden Gate Dining',90,'Michelin Rated,Open Kitchen,Wine Cellar,Chef Tasting Menu','r7.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(8,'Ocean Breeze',110,'Waterfront View,Outdoor Patio,Live Music,Private Rooms','r8.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(9,'Manhattan Eats',50,'Historic Venue,Rooftop,Michelin Rated,Open Kitchen','r9.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),(10,'Austin Smoke',130,'Live Music,Outdoor Patio,Chef Tasting Menu,Wine Cellar','r10.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(11,'Windy City Deli',40,'Open Kitchen,Private Rooms,Rooftop,Michelin Rated','r11.jpg','Standard','Not Available','Fast Casual',NULL,'Chicago','IL',NULL),(12,'Bay Fusion',95,'Waterfront View,Live Music,Chef Tasting Menu,Outdoor Patio','r12.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(13,'Coral Reef',75,'Private Rooms,Wine Cellar,Historic Venue,Michelin Rated','r13.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(14,'Empire Dining',65,'Rooftop,Open Kitchen,Live Music,Chef Tasting Menu','r14.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),(15,'Hill Country BBQ',140,'Outdoor Patio,Live Music,Wine Cellar,Private Rooms','r15.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(16,'Chicago Prime',85,'Michelin Rated,Rooftop,Chef Tasting Menu,Open Kitchen','r16.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),(17,'Pacific Table',110,'Waterfront View,Live Music,Outdoor Patio,Private Rooms','r17.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(18,'Miami Spice',60,'Chef Tasting Menu,Wine Cellar,Historic Venue,Rooftop','r18.jpg','Standard','Available','Casual Dining',NULL,'Miami','FL',NULL),(19,'Central Park Eats',55,'Open Kitchen,Michelin Rated,Live Music,Outdoor Patio','r19.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),(20,'Austin Urban BBQ',120,'Live Music,Outdoor Patio,Wine Cellar,Chef Tasting Menu','r20.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(21,'Northside Grill',80,'Private Rooms,Rooftop,Open Kitchen,Michelin Rated','r21.jpg','Standard','Not Available','Casual Dining',NULL,'Chicago','IL',NULL),(22,'SF Coastal',100,'Waterfront View,Chef Tasting Menu,Live Music,Wine Cellar','r22.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(23,'Miami Nights',70,'Outdoor Patio,Historic Venue,Private Rooms,Live Music','r23.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(24,'NY Classic',90,'Michelin Rated,Rooftop,Open Kitchen,Wine Cellar','r24.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),(25,'Austin Flame',130,'Live Music,Outdoor Patio,Chef Tasting Menu,Private Rooms','r25.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(26,'Chicago Harbor',75,'Waterfront View,Live Music,Rooftop,Michelin Rated','r26.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),(27,'Golden Spoon SF',95,'Open Kitchen,Chef Tasting Menu,Wine Cellar,Private Rooms','r27.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(28,'South Beach Grill',60,'Outdoor Patio,Live Music,Historic Venue,Michelin Rated','r28.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(29,'Brooklyn Eats',50,'Rooftop,Open Kitchen,Chef Tasting Menu,Wine Cellar','r29.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),(30,'Texas Flame House',140,'Live Music,Outdoor Patio,Private Rooms,Wine Cellar','r30.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(31,'Lake Michigan Bistro',85,'Waterfront View,Michelin Rated,Open Kitchen,Chef Tasting Menu','r31.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),(32,'SF Skyline',110,'Rooftop,Live Music,Outdoor Patio,Private Rooms','r32.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(33,'Miami Luxe',80,'Historic Venue,Wine Cellar,Michelin Rated,Chef Tasting Menu','r33.jpg','Standard','Available','Fine Dining',NULL,'Miami','FL',NULL),(34,'NY Midtown Grill',65,'Open Kitchen,Rooftop,Live Music,Outdoor Patio','r34.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),(35,'Austin Prime Smoke',120,'BBQ,Live Music,Wine Cellar,Private Rooms','r35.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(36,'Chicago Bistro 77',90,'Michelin Rated,Chef Tasting Menu,Outdoor Patio,Waterfront View','r36.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),(37,'SF Harbor Eats',100,'Waterfront View,Live Music,Open Kitchen,Private Rooms','r37.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(38,'Miami Sunset Kitchen',70,'Outdoor Patio,Live Music,Rooftop,Wine Cellar','r38.jpg','Standard','Available','Casual Dining',NULL,'Miami','FL',NULL),(39,'NY Eastside Table',55,'Michelin Rated,Chef Tasting Menu,Historic Venue,Open Kitchen','r39.jpg','Standard','Available','Upscale Casual',NULL,'New York','NY',NULL),(40,'Austin South Grill',130,'BBQ,Outdoor Patio,Live Music,Private Rooms','r40.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(41,'Chicago River Dining',85,'Waterfront View,Rooftop,Michelin Rated,Wine Cellar','r41.jpg','Standard','Available','Upscale Casual',NULL,'Chicago','IL',NULL),(42,'SF Market Table',95,'Open Kitchen,Chef Tasting Menu,Live Music,Outdoor Patio','r42.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(43,'Miami Ocean Prime',80,'Waterfront View,Private Rooms,Live Music,Michelin Rated','r43.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(44,'NY Uptown Grill',60,'Rooftop,Open Kitchen,Wine Cellar,Chef Tasting Menu','r44.jpg','Standard','Available','Casual Dining',NULL,'New York','NY',NULL),(45,'Austin River Smoke',140,'BBQ,Live Music,Outdoor Patio,Historic Venue','r45.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL),(46,'Chicago Gold Fork',75,'Michelin Rated,Chef Tasting Menu,Private Rooms,Open Kitchen','r46.jpg','Standard','Available','Fine Dining',NULL,'Chicago','IL',NULL),(47,'SF Bay View Grill',110,'Waterfront View,Rooftop,Live Music,Outdoor Patio','r47.jpg','Standard','Available','Upscale Casual',NULL,'San Francisco','CA',NULL),(48,'Miami Beach House',70,'Outdoor Patio,Live Music,Wine Cellar,Private Rooms','r48.jpg','Standard','Available','Upscale Casual',NULL,'Miami','FL',NULL),(49,'NY Grand Table',90,'Michelin Rated,Historic Venue,Chef Tasting Menu,Rooftop','r49.jpg','Standard','Available','Fine Dining',NULL,'New York','NY',NULL),(50,'Austin Legacy BBQ',130,'BBQ,Live Music,Outdoor Patio,Wine Cellar','r50.jpg','Standard','Available','Casual Dining',NULL,'Austin','TX',NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantCuisine`
--

DROP TABLE IF EXISTS `restaurantCuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantCuisine` (
  `restID` int NOT NULL,
  `cuisineID` int NOT NULL,
  PRIMARY KEY (`restID`,`cuisineID`),
  KEY `rest_cuisine_cui_fk` (`cuisineID`),
  CONSTRAINT `rest_cuisine_cui_fk` FOREIGN KEY (`cuisineID`) REFERENCES `cuisine` (`cuisineID`),
  CONSTRAINT `rest_cuisine_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantCuisine`
--

LOCK TABLES `restaurantCuisine` WRITE;
/*!40000 ALTER TABLE `restaurantCuisine` DISABLE KEYS */;
INSERT INTO `restaurantCuisine` VALUES (1,1),(9,1),(19,1),(21,1),(29,1),(34,1),(44,1),(2,2),(8,2),(13,2),(17,2),(22,2),(26,2),(28,2),(37,2),(41,2),(43,2),(47,2),(48,2),(3,3),(16,3),(4,4),(27,4),(5,5),(6,6),(31,6),(49,6),(7,7),(18,8),(38,8),(14,9),(24,9),(39,9),(10,10),(15,10),(20,10),(25,10),(30,10),(35,10),(40,10),(45,10),(50,10),(11,11),(12,12),(23,14),(32,14),(42,14),(36,15),(33,16),(46,16);
/*!40000 ALTER TABLE `restaurantCuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantTable`
--

DROP TABLE IF EXISTS `restaurantTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantTable` (
  `tableID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `estimateTime` int DEFAULT NULL,
  `availableStatus` enum('Available','Reserved','Occupied','Unavailable') DEFAULT NULL,
  `tableType` varchar(50) DEFAULT NULL,
  `seatCapacity` int DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tableID`),
  KEY `table_rest_fk` (`restID`),
  CONSTRAINT `table_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantTable`
--

LOCK TABLES `restaurantTable` WRITE;
/*!40000 ALTER TABLE `restaurantTable` DISABLE KEYS */;
INSERT INTO `restaurantTable` VALUES (1,1,90,'Available','2-Top',2,'A1'),(2,1,90,'Occupied','2-Top',2,'A2'),(3,1,90,'Available','2-Top',2,'A3'),(4,1,90,'Available','4-Top',4,'B1'),(5,1,90,'Occupied','4-Top',4,'B2'),(6,1,90,'Available','4-Top',4,'B3'),(7,1,120,'Reserved','6-Top',6,'C1'),(8,1,120,'Available','6-Top',6,'C2'),(9,1,120,'Occupied','8-Top',8,'D1'),(10,1,120,'Available','8-Top',8,'D2'),(11,1,120,'Available','10-Top',10,'PR1'),(12,1,120,'Reserved','10-Top',10,'PR2'),(13,1,120,'Available','6-Top',6,'E1'),(14,1,120,'Available','6-Top',6,'E2'),(15,2,120,'Available','2-Top',2,'BH1'),(16,2,120,'Occupied','2-Top',2,'BH2'),(17,2,120,'Available','2-Top',2,'BH3'),(18,2,120,'Available','2-Top',2,'BH4'),(19,2,120,'Available','2-Top',2,'BH5'),(20,2,120,'Reserved','2-Top',2,'BH6'),(21,2,120,'Available','4-Top',4,'BH7'),(22,2,120,'Occupied','4-Top',4,'BH8'),(23,2,120,'Available','4-Top',4,'BH9'),(24,2,120,'Available','4-Top',4,'BH10'),(25,2,120,'Reserved','4-Top',4,'BH11'),(26,2,120,'Available','4-Top',4,'BH12'),(27,2,120,'Available','4-Top',4,'BH13'),(28,2,120,'Occupied','4-Top',4,'BH14'),(29,2,120,'Available','4-Top',4,'BH15'),(30,2,120,'Available','4-Top',4,'BH16'),(31,2,120,'Available','6-Top',6,'BH17'),(32,2,120,'Occupied','6-Top',6,'BH18'),(33,2,120,'Available','6-Top',6,'BH19'),(34,2,120,'Reserved','6-Top',6,'BH20'),(35,2,120,'Available','6-Top',6,'BH21'),(36,2,120,'Available','6-Top',6,'BH22'),(37,2,120,'Available','8-Top',8,'BH23'),(38,2,120,'Occupied','8-Top',8,'BH24'),(39,2,120,'Available','8-Top',8,'BH25'),(40,2,120,'Reserved','8-Top',8,'BH26'),(41,3,90,'Available','2-Top',2,'SS1'),(42,3,90,'Occupied','2-Top',2,'SS2'),(43,3,90,'Available','2-Top',2,'SS3'),(44,3,90,'Available','2-Top',2,'SS4'),(45,3,90,'Reserved','2-Top',2,'SS5'),(46,3,90,'Available','2-Top',2,'SS6'),(47,3,90,'Available','4-Top',4,'SS7'),(48,3,90,'Occupied','4-Top',4,'SS8'),(49,3,90,'Available','4-Top',4,'SS9'),(50,3,90,'Available','4-Top',4,'SS10'),(51,3,90,'Reserved','4-Top',4,'SS11'),(52,3,90,'Available','4-Top',4,'SS12'),(53,3,120,'Available','6-Top',6,'SS13'),(54,3,120,'Occupied','6-Top',6,'SS14'),(55,3,120,'Available','6-Top',6,'SS15'),(56,3,120,'Reserved','6-Top',6,'SS16'),(57,4,90,'Available','2-Top',2,'UT1'),(58,4,90,'Occupied','2-Top',2,'UT2'),(59,4,90,'Available','2-Top',2,'UT3'),(60,4,90,'Available','2-Top',2,'UT4'),(61,4,90,'Reserved','2-Top',2,'UT5'),(62,4,90,'Available','2-Top',2,'UT6'),(63,4,90,'Available','4-Top',4,'UT7'),(64,4,90,'Occupied','4-Top',4,'UT8'),(65,4,90,'Available','4-Top',4,'UT9'),(66,4,90,'Available','4-Top',4,'UT10'),(67,4,90,'Reserved','4-Top',4,'UT11'),(68,4,90,'Available','4-Top',4,'UT12'),(69,4,90,'Available','6-Top',6,'UT13'),(70,4,90,'Available','3-Top',3,'UT14'),(71,5,120,'Available','8-Top',8,'LS1'),(72,5,120,'Occupied','8-Top',8,'LS2'),(73,5,120,'Available','8-Top',8,'LS3'),(74,5,120,'Reserved','8-Top',8,'LS4'),(75,5,120,'Available','8-Top',8,'LS5'),(76,5,120,'Available','8-Top',8,'LS6'),(77,5,120,'Available','6-Top',6,'LS7'),(78,5,120,'Occupied','6-Top',6,'LS8'),(79,5,120,'Available','6-Top',6,'LS9'),(80,5,120,'Reserved','6-Top',6,'LS10'),(81,5,120,'Available','4-Top',4,'LS11'),(82,5,120,'Occupied','4-Top',4,'LS12'),(83,5,120,'Available','4-Top',4,'LS13'),(84,5,120,'Available','4-Top',4,'LS14'),(85,5,120,'Reserved','4-Top',4,'LS15'),(86,5,120,'Available','2-Top',2,'LS16'),(87,5,120,'Available','2-Top',2,'LS17'),(88,5,120,'Occupied','2-Top',2,'LS18'),(89,5,120,'Reserved','2-Top',2,'LS19'),(90,6,90,'Available','2-Top',2,'LB1'),(91,6,90,'Occupied','2-Top',2,'LB2'),(92,6,90,'Available','2-Top',2,'LB3'),(93,6,90,'Reserved','2-Top',2,'LB4'),(94,6,90,'Available','2-Top',2,'LB5'),(95,6,90,'Available','4-Top',4,'LB6'),(96,6,90,'Occupied','4-Top',4,'LB7'),(97,6,90,'Available','4-Top',4,'LB8'),(98,6,90,'Reserved','4-Top',4,'LB9'),(99,6,90,'Available','4-Top',4,'LB10'),(100,6,90,'Available','4-Top',4,'LB11'),(101,6,90,'Occupied','4-Top',4,'LB12'),(102,6,120,'Available','6-Top',6,'LB13'),(103,6,120,'Reserved','6-Top',6,'LB14'),(104,6,120,'Available','6-Top',6,'LB15'),(105,6,120,'Occupied','6-Top',6,'LB16'),(106,6,120,'Available','5-Top',5,'LB17'),(107,6,120,'Reserved','5-Top',5,'LB18'),(108,7,120,'Available','2-Top',2,'GG1'),(109,7,120,'Occupied','2-Top',2,'GG2'),(110,7,120,'Available','2-Top',2,'GG3'),(111,7,120,'Reserved','2-Top',2,'GG4'),(112,7,120,'Available','2-Top',2,'GG5'),(113,7,120,'Available','2-Top',2,'GG6'),(114,7,120,'Available','4-Top',4,'GG7'),(115,7,120,'Occupied','4-Top',4,'GG8'),(116,7,120,'Available','4-Top',4,'GG9'),(117,7,120,'Reserved','4-Top',4,'GG10'),(118,7,120,'Available','4-Top',4,'GG11'),(119,7,120,'Available','4-Top',4,'GG12'),(120,7,120,'Occupied','4-Top',4,'GG13'),(121,7,120,'Available','4-Top',4,'GG14'),(122,7,120,'Available','6-Top',6,'GG15'),(123,7,120,'Reserved','6-Top',6,'GG16'),(124,7,120,'Available','6-Top',6,'GG17'),(125,7,120,'Occupied','6-Top',6,'GG18'),(126,7,120,'Available','6-Top',6,'GG19'),(127,7,120,'Available','8-Top',8,'GG20'),(128,7,120,'Reserved','8-Top',8,'GG21'),(129,8,120,'Available','2-Top',2,'OB1'),(130,8,120,'Occupied','2-Top',2,'OB2'),(131,8,120,'Available','2-Top',2,'OB3'),(132,8,120,'Reserved','2-Top',2,'OB4'),(133,8,120,'Available','2-Top',2,'OB5'),(134,8,120,'Available','2-Top',2,'OB6'),(135,8,120,'Available','4-Top',4,'OB7'),(136,8,120,'Occupied','4-Top',4,'OB8'),(137,8,120,'Available','4-Top',4,'OB9'),(138,8,120,'Reserved','4-Top',4,'OB10'),(139,8,120,'Available','4-Top',4,'OB11'),(140,8,120,'Available','4-Top',4,'OB12'),(141,8,120,'Occupied','4-Top',4,'OB13'),(142,8,120,'Available','4-Top',4,'OB14'),(143,8,120,'Reserved','4-Top',4,'OB15'),(144,8,120,'Available','4-Top',4,'OB16'),(145,8,120,'Available','6-Top',6,'OB17'),(146,8,120,'Occupied','6-Top',6,'OB18'),(147,8,120,'Available','6-Top',6,'OB19'),(148,8,120,'Reserved','6-Top',6,'OB20'),(149,8,120,'Available','6-Top',6,'OB21'),(150,8,120,'Available','6-Top',6,'OB22'),(151,8,120,'Available','8-Top',8,'OB23'),(152,8,120,'Occupied','8-Top',8,'OB24'),(153,8,120,'Available','3-Top',3,'OB25'),(154,8,120,'Reserved','3-Top',3,'OB26'),(155,9,90,'Available','2-Top',2,'ME1'),(156,9,90,'Occupied','2-Top',2,'ME2'),(157,9,90,'Available','2-Top',2,'ME3'),(158,9,90,'Reserved','2-Top',2,'ME4'),(159,9,90,'Available','2-Top',2,'ME5'),(160,9,90,'Available','2-Top',2,'ME6'),(161,9,90,'Available','4-Top',4,'ME7'),(162,9,90,'Occupied','4-Top',4,'ME8'),(163,9,90,'Available','4-Top',4,'ME9'),(164,9,90,'Reserved','4-Top',4,'ME10'),(165,9,90,'Available','4-Top',4,'ME11'),(166,9,90,'Available','4-Top',4,'ME12'),(167,9,90,'Available','6-Top',6,'ME13'),(168,9,90,'Occupied','6-Top',6,'ME14'),(169,9,90,'Available','6-Top',6,'ME15'),(170,9,90,'Reserved','6-Top',6,'ME16'),(171,9,90,'Available','2-Top',2,'ME17'),(172,10,120,'Available','8-Top',8,'AS1'),(173,10,120,'Occupied','8-Top',8,'AS2'),(174,10,120,'Available','8-Top',8,'AS3'),(175,10,120,'Reserved','8-Top',8,'AS4'),(176,10,120,'Available','8-Top',8,'AS5'),(177,10,120,'Available','8-Top',8,'AS6'),(178,10,120,'Occupied','8-Top',8,'AS7'),(179,10,120,'Available','8-Top',8,'AS8'),(180,10,120,'Available','6-Top',6,'AS9'),(181,10,120,'Occupied','6-Top',6,'AS10'),(182,10,120,'Available','6-Top',6,'AS11'),(183,10,120,'Reserved','6-Top',6,'AS12'),(184,10,120,'Available','6-Top',6,'AS13'),(185,10,120,'Available','6-Top',6,'AS14'),(186,10,120,'Available','4-Top',4,'AS15'),(187,10,120,'Occupied','4-Top',4,'AS16'),(188,10,120,'Available','4-Top',4,'AS17'),(189,10,120,'Reserved','4-Top',4,'AS18'),(190,10,120,'Available','4-Top',4,'AS19'),(191,10,120,'Available','4-Top',4,'AS20'),(192,10,120,'Available','2-Top',2,'AS21'),(193,10,120,'Occupied','2-Top',2,'AS22'),(194,10,120,'Available','2-Top',2,'AS23'),(195,11,60,'Available','2-top',4,'Main'),(196,11,60,'Available','2-top',4,'Main'),(197,11,60,'Available','2-top',4,'Main'),(198,11,60,'Available','2-top',4,'Main'),(199,11,60,'Available','Booth',6,'Dining'),(200,11,60,'Available','Booth',6,'Dining'),(201,11,60,'Available','Booth',6,'Dining'),(202,11,60,'Available','Booth',6,'Dining'),(203,12,75,'Available','Large',10,'Main'),(204,12,75,'Available','Large',10,'Main'),(205,12,75,'Available','Large',10,'Main'),(206,12,75,'Available','Large',10,'Main'),(207,12,75,'Available','Large',10,'Main'),(208,12,75,'Available','Standard',9,'Dining'),(209,12,75,'Available','Standard',9,'Dining'),(210,12,75,'Available','Standard',9,'Dining'),(211,12,75,'Available','Standard',9,'Dining'),(212,12,75,'Available','Standard',9,'Dining'),(213,13,80,'Available','Large',10,'Main'),(214,13,80,'Available','Large',10,'Main'),(215,13,80,'Available','Large',10,'Main'),(216,13,80,'Available','Booth',9,'Dining'),(217,13,80,'Available','Booth',9,'Dining'),(218,13,80,'Available','Booth',9,'Dining'),(219,13,80,'Available','Booth',9,'Dining'),(220,13,80,'Available','Booth',9,'Dining'),(221,14,70,'Available','Large',10,'Main'),(222,14,70,'Available','Large',10,'Main'),(223,14,70,'Available','Large',10,'Main'),(224,14,70,'Available','Large',10,'Main'),(225,14,70,'Available','Large',10,'Main'),(226,14,70,'Available','Small',5,'Dining'),(227,14,70,'Available','Small',5,'Dining'),(228,14,70,'Available','Small',5,'Dining'),(229,15,90,'Available','Family',14,'Main'),(230,15,90,'Available','Family',14,'Main'),(231,15,90,'Available','Family',14,'Main'),(232,15,90,'Available','Family',14,'Main'),(233,15,90,'Available','Family',14,'Main'),(234,15,90,'Available','Family',14,'Main'),(235,15,90,'Available','Family',14,'Main'),(236,15,90,'Available','Family',14,'Main'),(237,15,90,'Available','Family',14,'Main'),(238,15,90,'Available','Family',14,'Main'),(239,16,85,'Available','Large',10,'Main'),(240,16,85,'Available','Large',10,'Main'),(241,16,85,'Available','Large',10,'Main'),(242,16,85,'Available','Large',10,'Main'),(243,16,85,'Available','Large',10,'Main'),(244,16,85,'Available','Small',5,'Dining'),(245,16,85,'Available','Small',5,'Dining'),(246,16,85,'Available','Small',5,'Dining'),(247,16,85,'Available','Small',5,'Dining'),(248,16,85,'Available','Small',5,'Dining'),(249,16,85,'Available','Small',5,'Dining'),(250,16,85,'Available','Small',5,'Dining'),(251,17,95,'Available','Standard',11,'Main'),(252,17,95,'Available','Standard',11,'Main'),(253,17,95,'Available','Standard',11,'Main'),(254,17,95,'Available','Standard',11,'Main'),(255,17,95,'Available','Standard',11,'Main'),(256,17,95,'Available','Standard',11,'Main'),(257,17,95,'Available','Standard',11,'Main'),(258,17,95,'Available','Standard',11,'Main'),(259,17,95,'Available','Standard',11,'Main'),(260,17,95,'Available','Standard',11,'Main'),(261,18,65,'Available','Booth',10,'Main'),(262,18,65,'Available','Booth',10,'Main'),(263,18,65,'Available','Booth',10,'Main'),(264,18,65,'Available','Booth',10,'Main'),(265,18,65,'Available','Booth',10,'Main'),(266,18,65,'Available','Booth',10,'Main'),(267,19,70,'Available','Standard',11,'Main'),(268,19,70,'Available','Standard',11,'Main'),(269,19,70,'Available','Standard',11,'Main'),(270,19,70,'Available','Standard',11,'Main'),(271,19,70,'Available','Standard',11,'Main'),(272,20,90,'Available','BBQ Large',13,'Main'),(273,20,90,'Available','BBQ Large',13,'Main'),(274,20,90,'Available','BBQ Large',13,'Main'),(275,20,90,'Available','BBQ Large',13,'Main'),(276,20,90,'Available','BBQ Large',13,'Main'),(277,20,90,'Available','BBQ Large',13,'Main'),(278,20,90,'Available','BBQ Large',13,'Main'),(279,20,90,'Available','BBQ Large',13,'Main'),(280,20,90,'Available','BBQ Large',13,'Main'),(281,20,90,'Available','BBQ Large',13,'Main'),(282,21,70,'Available','Standard',10,'Main'),(283,21,70,'Available','Standard',10,'Main'),(284,21,70,'Available','Standard',10,'Main'),(285,21,70,'Available','Standard',10,'Main'),(286,21,70,'Available','Booth',10,'Dining'),(287,21,70,'Available','Booth',10,'Dining'),(288,21,70,'Available','Booth',10,'Dining'),(289,21,70,'Available','Booth',10,'Dining'),(290,22,85,'Available','Ocean View',10,'Main'),(291,22,85,'Available','Ocean View',10,'Main'),(292,22,85,'Available','Ocean View',10,'Main'),(293,22,85,'Available','Ocean View',10,'Main'),(294,22,85,'Available','Ocean View',10,'Main'),(295,22,85,'Available','Ocean View',10,'Main'),(296,22,85,'Available','Ocean View',10,'Main'),(297,22,85,'Available','Ocean View',10,'Main'),(298,22,85,'Available','Ocean View',10,'Main'),(299,22,85,'Available','Ocean View',10,'Main'),(300,23,60,'Available','Standard',10,'Main'),(301,23,60,'Available','Standard',10,'Main'),(302,23,60,'Available','Standard',10,'Main'),(303,23,60,'Available','Standard',10,'Main'),(304,23,60,'Available','Standard',10,'Main'),(305,23,60,'Available','Standard',10,'Main'),(306,24,80,'Available','Fine Dining',10,'Main'),(307,24,80,'Available','Fine Dining',10,'Main'),(308,24,80,'Available','Fine Dining',10,'Main'),(309,24,80,'Available','Fine Dining',10,'Main'),(310,24,80,'Available','Fine Dining',10,'Main'),(311,24,80,'Available','Fine Dining',10,'Main'),(312,24,80,'Available','Fine Dining',10,'Main'),(313,24,80,'Available','Fine Dining',10,'Main'),(314,24,80,'Available','Fine Dining',10,'Main'),(315,25,95,'Available','BBQ Large',13,'Main'),(316,25,95,'Available','BBQ Large',13,'Main'),(317,25,95,'Available','BBQ Large',13,'Main'),(318,25,95,'Available','BBQ Large',13,'Main'),(319,25,95,'Available','BBQ Large',13,'Main'),(320,25,95,'Available','BBQ Large',13,'Main'),(321,25,95,'Available','BBQ Large',13,'Main'),(322,25,95,'Available','BBQ Large',13,'Main'),(323,25,95,'Available','BBQ Large',13,'Main'),(324,25,95,'Available','BBQ Large',13,'Main'),(325,26,75,'Available','Harbor View',15,'Main'),(326,26,75,'Available','Harbor View',15,'Main'),(327,26,75,'Available','Harbor View',15,'Main'),(328,26,75,'Available','Harbor View',15,'Main'),(329,26,75,'Available','Harbor View',15,'Main'),(330,27,85,'Available','Chef Table',10,'Main'),(331,27,85,'Available','Chef Table',10,'Main'),(332,27,85,'Available','Chef Table',10,'Main'),(333,27,85,'Available','Chef Table',10,'Main'),(334,27,85,'Available','Chef Table',10,'Main'),(335,27,85,'Available','Chef Table',10,'Main'),(336,27,85,'Available','Chef Table',10,'Main'),(337,27,85,'Available','Chef Table',10,'Main'),(338,27,85,'Available','Chef Table',10,'Main'),(339,27,85,'Available','Private',5,'VIP'),(340,28,65,'Available','Beach',10,'Main'),(341,28,65,'Available','Beach',10,'Main'),(342,28,65,'Available','Beach',10,'Main'),(343,28,65,'Available','Beach',10,'Main'),(344,28,65,'Available','Beach',10,'Main'),(345,28,65,'Available','Beach',10,'Main'),(346,29,60,'Available','Urban',10,'Main'),(347,29,60,'Available','Urban',10,'Main'),(348,29,60,'Available','Urban',10,'Main'),(349,29,60,'Available','Urban',10,'Main'),(350,29,60,'Available','Urban',10,'Main'),(351,30,100,'Available','BBQ Pit',14,'Main'),(352,30,100,'Available','BBQ Pit',14,'Main'),(353,30,100,'Available','BBQ Pit',14,'Main'),(354,30,100,'Available','BBQ Pit',14,'Main'),(355,30,100,'Available','BBQ Pit',14,'Main'),(356,30,100,'Available','BBQ Pit',14,'Main'),(357,30,100,'Available','BBQ Pit',14,'Main'),(358,30,100,'Available','BBQ Pit',14,'Main'),(359,30,100,'Available','BBQ Pit',14,'Main'),(360,30,100,'Available','BBQ Pit',14,'Main'),(361,31,90,'Available','2-Top',20,'Window Side'),(362,31,90,'Available','4-Top',20,'Main Floor'),(363,31,90,'Available','Booth',15,'Lake View'),(364,31,90,'Available','6-Top',15,'Private Corner'),(365,31,90,'Available','Communal',15,'Center Hall'),(366,32,90,'Available','2-Top',20,'Rooftop Edge'),(367,32,90,'Available','4-Top',20,'Glass Wall'),(368,32,90,'Available','4-Top',20,'City View'),(369,32,90,'Available','6-Top',25,'VIP Section'),(370,32,90,'Available','Large Table',25,'Sky Lounge'),(371,33,90,'Available','2-Top',15,'Luxury Wing'),(372,33,90,'Available','4-Top',20,'Crystal Hall'),(373,33,90,'Available','Booth',15,'VIP Booths'),(374,33,90,'Available','6-Top',15,'Dining Room'),(375,33,90,'Available','Private Table',15,'Wine Room'),(376,34,90,'Available','2-Top',15,'Street View'),(377,34,90,'Available','4-Top',15,'Main Hall'),(378,34,90,'Available','Booth',15,'Corner Booths'),(379,34,90,'Available','6-Top',20,'Private Section'),(380,35,120,'Available','2-Top',20,'Front Patio'),(381,35,120,'Available','4-Top',25,'Main Hall'),(382,35,120,'Available','6-Top',25,'Smokehouse Room'),(383,35,120,'Available','8-Top',30,'BBQ Hall'),(384,35,120,'Available','Communal',20,'Festival Table'),(385,36,90,'Available','2-Top',15,'River View'),(386,36,90,'Available','4-Top',20,'Dining Hall'),(387,36,90,'Available','Booth',15,'Wine Booths'),(388,36,90,'Available','6-Top',20,'Chef Room'),(389,36,90,'Available','Private Table',20,'VIP Lounge'),(390,37,100,'Available','2-Top',20,'Harbor View'),(391,37,100,'Available','4-Top',20,'Main Deck'),(392,37,100,'Available','6-Top',20,'Sea Lounge'),(393,37,100,'Available','8-Top',20,'VIP Dock'),(394,37,100,'Available','Communal',20,'Center Hall'),(395,38,90,'Available','2-Top',15,'Sunset Deck'),(396,38,90,'Available','4-Top',15,'Main Room'),(397,38,90,'Available','Booth',15,'Lounge'),(398,38,90,'Available','6-Top',25,'VIP Corner'),(399,39,90,'Available','2-Top',15,'Street View'),(400,39,90,'Available','4-Top',20,'Main Floor'),(401,39,90,'Available','Booth',20,'Corner Booth'),(402,40,120,'Available','2-Top',20,'Front Patio'),(403,40,120,'Available','4-Top',25,'Main Hall'),(404,40,120,'Available','6-Top',25,'Smoke Room'),(405,40,120,'Available','8-Top',30,'BBQ Hall'),(406,40,120,'Available','Large Table',30,'Private Pit Room'),(407,41,90,'Available','2-Top',15,'River View'),(408,41,90,'Available','4-Top',20,'Main Hall'),(409,41,90,'Available','Booth',15,'Window Booths'),(410,41,90,'Available','6-Top',20,'Chef Section'),(411,41,90,'Available','Private Table',15,'VIP Room'),(412,42,90,'Available','2-Top',20,'Market View'),(413,42,90,'Available','4-Top',20,'Open Kitchen'),(414,42,90,'Available','4-Top',20,'Chef Counter'),(415,42,90,'Available','6-Top',20,'Dining Hall'),(416,42,90,'Available','Communal',15,'Center Table'),(417,43,90,'Available','2-Top',15,'Ocean View'),(418,43,90,'Available','4-Top',20,'Main Dining'),(419,43,90,'Available','Booth',15,'Luxury Booths'),(420,43,90,'Available','6-Top',15,'Private Wing'),(421,43,90,'Available','VIP Table',15,'Chef Room'),(422,44,90,'Available','2-Top',15,'Street View'),(423,44,90,'Available','4-Top',15,'Main Floor'),(424,44,90,'Available','Booth',15,'Corner Booth'),(425,44,90,'Available','6-Top',15,'Private Room'),(426,45,120,'Available','2-Top',25,'River Patio'),(427,45,120,'Available','4-Top',30,'Main Hall'),(428,45,120,'Available','6-Top',30,'Smoke Room'),(429,45,120,'Available','8-Top',30,'BBQ Hall'),(430,45,120,'Available','Communal',25,'Festival Table'),(431,46,90,'Available','2-Top',15,'Gold Room'),(432,46,90,'Available','4-Top',20,'Dining Hall'),(433,46,90,'Available','Booth',15,'Chef Booths'),(434,46,90,'Available','6-Top',10,'VIP Lounge'),(435,46,90,'Available','Private Table',15,'Tasting Room'),(436,47,100,'Available','2-Top',20,'Bay View'),(437,47,100,'Available','4-Top',25,'Main Deck'),(438,47,100,'Available','6-Top',25,'Sea Lounge'),(439,47,100,'Available','8-Top',20,'VIP Dock'),(440,47,100,'Available','Communal',20,'Center Hall'),(441,48,90,'Available','2-Top',15,'Beachfront'),(442,48,90,'Available','4-Top',15,'Main Room'),(443,48,90,'Available','Booth',15,'Lounge'),(444,48,90,'Available','6-Top',25,'Private Deck'),(445,49,90,'Available','2-Top',20,'Grand Hall'),(446,49,90,'Available','4-Top',20,'Dining Room'),(447,49,90,'Available','Booth',20,'Corner Booths'),(448,49,90,'Available','6-Top',15,'VIP Room'),(449,49,90,'Available','Private Table',15,'Chef Table'),(450,50,120,'Available','2-Top',25,'Front Patio'),(451,50,120,'Available','4-Top',30,'Main Hall'),(452,50,120,'Available','6-Top',25,'Smoke Pit Room'),(453,50,120,'Available','8-Top',30,'BBQ Hall'),(454,50,120,'Available','Communal',20,'Festival Table');
/*!40000 ALTER TABLE `restaurantTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestHasTag`
--

DROP TABLE IF EXISTS `RestHasTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestHasTag` (
  `restID` int NOT NULL,
  `tagID` int NOT NULL,
  PRIMARY KEY (`restID`,`tagID`),
  KEY `rest_tag_tag_fk` (`tagID`),
  CONSTRAINT `rest_tag_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  CONSTRAINT `rest_tag_tag_fk` FOREIGN KEY (`tagID`) REFERENCES `tag` (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestHasTag`
--

LOCK TABLES `RestHasTag` WRITE;
/*!40000 ALTER TABLE `RestHasTag` DISABLE KEYS */;
INSERT INTO `RestHasTag` VALUES (1,1),(3,1),(9,1),(1,2),(8,2),(1,5),(4,5),(4,6),(2,7),(8,7),(2,8),(6,8),(8,8),(3,10),(3,11),(4,14),(5,18),(5,19),(10,19),(5,20),(6,21),(6,22),(2,23),(7,23),(2,24),(7,24),(7,27),(7,28),(8,30),(9,31),(9,32),(10,33),(10,34),(10,35),(1,36),(8,36),(2,37),(3,37),(6,37),(7,37),(9,37),(4,38),(5,39),(10,39),(1,40),(4,40),(5,40);
/*!40000 ALTER TABLE `RestHasTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `userID` int NOT NULL,
  `diningDate` date DEFAULT NULL,
  `foodRating` int DEFAULT NULL,
  `numOfStars` int DEFAULT NULL,
  `overallRating` decimal(2,1) DEFAULT NULL,
  `ambRating` int DEFAULT NULL,
  `text_content` text,
  `serviceRating` int DEFAULT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `review_rest_fk` (`restID`),
  KEY `review_user_fk` (`userID`),
  CONSTRAINT `review_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`),
  CONSTRAINT `review_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'2026-04-01',5,5,5.0,5,'Excellent modern dining experience with great service.',5),(2,1,2,'2026-04-12',4,4,4.3,4,'Great food but slightly slow service.',4),(3,1,3,'2026-04-23',5,5,4.8,5,'Amazing rooftop atmosphere and quality dishes.',5),(4,2,4,'2026-04-11',5,5,5.0,5,'World-class seafood and stunning waterfront view.',5),(5,2,5,'2026-04-22',4,4,4.5,4,'Very fresh seafood, slightly expensive.',4),(6,3,6,'2026-04-15',5,5,4.9,5,'Perfect steak, cooked exactly right.',5),(7,4,7,'2026-04-21',4,4,4.2,4,'Nice ambiance but limited menu.',4),(8,4,8,'2026-05-12',5,5,4.7,5,'Rooftop dining was incredible.',5),(9,4,9,'2026-05-13',3,3,3.8,3,'Good but overpriced for portion size.',3),(10,5,10,'2026-05-11',5,5,4.9,5,'Best Tex-Mex in the city.',5),(11,5,11,'2026-05-02',4,4,4.4,4,'Fun vibe and solid food.',4),(12,6,12,'2026-04-17',5,5,4.8,5,'Elegant French dining experience.',5),(13,7,13,'2026-05-01',5,5,5.0,5,'Michelin-level experience, outstanding.',5),(14,7,14,'2026-05-02',4,4,4.6,4,'Very refined but small portions.',4),(15,7,15,'2026-05-05',5,5,4.9,5,'Incredible tasting menu experience.',5),(16,8,16,'2026-05-01',4,4,4.3,4,'Fresh seafood with good presentation.',4),(17,8,17,'2026-05-06',5,5,4.7,5,'Beautiful ocean view and great service.',5),(18,9,18,'2026-05-01',5,5,4.9,5,'Classic NYC dining done right.',5),(19,10,19,'2026-05-11',5,5,5.0,5,'Best BBQ in Austin, hands down.',5),(20,10,20,'2026-05-21',4,4,4.5,4,'Great smoky flavor and atmosphere.',4);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReviewHasTag`
--

DROP TABLE IF EXISTS `ReviewHasTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReviewHasTag` (
  `reviewID` int NOT NULL,
  `tagID` int NOT NULL,
  PRIMARY KEY (`reviewID`,`tagID`),
  KEY `review_tag_tag_fk` (`tagID`),
  CONSTRAINT `review_tag_review_fk` FOREIGN KEY (`reviewID`) REFERENCES `review` (`reviewID`),
  CONSTRAINT `review_tag_tag_fk` FOREIGN KEY (`tagID`) REFERENCES `tag` (`tagID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReviewHasTag`
--

LOCK TABLES `ReviewHasTag` WRITE;
/*!40000 ALTER TABLE `ReviewHasTag` DISABLE KEYS */;
INSERT INTO `ReviewHasTag` VALUES (1,1),(1,2),(17,2),(2,3),(2,4),(11,4),(1,5),(3,5),(3,6),(5,6),(4,7),(16,7),(4,8),(5,9),(6,10),(6,11),(7,12),(7,13),(8,14),(8,15),(9,16),(9,17),(10,18),(10,19),(20,19),(11,20),(12,21),(12,22),(13,23),(13,24),(14,25),(14,26),(15,27),(15,28),(16,29),(17,30),(18,31),(18,32),(19,33),(19,34),(20,35);
/*!40000 ALTER TABLE `ReviewHasTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved`
--

DROP TABLE IF EXISTS `saved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saved` (
  `userID` int NOT NULL,
  `restID` int NOT NULL,
  PRIMARY KEY (`userID`,`restID`),
  KEY `restID` (`restID`),
  CONSTRAINT `saved_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `saved_ibfk_2` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved`
--

LOCK TABLES `saved` WRITE;
/*!40000 ALTER TABLE `saved` DISABLE KEYS */;
INSERT INTO `saved` VALUES (2,1),(6,1),(1,2),(4,2),(7,2),(2,3),(8,3),(3,4),(9,4),(1,5),(10,5),(3,6),(11,6),(2,7),(12,7),(3,8),(13,8),(4,9),(14,9),(1,10),(5,10),(15,10),(4,11),(16,11),(5,12),(17,12),(6,13),(18,13),(7,14),(19,14),(5,15),(20,15),(6,16),(7,17),(8,18),(9,19),(8,20),(9,21),(10,22),(10,23),(11,24),(11,25),(12,26),(12,27),(13,28),(13,29),(14,30),(14,31),(15,32),(15,33),(16,34),(16,35),(17,36),(17,37),(18,38),(18,39),(19,40),(19,41),(20,42),(20,43);
/*!40000 ALTER TABLE `saved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicePeriod`
--

DROP TABLE IF EXISTS `servicePeriod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicePeriod` (
  `spID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `periodName` varchar(50) DEFAULT NULL,
  `dayOfWeek` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `serviceType` enum('Breakfast','Brunch','Lunch','Dinner','Late Night') DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`spID`),
  KEY `sp_rest_fk` (`restID`),
  CONSTRAINT `sp_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicePeriod`
--

LOCK TABLES `servicePeriod` WRITE;
/*!40000 ALTER TABLE `servicePeriod` DISABLE KEYS */;
INSERT INTO `servicePeriod` VALUES (1,1,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(2,1,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(3,1,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(4,2,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(5,2,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(6,3,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(7,4,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(8,4,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(9,5,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(10,5,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(11,6,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(12,6,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(13,7,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(14,8,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(15,8,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(16,9,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(17,10,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(18,10,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(19,10,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(20,11,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(21,11,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(22,12,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(23,13,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(24,13,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(25,14,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(26,14,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(27,15,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(28,15,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(29,16,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(30,17,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(31,17,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(32,18,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(33,19,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(34,19,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(35,20,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(36,20,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(37,21,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(38,21,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(39,22,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(40,23,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(41,23,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(42,24,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(43,25,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(44,25,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(45,25,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(46,26,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(47,27,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(48,27,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(49,28,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(50,29,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(51,29,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(52,30,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(53,31,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(54,31,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(55,32,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(56,33,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(57,33,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(58,34,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(59,35,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(60,35,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(61,36,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(62,36,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(63,37,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(64,38,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(65,38,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(66,39,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(67,40,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(68,40,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(69,41,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(70,42,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(71,42,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(72,43,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(73,44,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(74,44,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(75,45,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(76,46,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(77,46,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(78,47,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(79,48,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(80,48,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(81,49,'Dinner','Monday','Dinner','17:00:00','22:00:00'),(82,50,'Breakfast','Monday','Breakfast','08:00:00','11:00:00'),(83,50,'Lunch','Monday','Lunch','12:00:00','15:00:00'),(84,50,'Dinner','Monday','Dinner','17:00:00','22:00:00');
/*!40000 ALTER TABLE `servicePeriod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specials` (
  `specID` int NOT NULL AUTO_INCREMENT,
  `restID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`specID`),
  KEY `specials_rest_fk` (`restID`),
  CONSTRAINT `specials_rest_fk` FOREIGN KEY (`restID`) REFERENCES `restaurant` (`restID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specials`
--

LOCK TABLES `specials` WRITE;
/*!40000 ALTER TABLE `specials` DISABLE KEYS */;
INSERT INTO `specials` VALUES (1,1,'Chef Tasting Menu',75.00,'5 course meal'),(2,2,'Seafood Feast',120.00,'Luxury platter'),(3,3,'Steak Night',60.00,'Special cut selection'),(4,4,'Wine Pairing Menu',90.00,'Curated wines'),(5,5,'BBQ Platter',55.00,'Family style'),(6,6,'French Degustation',110.00,'Chef curated'),(7,7,'Sushi Omakase',130.00,'Chef choice'),(8,8,'Ocean Special',95.00,'Mixed seafood'),(9,9,'NY Signature Menu',85.00,'Exclusive dishes'),(10,10,'Texas Smoke Feast',70.00,'BBQ sampler');
/*!40000 ALTER TABLE `specials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tagID` int NOT NULL AUTO_INCREMENT,
  `tagName` varchar(50) NOT NULL,
  PRIMARY KEY (`tagID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Excellent Food'),(2,'Great Service'),(3,'Slow Service'),(4,'Good Food'),(5,'Rooftop Experience'),(6,'High Quality'),(7,'Fresh Seafood'),(8,'Waterfront View'),(9,'Expensive'),(10,'Perfectly Cooked'),(11,'Steakhouse'),(12,'Limited Menu'),(13,'Average Value'),(14,'Rooftop Dining'),(15,'Great Experience'),(16,'Overpriced'),(17,'Decent Food'),(18,'Best Tex-Mex'),(19,'Great Value'),(20,'Fun Atmosphere'),(21,'Elegant Dining'),(22,'French Cuisine'),(23,'Michelin Quality'),(24,'Exceptional Food'),(25,'Small Portions'),(26,'Refined Dining'),(27,'Tasting Menu'),(28,'High End Cuisine'),(29,'Good Presentation'),(30,'Ocean View'),(31,'Classic NYC Dining'),(32,'Premium Quality'),(33,'Best BBQ'),(34,'Smoked Perfection'),(35,'Great Atmosphere'),(36,'Kid Friendly'),(37,'Romantic'),(38,'Vegetarian Options'),(39,'Live Music'),(40,'Outdoor Seating');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslot` (
  `slotID` int NOT NULL AUTO_INCREMENT,
  `reservationID` int DEFAULT NULL,
  `spID` int NOT NULL,
  `expID` int DEFAULT NULL,
  `points` int DEFAULT '100',
  `slotDate` date DEFAULT NULL,
  `slotTime` time DEFAULT NULL,
  PRIMARY KEY (`slotID`),
  KEY `slot_res_fk` (`reservationID`),
  KEY `slot_sp_fk` (`spID`),
  KEY `slot_exp_fk` (`expID`),
  CONSTRAINT `slot_exp_fk` FOREIGN KEY (`expID`) REFERENCES `experience` (`expID`),
  CONSTRAINT `slot_res_fk` FOREIGN KEY (`reservationID`) REFERENCES `reservation` (`reservationID`),
  CONSTRAINT `slot_sp_fk` FOREIGN KEY (`spID`) REFERENCES `servicePeriod` (`spID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslot`
--

LOCK TABLES `timeslot` WRITE;
/*!40000 ALTER TABLE `timeslot` DISABLE KEYS */;
INSERT INTO `timeslot` VALUES (1,NULL,1,1,100,'2026-01-15','17:00:00'),(2,NULL,2,1,100,'2026-02-01','18:00:00'),(3,NULL,3,2,150,'2026-02-10','18:30:00'),(4,NULL,4,2,150,'2026-03-01','19:00:00'),(5,NULL,5,3,100,'2026-03-15','17:30:00'),(6,NULL,6,3,100,'2026-04-01','18:00:00'),(7,NULL,7,4,200,'2026-04-10','19:00:00'),(8,NULL,8,4,200,'2026-05-01','18:30:00'),(9,NULL,9,5,100,'2026-05-15','17:00:00'),(10,NULL,10,5,100,'2026-06-01','18:00:00'),(11,NULL,11,6,150,'2026-06-10','19:00:00'),(12,NULL,12,6,150,'2026-07-01','18:30:00'),(13,NULL,13,7,100,'2026-07-15','17:30:00'),(14,NULL,14,7,100,'2026-08-01','18:00:00'),(15,NULL,15,8,200,'2026-08-10','19:00:00'),(16,NULL,16,8,200,'2026-09-01','18:30:00'),(17,NULL,17,9,100,'2026-09-15','17:00:00'),(18,NULL,18,9,100,'2026-10-01','18:00:00'),(19,NULL,19,11,150,'2026-10-10','19:00:00'),(20,NULL,20,12,150,'2026-11-01','18:30:00');
/*!40000 ALTER TABLE `timeslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `anniversary` date DEFAULT NULL,
  `loyaltyPoints` int DEFAULT '0',
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ava','Johnson','ava1@gmail.com','2022-01-10',120,'12 Lake St','Chicago','IL','60601'),(2,'Liam','Smith','liam2@gmail.com','2021-05-22',340,'88 Market St','San Francisco','CA','94105'),(3,'Noah','Brown','noah3@gmail.com','2020-09-14',210,'77 Ocean Dr','Miami','FL','33139'),(4,'Emma','Davis','emma4@gmail.com','2023-03-11',90,'55 Broadway','New York','NY','10001'),(5,'Olivia','Wilson','olivia5@gmail.com','2022-07-19',410,'33 Congress Ave','Austin','TX','73301'),(6,'Elijah','Taylor','eli6@gmail.com','2021-11-02',150,'12 State St','Chicago','IL','60602'),(7,'Sophia','Anderson','sophia7@gmail.com','2020-06-30',275,'9 Castro St','San Francisco','CA','94114'),(8,'James','Thomas','james8@gmail.com','2023-02-18',60,'101 Collins Ave','Miami','FL','33133'),(9,'Isabella','Moore','isa9@gmail.com','2022-08-25',330,'44 Wall St','New York','NY','10005'),(10,'Lucas','Martin','lucas10@gmail.com','2021-12-01',200,'19 6th St','Austin','TX','73344'),(11,'Mia','Lee','mia11@gmail.com','2023-01-05',110,'77 Wacker Dr','Chicago','IL','60603'),(12,'Ethan','Perez','ethan12@gmail.com','2020-10-10',390,'66 Mission St','San Francisco','CA','94103'),(13,'Amelia','White','amelia13@gmail.com','2022-04-12',220,'10 Brickell Ave','Miami','FL','33130'),(14,'Harper','Harris','harper14@gmail.com','2021-03-08',180,'99 5th Ave','New York','NY','10011'),(15,'Benjamin','Clark','ben15@gmail.com','2023-06-20',95,'11 South Congress','Austin','TX','73301'),(16,'Charlotte','Lewis','char16@gmail.com','2022-02-14',260,'8 Michigan Ave','Chicago','IL','60604'),(17,'Henry','Walker','henry17@gmail.com','2021-07-09',300,'21 Market St','San Francisco','CA','94111'),(18,'Evelyn','Young','eve18@gmail.com','2020-12-19',140,'34 Miami Beach','Miami','FL','33141'),(19,'Alexander','Allen','alex19@gmail.com','2023-09-01',70,'18 Madison Ave','New York','NY','10010'),(20,'Abigail','King','abi20@gmail.com','2022-10-10',450,'5 Austin St','Austin','TX','73344'),(21,'Daniel','Scott','dan21@gmail.com','2021-01-15',210,'12 Lake Shore','Chicago','IL','60605'),(22,'Emily','Green','em22@gmail.com','2020-05-05',320,'77 Castro','San Francisco','CA','94110'),(23,'Matthew','Baker','mat23@gmail.com','2023-03-03',130,'88 Ocean Blvd','Miami','FL','33137'),(24,'Ella','Adams','ella24@gmail.com','2022-06-16',175,'66 Park Ave','New York','NY','10016'),(25,'David','Nelson','dav25@gmail.com','2021-08-28',280,'9 Congress','Austin','TX','73301'),(26,'Grace','Carter','gra26@gmail.com','2020-11-11',90,'55 State St','Chicago','IL','60606'),(27,'Logan','Mitchell','log27@gmail.com','2023-04-04',410,'22 Market','San Francisco','CA','94102'),(28,'Chloe','Perez','chlo28@gmail.com','2022-09-09',150,'11 Miami Ave','Miami','FL','33132'),(29,'Sebastian','Roberts','seb29@gmail.com','2021-02-02',360,'19 Wall St','New York','NY','10007'),(30,'Victoria','Turner','vic30@gmail.com','2020-07-07',240,'88 Austin Blvd','Austin','TX','73301'),(31,'Jack','Phillips','jack31@gmail.com','2022-01-21',110,'13 Lake St','Chicago','IL','60607'),(32,'Lily','Campbell','lily32@gmail.com','2021-05-15',300,'44 Mission','San Francisco','CA','94109'),(33,'Owen','Parker','owen33@gmail.com','2020-03-03',200,'77 Brickell','Miami','FL','33131'),(34,'Hannah','Evans','hannah34@gmail.com','2023-08-08',95,'55 6th Ave','New York','NY','10012'),(35,'Wyatt','Edwards','wy35@gmail.com','2022-11-11',260,'12 Congress','Austin','TX','73344'),(36,'Zoey','Collins','zo36@gmail.com','2021-12-12',180,'9 Lake Shore','Chicago','IL','60608'),(37,'Caleb','Stewart','cal37@gmail.com','2020-10-10',410,'88 Market','San Francisco','CA','94108'),(38,'Nora','Sanchez','nor38@gmail.com','2023-05-05',120,'66 Ocean Dr','Miami','FL','33136'),(39,'Ryan','Morris','ry39@gmail.com','2022-02-02',330,'11 Wall St','New York','NY','10009'),(40,'Layla','Rogers','la40@gmail.com','2021-09-09',210,'33 Austin St','Austin','TX','73301'),(41,'Nathan','Reed','na41@gmail.com','2020-06-06',150,'21 Lake St','Chicago','IL','60609'),(42,'Aubrey','Cook','au42@gmail.com','2023-03-13',280,'19 Castro','San Francisco','CA','94107'),(43,'Isaac','Morgan','is43@gmail.com','2022-07-07',390,'77 Miami Blvd','Miami','FL','33134'),(44,'Scarlett','Bell','sc44@gmail.com','2021-04-04',90,'55 Park Ave','New York','NY','10013'),(45,'Dylan','Murphy','dy45@gmail.com','2020-01-01',450,'88 Congress','Austin','TX','73301'),(46,'Aria','Bailey','ar46@gmail.com','2022-08-18',160,'12 Lake Shore','Chicago','IL','60610'),(47,'Luke','Rivera','lu47@gmail.com','2021-11-11',300,'44 Market','San Francisco','CA','94106'),(48,'Sofia','Cooper','so48@gmail.com','2020-09-09',220,'66 Ocean Dr','Miami','FL','33138'),(49,'Andrew','Richardson','an49@gmail.com','2023-06-06',130,'11 Wall St','New York','NY','10014'),(50,'Riley','Howard','ri50@gmail.com','2022-12-12',370,'99 Austin Blvd','Austin','TX','73344');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userPreference`
--

DROP TABLE IF EXISTS `userPreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userPreference` (
  `userID` int NOT NULL,
  `preferenceID` int NOT NULL,
  PRIMARY KEY (`userID`,`preferenceID`),
  KEY `user_pref_pref_fk` (`preferenceID`),
  CONSTRAINT `user_pref_pref_fk` FOREIGN KEY (`preferenceID`) REFERENCES `Preferences` (`preferenceID`),
  CONSTRAINT `user_pref_user_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userPreference`
--

LOCK TABLES `userPreference` WRITE;
/*!40000 ALTER TABLE `userPreference` DISABLE KEYS */;
INSERT INTO `userPreference` VALUES (1,1),(14,1),(2,2),(16,2),(26,2),(36,2),(46,2),(3,3),(17,3),(27,3),(37,3),(47,3),(4,4),(24,4),(34,4),(44,4),(5,5),(6,6),(13,6),(23,6),(33,6),(43,6),(7,7),(18,7),(28,7),(38,7),(48,7),(8,8),(15,8),(25,8),(35,8),(45,8),(9,9),(19,9),(29,9),(39,9),(49,9),(10,10),(20,10),(30,10),(40,10),(50,10),(11,11),(21,11),(31,11),(41,11),(12,12),(22,12),(32,12),(42,12);
/*!40000 ALTER TABLE `userPreference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 22:09:08
