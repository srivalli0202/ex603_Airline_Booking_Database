## Passengers

Relation: passengers

| Attribute | Domain |
|---|---|
| passenger_id | INTEGER |
| passenger_name | VARCHAR(100) |
Primary Key: passenger_id

 ## Flights
 Relation: flights

| Attribute | Domain |
|---|---|
| flight_id | INTERGER |
| flight_number | VARCHAR(20) |
| departure_time | TIMESTAMP |
| arrival_time | TIMESTAMP |
| fare | DECIMAL(10,2) |
| active | BOOLEAN |
Primary Key: flight_id

## Bookings

Relation: bookings

| Attribute | Domain |
|---|---|
| booking_id | INTEGER |
| passenger_id | INTEGER |
| flight_id | INTEGER |
| booking_time | TIMESTAMP |
| fare_paid | DECIMAL(10,2) |
Primary Key: booking_id

## Airports

Relation: airports

|Attribute | Domain |
|---|---|
| airport_id | INTEGER |
| airport_name | VARCHAR(100) |
Primary Key: airport_id

## Flight_routes

Relation: flight_routes

| Attributes | Domain |
|---|---|
| flight_id | INTEGER |
| airport_id | INTEGER |
Primary Key: (flight_id, airport_id)
