-- Task 5.1 Question 1
-- Which passenger booked which flight, and when?

SELECT
    p.passenger_id,
    p.passenger_name,
    b.booking_id,
    f.flight_number,
    b.booked_at
FROM bookings b
INNER JOIN passengers p
    ON b.passenger_id = p.passenger_id
INNER JOIN flights f
    ON b.flight_id = f.flight_id
ORDER BY b.booking_at;

--Task 5.2 question 2
--Which flights are associated with which airports?

SELECT 
	f.flight_id, 
	f.flight_number,
	a.airport_id, 
	a.iata_code,
	a.airport_name
FROM flights f 
INNER JOIN flight_routes fr
	ON f.flight_id = fr.flight_id
INNER JOIN airports a 
	ON fr.airport_id = a.airport_id
WHERE a.iata_code = 'SGN'
ORDER BY f.flight_id, a.airport_name;

-- Task 5.1 Question 3
-- Which flights share the same origin country
-- as Flights 3, 9, and 11?

SELECT
    f1.flight_id AS investigated_flight_id,
    f1.flight_number AS investigated_flight,
    f1.origin_country,
    f2.flight_id AS comparison_flight_id,
    f2.flight_number AS comparison_flight
FROM flights f1
INNER JOIN flights f2
    ON f1.origin_country = f2.origin_country
   AND f1.flight_id <> f2.flight_id
WHERE f1.flight_id IN (3, 9, 11)
ORDER BY f1.flight_id, f2.flight_id;
