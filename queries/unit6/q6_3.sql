-- Task 6.3 Part A: Top N per Category
-- What are the top three highest booking fares
-- for each flight?

-- Ties are resolved using booking_id to ensure
-- a maximum of three bookings per flight.

WITH ranked_bookings AS (
    SELECT
        booking_id,
        flight_id,
        fare_paid,
        ROW_NUMBER() OVER (
            PARTITION BY flight_id
            ORDER BY fare_paid DESC, booking_id
        ) AS fare_rank,
        FIRST_VALUE(fare_paid) OVER (
            PARTITION BY flight_id
            ORDER BY fare_paid DESC, booking_id
        ) AS highest_fare
    FROM bookings
)
SELECT *
FROM ranked_bookings
WHERE fare_rank <= 3
ORDER BY flight_id, fare_rank;

-- Task 6.3 part b: Period over period Analysis
-- How does monthly booking activity change
-- compared to the previous month?
WITH monthly_bookings AS (
    SELECT
        DATE_TRUNC('month', booked_at)::date AS booking_month,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY DATE_TRUNC('month', booked_at)::date
),
monthly_comparison AS (
    SELECT
        booking_month,
        total_bookings,
        LAG(booking_month) OVER (
            ORDER BY booking_month
        ) AS previous_month,
        LAG(total_bookings) OVER (
            ORDER BY booking_month
        ) AS previous_bookings
    FROM monthly_bookings
)
SELECT *,
    CASE
        WHEN booking_month = previous_month + INTERVAL '1 month'
        THEN ROUND(
            (total_bookings - previous_bookings) * 100.0
            / NULLIF(previous_bookings, 0), 2
        )
    END AS percent_change,
    CASE
        WHEN previous_month IS NULL THEN 'First month'
        WHEN booking_month = previous_month + INTERVAL '1 month'
        THEN 'No gap'
        ELSE 'Missing month'
    END AS month_check
FROM monthly_comparison
ORDER BY booking_month;
