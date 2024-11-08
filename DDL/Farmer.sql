SET SERVEROUTPUT ON;
 
DECLARE
    -- Variable to store the count of existing Farmer table
    farmer_exists NUMBER;
BEGIN
    -- Check if the Farmer table already exists
    SELECT COUNT(*) INTO farmer_exists
    FROM user_tables
    WHERE table_name = 'FARMER';
 
    -- If Farmer table does not exist, create it
    IF farmer_exists = 0 THEN
        EXECUTE IMMEDIATE '
        CREATE TABLE Farmer (
            Farmer_id    INTEGER NOT NULL,
            First_name   VARCHAR2(50) NOT NULL,
            Last_name    VARCHAR2(50) NOT NULL,
            Email        VARCHAR2(100) NOT NULL,
            Address      VARCHAR2(255),
            Phone        VARCHAR2(15),
            CONSTRAINT farmer_pk PRIMARY KEY (Farmer_id)
        )';
        DBMS_OUTPUT.PUT_LINE('Farmer table created successfully.');
    ELSE
        -- If Farmer table already exists, inform the user
        DBMS_OUTPUT.PUT_LINE('Farmer table already exists.');
    END IF;
 
-- Exception handling block to catch any errors during table creation
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating table Farmer ');
END;
/
 
-- Add unique constraint on Email column
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Farmer ADD CONSTRAINT unique_farmer_email UNIQUE (Email)';
    DBMS_OUTPUT.PUT_LINE('Unique constraint on Email added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unique constraint on Email already exists ');
END;
/
 
-- Add unique constraint on Phone column
BEGIN
    EXECUTE IMMEDIATE 'ALTER TABLE Farmer ADD CONSTRAINT unique_farmer_phone UNIQUE (Phone)';
    DBMS_OUTPUT.PUT_LINE('Unique constraint on Phone added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unique constraint on Phone already exists');
END;
/


