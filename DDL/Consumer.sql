--Consumer Table-
SET SERVEROUTPUT ON;
DECLARE
    -- Variable to store the count of existing Consumer table
    consumer_exists NUMBER;
BEGIN
    -- Check if the Consumer table already exists
    SELECT COUNT(*) INTO consumer_exists
    FROM user_tables
    WHERE table_name = 'CONSUMER';
    -- If Consumer table does not exist, create it
    IF consumer_exists = 0 THEN
        EXECUTE IMMEDIATE '
        CREATE TABLE Consumer (
            Consumer_id  INTEGER NOT NULL,
            First_name   VARCHAR2(50) NOT NULL,
            Last_name    VARCHAR2(50) NOT NULL,
            Email        VARCHAR2(100) NOT NULL,
            Address      VARCHAR2(255),
            Phone        VARCHAR2(15),
            CONSTRAINT consumer_pk PRIMARY KEY (Consumer_id)
        )';
        DBMS_OUTPUT.PUT_LINE('Consumer table created successfully.');
    ELSE
        -- If Consumer table already exists, inform the user
        DBMS_OUTPUT.PUT_LINE('Consumer table already exists.');
    END IF;
-- Exception handling block to catch any errors during table creation
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating table Consumer ');
END;
/
-- Add unique constraint on Email column
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Consumer ADD CONSTRAINT unique_consumer_email UNIQUE (Email)';
    DBMS_OUTPUT.PUT_LINE('Unique constraint on Email added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unique constraint on Email already exists');
END;
/
-- Add unique constraint on Phone column
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Consumer ADD CONSTRAINT unique_consumer_phone UNIQUE (Phone)';
    DBMS_OUTPUT.PUT_LINE('Unique constraint on Phone added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unique constraint on Phone already exists');
END;
/
