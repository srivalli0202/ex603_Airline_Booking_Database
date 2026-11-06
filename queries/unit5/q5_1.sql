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
