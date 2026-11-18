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

-- Task 6.2 Part B
-- How does total booking revenue grow over time,
-- and what is the moving average of recent fares?

SELECT
    booking_id,
    booked_at,
    fare_paid,

    SUM(fare_paid) OVER (
        ORDER BY booked_at, booking_id
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total,

    ROUND(AVG(fare_paid) OVER (
        ORDER BY booked_at, booking_id
        ROWS BETWEEN 6 PRECEDING
        AND CURRENT ROW
    ), 2) AS moving_average

FROM bookings
ORDER BY booked_at, booking_id;

-- Task 6.2 Part B
-- How does booking revenue change over time,
-- and how close is it to the target of 4000?

WITH revenue_analysis AS (
    SELECT
        booking_id,
        booked_at,
        fare_paid,

        SUM(fare_paid) OVER (
            ORDER BY booked_at, booking_id
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        ) AS running_total,

        ROUND(AVG(fare_paid) OVER (
            ORDER BY booked_at, booking_id
            ROWS BETWEEN 6 PRECEDING
            AND CURRENT ROW
        ), 2) AS moving_average

    FROM bookings
)

SELECT
    *,
    4000 AS revenue_target,
    4000 - running_total AS remaining_target,
    ROUND(running_total * 100.0 / 4000, 2)
        AS target_percentage
FROM revenue_analysis
ORDER BY booked_at, booking_id;

-- Task 6.2 Part C: Gap Detection
-- Which flights have gaps longer than 14 days
-- between consecutive bookings?

WITH booking_gaps AS (
    SELECT
        booking_id,
        flight_id,
        booked_at,

        LAG(booked_at) OVER (
            PARTITION BY flight_id
            ORDER BY booked_at, booking_id
        ) AS previous_booking

    FROM bookings
)

SELECT
    booking_id,
    flight_id,
    previous_booking,
    booked_at,
    booked_at - previous_booking AS booking_gap
FROM booking_gaps
WHERE booked_at - previous_booking > INTERVAL '14 days'
ORDER BY booking_gap DESC;
