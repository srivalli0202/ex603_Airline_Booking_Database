# Integrity Constraints

The following constraints are used to maintain the accuracy and consistency of the Airline Booking Database.

## Primary Key Constraints
- passengers.passenger_id is the primary key and must uniquely identify each passenger.
- flights.flight_id is the primary key and must uniquely identify each flight.
- bookings.booking_id is the primary key and must uniquely identify each booking.
- airports.airport_id is the primary key and must uniquely identify each airport.
- flight_routes uses a composite primary key of (flight_id, airport_id) so the same flight- airport combination cannot be stored more than once.

## Foreign Key Constraints
- bookings.passenger_id is a foreign key that references passengers.passenger_id.
- ON DELETE RESTRICT
- Reason: A passenger should not be deleted while booking records still reference that passenger.

- bookings.flight_id is a foreign key that references flights.flight_id.
- ON DELETE RESTRICT
- Reason: A flight should not be deleted while booking records still reference that flight.

- flight_routes.flight_id is a foreign key references flights.flight_id.
- ON DELETE CASCADE
- Reason: If a flight is deleted, its related route records are no longer needed and can be deleted automatically.

- flight_routes.airport_id is a foreign key references airports.airport_id.
- ON DELETE RESTRICT
- Reason: An airport should not be deleted while route records still reference it.

## Other Integrity Constraints
- passenger_name must not be NULL because every passenger must have a name.
- airport_name must not be NULL because every airport must have a name.
- flight_number must not be NULL because every flight must have a flight number.
- fare must be greater than or equal to 0 because a flight fare cannot be negative.
- fare_paid must be greater than or equal to 0 because a passenger cannot pay a negative amount.
- arrival_time must be later than departure_time because a flight cannot arrive before it departs.
  

