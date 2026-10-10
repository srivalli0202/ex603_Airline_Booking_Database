-- Task 3.2 part A: Count missing check in times.
SELECT COUNT(*) AS missing_checkins
FROM bookings
WHERE checked_in_at IS NULL;
-- part A: Broken query.
-- Find bookings whose check-in-times is not before 2024.
SELECT COUNT(*) AS broken_count
FROM bookings
WHERE checked_in_at >= '2024-01-01';
-- Count bookings with a check-in time.
SELECT COUNT(*) AS checked_in_count
FROM bookings
WHERE checked_in_at IS NOT NULL;

-- Part A- demonstrate the bug
SELECT COUNT(*) AS not_cancelled_count
FROM bookings
WHERE booking_status <> 'cancelled';
-- Find bookingswith check-in times different from January 1, 2023.
SELECT COUNT(*) AS different_checkins
FROM bookings
WHERE checked_in_at <> '2023-01-01';
-- Include bookings with missing check-in times.
SELECT COUNT(*) AS repaired_count
FROM bookings
WHERE checked_in_at <> '2023-01-01'
	OR checked_in_at IS NULL;
