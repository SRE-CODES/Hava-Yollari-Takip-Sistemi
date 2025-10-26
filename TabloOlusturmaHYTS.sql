CREATE TABLE Airlines(
airline_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
name VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Airplanes(
airplane_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
model VARCHAR(50) NOT NULL,
capacity INT NOT NULL,
airline_id INT FOREIGN KEY REFERENCES Airlines(airline_id)
);

CREATE TABLE Airports(
airport_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
name VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
country VARCHAR(100) NOT NULL
);

CREATE TABLE Flights(
flight_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
flight_number VARCHAR(100) NOT NULL,
--airplane_id INT NOT NULL,
--departure_airport_id INT NOT NULL,
--arrival_airport_id INT NOT NULL,
--departure_time TIME NOT NULL,
--arrival_time TIME NOT NULL,
airplane_id INT FOREIGN KEY  REFERENCES Airplanes(airplane_id),
departure_airport_id INT FOREIGN KEY  REFERENCES Airports(airport_id),
arrival_airport_id INT FOREIGN KEY REFERENCES Airports(airport_id)
);

CREATE TABLE Passengers(
passenger_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
passport_number INT NOT NULL UNIQUE
);

CREATE TABLE Tickets(
ticket_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
seat_number INT NOT NULL,
price INT NOT NULL,
flight_id INT FOREIGN KEY  REFERENCES Flights(flight_id),
passenger_id INT FOREIGN KEY  REFERENCES Passengers(passenger_id)
);

