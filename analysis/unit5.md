# Unit 5 Analysis
## Task 5.1 Question 1: Three - Table JOIN

The three-table join could be used to create a flight booking report for the airline platform. This report would show the passenger ID, passenger name, booking ID, flight number, and booking date. It would help the airline team understand which passengers booked which flights and when the bookings were made. This information could also help customer service employees find booking details and answer passenger questions.

 ## Task 5.1 question 2: Junction Table
The junction table is important because it connects flights with airports. In my airline database, I used the flight_routes table to connect the flights and airports tables. This helped me identify which flights are associated with SGN airport. Without the junction table, it would be difficult to find these relationships because one flight can be connected to multiple airports, and one airport can be connected to multiple flights. The junction table makes the data easier to organize and helps avoid repeating the same information.

## Task 5.2 Question 1: Flights Excluded by INNER JOIN
In my airline booking database, the INNER JOIN excluded two flights: Flight 14(VN214) and Flight 15 (VN215). The LEFT JOIN returned all 15 flights, including these two flights with zero bookings. However, the INNER JOIN returned only 13 flights because it includes only records that have matching booking information. Since Flights 14 and 15 have no matching records in the bookings table, they were excluded from the INNER JOIN results.

## Task 5.2 Question 2: Flights with No Bookings
When a flight has no bookings, it means there are no matching booking records for that flight in the database. In my analysis, flights 14 and 15 had zero bookings. There could be several reasons for this. The flights might be newly added, not yet available for booking, or inactive. However, the booking data alone does not tell us the exact reason. We would need to check the flight status and other information before making a conclusion.

## Task 5.2 Question 3: How INNER JOIN can hide information
A report based only on an INNER JOIN could give leadership an incomplete picture because it excludes flights that have no bookings. In my analysis, the INNER JOIN returned 13 flights, while the LEFT JOIN returned all 15 flights. Flights 14 and 15 were missing from the INNER JOIN results because they had no matching booking records. If leadership only reviewed the INNER JOIN report, they might not realize that these two flights had zero bookings. Using a LEFT JOIN helps show all flights and gives leadership a more complete understanding of booking activity.

## Task 5.2 Question 4: Why leadership should identify inactive flights
Leadership should identify flights with no bookings because it helps them understand which flights are not receiving booking activity. In my analysis, flights 14 and 15 had zero bookings. These flights might be newly added, inactive, or experiencing booking related issues. By identifying these flights, leadership can investigate the reasons, check whether the flights are available for booking, and decide if any acton is needed. 

## Recommended Action
Based on my findings, I recommend that leadership investigate Flights 14 and 15 because they have no bookings. The team should first check whether these flights are active and available for booking. If the flights are new, leadership could review their launch dates and booking availability. If they are active but still have no bookings, the team could investigate possible booking issues or low customer demand.

## Task 5.3 Part A: CROSS JOIN Analysis
In my airline database, the flight table 15 rows, and the airports table contains 5 rows. When I used a CROSS JOIN, the result contained 75 rows because 15 multiplied by 5 equals 75. This is called a Cartesian product. A Cartesian product can be useful when we want to generate every possible combination of flights and airports for planning or analysis. However, it can also indicate a query mistake if we accidentally combine tables without the correct join condition. This could create unnecessary rows and produce misleading results.

## Task 5.3 Part B: Execution Plan Analysis
I used PostgreSQL's EXPLAIN command to examine my three table join between bookings, passengers, and flights. The execution plan showed the PostgreSQL selected a Hash Join and Nested Loop.

The Hash join connects bookings with passengers using passenger_id, PostgreSQL also uses a Nested Loop with an Index Scan to find matching flight records using flight_id. The execution plain memorizes, which helps reuse previous flight lookups. PostgreSQL may have selected these methods because the tables are relatively small and the flights table has a primarykey index. As the database grows, reading and joining more records could require additional processing time.

 
