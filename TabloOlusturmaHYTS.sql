CREATE TABLE Airlines(
airline_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL
);

CREATE TABLE Airports(
airport_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL
);

CREATE TABLE Airplanes(
airplane_id INT IDENTITY(1,1) PRIMARY KEY,
model VARCHAR(100),
capacity INT,
airline_id INT FOREIGN KEY REFERENCES Airlines(airline_id)
);

CREATE TABLE Flights(
flight_id INT IDENTITY(1,1) PRIMARY KEY,
flight_number VARCHAR(20),
departure_time DATETIME,
arrival_time DATETIME,
airplane_id INT FOREIGN KEY  REFERENCES Airplanes(airplane_id),
departure_airport_id INT FOREIGN KEY  REFERENCES Airports(airport_id),
arrival_airport_id INT FOREIGN KEY REFERENCES Airports(airport_id)
);

CREATE TABLE Passengers(
passenger_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
passport_number VARCHAR(20) UNIQUE
);

CREATE TABLE Tickets(
ticket_id INT IDENTITY(1,1) PRIMARY KEY,
seat_number VARCHAR(10),
price DECIMAL(10,2) NOT NULL,
flight_id INT FOREIGN KEY  REFERENCES Flights(flight_id),
passenger_id INT FOREIGN KEY  REFERENCES Passengers(passenger_id)
);


