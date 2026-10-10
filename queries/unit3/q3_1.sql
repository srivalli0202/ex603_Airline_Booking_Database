-- Task 3.1a: Find the top 10 active flights with at least 180 seats.
SELECT flight_id, flight_number, seat_capacity, is_active
FROM flights
WHERE is_active = TRUE
  AND seat_capacity >= 180
ORDER BY seat_capacity DESC
LIMIT 10;
