Use GymDatabase;

CREATE VIEW UserMealPlans AS
SELECT 
    U.UserID,
    CONCAT(U.FirstName, ' ', U.LastName) AS UserName,
    MP.PlanName AS MealPlanName,
    COUNT(MPM.FoodID) AS TotalMeals
FROM Users U
JOIN MealPlan MP ON U.UserID = MP.UserID
LEFT JOIN MealPlanMeals MPM ON MP.MealPlanID = MPM.MealPlanID
GROUP BY U.UserID, MP.MealPlanID;

SELECT * 
FROM UserMealPlans
WHERE TotalMeals > 5;

CREATE VIEW EquipmentByLocation AS
SELECT 
    GL.GymLocationID,
    GL.LocationName,
    E.Name
FROM GymLocation GL
LEFT JOIN Equipment E ON GL.GymLocationID = E.GymLocationID;

SELECT Name
FROM EquipmentByLocation
Where Name is not null;

INSERT INTO UserMealPlans (UserID, UserName, MealPlanName, TotalMeals)
VALUES (5, 'John Doe', 'Keto Plan', 3);