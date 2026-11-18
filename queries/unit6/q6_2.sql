-- Task 6.2 Part A
-- How does each booking fare compare with the 
-- Previous and Next booking fares for Flight 6?
WITH fare_comparison AS (
    SELECT
        booking_id,
        flight_id,
        booked_at,
        fare_paid,

        LAG(fare_paid) OVER (
            PARTITION BY flight_id
            ORDER BY booked_at, booking_id
        ) AS previous_fare,

        LEAD(fare_paid) OVER (
            PARTITION BY flight_id
            ORDER BY booked_at, booking_id
        ) AS next_fare

    FROM bookings
)

SELECT
    *,
    fare_paid - previous_fare AS fare_delta
FROM fare_comparison
WHERE flight_id = 6
ORDER BY booked_at, booking_id;
