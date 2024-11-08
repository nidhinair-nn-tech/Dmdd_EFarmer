
SET SERVEROUTPUT ON;

DECLARE
    -- Variable to store the count of existing Payments table
    payments_exists NUMBER;
BEGIN
    -- Check if the Payments table already exists
    SELECT COUNT(*) INTO payments_exists
    FROM user_tables
    WHERE table_name = 'PAYMENTS';
    -- If Payments table does not exist, create it
    IF payments_exists = 0 THEN
        EXECUTE IMMEDIATE '
        CREATE TABLE Payments (
            payment_id      INTEGER PRIMARY KEY,
            payment_method  VARCHAR2(20) NOT NULL,
            payment_status  VARCHAR2(20) NOT NULL,
            transaction_date TIMESTAMP,
            order_order_id  INTEGER NOT NULL,
            CONSTRAINT fk_pay_order_id FOREIGN KEY (order_order_id) REFERENCES Orders(order_id)
        )';
        dbms_output.put_line('Payments table created successfully.');
    ELSE
        -- If Payments table already exists, inform the user
        dbms_output.put_line('Payments table already exists.');
    END IF;
-- Exception handling block to catch any errors during table creation
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error creating Payments table: ' || sqlerrm);
END;
/
-- Check if the unique constraint on order_order_id already exists before adding it
DECLARE
    v_constraint_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_constraint_exists 
    FROM user_constraints 
    WHERE constraint_name = 'UNIQUE_PAY_ORDER_ID'
      AND table_name = 'PAYMENTS';
    IF v_constraint_exists = 0 THEN
        EXECUTE IMMEDIATE 'ALTER TABLE Payments ADD CONSTRAINT UNIQUE_PAY_ORDER_ID UNIQUE (order_order_id)';
        dbms_output.put_line('Unique constraint on order_order_id added successfully.');
    ELSE
        dbms_output.put_line('Unique constraint on order_order_id already exists.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error adding unique constraint: ' || sqlerrm);
END;