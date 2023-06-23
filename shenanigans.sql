CREATE TABLE "Salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "phone_number" VARCHAR(50),
  "email" VARCHAR(50),
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "Mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email" VARCHAR(50),
  "phone_number" VARCHAR(50),
  PRIMARY KEY ("mechanic_id")
);

CREATE TABLE "Customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "phone_numer" VARCHAR(50),
  "email" VARCHAR(50),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Invoice" (
  "invoice_id" SERIAL,
  "cost" NUMERIC(5,2),
  "salesperson_id" INTEGER,
  "car_id" INTEGER,
  "mechanic_id" INTEGER,
  PRIMARY KEY ("invoice_id")
);

CREATE TABLE "Service Ticket" (
  "ticket_id" SERIAL,
  "customer_id" INTEGER,
  "car_id" INTEGER,
  PRIMARY KEY ("ticket_id")
);

CREATE TABLE "Car" (
  "car_id" SERIAL,
  "serial_number" VARCHAR(50),
  PRIMARY KEY ("car_id")
);

-- Create a stored function to insert data into the Salesperson table
CREATE FUNCTION InsertSalesperson(p_id INT, p_first_name VARCHAR(255), p_last_name VARCHAR(255))
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Salesperson" ("salesperson_id", "first_name", "last_name")
    VALUES (p_id, p_first_name, p_last_name);
END;
$$ LANGUAGE plpgsql;

-- Call the stored function to insert data into the Salesperson table
SELECT InsertSalesperson(1, 'Barack', 'Obama');
SELECT InsertSalesperson(2, 'Steve', 'Jobs');
SELECT InsertSalesperson(3, 'Hillary', 'Clinton');

-- Create a stored function to insert data into the Car table
CREATE FUNCTION InsertCar(p_id INT, p_serial_number VARCHAR(50), p_is_serviced BOOLEAN)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Car" ("car_id", "serial_number", "is_serviced")
    VALUES (p_id, p_serial_number, p_is_serviced);
END;
$$ LANGUAGE plpgsql;

-- Call the stored function to insert data into the Car table
SELECT InsertCar(1, 'Toyota', TRUE);
SELECT InsertCar(2, 'Honda', FALSE);
SELECT InsertCar(3, 'Ford', TRUE);

-- Create a stored function to insert data into the Invoice table
CREATE FUNCTION InsertInvoice(p_id INT, p_salesperson_id INT, p_customer_id INT, p_car_id INT)
RETURNS VOID
AS $$
BEGIN
    INSERT INTO "Invoice" ("invoice_id", "cost", "salesperson_id", "car_id", "mechanic_id")
    VALUES (p_id, 0.00, p_salesperson_id, p_car_id, 0);
END;
$$ LANGUAGE plpgsql;

-- Call the stored function to insert data into the Invoice table
SELECT InsertInvoice(1, 1, 1, 1);
SELECT InsertInvoice(2, 2, 2, 2);
SELECT InsertInvoice(3, 3, 3, 3);

-- Add the "is_serviced" column to the "Car" table
ALTER TABLE "Car"
ADD COLUMN "is_serviced" BOOLEAN;

-- Create a procedure to update the service status of a purchased vehicle
CREATE OR REPLACE FUNCTION UpdateServiceStatus(vehicle_id INT)
RETURNS VOID AS $$
DECLARE
    existing_service BOOLEAN;
BEGIN
    -- Check if the vehicle has existing service records
    SELECT COUNT(*) > 0 INTO existing_service
    FROM "Service History"
    WHERE car_id = vehicle_id;
    
    IF existing_service = FALSE THEN
        -- Update the service status to TRUE if the vehicle had no previous service
        UPDATE "Car"
        SET "is_serviced" = TRUE
        WHERE car_id = vehicle_id;
    END IF;
END $$ LANGUAGE plpgsql;

