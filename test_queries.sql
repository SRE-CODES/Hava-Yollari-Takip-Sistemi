--uçuþ ve yolcu listesi
SELECT f.flight_number, p.name, p.surname, t.seat_number
FROM Flights f
JOIN Tickets t ON f.flight_id = t.flight_id
JOIN Passengers p ON t.passenger_id = p.passenger_id
ORDER BY f.flight_number;

--uçak baþýna toplam koltuk
SELECT a.model, COUNT(s.seat_id) AS Total_Seats
FROM Airplanes a
LEFT JOIN Seats s ON a.airplane_id = s.airplane_id
GROUP BY a.model;

--uçak baþýna toplam bagaj aðýrlýðý
SELECT f.flight_number, SUM(b.weight) AS Total_Baggage_Weight
FROM Flights f
JOIN Tickets t ON f.flight_id = t.flight_id
JOIN Baggage b ON t.ticket_id = b.ticket_id
GROUP BY f.flight_number;

--uçuþ ekibi bilgileri
SELECT f.flight_number, c.name, c.surname, c.role
FROM Flights f
JOIN Flight_Crew fc ON f.flight_id = fc.flight_id
JOIN Crew c ON fc.crew_id = c.crew_id
ORDER BY f.flight_number;

--ödeme bilgileri
SELECT p.name + ' ' + p.surname AS Passenger, f.flight_number, pay.amount, pay.payment_method
FROM Payments pay
JOIN Tickets t ON pay.ticket_id = t.ticket_id
JOIN Passengers p ON t.passenger_id = p.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id;

--bakým geçmiþi
SELECT al.name AS Airline, ap.model, m.maintenance_date, m.description, m.technician_name
FROM Maintenance m
JOIN Airplanes ap ON m.airplane_id = ap.airplane_id
JOIN Airlines al ON ap.airline_id = al.airline_id
ORDER BY m.maintenance_date DESC;

