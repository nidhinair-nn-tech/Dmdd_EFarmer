/** 
''' This is done by ADMIN USER to create a EFarmer_admin for this project'''
**/
set serveroutput on;
Declare
    user_exists NUMBER;
    grant_error EXCEPTION;
BEGIN
    -- Check if the user already exists
    SELECT COUNT(*)
    INTO user_exists
    FROM all_users
    WHERE username = 'EFARMER_ADMIN';

    IF user_exists = 0 THEN
        -- Create the user if it doesn't exist
        EXECUTE IMMEDIATE 'CREATE USER EFARMER_ADMIN IDENTIFIED BY Farmermarket2024';
        DBMS_OUTPUT.PUT_LINE('User created successfully.');
    ELSE
        -- User already exists, inform the user
        DBMS_OUTPUT.PUT_LINE('User already exists.');
    END IF;

    BEGIN
        -- User already exists, inform the user
        EXECUTE IMMEDIATE 'GRANT CONNECT TO EFARMER_ADMIN';
        EXECUTE IMMEDIATE 'GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER, CREATE USER TO EFARMER_ADMIN WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CONNECT TO EFARMER_ADMIN WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT CREATE ROLE TO EFARMER_ADMIN WITH ADMIN OPTION';
        EXECUTE IMMEDIATE 'GRANT UNLIMITED TABLESPACE TO EFARMER_ADMIN';
        EXECUTE IMMEDIATE 'GRANT CREATE VIEW TO EFARMER_ADMIN';
    EXCEPTION
        WHEN grant_error THEN
            NULL; -- Ignore if the user already has the privilege
    END;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
