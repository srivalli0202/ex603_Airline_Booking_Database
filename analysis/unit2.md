# unit2.md — EX603 Assignment 2 (Unit 2 Analysis)
**Theme:** Airline Booking Database  
**Author:** Srivalli  


| Constraint Name | Source Table | Source Column | Target Table | Target Column | ON DELETE Rule | Rationale |
|-----------------|--------------|---------------|--------------|---------------|----------------|-----------|
| fk_flight_routes_flight | flight_routes | flight_id | flights | flight_id | CASCADE | Removing a flight must also remove all route mappings for that flight. Prevents orphaned route entries. |
| fk_flight_routes_airport | flight_routes | airport_id | airports | airport_id | RESTRICT | Prevents deletion of an airport that is still referenced by any flight route. Protects core reference data. |
| fk_bookings_passenger | bookings | passenger_id | passengers | passenger_id | CASCADE | If a passenger is deleted, all their bookings must also be deleted. A booking cannot exist without a passenger. |
| fk_bookings_flight | bookings | flight_id | flights | flight_id | RESTRICT | Prevents deletion of flights that have active bookings. Protects paid customer reservations. |

Constraint Analysis Write‑Up
Foreign Key Constraints Overview
The Airline Booking Database uses four foreign key constraints to maintain referential integrity across its relational structure. These constraints ensure that relationships between passengers, flights, airports, routes, and bookings remain valid and consistent throughout all database operations.

1. fk_flight_routes_flight (CASCADE)
This constraint links each route entry to a specific flight. The CASCADE rule ensures that when a flight is deleted, all associated route mappings are automatically removed. This prevents orphaned route records and maintains the integrity of the flight‑to‑route relationship.

2. fk_flight_routes_airport (RESTRICT)
This constraint connects each route entry to an airport. The RESTRICT rule prevents deletion of an airport if it is still referenced by any route. Airports serve as core reference data, and this rule protects the stability of the route network by ensuring no airport can be removed while still in use.

3. fk_bookings_passenger (CASCADE)
This constraint ties each booking to a passenger. The CASCADE rule ensures that if a passenger is deleted—such as in a GDPR‑related data removal—all of their bookings are also deleted. This prevents invalid bookings from remaining in the system without a corresponding passenger.

4. fk_bookings_flight (RESTRICT)
This constraint links each booking to a flight. The RESTRICT rule prevents deletion of any flight that still has active bookings. This protects customer reservations and enforces business rules around flight availability and booking validity.

Justification of ON DELETE Rules
The chosen ON DELETE behaviors reflect the logical and business requirements of an airline booking system:

CASCADE is applied where dependent records must not outlive their parent (e.g., bookings tied to passengers, routes tied to flights).

RESTRICT is applied where deletion would violate business rules or compromise essential reference data (e.g., airports, flights with active bookings).

This combination ensures both data integrity and operational safety.

CHECK Constraint Narrative
Although explicit SQL CHECK constraints are not defined in the schema, several business rules are enforced through column types, NOT NULL constraints, and application‑level validation:

fare (flights.fare) and fare_paid (bookings.fare_paid) must be positive monetary values.

active (flights.active) ensures consistent representation of flight status.

booking_time defaults to the current timestamp, guaranteeing valid booking records.

arrival_time > departure_time is a business rule enforced at the application layer to ensure valid flight schedules.

These constraints collectively ensure that the data stored in the system remains meaningful and logically consistent.

Narrative Summary
The constraint design of the Airline Booking Database balances strict referential integrity with practical business logic. CASCADE rules ensure automatic cleanup of dependent records, while RESTRICT rules safeguard critical data from accidental deletion. Together, these constraints create a robust, normalized schema that supports reliable airline operations, accurate booking management, and consistent route tracking.

