--Task 4.2B: Regional Subtotals and Grand Total

The regional director needs the country-level subtotals to compare booking failures across different regions. The grand total shows 200 bookings and 44 failures, giving an overall failure rate of 22%. This helps leadership understand the platform's overall performance and decide which regions may need further investigation.

--Task 4.2c: Two-Step Pipeline
The two-step pipeline helps leadership understand the failure rate among flights with enough bookings to make a meaningful comparison. First, I used a CTE to calculate the total bookings and failed bookings for each flight. Next, I included only flights with at least 10 bookings calculated their overall failure rate. The results showed that 12 flights met this requirement, with 194 total bookings and 42 failed bookings. The baseline failure rate was 21.65%. This gives leadership a useful starting point for comparing high volume flights and identifying which ones may need further investigation.

In this assignment, I learned how conditional aggregation helps calculate multiple results in a single SQL query. For example, in Task 4.2A, I calculated the total number of bookings and failed bookings for each flight using COUNT (*) and SUM (CASE WHEN). This helped me understand how we can get different results together without writing separate queries.

If I used two separate filtered queries, I would need one query to count all bookings and another query to count only cancelled and disputed bookings.This could require reading the same fata more than once. Conditional aggregation can calculate both values while processing the same rows, which may reduce unnecessary work.

When a table contains one million rows, efficiency becomes more important because processing large amounts of data can take more time and resources. Using conditional aggregation can improve performance, although the actual benefit depends on the query plan. It also makes the results easier to compare because both counts appear in the same output.
