-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: gymdatabase
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `FoodID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Calories` int NOT NULL,
  `Protein` float NOT NULL,
  `Carbs` float NOT NULL,
  `Fats` float NOT NULL,
  PRIMARY KEY (`FoodID`),
  CONSTRAINT `food_chk_1` CHECK ((`Calories` >= 0)),
  CONSTRAINT `food_chk_2` CHECK ((`Protein` >= 0)),
  CONSTRAINT `food_chk_3` CHECK ((`Carbs` >= 0)),
  CONSTRAINT `food_chk_4` CHECK ((`Fats` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Eggs',466,41,30,4),(2,'Blood oranges',787,12,43,21),(3,'Cream Cheese',486,25,11,5),(4,'Snowpea sprouts',500,35,53,24),(5,'Spinach',439,37,16,24),(6,'Wholegrain Bread',291,22,57,16),(7,'Brazil Nut',716,26,3,22),(8,'Grapefruit',155,16,3,27),(9,'Amchur',449,47,7,10),(10,'Clams',204,30,57,18),(11,'Corn Oil',200,47,19,29),(12,'Chicken',186,34,16,15),(13,'Lettuce',521,33,15,4),(14,'Chinese Five Spice',161,33,32,27),(15,'Ricemilk',382,28,56,10),(16,'Blue Eye Trevalla',317,40,47,28),(17,'French eschallots',521,33,1,30),(18,'Sun dried tomatoes',357,27,52,28),(19,'Szechuan Pepperberry',193,14,15,26),(20,'Loquats',763,22,54,15),(21,'Ajowan Seed',506,15,21,23),(22,'Red cabbage',348,21,57,4),(23,'Snapper',199,35,13,16),(24,'Cous Cous',643,19,13,20),(25,'Hot smoked salmon',344,18,11,27),(26,'Papaw',223,5,39,8),(27,'Licorice',257,50,50,7),(28,'Oysters',212,32,10,4),(29,'Rye',93,25,39,9),(30,'Blueberries',783,42,3,26),(31,'Barramundi',432,34,31,17),(32,'Raisin',458,47,50,10),(33,'Albacore Tuna',473,39,9,25),(34,'Nasturtium',424,30,47,27),(35,'Bread',567,5,24,15),(36,'Prunes',620,7,28,10),(37,'Canola Oil',527,9,35,1),(38,'Fish Sauce',476,16,52,9),(39,'Pumpkin',606,40,19,22),(40,'Vegetable spaghetti',52,22,6,4),(41,'Tamarillo',640,42,39,16),(42,'Adzuki Beans',736,31,24,22),(43,'Corn Tortilla',298,10,34,20),(44,'Wakame',141,29,50,20),(45,'English Spinach',782,36,58,6),(46,'Harissa',577,47,23,12),(47,'Corn Tortilla',444,37,3,25),(48,'SwordfishTabasco',433,24,40,24),(49,'Snapper',324,37,51,27),(50,'Whiting Wild Rice',226,27,24,1),(51,'Coriander Leaves',787,43,21,6),(52,'Parsnip',509,6,55,16),(53,'Galangal',418,27,12,17),(54,'Achacha',405,7,15,26),(55,'Cardamom',272,34,26,23),(56,'Cannellini Beans',577,30,1,16),(57,'Vegetable Stock',311,36,24,30),(58,'Crabs',189,27,30,9),(59,'Freekeh',152,29,21,8),(60,'Butternut pumpkin',372,19,6,22),(61,'Lychees',607,38,45,1),(62,'Blackberries',189,47,34,6),(63,'Turnips',78,26,14,17),(64,'SwedeSweet Chilli Sauce',159,28,27,19),(65,'Soy Milk',540,14,12,1),(66,'Lychees',578,37,21,22),(67,'Purple RiceQuail',463,41,38,30),(68,'Cherries',696,27,45,12),(69,'Scallops',349,26,21,11),(70,'Apricots',238,19,9,3),(71,'Hiramasa Kingfish',259,23,13,18),(72,'Lemongrass',747,24,36,23),(73,'Enoki Mushrooms',617,38,54,16),(74,'Margarine',709,13,32,8),(75,'Cucumber',692,23,52,27),(76,'Cinnamon',93,45,36,10),(77,'Kangaroo',182,26,15,9),(78,'Wholemeal',552,29,53,13),(79,'Endive',697,50,57,21),(80,'Cumquat',258,48,34,20),(81,'Oatmeal',316,10,46,19),(82,'Elderberry',333,36,36,24),(83,'Lemon',132,48,8,17),(84,'Kale',526,10,42,8),(85,'Dashi',765,15,53,7),(86,'Almonds',664,13,43,6),(87,'Mahi mahi',400,24,53,2),(88,'Aubergine',171,9,12,17),(89,'Pineapple',777,17,60,10),(90,'Kale',487,45,39,28),(91,'Brazil Nut',427,44,54,29),(92,'Common Cultivated Mushrooms',84,31,2,4),(93,'Persimmon',146,13,16,25),(94,'Tom Yum',78,18,58,18),(95,'Lemongrass',698,50,33,2),(96,'Grapefruit',359,25,25,28),(97,'Polenta',382,38,55,6),(98,'French eschallots',539,39,4,26),(99,'Green beans',140,14,12,7),(100,'Provolone',762,30,3,15),(101,'Raspberry',281,42,12,22),(102,'Green Pepper',567,20,51,29),(103,'Saffron',739,35,57,9),(104,'Lychees',557,9,7,10),(105,'Papaw',86,29,7,17),(106,'Raspberry',239,25,3,21),(107,'Slivered Almonds',215,32,57,12),(108,'Cloves',645,14,9,19),(109,'GemGinger',303,44,1,13),(110,'Cavalo',281,43,25,23),(111,'Scallops',110,34,18,8),(112,'Brown rice vinegar',154,44,42,9),(113,'Dill',204,48,38,26),(114,'Anchovies',708,19,21,3),(115,'Soy Sauce',391,5,56,23),(116,'Nutmeg',670,48,50,20),(117,'Kale',178,39,57,15),(118,'Chicken Stock',749,23,35,8),(119,'Harissa',96,44,12,20),(120,'FlourRice',572,29,51,13),(121,'Cinnamon',121,37,15,25),(122,'Pork',104,49,40,10),(123,'Dried Apricots',266,22,58,4),(124,'Apples',394,21,36,11),(125,'Amaranth',549,21,25,3),(126,'Vegetable Stock',244,48,17,2),(127,'Lychees',216,28,52,6),(128,'Apples',67,37,38,13),(129,'Pork',531,17,49,6),(130,'Pears',699,15,34,11),(131,'Passionfruit',500,38,6,5),(132,'Pears',760,43,49,20),(133,'Mint',477,6,20,10),(134,'Rye',374,24,54,2),(135,'Semolina',309,19,53,17),(136,'Persimmon',318,27,45,3),(137,'Canola Oil',419,26,44,23),(138,'Cashews',101,6,1,18),(139,'Warehou',343,33,40,18),(140,'Goat Cheese',85,42,21,7),(141,'Kecap Manis',544,50,49,17),(142,'Tempeh',156,46,49,26),(143,'Iceberg lettuce',296,38,11,17),(144,'Soy Beans',320,15,26,11),(145,'Albacore Tuna',299,28,12,29),(146,'Almond oil',519,46,54,20),(147,'Asafoetida',688,24,48,17),(148,'Oysters',378,24,4,12),(149,'Zucchini',261,43,59,21),(150,'Bread',756,31,18,19),(151,'Cocoa powder',531,17,17,29),(152,'Beans',255,28,54,28),(153,'Pineapple',276,31,30,1),(154,'Yeast',585,10,13,22),(155,'Coriander Seed',145,7,47,11),(156,'Cannellini Beans',659,21,41,15),(157,'Goat Cheese',750,28,42,10),(158,'Oats',331,26,59,21),(159,'Bocconcini',631,11,39,19),(160,'Taleggio cheese',148,16,26,4),(161,'Grapes',513,42,21,5),(162,'Agave Syrup',557,15,20,1),(163,'Margarine',242,47,40,6),(164,'Anchovies',788,9,2,11),(165,'Bonza',544,48,31,27),(166,'Pears',297,15,46,27),(167,'Watermelon',601,25,21,3),(168,'Pear',354,33,43,16),(169,'Hiramasa Kingfish',555,19,34,23),(170,'Edam',553,18,38,7),(171,'Cinnamon',588,42,5,27),(172,'Omega Spread',526,46,30,16),(173,'Green Tea',379,49,46,13),(174,'Buckwheat',683,43,36,10),(175,'Asian Greens',619,28,26,11),(176,'English Spinach',155,8,31,8),(177,'Molasses',292,33,39,2),(178,'Rice Noodles',360,12,59,12),(179,'Aniseed',231,14,54,7),(180,'Zucchini',503,21,54,2),(181,'Cumquat',766,34,56,5),(182,'Turnips',784,41,11,4),(183,'Extra Virgin Olive Oil',688,8,33,22),(184,'Wheatgrass juice',192,5,30,11),(185,'Mussels',762,39,11,3),(186,'Vegetable Oil',94,25,40,23),(187,'Koshihikari rice',50,24,9,10),(188,'Flaxseed Oil',398,28,11,29),(189,'Farmed Prawns',528,9,31,17),(190,'Sun dried tomatoes',700,41,37,15),(191,'Macadamia Nut',724,27,50,24),(192,'Fish Stock',702,43,20,15),(193,'Bran',97,38,57,6),(194,'Flounder',251,30,27,10),(195,'Coriander Leaves',94,13,49,14),(196,'Pumpkin Seed',188,15,17,17),(197,'Nutritional Yeast',408,30,51,20),(198,'Cream Cheese',641,22,28,13),(199,'Celery',794,45,5,1),(200,'Jewfish',544,12,3,25),(201,'Star Anise',770,40,33,12),(202,'Marjoram',531,43,42,27),(203,'Brazil Nut',376,43,60,29),(204,'Prunes',503,43,49,15),(205,'Pear',704,15,32,5),(206,'Brazil Nut',540,9,26,18),(207,'Soy Sauce',559,12,22,14),(208,'Nashi Pear',623,33,24,9),(209,'Artichoke',272,9,51,10),(210,'Artichoke',323,40,1,10),(211,'Marigold',422,16,12,1),(212,'Sardines',151,12,27,6),(213,'Oats',338,5,32,2),(214,'Papaya',355,30,9,26),(215,'Tapioca Flour',386,9,29,17),(216,'White wine vinegar',65,30,18,25),(217,'Incaberries',68,6,14,9),(218,'Garlic',622,16,41,23),(219,'Fennel Seeds',163,13,28,23),(220,'Mangosteens',783,22,14,24),(221,'Freekeh',441,5,12,18),(222,'Octopus',315,23,60,17),(223,'Parsnip',641,24,10,16),(224,'Peaches',710,26,4,5),(225,'Brown Mushrooms',492,14,6,22),(226,'Silverbeet',162,14,2,29),(227,'Peanuts',137,10,13,4),(228,'Nutritional Yeast',684,11,41,17),(229,'Kombu',232,38,54,27),(230,'Zucchini',695,30,37,23),(231,'Purple RiceQuail',289,27,52,29),(232,'Flathead',591,14,21,9),(233,'Banana',124,19,49,17),(234,'Cumin',233,46,41,10),(235,'Yogurt',520,20,39,17),(236,'Buckwheat Flour',737,48,1,26),(237,'Alfalfa',632,17,6,16),(238,'Avocado',196,18,1,13),(239,'Star Anise',375,46,29,14),(240,'Hummus',628,29,54,7),(241,'French eschallots',592,21,28,25),(242,'Jewfish',246,48,33,15),(243,'CarobCarrot',582,25,21,20),(244,'Broccoli',413,29,50,16),(245,'Kohlrabi',314,23,50,30),(246,'Chestnut',552,41,3,27),(247,'Tapioca Flour',444,48,10,24),(248,'Bush Tomato',481,44,28,1),(249,'Squid',797,32,2,30),(250,'Tea',58,50,33,27),(251,'WhiteBread',471,16,40,3),(252,'Chickpea',700,10,13,23),(253,'Edamame',335,8,14,29),(254,'Lychees',58,50,33,2),(255,'Black Eyed Beans',726,23,3,13),(256,'Quinoa',362,12,11,9),(257,'Bonza',163,49,19,7),(258,'Saffron',344,19,34,29),(259,'Marjoram',214,29,13,27),(260,'Almonds',404,46,37,15),(261,'Lamb',773,43,31,25),(262,'Nori',661,27,8,20),(263,'Nori',519,20,31,15),(264,'Chinese Cabbage',92,43,18,16),(265,'Apple juice',598,6,8,1),(266,'Wheatgrass juice',312,49,18,1),(267,'Coriander Seed',546,37,39,30),(268,'Pear',382,6,17,18),(269,'Vermicelli Noodles',772,42,25,20),(270,'Rockmelon',504,26,12,11),(271,'Custard ApplesDaikon',458,8,17,30),(272,'Kombu',456,14,21,28),(273,'Oysters',143,6,60,21),(274,'Beef Stock',643,17,48,20),(275,'Raspberry',154,42,46,27),(276,'Balsamic Vinegar',97,47,42,21),(277,'Tomatoes',141,23,11,1),(278,'SwordfishTabasco',424,47,36,8),(279,'Buttermilk',665,9,47,27),(280,'Rhubarb',739,23,58,12),(281,'Vegetable Oil',663,31,41,15),(282,'Eggplant',786,8,38,28),(283,'UnbleachedFlour',695,8,51,22),(284,'Brown Rice',328,45,30,22),(285,'Garam Masala',180,46,13,7),(286,'Dandelion',695,25,7,12),(287,'Grapes',324,46,45,5),(288,'Rice Noodles',582,34,45,28),(289,'FlourOat',52,20,41,23),(290,'Bean Shoots',159,18,56,4),(291,'Porcini mushrooms',707,50,55,2),(292,'Mulberries',620,25,4,23),(293,'Vinegar',95,45,24,28),(294,'Grapes',390,41,9,12),(295,'Greenwheat Freekeh',666,45,26,15),(296,'Harissa',435,24,8,16),(297,'Fenugreek',636,25,44,21),(298,'Cranberry',256,39,59,25),(299,'Sun dried tomatoes',130,9,30,9),(300,'Peppercorns',257,30,34,6),(301,'Bok Choy',315,13,33,14),(302,'Chicken',230,20,31,13),(303,'Borlotti Beans',733,35,33,19),(304,'Fromage Blanc',351,6,10,13),(305,'Stevia',143,36,16,23),(306,'Squid',59,33,53,24),(307,'Garlic',302,22,25,20),(308,'File Powder',149,44,6,14),(309,'Apricots',255,11,39,12),(310,'Shiitake Mushrooms',333,37,12,29),(311,'Adzuki Beans',116,46,10,27),(312,'Snowpeas',219,13,59,18),(313,'Lentils',250,28,15,17),(314,'Shiitake Mushrooms',725,5,54,1),(315,'Mountain Bread',258,13,38,30),(316,'Green beans',141,44,50,10),(317,'Macadamia Nut',279,16,13,16),(318,'Asafoetida',749,13,60,28),(319,'Capsicum',687,41,53,10),(320,'Cucumber',603,30,40,23),(321,'Mountain Bread',440,42,12,14),(322,'BulghurBurghul',226,19,58,25),(323,'Silverbeet',197,20,47,12),(324,'Goat Milk',185,32,35,9),(325,'Peppermint',298,15,50,29),(326,'Fennel',461,45,35,9),(327,'Cherries',198,32,11,9),(328,'Cayenne',726,11,12,18),(329,'Mastic',623,35,40,22),(330,'Coconut water',624,49,29,13),(331,'Dandelion',279,11,34,8),(332,'Goat Milk',253,29,12,4),(333,'Tamari',556,36,21,4),(334,'Soba',187,10,20,1),(335,'Bamboo Shoots',761,8,23,1),(336,'Incaberries',92,13,5,27),(337,'Cream',323,12,3,10),(338,'French eschallots',666,50,20,3),(339,'Cherries',775,10,4,11),(340,'Aniseed',236,47,32,25),(341,'Vegetable spaghetti',520,29,15,29),(342,'Kidneys',384,38,20,4),(343,'Black Eyed Beans',153,19,57,4),(344,'Pineapple',730,9,15,16),(345,'Ajowan Seed',669,34,46,30),(346,'Shark',381,32,2,21),(347,'Rice Noodles',253,11,1,25),(348,'Garam Masala',460,19,36,1),(349,'Persimmon',568,20,57,19),(350,'Kale',715,22,50,28),(351,'Fingerlime',769,38,21,2),(352,'Cauliflower',482,8,50,30),(353,'Tom Yum',193,37,38,19),(354,'Vinegar',749,40,34,16),(355,'Whiting Wild Rice',508,12,10,19),(356,'Tahini',336,9,35,2),(357,'MilkChocolate',505,18,49,21),(358,'Barberry',759,22,16,14),(359,'Parsnip',234,41,54,22),(360,'Apple Cider Vinegar',155,30,55,3),(361,'Almonds',347,22,31,13),(362,'Tomatoes',350,9,7,3),(363,'Green Tea noodles',506,34,37,14),(364,'Watermelon',543,12,55,10),(365,'Dandelion',670,40,35,6),(366,'Bacon',189,34,31,9),(367,'Jasmine rice',757,17,13,14),(368,'Bocconcini',170,38,31,16),(369,'Chia seeds',75,8,39,7),(370,'Wasabi',503,49,21,16),(371,'Wheat',263,50,5,14),(372,'Buckwheat Flour',447,38,2,16),(373,'Chia seeds',490,32,2,11),(374,'Pumpkin Seed',534,42,52,8),(375,'Red Pepper',580,26,24,29),(376,'Nasturtium',258,32,34,13),(377,'Cayenne',309,13,16,25),(378,'Cacao',585,19,16,19),(379,'Nuts',294,9,9,28),(380,'Baking Soda',52,28,36,5),(381,'Cassia bark',390,13,58,8),(382,'Slivered Almonds',475,15,31,27),(383,'Rye',248,39,12,7),(384,'Warehou',350,15,60,13),(385,'Brown Rice',216,48,31,9),(386,'Elderberry',563,11,18,30),(387,'Mackerel',402,13,20,18),(388,'Bok Choy',254,21,29,23),(389,'Alfalfa',280,19,54,14),(390,'Onion',316,21,37,2),(391,'Kohlrabi',369,46,30,23),(392,'Tamari',696,38,49,29),(393,'Fennel Seeds',774,44,50,9),(394,'Cherries',144,48,27,25),(395,'Chickpea',491,19,13,5),(396,'Octopus',312,7,7,18),(397,'Chestnut',599,45,29,22),(398,'Ricotta',648,19,47,29),(399,'Zucchini',206,33,23,2),(400,'Lobster',355,42,28,18),(401,'Jerusalem Artichoke',662,46,4,3),(402,'White rice',174,43,49,3),(403,'Quinoa',557,10,33,14),(404,'Wasabi',129,7,1,8),(405,'Green Tea',688,10,39,8),(406,'Stevia',787,26,35,15),(407,'Endive',428,8,38,30),(408,'Brussels Sprouts',216,26,6,21),(409,'Spinach',553,47,45,8),(410,'Common Cultivated Mushrooms',472,24,41,5),(411,'Wholemeal',253,23,48,7),(412,'Maple Syrup',430,23,22,6),(413,'Garam Masala',129,30,58,9),(414,'Chestnut',518,40,56,13),(415,'Capers',466,31,18,14),(416,'Choy Sum',93,26,23,10),(417,'Borlotti Beans',460,16,4,29),(418,'Beans',769,33,39,16),(419,'Wheat',371,20,39,26),(420,'Broccoli',445,15,35,20),(421,'Sun dried tomatoes',400,31,8,25),(422,'Soy Beans',562,15,59,19),(423,'Buckwheat Flour',764,43,47,11),(424,'Aubergine',681,39,32,11),(425,'Mackerel',463,14,34,26),(426,'CarobCarrot',75,40,8,27),(427,'Capsicum',406,6,6,22),(428,'Sesame Seeds',413,7,4,7),(429,'Octopus',523,46,56,6),(430,'Wholegrain Bread',616,16,52,16),(431,'Buckwheat',293,31,57,18),(432,'Bonza',546,20,17,29),(433,'Bamboo Shoots',651,32,51,24),(434,'Asparagus',206,48,23,15),(435,'Feta',121,42,53,23),(436,'Smoked Trout',248,29,34,15),(437,'Raisin',777,39,31,30),(438,'Kecap Manis',132,41,47,24),(439,'Mahlab',544,41,28,6),(440,'Bocconcini',61,25,24,26),(441,'Pineapple',224,19,48,16),(442,'Enoki Mushrooms',286,31,54,4),(443,'Kidneys',351,15,31,1),(444,'Mustard Seed',163,13,36,15),(445,'Dates',177,22,7,2),(446,'Sugar',133,19,22,15),(447,'Blood oranges',106,7,20,18),(448,'Honey',440,36,16,7),(449,'Cloves',372,45,34,28),(450,'Lemon',96,11,2,9),(451,'Red cabbage',254,29,1,29),(452,'Longan',434,39,36,27),(453,'Jasmine rice',547,10,27,22),(454,'Incaberries',295,14,50,26),(455,'Asafoetida',142,34,25,20),(456,'Pistachio Nut',203,12,28,7),(457,'Wheatgrass juice',722,17,50,21),(458,'Capers',430,28,50,2),(459,'Barramundi',241,48,46,15),(460,'Arborio rice',342,22,60,4),(461,'Ricemilk',209,15,48,8),(462,'Mahi mahi',543,30,22,5),(463,'Ricotta',238,21,3,30),(464,'Cheddar',446,22,52,28),(465,'Blueberries',742,6,5,19),(466,'Besan',73,12,27,27),(467,'Turmeric',599,42,22,2),(468,'PepitasPepper',732,47,46,2),(469,'MilkChocolate',469,46,20,5),(470,'Malt vinegar',108,26,25,6),(471,'Parsnip',588,7,52,11),(472,'Pecan Nut',624,42,32,6),(473,'Harissa',518,21,5,11),(474,'Barley',733,12,10,20),(475,'Sunflower Oil',92,30,50,4),(476,'Molasses',571,8,57,16),(477,'Wakame',266,13,21,14),(478,'Milk',766,21,42,7),(479,'Parmesan cheese',783,9,58,10),(480,'Blue Cheese',50,6,11,11),(481,'Loquats',652,18,44,21),(482,'Chickpea',423,47,31,20),(483,'Chickory',488,31,39,16),(484,'Duck',575,23,22,2),(485,'Oysters',114,17,47,8),(486,'Mulberries',325,36,46,11),(487,'Kidneys',301,11,34,21),(488,'Soy',113,18,30,2),(489,'Kidney Beans',260,15,36,23),(490,'Cumin',674,38,28,28),(491,'Arugula',591,23,25,10),(492,'Oats',403,16,38,5),(493,'Wheat',691,8,43,6),(494,'Sesame Oil',359,17,4,26),(495,'Borlotti Beans',102,26,11,26),(496,'Vinegar',354,41,38,15),(497,'Besan',261,19,12,16),(498,'Lime Leaves',332,28,51,4),(499,'WhiteBread',790,48,50,7),(500,'Snapper',87,33,5,22);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23  2:01:25
