SET SERVEROUTPUT ON;

DECLARE

    v_constraint_violation EXCEPTION;

    PRAGMA EXCEPTION_INIT(v_constraint_violation, -1);
 
    -- Function to check if a Farmer ID already exists

    FUNCTION farmer_exists(p_farmer_id INTEGER) RETURN BOOLEAN IS

        v_count INTEGER;

    BEGIN

        SELECT COUNT(*) INTO v_count FROM Farmer WHERE Farmer_id = p_farmer_id;

        RETURN v_count > 0;

    END;

BEGIN

    -- Insert data into the Farmer table

    IF NOT farmer_exists(1) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123 Farm Lane', '1234567890');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 1 - John Doe');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 1 already exists. Skipping insert.');

    END IF;
 
    IF NOT farmer_exists(2) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '456 Maple St', '0987654321');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 2 - Jane Smith');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 2 already exists. Skipping insert.');

    END IF;
 
    IF NOT farmer_exists(3) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (3, 'Carlos', 'Gomez', 'carlos.gomez@example.com', '789 Pine St', '5678901234');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 3 - Carlos Gomez');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 3 already exists. Skipping insert.');

    END IF;
 
    IF NOT farmer_exists(4) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (4, 'Maria', 'Garcia', 'maria.garcia@example.com', '123 Oak Dr', '8765432109');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 4 - Maria Garcia');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 4 already exists. Skipping insert.');

    END IF;
 
    IF NOT farmer_exists(5) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (5, 'Liam', 'Brown', 'liam.brown@example.com', '345 Elm St', '1230984567');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 5 - Liam Brown');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 5 already exists. Skipping insert.');

    END IF;
 
    IF NOT farmer_exists(6) THEN

        BEGIN

            INSERT INTO Farmer (Farmer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (6, 'Emma', 'Wilson', 'emma.wilson@example.com', '678 Cedar St', '3456789012');

            DBMS_OUTPUT.PUT_LINE('Inserted Farmer: 6 - Emma Wilson');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Farmer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Farmer 6 already exists. Skipping insert.');

    END IF;
 
    -- Commit the transaction

    COMMIT;

END;

/



