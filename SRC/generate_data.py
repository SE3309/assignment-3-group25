from faker import Faker
import random
from faker_food import FoodProvider

# Initialize Faker object
fake = Faker()
fake.add_provider(FoodProvider)

# Number of records to generate
num_gym_locations = 3000  # For GymLocation
num_users = 4000  # For Users
num_food_items = 500  # For Food
num_meal_plans = 100  # For MealPlan
num_workout_plans = 100  # For WorkoutPlan
num_products = 50  # For Product
num_equipment = 150  # For Equipment
num_meal_plan_meals = 300  # For MealPlanMeals
num_workout_plan_exercises = 300  # For WorkoutPlanExercises

# Data containers
gym_locations = []
users = []
food_items = []
meal_plans = []
workout_plans = []
products = []
equipment = []
meal_plan_meals = []
workout_plan_exercises = []

# Generate GymLocation Data
for _ in range(num_gym_locations):
    gym_location_id = _ + 1  # GymLocationID will be sequential
    location_name = fake.company() + " Gym"
    address = fake.address().replace("\n", " ")  # Remove line breaks from address
    city = fake.city()
    state = fake.state_abbr()
    postal_code = fake.zipcode()
    gym_locations.append((gym_location_id, location_name, address, city, state, postal_code))

generated_emails = set()
# Generate Users Data
for _ in range(num_users):
    user_id = _ + 1  # UserID will be sequential
    first_name = fake.first_name()
    last_name = fake.last_name()
    while True:
        email = fake.email()
        if email not in generated_emails:
            generated_emails.add(email)
            break
    phone_number = fake.phone_number()
    date_of_birth = fake.date_of_birth(minimum_age=18, maximum_age=65).strftime('%Y-%m-%d')
    gym_location_id = random.choice(range(1, num_gym_locations + 1))  # Randomly assign a GymLocationID
    users.append((user_id, first_name, last_name, email, phone_number, date_of_birth, gym_location_id))

# Generate Food Data
for _ in range(num_food_items):
    food_id = _ + 1  # FoodID will be sequential
    food_name = fake.ingredient()  # Random food name
    calories = random.randint(50, 800)  # Random calories between 50 and 800
    protein = random.randint(5, 50)  # Random protein value between 5 and 50
    fat = random.randint(1, 30)  # Random fat value between 1 and 30
    carbs = random.randint(1, 60)
    food_items.append((food_id, food_name, calories, protein, fat, carbs))

# Generate MealPlan Data
for _ in range(num_meal_plans):
    meal_plan_id = _ + 1  # MealPlanID will be sequential
    plan_name = fake.bs()  # Random name for the meal plan
    user_id = random.choice(range(1, num_users + 1))
    meal_plans.append((meal_plan_id, user_id, plan_name))

# Generate WorkoutPlan Data
for _ in range(num_workout_plans):
    workout_plan_id = _ + 1  # WorkoutPlanID will be sequential
    plan_name = fake.bs()  # Random name for the workout plan
    user_id = random.choice(range(1, num_users + 1))
    workout_plans.append((workout_plan_id, user_id, plan_name))

gym_product_names = [
    "Dumbbell Set", "Yoga Mat", "Resistance Bands", "Kettlebell", 
    "Treadmill", "Weight Bench", "Foam Roller", "Pull-up Bar",
    "Gym Gloves", "Protein Powder", "Exercise Ball", "Jump Rope",
    "Ankle Weights", "Gym Bag", "Water Bottle", "Fitness Tracker"
]

gym_description_templates = [
    "Perfect for strength training and muscle building.",
    "Ideal for yoga, Pilates, and stretching exercises.",
    "Durable and lightweight for easy portability.",
    "Enhance your home gym setup with this essential equipment.",
    "Designed to improve balance, flexibility, and coordination.",
    "Premium quality, built to last through intense workouts.",
    "Compact and easy to store, great for small spaces.",
    "Helps you stay hydrated and on top of your fitness goals.",
    "A must-have for any fitness enthusiast.",
    "Boost your recovery and reduce muscle soreness effectively."
]

# Generate Product Data
for _ in range(num_products):
    product_id = _ + 1  # ProductID will be sequential
    product_name = random.choice(gym_product_names)  # Random product name
    price = round(random.uniform(5.0, 200.0), 2)  # Random price between $5 and $200
    description = random.choice(gym_description_templates)
    stock = random.choice(range(0, 10))
    products.append((product_id, product_name, description, price, stock))

equipment_types = ["Machine", "Bench", "Bar", "Rack", "Set", "Roller", "Rope"]
adjectives = ["Adjustable", "Premium", "Heavy-Duty", "Compact", "Foldable", "Portable", "Durable"]

