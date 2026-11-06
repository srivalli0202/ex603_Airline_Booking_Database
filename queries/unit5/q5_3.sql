## Task 5.3 Part A: Count rows in both tables

SELECT
    (SELECT COUNT(*) FROM flights) AS total_flights,
    (SELECT COUNT(*) FROM airports) AS total_airports;

-- Task 5.3 Part A: CROSS JOIN
-- count all combinations of flghts and airports
SELECT COUNT(*) AS cross_join_total
FROM flights f
CROSS JOIN airports a;

-- Task 5.3 Part A: Verify CROSS JOIN results
SELECT 
    (SELECT COUNT(*) FROM flights) AS total_flights,
    (SELECT COUNT(*) FROM airports) AS total_airports,
    (SELECT COUNT(*)
      FROM flights
      CROSS JOIN airports) AS cross_join_total;

-- Task 5.3 Part B
--Examine the execution plan for the three table JOIN
EXPLAIN
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
ORDER BY b.booked_at;


