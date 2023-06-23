-- Problem: Update the service history of a car when a service ticket is created.

-- Create a procedure to update the service history:
CREATE OR REPLACE PROCEDURE UpdateServiceHistory(p_ticket_id INTEGER, p_car_id INTEGER)
AS $$
BEGIN
    -- Insert a new entry into the service history table
    INSERT INTO "Service History" ("ticket_id", "car_id")
    VALUES (p_ticket_id, p_car_id);
    
    -- Update the is_serviced flag of the car to indicate it has been serviced
    UPDATE "Car"
    SET "is_serviced" = TRUE
    WHERE "car_id" = p_car_id;
END;
$$ LANGUAGE plpgsql;

-- Create a service ticket and update the service history
CALL UpdateServiceHistory(1, 1);
