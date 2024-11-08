--Consumer Data Insertion Script--
SET SERVEROUTPUT ON;
 
DECLARE
 
    v_constraint_violation EXCEPTION;

    PRAGMA EXCEPTION_INIT(v_constraint_violation, -1);
 
    -- Function to check if a Consumer ID already exists

    FUNCTION consumer_exists(p_consumer_id INTEGER) RETURN BOOLEAN IS

        v_count INTEGER;

    BEGIN

        SELECT COUNT(*) INTO v_count FROM Consumer WHERE Consumer_id = p_consumer_id;

        RETURN v_count > 0;

    END;
 
BEGIN

    -- Insert data into the Consumer table
 
    IF NOT consumer_exists(1) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (1, 'Alice', 'Johnson', 'alice.johnson@example.com', '101 Park Ave', '5551234567');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 1 - Alice Johnson');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 1 already exists. Skipping insert.');

    END IF;
 
    IF NOT consumer_exists(2) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (2, 'Bob', 'Martin', 'bob.martin@example.com', '202 Elm St', '5552345678');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 2 - Bob Martin');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 2 already exists. Skipping insert.');

    END IF;
 
    IF NOT consumer_exists(3) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (3, 'Charlie', 'Davis', 'charlie.davis@example.com', '303 Pine St', '5553456789');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 3 - Charlie Davis');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 3 already exists. Skipping insert.');

    END IF;
 
    IF NOT consumer_exists(4) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (4, 'Dana', 'Evans', 'dana.evans@example.com', '404 Maple St', '5554567890');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 4 - Dana Evans');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 4 already exists. Skipping insert.');

    END IF;
 
    IF NOT consumer_exists(5) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (5, 'Eve', 'Taylor', 'eve.taylor@example.com', '505 Birch St', '5555678901');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 5 - Eve Taylor');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 5 already exists. Skipping insert.');

    END IF;
 
    IF NOT consumer_exists(6) THEN

        BEGIN

            INSERT INTO Consumer (Consumer_id, First_name, Last_name, Email, Address, Phone)

            VALUES (6, 'Frank', 'Wilson', 'frank.wilson@example.com', '606 Cedar St', '5556789012');

            DBMS_OUTPUT.PUT_LINE('Inserted Consumer: 6 - Frank Wilson');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Consumer_id/Email/Phone found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Consumer 6 already exists. Skipping insert.');

    END IF;
 
    -- Commit the transaction

    COMMIT;
 
END;

/
 