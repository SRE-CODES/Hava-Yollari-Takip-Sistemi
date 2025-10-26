INSERT INTO Airlines (name, country) VALUES
('Turkish Airlines', 'Turkey'),
('Pegasus Airlines', 'Turkey'),
('Lufthansa', 'Germany');

INSERT INTO Airports (name, city, country) VALUES
('Istanbul Airport', 'Istanbul', 'Turkey'),
('Ankara Esenboða', 'Ankara', 'Turkey'),
('Frankfurt Airport', 'Frankfurt', 'Germany'),
('Heathrow Airport', 'London', 'UK');

INSERT INTO Airplanes (model, capacity, airline_id) VALUES
('Boeing 737', 180, 1),
('Airbus A320', 150, 2),
('Airbus A350', 300, 3);

INSERT INTO Flights (flight_number, airplane_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time) VALUES
('TK215', 1, 1, 3, '2025-11-05 08:00', '2025-11-05 11:00'),
('TK316', 1, 1, 2, '2025-11-06 07:30', '2025-11-06 08:30'),
('PC101', 2, 2, 1, '2025-11-07 09:00', '2025-11-07 10:00'),
('LH890', 3, 3, 4, '2025-11-08 12:00', '2025-11-08 13:45');

INSERT INTO Passengers (name, surname, passport_number) VALUES
('Ali', 'Yýlmaz', 'TR12345'),
('Ayþe', 'Demir', 'TR54321'),
('Mehmet', 'Can', 'TR98765'),
('Elif', 'Güneþ', 'DE87654');

INSERT INTO Tickets (flight_id, passenger_id, seat_number, price) VALUES
(1, 1, '12A', 1200.00),
(1, 2, '14B', 1200.00),
(2, 3, '10C', 800.00),
(3, 4, '5A', 700.00);

INSERT INTO Crew (name, surname, role, experience_years, airline_id) VALUES
('Ahmet', 'Kara', 'Pilot', 12, 1),
('Zeynep', 'Çetin', 'Cabin Crew', 5, 1),
('Hans', 'Müller', 'Pilot', 15, 3),
('Ayþe', 'Yýldýz', 'Co-Pilot', 8, 2);

INSERT INTO Flight_Crew (flight_id, crew_id) VALUES
(1, 1), (1, 2),
(2, 4),
(4, 3);

INSERT INTO Seats (airplane_id, seat_number, seat_class, is_window) VALUES
(1, '12A', 'Economy', 1),
(1, '14B', 'Economy', 0),
(2, '10C', 'Business', 1),
(3, '5A', 'First', 1);

INSERT INTO Reservations (passenger_id, flight_id, reservation_date, status) VALUES
(1, 1, GETDATE(), 'Confirmed'),
(2, 1, GETDATE(), 'Confirmed'),
(3, 2, GETDATE(), 'Pending'),
(4, 3, GETDATE(), 'Cancelled');

INSERT INTO Payments (ticket_id, amount, payment_method) VALUES
(1, 1200.00, 'Credit Card'),
(2, 1200.00, 'Online'),
(3, 800.00, 'Cash'),
(4, 700.00, 'Debit Card');

INSERT INTO Baggage (ticket_id, weight, type) VALUES
(1, 15.5, 'Checked'),
(2, 7.0, 'Cabin'),
(3, 18.2, 'Checked'),
(4, 10.0, 'Cabin');

INSERT INTO Flight_Status (flight_id, status) VALUES
(1, 'Scheduled'),
(2, 'Departed'),
(3, 'Delayed'),
(4, 'Cancelled');

INSERT INTO Maintenance (airplane_id, maintenance_date, description, technician_name) VALUES
(1, '2025-09-10', 'Engine inspection completed.', 'Ali Toprak'),
(2, '2025-09-20', 'Landing gear replaced.', 'Fatma Korkmaz'),
(3, '2025-09-22', 'Cabin system check.', 'Hans Becker');
