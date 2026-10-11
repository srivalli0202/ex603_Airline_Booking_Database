-- Task 3.3a: Find passengers with disputed bookings.
-- Method 1: IN subquery

SELECT passenger_id, passenger_name
FROM passengers
WHERE passenger_id IN (
    SELECT passenger_id
    FROM bookings
    WHERE booking_status = 'disputed'
)
ORDER BY passenger_id;
-- Method 2 - Using a CTE
WITH disputed_passengers AS (
    SELECT DISTINCT passenger_id
    FROM bookings
    WHERE booking_status = 'disputed'
)
SELECT passenger_id, passenger_name
FROM passengers
WHERE passenger_id IN (
    SELECT passenger_id
    FROM disputed_passengers
)
ORDER BY passenger_id;


-- Task 3.3c: Find passengers with disputed bookings
-- ethod 3: Using Exists.
SELECT p.passenger_id, p.passenger_name
FROM passengers p
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.passenger_id = p.passenger_id
      AND b.booking_status = 'disputed'
)
ORDER BY p.passenger_id;

-- Task 3.3d: Verify that IN and EXISTS return identical rows.
-- Aresult of 0 means there are no differences.
WITH method1 AS (
    SELECT passenger_id, passenger_name
    FROM passengers
    WHERE passenger_id IN (
        SELECT passenger_id
        FROM bookings
        WHERE booking_status = 'disputed'
    )
),
method3 AS (
    SELECT p.passenger_id, p.passenger_name
    FROM passengers p
    WHERE EXISTS (
        SELECT 1
        FROM bookings b
        WHERE b.passenger_id = p.passenger_id
          AND b.booking_status = 'disputed'
    )
)
SELECT COUNT(*) AS different_rows
FROM (
    (SELECT * FROM method1 EXCEPT SELECT * FROM method3)
    UNION ALL
    (SELECT * FROM method3 EXCEPT SELECT * FROM method1)
) AS differences;

-- Task 3.3e: Verify Method 1 and Method 2 return identical rows.

WITH method1 AS (
    SELECT passenger_id, passenger_name
    FROM passengers
    WHERE passenger_id IN (
        SELECT passenger_id
        FROM bookings
        WHERE booking_status = 'disputed'
    )
),
method2 AS (
    WITH disputed_passengers AS (
        SELECT DISTINCT passenger_id
        FROM bookings
        WHERE booking_status = 'disputed'
    )
    SELECT passenger_id, passenger_name
    FROM passengers
    WHERE passenger_id IN (
        SELECT passenger_id
        FROM disputed_passengers
    )
)
SELECT COUNT(*) AS different_rows
FROM (
    (SELECT * FROM method1 EXCEPT SELECT * FROM method2)
    UNION ALL
    (SELECT * FROM method2 EXCEPT SELECT * FROM method1)
) AS differences;

-- Task 3.3f: Edge case
-- NOT IN and NOT EXISTS may return different results
-- when the subquery contains NULL values.
-- NOT IN can return no rows because comparisons with
-- NULL produce UNKNOWN.
-- NOT EXISTS checks for matching rows and does not
-- have the same NULL problem.
