-- Function to insert a new salesperson
CREATE FUNCTION InsertSalesperson(p_name VARCHAR(50))
RETURNS VOID AS $$
BEGIN
    INSERT INTO Salesperson (name)
    VALUES (p_name);
END;
$$ LANGUAGE plpgsql;

-- Function to insert a new customer
CREATE FUNCTION InsertCustomer(p_name VARCHAR(50))
RETURNS VOID AS $$
BEGIN
    INSERT INTO Customer (name)
    VALUES (p_name);
END;
$$ LANGUAGE plpgsql;

-- Function to insert a new car
CREATE FUNCTION InsertCar(p_serial_number VARCHAR(50))
RETURNS VOID AS $$
BEGIN
    INSERT INTO Car (serial_number)
    VALUES (p_serial_number);
END;
$$ LANGUAGE plpgsql;

