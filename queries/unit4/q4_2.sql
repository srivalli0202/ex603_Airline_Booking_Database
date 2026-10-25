-- Task 4.2A: Count total and failed bookings
-- for each flight in one query.

SELECT
    flight_id,
    COUNT(*) AS total_bookings,
    SUM(
        CASE
            WHEN booking_status IN ('cancelled', 'disputed')
            THEN 1
            ELSE 0
        END
    ) AS failed_bookings
FROM bookings
GROUP BY flight_id
ORDER BY failed_bookings DESC, flight_id;

-- Task 4.2B: Show booking totals and failures
-- by origin country, plus a platform grand total.

SELECT
    CASE
        WHEN GROUPING(f.origin_country) = 1
        THEN 'GRAND TOTAL'
        ELSE COALESCE(f.origin_country, 'Unknown')
    END AS region,
    COUNT(*) AS total_bookings,
    SUM(
        CASE
            WHEN b.booking_status IN ('cancelled', 'disputed')
            THEN 1
            ELSE 0
        END
    ) AS failed_bookings
FROM bookings b
JOIN flights f
    ON b.flight_id = f.flight_id
GROUP BY ROLLUP(f.origin_country)
ORDER BY GROUPING(f.origin_country), f.origin_country;
