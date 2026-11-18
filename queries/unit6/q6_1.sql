-- Task 6.1 Question 1
-- How does each booking fare compare to its flight's average fare?

SELECT
    booking_id,
    flight_id,
    fare_paid,
    ROUND(AVG(fare_paid) OVER (
        PARTITION BY flight_id
    ), 2) AS average_flight_fare
FROM bookings
ORDER BY flight_id, booking_id;

-- Task 6.1 Question 1: GROUP BY comparison
-- What is the average booking fare for each flight?

SELECT
    flight_id,
    ROUND(AVG(fare_paid), 2) AS average_flight_fare
FROM bookings
GROUP BY flight_id
ORDER BY flight_id;

-- How do flights rank based on their total bookings?
SELECT 
	flight_id, 
	COUNT(*) AS total_bookings,

	ROW_NUMBER() OVER(
		ORDER BY COUNT(*) DESC, flight_id
		
	)AS row_num,

	RANK() OVER (
		ORDER BY COUNT(*) DESC
	) AS flight_rank,

	DENSE_RANK() OVER (
		ORDER BY COUNT(*) DESC
	) AS dense_rank

FROM bookings
GROUP BY flight_id
ORDER BY ROW_num;

-- Task 6.1 Question 3: NTILE(4)
-- How can flights be divided into four groups
-- based on their total bookings?
SELECT
	flight_id,
	COUNT(*) AS total_bookings,
	NTILE(4) OVER (
		ORDER BY COUNT(*) DESC, flight_id
	) AS booking_band
FROM bookings
GROUP BY flight_id
ORDER BY booking_band, total_bookings DESC, flight_id;