# Generate Equipment Data
for _ in range(num_equipment):
    equipment_id = _ + 1  # EquipmentID will be sequential
    equipment_name = random.choice(adjectives) + random.choice(equipment_types)  # Random equipment name
    gym_location_id = random.choice(range(1, num_gym_locations + 1))  # Randomly assign a GymLocationID
    maintanance_date = fake.date()
    equipment.append((equipment_id, equipment_name, gym_location_id, maintanance_date))

# Generate MealPlanMeals Data (many-to-many relationship between MealPlan and Food)
for _ in range(num_meal_plan_meals):
    meal_plan_id = random.choice(range(1, num_meal_plans + 1))  # Random MealPlanID
    food_id = random.choice(range(1, num_food_items + 1))  # Random FoodID
    serving_size = random.randint(1, 5)  # Random serving size between 1 and 5
    meal_plan_meals.append((meal_plan_id, food_id, serving_size))

# Generate WorkoutPlanExercises Data (many-to-many relationship between WorkoutPlan and Exercises)
for _ in range(num_workout_plan_exercises):
    workout_plan_id = random.choice(range(1, num_workout_plans + 1))  # Random WorkoutPlanID
    exercise_name = fake.bs()  # Random exercise name
    repetitions = random.randint(5, 20)  # Random repetitions between 5 and 20
    sets = random.randint(1, 5)  # Random sets between 1 and 5
    duration = random.randint(10, 30)
    workout_plan_exercises.append((workout_plan_id, exercise_name, sets, repetitions, duration))

# Generate SQL INSERT Statements for GymLocation
with open('gym_location_inserts.sql', 'w') as f:
    for gym in gym_locations:
        f.write(f"INSERT INTO GymLocation (GymLocationID, LocationName, Address, City, State, ZipCode) VALUES ({gym[0]}, '{gym[1]}', '{gym[2]}', '{gym[3]}', '{gym[4]}', '{gym[5]}');\n")

# Generate SQL INSERT Statements for Users
with open('users_inserts.sql', 'w') as f:
    for user in users:
        f.write(f"INSERT INTO Users (UserID, FirstName, LastName, Email, PhoneNumber, DateOfBirth, GymLocationID) VALUES ({user[0]}, '{user[1]}', '{user[2]}', '{user[3]}', '{user[4]}', '{user[5]}', {user[6]});\n")

# Generate SQL INSERT Statements for Food
with open('food_inserts.sql', 'w') as f:
    for food in food_items:
        f.write(f"INSERT INTO Food (FoodID, Name, Calories, Protein, Carbs, Fats) VALUES ({food[0]}, '{food[1]}', {food[2]}, {food[3]}, {food[5]}, {food[4]});\n")

# Generate SQL INSERT Statements for MealPlan
with open('meal_plan_inserts.sql', 'w') as f:
    for plan in meal_plans:
        f.write(f"INSERT INTO MealPlan (MealPlanID, UserID, PlanName) VALUES ({plan[0]}, '{plan[1]}', '{plan[2]}');\n")

# Generate SQL INSERT Statements for WorkoutPlan
with open('workout_plan_inserts.sql', 'w') as f:
    for plan in workout_plans:
        f.write(f"INSERT INTO WorkoutPlan (WorkoutPlanID, UserID, PlanName) VALUES ({plan[0]}, '{plan[1]}', '{plan[2]}');\n")

# Generate SQL INSERT Statements for Product
with open('product_inserts.sql', 'w') as f:
    for product in products:
        f.write(f"INSERT INTO Product (ProductID, Name, Description, Price, Stock) VALUES ({product[0]}, '{product[1]}', '{product[2]}', '{product[3]}', '{product[4]}');\n")

# Generate SQL INSERT Statements for Equipment
with open('equipment_inserts.sql', 'w') as f:
    for equip in equipment:
        f.write(f"INSERT INTO Equipment (EquipmentID, Name, GymLocationID, MaintenanceDate) VALUES ({equip[0]}, '{equip[1]}', {equip[2]}, '{equip[3]}');\n")

# Generate SQL INSERT Statements for MealPlanMeals
with open('meal_plan_meals_inserts.sql', 'w') as f:
    for meal in meal_plan_meals:
        f.write(f"INSERT INTO MealPlanMeals (MealPlanID, FoodID, ServingSize) VALUES ({meal[0]}, {meal[1]}, {meal[2]});\n")

# Generate SQL INSERT Statements for WorkoutPlanExercises
with open('workout_plan_exercises_inserts.sql', 'w') as f:
    for exercise in workout_plan_exercises:
        f.write(f"INSERT INTO WorkoutPlanExercises (WorkoutPlanID, ExerciseName, Sets, Reps, Duration) VALUES ({exercise[0]}, '{exercise[1]}', '{exercise[2]}', {exercise[3]}, {exercise[4]});\n")

print("Data generated and saved in SQL insert files.")

