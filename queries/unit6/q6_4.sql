-- Task 6.4: Monthly Failure Rate
-- Is the booking failure rate improving
-- or worsening over time?

SELECT
    DATE_TRUNC('month', booked_at)::date AS booking_month,
    COUNT(*) AS total_bookings,
    COUNT(*) FILTER (
        WHERE booking_status IN ('cancelled', 'disputed')
    ) AS failed_bookings,
    ROUND(
        COUNT(*) FILTER (
            WHERE booking_status IN ('cancelled', 'disputed')
        ) * 100.0 / NULLIF(COUNT(*), 0), 2
    ) AS failure_rate
FROM bookings
GROUP BY DATE_TRUNC('month', booked_at)::date
ORDER BY booking_month;
