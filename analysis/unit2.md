# unit2.md — EX603 Assignment 2 (Unit 2 Analysis)
**Theme:** Airline Booking Database  
**Author:** Srivalli  


| Constraint Name | Source Table | Source Column | Target Table | Target Column | ON DELETE Rule | Rationale |
|-----------------|--------------|---------------|--------------|---------------|----------------|-----------|
| fk_flight_routes_flight | flight_routes | flight_id | flights | flight_id | CASCADE | Removing a flight must also remove all route mappings for that flight. Prevents orphaned route entries. |
| fk_flight_routes_airport | flight_routes | airport_id | airports | airport_id | RESTRICT | Prevents deletion of an airport that is still referenced by any flight route. Protects core reference data. |
| fk_bookings_passenger | bookings | passenger_id | passengers | passenger_id | CASCADE | If a passenger is deleted, all their bookings must also be deleted. A booking cannot exist without a passenger. |
| fk_bookings_flight | bookings | flight_id | flights | flight_id | RESTRICT | Prevents deletion of flights that have active bookings. Protects paid customer reservations. |
