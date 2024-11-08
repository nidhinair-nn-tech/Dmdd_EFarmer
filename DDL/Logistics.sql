
SET SERVEROUTPUT ON;
DECLARE
    -- Variable to store the count of existing Logistics table
    logistics_exists NUMBER;
BEGIN
    -- Check if the Logistics table already exists
    SELECT COUNT(*) INTO logistics_exists
    FROM user_tables
    WHERE table_name = 'LOGISTICS';
    -- If Logistics table does not exist, create it
    IF logistics_exists = 0 THEN
        EXECUTE IMMEDIATE '
        CREATE TABLE Logistics (
            shipment_id             INTEGER PRIMARY KEY,
            delivery_status         VARCHAR2(20) NOT NULL,
            estimated_delivery_date DATE,
            order_order_id          INTEGER NOT NULL,
            CONSTRAINT fk_logistics_order FOREIGN KEY (order_order_id) REFERENCES Orders(order_id)
        )';
        dbms_output.put_line('Logistics table created successfully.');
    ELSE
        -- If Logistics table already exists, inform the user
        dbms_output.put_line('Logistics table already exists.');
    END IF;
-- Exception handling block to catch any errors during table creation
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error creating Logistics table: ' || sqlerrm);
END;
/
-- Check if the unique constraint on order_order_id already exists before adding it
DECLARE
    v_constraint_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_constraint_exists 
    FROM user_constraints 
    WHERE constraint_name = 'UNIQUE_LOGISTICS_ORDER_ID'
      AND table_name = 'LOGISTICS';
    IF v_constraint_exists = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE Logistics ADD CONSTRAINT UNIQUE_LOGISTICS_ORDER_ID UNIQUE (order_order_id)';
        dbms_output.put_line('Unique constraint on order_order_id added successfully.');
    ELSE
        dbms_output.put_line('Unique constraint on order_order_id already exists.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error adding unique constraint: ' || sqlerrm);
END;
/