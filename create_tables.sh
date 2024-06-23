#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

# RESETING TABLES
$PSQL "DROP TABLE IF EXISTS appointments;
       DROP TABLE IF EXISTS customers;
       DROP TABLE IF EXISTS services;"

# CREATING TABLES
$PSQL "CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(50) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL);"

$PSQL "CREATE TABLE services(
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL);"

$PSQL "CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY,
  time VARCHAR(50),
  customer_id INT,
  service_id INT,
  CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
  CONSTRAINT fk_service FOREIGN KEY(service_id) REFERENCES services(service_id) ON DELETE CASCADE);"


# INSERTING DATA
$PSQL "INSERT INTO services(name) VALUES('cut'),('style'), ('perm'), ('shave'), ('color');"
