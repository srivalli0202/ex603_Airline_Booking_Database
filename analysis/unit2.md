# unit2.md — EX603 Assignment 2 (Unit 2 Analysis)
**Theme:** Airline Booking Database  
**Author:** Srivalli  


| Constraint Name | Source Table | Source Column | Target Table | Target Column | ON DELETE Rule | Rationale |
|-----------------|--------------|---------------|--------------|---------------|----------------|-----------|
| fk_flight_routes_flight | flight_routes | flight_id | flights | flight_id | CASCADE | Removing a flight must also remove all route mappings for that flight. Prevents orphaned route entries. |
| fk_flight_routes_airport | flight_routes | airport_id | airports | airport_id | RESTRICT | Prevents deletion of an airport that is still referenced by any flight route. Protects core reference data. |
| fk_bookings_passenger | bookings | passenger_id | passengers | passenger_id | CASCADE | If a passenger is deleted, all their bookings must also be deleted. A booking cannot exist without a passenger. |
| fk_bookings_flight | bookings | flight_id | flights | flight_id | RESTRICT | Prevents deletion of flights that have active bookings. Protects paid customer reservations. |
| fk_passengers_referrer | passengers | referred_by | passengers | passenger_id | SET NULL | Keeps the passenger record when the referring passenger is deleted. |
| fk_flight_stops_flight | flight_stops | flight_id | flights | flight_id | CASCADE | Deletes related stops when their flight is deleted. |
| fk_flight_stops_airport | flight_stops | airport_id | airports | airport_id | RESTRICT | Prevents deleting an airport that is still used by a flight stop. |

Constraint Analysis Write‑Up
Foreign Key Constraints Overview
The Airline Booking Database uses seven foreign key constraints to maintain referential integrity across its relational structure. These constraints ensure that relationships between passengers, flights, airports, routes, and bookings remain valid and consistent throughout all database operations.

1. fk_flight_routes_flight (CASCADE)
This constraint links each route entry to a specific flight. The CASCADE rule ensures that when a flight is deleted, all associated route mappings are automatically removed. This prevents orphaned route records and maintains the integrity of the flight‑to‑route relationship.

2. fk_flight_routes_airport (RESTRICT)
This constraint connects each route entry to an airport. The RESTRICT rule prevents deletion of an airport if it is still referenced by any route. Airports serve as core reference data, and this rule protects the stability of the route network by ensuring no airport can be removed while still in use.

3. fk_bookings_passenger (CASCADE)
This constraint ties each booking to a passenger. The CASCADE rule ensures that if a passenger is deleted—such as in a GDPR‑related data removal—all of their bookings are also deleted. This prevents invalid bookings from remaining in the system without a corresponding passenger.

4. fk_bookings_flight (RESTRICT)
This constraint links each booking to a flight. The RESTRICT rule prevents deletion of any flight that still has active bookings. This protects customer reservations and enforces business rules around flight availability and booking validity.

5. fk_passengers_referrer (SET NULL)
This constraint connects a passenger to another passenger who referred them. If the referring passenger is deleted, the referred_by value becomes NULL. The passenger's record stays in the database.

6. fk_flight_stops_flight (CASCADE)
This constraint connects each flight stop to its flight. When a flight is deleted, all its related stops are automatically deleted because those stops cannot exist without the flight.

7. fk_flight_stops_airport (RESTRICT)
This constraint connects each flight stop to an airport. The RESTRICT rule prevents an airport from being deleted while it is still used by a flight stop. This helps protect important route information.

### Justification of ON DELETE Rules
The chosen ON DELETE behaviors reflect the logical and business requirements of an airline booking system:

CASCADE is applied where dependent records must not outlive their parent (e.g., bookings tied to passengers, routes tied to flights).

RESTRICT is applied where deletion would violate business rules or compromise essential reference data (e.g., airports, flights with active bookings).

This combination ensures both data integrity and operational safety.

### CHECK Constraint Narrative

In my Airline Booking Database, I added CHECK constraints to prevent invalid data from being stored in the tables.

1. **Flight fare:** `CHECK (fare >= 0)` prevents negative ticket prices. Without this rule, someone could accidentally enter a negative fare.

2. **Flight time:** `CHECK (arrival_time > departure_time)` ensures that a flight's arrival time is later than its departure time. This prevents invalid flight schedules.

3. **Booking payment:** `CHECK (fare_paid >= 0)` prevents negative payment amounts from being stored in bookings.

4. **Passenger referral:** `CHECK (referred_by IS DISTINCT FROM passenger_id)` prevents passengers from referring themselves. A passenger can still have no referrer.

5. **Flight stop number:** `CHECK (stop_number > 0)` ensures that every flight stop has a positive stop number.

These CHECK constraints help maintain data accuracy and prevent mistakes when inserting or updating records in the database.

Narrative Summary
The constraint design of the Airline Booking Database balances strict referential integrity with practical business logic. CASCADE rules ensure automatic cleanup of dependent records, while RESTRICT rules safeguard critical data from accidental deletion. Together, these constraints create a robust, normalized schema that supports reliable airline operations, accurate booking management, and consistent route tracking.

