-- Task 3.1a: Find the top 10 active flights with at least 180 seats.
SELECT flight_id, flight_number, seat_capacity, is_active
FROM flights
WHERE is_active = TRUE
  AND seat_capacity >= 180
ORDER BY seat_capacity DESC
LIMIT 10;

-- 3.1b: Find all different booking statuses.
-- Check how many types of booking statues exist.
SELECT DISTINCT booking_status
FROM bookings
ORDER BY booking_status;

-- 3.1c: Find bookings with fares between $20 and $50.
-- Filter bookings using a numeric range.
SELECT booking_id, booking_country, fare_paid
FROM bookings
WHERE fare_paid BETWEEN 20 AND 50
ORDER BY fare_paid DESC;

--3.1d: Find bookings from three countries.
--Filter bookings using IN.
SELECT booking_id, booking_country, fare_paid
FROM bookings
WHERE booking_country IN ('Korea', 'Japan', 'Thailand')
ORDER BY fare_paid DESC;

--3.1e:Using LIkE
--Find flights whose flight numbers start with VN2.
--Use LIKE to search for a text pattern.
SELECT flight_id, flight_number, seat_capacity
FROM flights
WHERE flight_number LIKE 'VN2%'
ORDER BY flight_number;

-- 3.1f: Find bookings with a missing cancellation reason.
-- Use IS NULL to identify missing values.
SELECT booking_id, booking_status, cancellation_reason
FROM bookings
WHERE cancellation_reason IS NULL
ORDER BY booking_id
LIMIT 10;

-- 3.1g: Replace missing cancellation reasons with a useful label.
-- Use COALESCE to display text instead of NULL.
SELECT booking_id,
       booking_status,
       COALESCE(cancellation_reason, 'No reason provided') AS reason
FROM bookings
ORDER BY booking_id
LIMIT 10;

-- 3.1h: Calculate the adjusted fare and label payment amounts.
-- Use a computed  column and CASE for easy-to-read results.
SELECT booking_id,
       fare_paid,
       fare_multiplier,
       ROUND(fare_paid * fare_multiplier, 2) AS adjusted_fare,
       CASE
           WHEN fare_paid = 0 THEN 'No payment'
           WHEN fare_paid < 20 THEN 'Low payment'
           WHEN fare_paid <= 50 THEN 'Medium payment'
           ELSE 'High payment'
       END AS payment_category
FROM bookings
ORDER BY booking_id
LIMIT 10;
