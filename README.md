## Project title: Airline_Booking_Database
Relational database course project for an airline booking system.

## Theme
Airline Booking System

## Domain

The Airline Booking System is a platform designed to organize and manage information about passengers, flights, bookings, airports, and flight routes. Passengers can make bookings for available flights, and each booking connects a passenger with a specific flight. The system also maintains information about flight schedules, fares, and booking statuses.

The database helps answer important business questions about airline operations, such as which flights receive the most bookings, how booking fares vary across flights, which flights have higher failure rates, and how booking activity changes over time. Cancelled and disputed bookings are analyzed to identify potential problems in the booking process.

This project uses PostgreSQL techniques such as joins, aggregations, common table expressions (CTEs), and window functions to analyze booking activity, identify trends, and generate meaningful business insights. These findings can help airline management monitor booking performance, investigate failures, and make informed business decisions.

## Database Overview
### Entity Relationship Diagram 
The following ERD represents the original Airline Booking Database design developed in Units 1 and 2. The instructor provided Unit 3 reference dataset was used for the analytical queries in Unit 3-6.
![Airline Booking Database ERD](schema/erd1.png) 


### Database Schema

For Assignment 2, I converted my Airline Booking Database ERD into PostgreSQL tables. The database contains six tables: passengers, flights, airports, bookings, flight_routes, and flight_stops.

I added primary keys and foreign keys to connect the tables and maintain relationships between the data. I also used CHECK constraints to prevent invalid values, such as negative flight fares and incorrect arrival times.

The passengers table includes a recursive foreign key to track passenger referrals. The flights table includes a derived attribute called duration_min, which calculates flight duration from departure and arrival times.

The flight_stops table represents a weak entity because each stop belongs to a specific flight. The flight_routes table resolves the many-to-many relationship between flights and airports.

I tested the SQL schema in PostgreSQL 16 using pgAdmin 4 and verified that all six tables were created successfully.

**Schema SQL file:** [schema.sql](schema/schema.sql)

**Constraint analysis:** [Unit 2 Analysis](analysis/unit2.md)

**ERD:** [Airline Booking ERD](schema/erd1.png)

The analytical queries developed in unit 3-6 focus on the airline booking dataset provided in Unit 3.

### Tables Relevant to Analytics

| Table | Description |
|---|---|
| Passengers | Stores passenger information. |
| flights | Stores flight details and flight related information. |
| airports | Stores airport information and locations. |
| bookings | Stores booking records, booking dates, fares, booking statuses, and cancellation reasons. |

The bookings table is the primary table used for analyzing booking activity, fare trends, cancellation and dispute rates, and monthly and quarterly performance. The flights table provides additional flight information for flight level comparisons and reporting. The original database schema was designed in Units 1 and 2, while the dataset provided in Unit 3 was used for the analytical queries in the later units.

### Unit 3 Dataset and DDL

The analytical queries in Units 3-6 were executed using the instructor provided airline.sql file from Unit 3, imported into the ex603_data PostgreSQL database. 

This dataset provided the database structure and booking records used for business analysis.

The instructor-provided reference dataset contains the database structure, integrity constraints, and synthetic data used for the analytical queries in Units 3–6.

[Unit 3 Reference Dataset](schema/airline.sql)

## Query Catalogue

### Unit 3: Data Exploration 

| SQL File | Business Question |
|---|---|
| [q3_1.sql](queries/unit3/q3_1.sql) | How can flights and bookings be filtered, missing values handled, adjusted fares calculated, and payments categorized? |
| [q3_2.sql](queries/unit3/q3_2.sql) | How can missing check-in values be handled and SQL filtering and column alias errors be corrected using expressions and CTEs? | |
| [q3_3.sql](queries/unit3/q3_3.sql) | Which passengers have disputed bookings, and how can subqueries, CTEs, IN, and EXISTS be used to identify and verify the results? |


### Unit 4: From Rows to Insight

In Unit 4, I used SQL aggregation to analyze booking activity and identify booking failures across flights and regions.

| SQL File | Business Question |
|---|---|
| [q4_1.sql](queries/unit4/q4_1.sql) | How many bookings and passengers are there, what are the fare statistics, and which flights and countries have the most bookings? |
| [q4_2.sql](queries/unit4/q4_2.sql) | What are the booking failure counts and failure rates across flights and countries, and which flights require further investigation? |


**queries/unit4/q4_1.sql — Basic Aggregation**

This query file answers the following business questions:
- How many total bookings and unique passengers are there?
- What are the total, average, minimum, and maximum fares?
- Which flights have the most bookings?
- Which flights have at least 10 bookings?
- How do booking totals differ by country and flight?

**queries/unit4/q4_2.sql — Advanced Aggregation**

This query file answers the following business questions:
- How many total and failed bookings does each flight have?
- How many bookings and failures occurred in each country?
- What are the overall booking and failure totals?
- What is the baseline failure rate for flights with at least 10 bookings?

### Unit 5: Joins and Query Optimization

In Unit 5, I used SQL joins to retrieve related data from multiple tables and analyzed query execution plans to understand database performance.

| SQL File | Business Question |
|---|---|
| [q5_1.sql](queries/unit5/q5_1.sql) | Which passengers booked which flights, which flights are associated with specific airports, and which flights share the same origin country? |
| [q5_2.sql](queries/unit5/q5_2.sql) | Which flights have no bookings, and how do different join types affect the query results? |
| [q5_3.sql](queries/unit5/q5_3.sql) | How many flight-airport combinations are possible, and how does PostgreSQL execute a multi-table join? |

### Unit 6: Window Functions and Analytics

