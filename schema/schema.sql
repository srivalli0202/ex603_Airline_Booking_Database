-- ============================================================
-- EX 603 Assignment 2 - schema.sql
-- Theme: Airline Booking Database
-- Author: Srivalli
-- Target: PostgreSQL 14+
-- ============================================================

-- Reset: Reverse creation order, so no dependency blocks a drop.

DROP TABLE IF EXISTS flights_routes CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS airports CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS passengers CASCADE;
