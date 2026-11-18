## Task 6.1: Windows Functions
## question1: Comparing Individual Booking Fares with the Flight Average

I used a window function with AVG () and PARTITION BY flight_id to calculate the average fare for each flight while keeping individual booking records. The window function returned 200 rows, while the GROUP BY query returned only 13 rows. For example, Flight 1 had an average fare of 16.03, but individual bookings has different fares.

GROUP BY alone cannot answer this question because it combines all bookings for each flight into one summary row and loses individual booking details. The window function allows the airline operations team to compare individual fares with flights average and identify unusually high or low fares.

## Ranking Flights Based on Booking Activity

The airline platform could use a flight popularity leaderboard to display flights based on their total number of bookings. I would choose DENSE_RANK () because flights with the same number of bookings receive the same rank without skipping the next ranking position. 

Flights 5 and 7 both received 18 bookings. ROW_NUMBER () assigned them different positions, 4 and 5, while RANK () and DENSE_RANK () assigned both flights rank 4. However, RANK () skipped the next position, while DENSE_RANK () continued with rank 5.

I would prefer DENSE_RANK () because it treats with equal booking activity fairly and provides consecutive ranking positions for the leaderboard.

## Observation: NTILE (4)

The NTILE (4) function divided 13 flights with bookings into four groups containing 4,3,3, and 3 flights. Flights 5 and 7 both had 18 bookings, but they were placed in different bands. Similarly, Flights 2 and 11 both had 16 bookings but belonged to different bands. This shows that NTILE () divides records into approximately equal sized groups rather than keeping tied values together.
