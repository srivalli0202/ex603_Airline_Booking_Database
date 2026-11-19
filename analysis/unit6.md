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

## Task 6.2: Compare Each Row to its Neighbors
## Question 1: Understanding Fare Changes

A large delta indicates a significant difference between two consecutive booking fares for the same flight. In my analysis, booking ID 68 for Flight 6 had a fare of 33.48, while the previous booking had a fare of 14.01, resulting in a positive delta of 19.47.

A large positive or negative delta could indicate pricing changes, discounts, cancellations, or unusual booking activity. The airline operations team should investigate these changes to determine whether they are expected or indicate a pricing or data quality problem. A large delta alone does not explain the reason for the change.

### Question 2: Running Totals vs. SUM ()

A regular SUM () calculates the total fare paid for all bookings and returns a single value. However, a running total shows how the total fare paid increases with each booking over time while preserving individual booking records.

In my analysis, the final running total reached 3,628.19, which was 90.70% of the selected target of 4,000. The running total helps the airline management team track progress toward its target throughout the period rather than only seeing the final amount. This allows management to monitor performance and take action before the end of the reporting period.

### question 3: Choosing a Moving Average Window Size

I selected a seven-row moving average to understand recent booking fare trends while reducing the effect of sudden price changes. This window includes the current booking and the previous six bookings. In my analysis, the final moving average was 24.86.

A smaller window would respond more quickly to fare changes, while a larger window would provide a smoother trend but might hide sudden changes. I chose seven rows to balance these two factors. This helps the airline management team monitor recent fare trends without focusing too much on individual booking prices.

Since the query uses ROWS, the moving average represents seven consecutive bookings rather than seven calendars days.

### Question 4: Identifying Gaps in Booking Activity

I selected a threshold of 14 days to identify long periods between consecutive bookings for each flight. My query identified 104 booking gaps longer than 14 days.

These gaps could indicate low customer demand, limited flight availability, seasonal changes, or missing booking records. The airline operations team should investigate these gaps by reviewing flight schedules, booking availability, and customer demand. This information could help management identify potential problems and improve booking activity.

However, a long booking gap does not necessarily mean that a flight stopped operating. Further investigation is needed to understand the actual reason.

### ROWS vs. RANGE

Rows calculates results based on individual row positions, while RANGE uses the ORDER BY values and treats rows with equal ordering values as peers. I used rows with booked_at and booking_id to ensure that the running total and moving average are calculated in a consistent booking by booking order.

### Task6.3: Build the reporting Patterns
### Question 1: Top-N Reporting Feature

The top N query could support a high value booking dashboard that displays the three highest booking fares for each flight. This feature would help the airline management team identify high value bookings and understand fare patterns.

In my analysis, the query returned 39 records across 13 flights. For example, flight 1 had three highest booking fares of 29.07, 26.17, and 22.46.

### Question 2: Month-over-Month Booking Changes
A large month over month change indicates a significant increase or decrease in airline booking activity. In my analysis, March 2023 showed a decrease of 47.62%, with bookings dropping from 21 to 11. May 2023 showed an increase of 54.55%, with bookings rising from 11 to 17.

These changes could be related to seasonal demand, ticket prices, promotional offers, or flight availability. The airline management team should investigate significant decreases and consider adjusting pricing, marketing strategies, or flight schedules. they should also analyze significant increases to understand which strategies may be working effectively.
