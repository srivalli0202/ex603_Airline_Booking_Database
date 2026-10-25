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
