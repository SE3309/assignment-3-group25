Use GymDatabase;

SELECT FirstName, LastName, Email 
FROM Users
WHERE GymLocationID = 1;

SELECT GL.LocationName, E.Name
FROM GymLocation GL
JOIN Equipment E ON GL.GymLocationID = E.GymLocationID;

SELECT FirstName, LastName 
FROM Users 
WHERE UserID IN (
    SELECT DISTINCT UserID 
    FROM MealPlan
);

SELECT WP.WorkoutPlanID, WP.PlanName, COUNT(WPE.ExerciseName) AS TotalExercises
FROM WorkoutPlan WP
JOIN WorkoutPlanExercises WPE ON WP.WorkoutPlanID = WPE.WorkoutPlanID
GROUP BY WP.WorkoutPlanID, WP.PlanName;

SELECT MP.PlanName
FROM MealPlan MP
WHERE EXISTS (
    SELECT 1 
    FROM MealPlanMeals MPM 
    JOIN Food F ON MPM.FoodID = F.FoodID
    WHERE MP.MealPlanID = MPM.MealPlanID AND F.Name = 'Chicken'
);

SELECT GL.LocationName, COUNT(E.EquipmentID) AS TotalEquipment
FROM GymLocation GL
JOIN Equipment E ON GL.GymLocationID = E.GymLocationID
GROUP BY GL.GymLocationID, GL.LocationName
HAVING COUNT(E.EquipmentID) > 1;

SELECT *
FROM WorkoutPlan WP
LEFT JOIN WorkoutPlanExercises WPE ON WP.WorkoutPlanID = WPE.WorkoutPlanID;