-- Step 1: Create the database
CREATE DATABASE GymDatabase;

-- Step 2: Use the database
USE GymDatabase;

CREATE TABLE GymLocation (
    GymLocationID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each gym location
    LocationName VARCHAR(100) NOT NULL,           -- Name of the gym location
    Address VARCHAR(255) NOT NULL,               -- Address of the gym location
    City VARCHAR(50) NOT NULL,                   -- City of the gym location
    State VARCHAR(50),                           -- State or region (optional)
    ZipCode VARCHAR(20)                          -- Postal code (optional)
);

-- Step 3: Create the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user
    FirstName VARCHAR(50) NOT NULL,       -- User's first name, cannot be null
    LastName VARCHAR(50) NOT NULL,        -- User's last name, cannot be null
    Email VARCHAR(255) UNIQUE NOT NULL,   -- Ensures email is unique and not null
    PhoneNumber VARCHAR(15) UNIQUE,       -- Optional, but unique if provided
    DateOfBirth DATE NOT NULL,            -- Enforces user age data
    GymLocationID INT NOT NULL,           -- References the GymLocation table
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Tracks when the user was added
    CONSTRAINT fk_gym_location FOREIGN KEY (GymLocationID)
        REFERENCES GymLocation(GymLocationID)
        ON DELETE CASCADE                 -- Deletes user if gym location is deleted
);

-- Step 4: Add an index for optimization
CREATE INDEX idx_gym_location ON Users(GymLocationID);

-- Step 5: Create a trigger to enforce age constraints
DELIMITER $$
CREATE TRIGGER before_user_insert
BEFORE INSERT ON Users
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.DateOfBirth, CURDATE()) < 16 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User must be at least 16 years old.';
    END IF;
END$$
DELIMITER ;

CREATE TABLE Food (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Calories INT NOT NULL CHECK (Calories >= 0), -- Ensures calories are non-negative
    Protein FLOAT NOT NULL CHECK (Protein >= 0), -- Protein in grams
    Carbs FLOAT NOT NULL CHECK (Carbs >= 0),    -- Carbohydrates in grams
    Fats FLOAT NOT NULL CHECK (Fats >= 0)       -- Fats in grams
);

CREATE TABLE MealPlan (
    MealPlanID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PlanName VARCHAR(100) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_meal FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE -- Deletes meal plan if the user is deleted
);

CREATE TABLE WorkoutPlan (
    WorkoutPlanID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    PlanName VARCHAR(100) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_workout FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE CASCADE -- Deletes workout plan if the user is deleted
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0), -- Non-negative price
    Stock INT DEFAULT 0 CHECK (Stock >= 0)           -- Stock quantity
);

CREATE TABLE Equipment (
    EquipmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    GymLocationID INT NOT NULL,
    MaintenanceDate DATE,
    CONSTRAINT fk_equipment_gym FOREIGN KEY (GymLocationID)
        REFERENCES GymLocation(GymLocationID)
        ON DELETE CASCADE -- Deletes equipment if the gym location is deleted
);

-- Index for faster searches on UserID in MealPlan
CREATE INDEX idx_meal_user ON MealPlan(UserID);

-- Index for faster searches on UserID in WorkoutPlan
CREATE INDEX idx_workout_user ON WorkoutPlan(UserID);

-- Index for GymLocationID in Equipment
CREATE INDEX idx_equipment_gym ON Equipment(GymLocationID);

CREATE TABLE MealPlanMeals (
    MealPlanID INT NOT NULL,      -- Links to MealPlan
    FoodID INT NOT NULL,          -- Links to Food
    ServingSize FLOAT NOT NULL CHECK (ServingSize > 0), -- Size in grams, cups, etc.
    CONSTRAINT pk_mealplanmeals PRIMARY KEY (MealPlanID, FoodID), -- Composite key
    CONSTRAINT fk_mealplanmeals_mealplan FOREIGN KEY (MealPlanID)
        REFERENCES MealPlan(MealPlanID)
        ON DELETE CASCADE,       -- Removes entry if MealPlan is deleted
    CONSTRAINT fk_mealplanmeals_food FOREIGN KEY (FoodID)
        REFERENCES Food(FoodID)
        ON DELETE CASCADE        -- Removes entry if Food is deleted
);

CREATE TABLE WorkoutPlanExercises (
    WorkoutPlanID INT NOT NULL,      -- Links to WorkoutPlan
    ExerciseName VARCHAR(100) NOT NULL, -- Name of the exercise
    Sets INT NOT NULL CHECK (Sets > 0), -- Number of sets
    Reps INT NOT NULL CHECK (Reps > 0), -- Number of repetitions per set
    Duration INT DEFAULT NULL,          -- Optional: Duration in minutes
    CONSTRAINT pk_workoutplanexercises PRIMARY KEY (WorkoutPlanID, ExerciseName),
    CONSTRAINT fk_workoutplanexercises_workoutplan FOREIGN KEY (WorkoutPlanID)
        REFERENCES WorkoutPlan(WorkoutPlanID)
        ON DELETE CASCADE                -- Removes entry if WorkoutPlan is deleted
);

DESCRIBE Users;
DESCRIBE GymLocation;
DESCRIBE Food;
DESCRIBE MealPlan;
DESCRIBE WorkoutPlan;
DESCRIBE Product;
DESCRIBE Equipment;
DESCRIBE MealPlanMeals;
DESCRIBE WorkoutPlanExercises;