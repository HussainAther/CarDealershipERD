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

-- Function to insert a new invoice
CREATE FUNCTION InsertInvoice(p_salesperson_id INTEGER, p_car_id INTEGER)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Invoice (salesperson_id, car_id)
    VALUES (p_salesperson_id, p_car_id);
END;
$$ LANGUAGE plpgsql;

-- Function to insert a new service ticket
CREATE FUNCTION InsertServiceTicket(p_customer_id INTEGER, p_car_id INTEGER)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Service_Ticket (customer_id, car_id)
    VALUES (p_customer_id, p_car_id);
END;
$$ LANGUAGE plpgsql;

-- Function to insert a new service history record
CREATE FUNCTION InsertServiceHistory(p_car_id INTEGER)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Service_History (car_id)
    VALUES (p_car_id);
END;
$$ LANGUAGE plpgsql;

