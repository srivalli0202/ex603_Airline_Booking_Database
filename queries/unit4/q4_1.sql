-- Task 4.1a: Calculate overall booking statistics.
-- Find total bookings, total fare, average fare,
-- minimum fare, maximum fare, and unique passengers.

SELECT
    COUNT(*) AS total_bookings,
    SUM(fare_paid) AS total_fare,
    AVG(fare_paid) AS average_fare,
    MIN(fare_paid) AS minimum_fare,
    MAX(fare_paid) AS maximum_fare,
    COUNT(DISTINCT passenger_id) AS unique_passengers
FROM bookings;

-- Task 4.1b: Count bookings and calculate average fare
-- for each flight, from most bookings to fewest.

SELECT
    flight_id,
    COUNT(*) AS total_bookings,
    ROUND(AVG(fare_paid), 2) AS average_fare
FROM bookings
GROUP BY flight_id
ORDER BY total_bookings DESC;