In Unit 6, I used SQL window functions to analyze fare patterns, rank bookings, compare consecutive records, and identify trends in booking activity and failure rates.

| SQL File | Business Question |
|---|---|
| [q6_1.sql](queries/unit6/q6_1.sql) | How do individual booking fares compare with flight averages, and how can flights be ranked and grouped based on booking counts? |
| [q6_2.sql](queries/unit6/q6_2.sql) | How do consecutive booking fares change, how does booking revenue accumulate over time, and where are significant gaps in booking activity? |
| [q6_3.sql](queries/unit6/q6_3.sql) | What are the top three booking fares for each flight, and how does booking activity change from month to month? |
| [q6_4.sql](queries/unit6/q6_4.sql) | Is the booking failure rate improving or worsening over time? |


## Technical Highlights

### 1. SQL Joins

I used INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, and SELF JOIN to retrieve related information from multiple tables. These techniques helped identify passenger bookings, flight relationships, and flights without bookings.

### 2. Aggregations

I used COUNT(), SUM(), AVG(), GROUP BY, and HAVING to summarize booking activity, calculate fare statistics, and identify flights with high booking failure rates.

### 3. Common Table Expressions (CTEs)

I used CTEs to organize complex queries into smaller, readable steps. This made it easier to calculate adjusted fares, identify disputed bookings, and perform ranking and monthly comparisons.

### 4. Window Functions

I used ROW_NUMBER(), RANK(), DENSE_RANK(), NTILE(), LAG(), LEAD(), and FIRST_VALUE() to rank records, compare consecutive bookings, calculate running totals, and analyze trends without losing individual records.

### 5. Query Execution Plans

I used EXPLAIN to understand how PostgreSQL executes queries. Analyzing execution plans helped me understand join strategies and how query performance may change as the dataset grows.

## Findings and Recommendations

### Finding 1: Overall Booking Failure Rate

The dataset contains 200 bookings, including 44 cancelled or disputed bookings, resulting in an overall failure rate of 22%.

Recommendation: The airline management team should investigate cancellation reasons and disputed bookings to identify recurring problems and improve booking reliability.

Supporting query: [Unit 4 - Failure Analysis](queries/unit4/q4_2.sql)

### Finding 2: Improvement in Booking Reliability

The quarterly failure rate decreased from 24.53% in the first quarter to 16.67% in the fourth quarter of 2023. However, June recorded the highest monthly failure rate of 40%.

Recommendation: Management should investigate the high failure rate in June, monitor monthly performance, and aim to reduce the failure rate below 15% in the next quarter.

Supporting query: [Unit 6 - Failure Rate Analysis](queries/unit6/q6_4.sql)

### Finding 3: Changes in Monthly Booking Activity

Monthly booking activity decreased by 47.62% in March 2023 and increased by 54.55% in May 2023.

Recommendation: Management should investigate seasonal demand, pricing strategies, promotional offers, and flight availability to understand these changes and improve booking activity.

Supporting query: [Unit 6 - Monthly Booking Analysis](queries/unit6/q6_3.sql)

## Limitations and Future Improvements

### Limitations

The dataset contains only 200 booking records covering January through December 2023. This limited dataset may not fully represent real-world airline booking patterns or long-term seasonal trends.

Although the analysis identified booking failures, fare changes, and fluctuations in monthly booking activity, it does not establish the exact causes of these changes.

### Future Improvements

- Expand the dataset to include multiple years of booking records to improve seasonal and long-term trend analysis.
- Collect more detailed information about cancellation reasons and booking disputes to identify recurring problems.
- Analyze query performance using larger datasets to evaluate database scalability.
- Develop an interactive reporting dashboard to monitor booking activity, revenue trends, and failure rates.

## Video Presentation

The video presentation provides an overview of the Airline Booking Database project, demonstrates representative SQL queries, discusses important business findings and recommendations, and explains technical challenges and limitations.

Video link: [https://drive.google.com/file/d/1nLADBBvz-va0mJ8DvPTLO5navrqX-Ptu/view?usp=drive_link]

## How to Run the Project

### Prerequisites

- PostgreSQL 16
- pgAdmin 4
- Git or access to the GitHub repository
- [Instructor-provided airline.sql dataset](schema/airline.sql)

### Database Setup

1. Clone or download this GitHub repository.
2. Open pgAdmin 4 and connect to the PostgreSQL server.
3. Create a database named ex603_data.
4. Import the instructor-provided airline.sql file into the database.
5. Verify that the required tables and records are available.
   
 Alternatively, run the following commands from the repository root directory:

```bash
createdb ex603_data
psql -d ex603_data -f schema/airline.sql
```

Note: Use a new database because airline.sql contains DROP TABLE statements that remove existing tables before recreating them.

### Verify the Dataset

Execute the following SQL commands:

```sql
SELECT COUNT(*) FROM bookings;
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM airports;
```

The expected results are 200 bookings, 15 flights, and 5 airports.

### Execute the Analytical Queries

1. Open the Query Tool in the ex603_data database.
2. Select a SQL file from the queries folder.
3. Copy the SQL query into the Query Tool.
4. Execute the query and review the results.

The analytical SQL files are organized into the following folders:

- queries/unit3/
- queries/unit4/
- queries/unit5/
- queries/unit6/

Note: Some Unit 3 queries intentionally demonstrate SQL errors for educational purposes. Execute these examples individually.

### Additional Resources

- [Database Schema](schema/schema.sql)
- [Unit 6 Analysis](analysis/unit6.md)
- [Closing Memo](analysis/unit6-finding.md)
