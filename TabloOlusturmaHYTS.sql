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

CREATE TABLE  üye(
üye_id INT PRIMARY KEY NOT NULL IDENTITY,
üye_first_name VARCHAR(20)  NOT NULL ,
üye_last_name VARCHAR(20) NOT NULL,
üye_telefon_no VARCHAR(11) NoT NULL,
üye_email VARCHAR(50) NoT NULL,
puan INT DEFAULT(0) CHECK(puan>=0 AND puan<=100000)
);

CREATE TABLE Tickets(
ticket_id INT IDENTITY(1,1) PRIMARY KEY,
seat_number VARCHAR(10),
price DECIMAL(10,2) NOT NULL,
üye_id INT FOREIGN KEY  REFERENCES üye(üye_id),
flight_id INT FOREIGN KEY  REFERENCES Flights(flight_id),
passenger_id INT FOREIGN KEY  REFERENCES Passengers(passenger_id),
tickets_status VARCHAR(20) CHECK(tickets_status IN('aktif','iptal'))
);


CREATE TABLE Crew(
crew_id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
role VARCHAR(20) CHECK (role IN ('Pilot', 'Co-Pilot', 'Cabin Crew')),
experience_years INT,
airline_id INT FOREIGN KEY REFERENCES Airlines(airline_id)
);

CREATE TABLE Flight_Crew(
flight_id INT NOT NULL FOREIGN KEY REFERENCES Flights(flight_id),
crew_id INT NOT NULL FOREIGN KEY REFERENCES Crew(crew_id),
PRIMARY KEY (flight_id, crew_id)
);

CREATE TABLE Seats(
seat_id INT IDENTITY(1,1) PRIMARY KEY,
airplane_id INT NOT NULL FOREIGN KEY REFERENCES Airplanes(airplane_id),
seat_number VARCHAR(10),
seat_class VARCHAR(20) CHECK (seat_class IN ('Economy', 'Business', 'FirstClass')),
ticket_id INT NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
is_window BIT
);

CREATE TABLE Reservations(
reservation_id INT IDENTITY(1,1) PRIMARY KEY,
passenger_id INT NOT NULL FOREIGN KEY REFERENCES Passengers(passenger_id),
flight_id INT NOT NULL FOREIGN KEY REFERENCES Flights(flight_id),
reservation_date DATETIME,
status VARCHAR(20) CHECK (status IN ('Pending', 'Confirmed', 'Cancelled'))
);

CREATE TABLE Payments(
payment_id INT IDENTITY(1,1) PRIMARY KEY,
ticket_id INT NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
payment_date DATETIME DEFAULT GETDATE(),
amount DECIMAL(10,2),
payment_method VARCHAR CHECK (payment_method IN ('Credit Card', 'Debit Card', 'Cash', 'Online'))
);

CREATE TABLE Baggage(
baggage_id INT IDENTITY(1,1) PRIMARY KEY,
ticket_id INT NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
weight DECIMAL(10,2),
type VARCHAR(20) CHECK (type IN ('Cabin', 'Checked')),
baggage_limit INT DEFAULT(15)
);

CREATE TABLE Flight_Status(
status_id INT IDENTITY(1,1) PRIMARY KEY,
flight_id INT NOT NULL FOREIGN KEY REFERENCES Flights(flight_id),
status VARCHAR(20) CHECK (status IN ('Scheduled', 'Boarding', 'Departed', 'Delayed', 'Arrived', 'Cancelled')),
updated_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Maintenance(
maintenance_id INT IDENTITY(1,1) PRIMARY KEY,
airplane_id INT NOT NULL FOREIGN KEY REFERENCES Airplanes(airplane_id),
maintenance_date DATE,
description VARCHAR(255),
technician_name VARCHAR(100)
);

CREATE TABLE  İptal_edilen_biletler(
iptal_id INT PRIMARY KEY NOT NULL IDENTITY,
ticket_id INT  NOT NULL FOREIGN KEY REFERENCES Tickets(ticket_id),
iadetutarı INT NOT NULL
);


