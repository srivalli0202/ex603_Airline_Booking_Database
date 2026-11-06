-- Task 5.2 Part A - LEFT JOIN
-- Show all flights, including flights with no bookings.

SELECT
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM flights f
LEFT JOIN bookings b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_number
ORDER BY f.flight_id;

-- Task 5.2 Part A - INNER JOIN
-- Show flights that have matching bookings.

SELECT
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM flights f
INNER JOIN bookings b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_number
ORDER BY f.flight_id;

-- Task 5.2 Part A
-- Count flights excluded by INNER JOIN.

SELECT
    COUNT(*) AS excluded_flights
FROM flights f
LEFT JOIN bookings b
    ON f.flight_id = b.flight_id
WHERE b.booking_id IS NULL;

-- Task 5.2 Part B - RIGHT JOIN
-- Show all flights, including flights with no bookings.

SELECT
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
RIGHT JOIN flights f
    ON b.flight_id = f.flight_id
GROUP BY f.flight_id, f.flight_number
ORDER BY f.flight_id;

-- Task 5.2 Part B - FULL OUTER JOIN
-- Show all flights and their booking counts,
-- including unmatched records from either table.

SELECT
    f.flight_id,
    f.flight_number,
    COUNT(b.booking_id) AS total_bookings
FROM flights f
FULL OUTER JOIN bookings b
    ON f.flight_id = b.flight_id
GROUP BY f.flight_id, f.flight_number
ORDER BY f.flight_id NULLS LAST;

-- Task 5.2 Part C - NOT EXISTS
-- Find flights that have no bookings.

SELECT
    f.flight_id,
    f.flight_number
FROM flights f
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.flight_id = f.flight_id
)
ORDER BY f.flight_id;

-- Task 5.2 Part C - EXCEPT
-- Find flights that have no bookings.

SELECT flight_id
FROM flights

EXCEPT

SELECT flight_id
FROM bookings

ORDER BY flight_id;
