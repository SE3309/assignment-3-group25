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
-- Temporary view structure for view `usermealplans`
--

DROP TABLE IF EXISTS `usermealplans`;
/*!50001 DROP VIEW IF EXISTS `usermealplans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usermealplans` AS SELECT 
 1 AS `UserID`,
 1 AS `UserName`,
 1 AS `MealPlanName`,
 1 AS `TotalMeals`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `equipmentbylocation`
--

DROP TABLE IF EXISTS `equipmentbylocation`;
/*!50001 DROP VIEW IF EXISTS `equipmentbylocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `equipmentbylocation` AS SELECT 
 1 AS `GymLocationID`,
 1 AS `LocationName`,
 1 AS `Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `usermealplans`
--

/*!50001 DROP VIEW IF EXISTS `usermealplans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usermealplans` AS select `u`.`UserID` AS `UserID`,concat(`u`.`FirstName`,' ',`u`.`LastName`) AS `UserName`,`mp`.`PlanName` AS `MealPlanName`,count(`mpm`.`FoodID`) AS `TotalMeals` from ((`users` `u` join `mealplan` `mp` on((`u`.`UserID` = `mp`.`UserID`))) left join `mealplanmeals` `mpm` on((`mp`.`MealPlanID` = `mpm`.`MealPlanID`))) group by `u`.`UserID`,`mp`.`MealPlanID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `equipmentbylocation`
--

/*!50001 DROP VIEW IF EXISTS `equipmentbylocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `equipmentbylocation` AS select `gl`.`GymLocationID` AS `GymLocationID`,`gl`.`LocationName` AS `LocationName`,`e`.`Name` AS `Name` from (`gymlocation` `gl` left join `equipment` `e` on((`gl`.`GymLocationID` = `e`.`GymLocationID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23  2:01:25
