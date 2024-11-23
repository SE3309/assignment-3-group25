USE GymDatabase;

-- Insert a new gym location into the GymLocation table
INSERT INTO GymLocation (GymLocationID, LocationName, Address, City, State, ZipCode)
VALUES (1, 'Downtown Gym', '123 Main St', 'Metropolis', 'NY', '10001');

-- Insert a new user directly
INSERT INTO Users (FirstName, LastName, Email, PhoneNumber, DateOfBirth, GymLocationID)
VALUES ('Samuel', 'Jackson', 'samuel.jackson@example.com', '555-888-9999', '1975-02-20', 1);

INSERT INTO GymLocation (GymLocationID, LocationName, Address, City, State, ZipCode)
SELECT 3, 'GYM', DateOfBirth, Email, 'NY', '10002'
FROM Users
WHERE UserID = 3;

INSERT INTO GymLocation (GymLocationID, LocationName, Address, City, State, ZipCode)
SELECT 2, FirstName, '456 Uptown Ave', 'Metropolis', 'NY', '10002'
FROM Users
WHERE UserID = 3;