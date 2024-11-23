USE GymDatabase;

INSERT INTO WorkoutPlan (PlanName, UserID)
SELECT CONCAT(GL.LocationName, ' Workout Plan'), U.UserID
FROM Users U
JOIN GymLocation GL ON U.GymLocationID = GL.GymLocationID
WHERE GL.GymLocationID = 1;

UPDATE MealPlanMeals MPM
SET ServingSize = ServingSize * 2
WHERE FoodID IN (
    SELECT FoodID
    FROM Food
    WHERE Name = 'Chicken'
);

DELETE FROM Equipment
WHERE Name LIKE '%AdjustableRope%';