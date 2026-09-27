-- =====================================================================
-- EX603 Assignment 2 — schema.sql
-- Theme   : Airline Booking Database
-- Author  : Srivalli
-- Target  : PostgreSQL 14+
-- =====================================================================

DROP TABLE IF EXISTS bookings       CASCADE;
DROP TABLE IF EXISTS flight_routes  CASCADE;
DROP TABLE IF EXISTS airports       CASCADE;
DROP TABLE IF EXISTS flights        CASCADE;
DROP TABLE IF EXISTS passengers     CASCADE;

-- ---------------------------------------------------------------------
-- 1. passengers — no outgoing references
-- ---------------------------------------------------------------------
CREATE TABLE passengers (
    passenger_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    passenger_name VARCHAR(100) NOT NULL
);

-- ---------------------------------------------------------------------
-- 2. flights — independent
-- ---------------------------------------------------------------------
CREATE TABLE flights (
    flight_id      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    flight_number  VARCHAR(20) NOT NULL UNIQUE,
    departure_time TIMESTAMP   NOT NULL,
    arrival_time   TIMESTAMP   NOT NULL,
    fare           NUMERIC(10,2) NOT NULL,
    active         BOOLEAN NOT NULL DEFAULT TRUE
);

-- ---------------------------------------------------------------------
-- 3. airports — independent
-- ---------------------------------------------------------------------
CREATE TABLE airports (
    airport_id   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL UNIQUE
);

-- ---------------------------------------------------------------------
-- 4. flight_routes — resolves M:N between flights and airports
-- ---------------------------------------------------------------------
CREATE TABLE flight_routes (
    flight_id  INTEGER NOT NULL,
    airport_id INTEGER NOT NULL,

    CONSTRAINT pk_flight_routes PRIMARY KEY (flight_id, airport_id),

    CONSTRAINT fk_flight_routes_flight
        FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_flight_routes_airport
        FOREIGN KEY (airport_id)
        REFERENCES airports (airport_id)
        ON DELETE RESTRICT
);

-- ---------------------------------------------------------------------
-- 5. bookings — references passengers + flights
-- ---------------------------------------------------------------------
CREATE TABLE bookings (
    booking_id    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    passenger_id  INTEGER NOT NULL,
    flight_id     INTEGER NOT NULL,
    booking_time  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fare_paid     NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_bookings_passenger
        FOREIGN KEY (passenger_id)
        REFERENCES passengers (passenger_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_bookings_flight
        FOREIGN KEY (flight_id)
        REFERENCES flights (flight_id)
        ON DELETE RESTRICT
);
