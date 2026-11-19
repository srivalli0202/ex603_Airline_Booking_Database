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
The following ERD shows the relationships between the main entities in the Airline Booking Database.
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

The analytical queries in Units 3-6 were executed using the instructor provided airline. SQL file from Unit 3, imported into the ex603_data PostgreSQL database. 

This dataset provided the database structure and booking records used for business analysis.

### Unit 4: From Rows to Insight

In Unit 4, I used SQL aggregation to analyze booking activity and identify booking failures across flights and regions.

### Query Catalog

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

### Key Finding

The dataset contains 200 bookings, including 44 cancelled or disputed bookings, giving an overall failure rate of 22%. Flight IDs 3, 9, and 11 were identified for further investigation.
