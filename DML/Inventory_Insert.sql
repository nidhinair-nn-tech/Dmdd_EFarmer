--Inventory Creation Script --
SET SERVEROUTPUT ON;
 
DECLARE
 
    v_constraint_violation EXCEPTION;

    PRAGMA EXCEPTION_INIT(v_constraint_violation, -1);
 
    -- Function to check if an Inventory record already exists based on Inventory_id

    FUNCTION inventory_exists(p_inventory_id INTEGER) RETURN BOOLEAN IS

        v_count INTEGER;

    BEGIN

        SELECT COUNT(*) INTO v_count FROM Inventory WHERE Inventory_id = p_inventory_id;

        RETURN v_count > 0;

    END;
 
BEGIN

    -- Insert data into the Inventory table
 
    IF NOT inventory_exists(301) THEN

        BEGIN

            INSERT INTO Inventory (Inventory_id, Product_id, Quantity_in_stock, Last_updated)

            VALUES (301, 101, 50, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('Inserted Inventory: 301 - Product ID 101 (Carrots)');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Inventory_id/Product_id found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Inventory 301 already exists. Skipping insert.');

    END IF;
 
    IF NOT inventory_exists(302) THEN

        BEGIN

            INSERT INTO Inventory (Inventory_id, Product_id, Quantity_in_stock, Last_updated)

            VALUES (302, 102, 80, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('Inserted Inventory: 302 - Product ID 102 (Tomatoes)');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Inventory_id/Product_id found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Inventory 302 already exists. Skipping insert.');

    END IF;
 
    IF NOT inventory_exists(303) THEN

        BEGIN

            INSERT INTO Inventory (Inventory_id, Product_id, Quantity_in_stock, Last_updated)

            VALUES (303, 103, 100, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('Inserted Inventory: 303 - Product ID 103 (Milk)');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Inventory_id/Product_id found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Inventory 303 already exists. Skipping insert.');

    END IF;
 
    IF NOT inventory_exists(304) THEN

        BEGIN

            INSERT INTO Inventory (Inventory_id, Product_id, Quantity_in_stock, Last_updated)

            VALUES (304, 104, 25, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('Inserted Inventory: 304 - Product ID 104 (Cheese)');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Inventory_id/Product_id found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Inventory 304 already exists. Skipping insert.');

    END IF;
 
    IF NOT inventory_exists(305) THEN

        BEGIN

            INSERT INTO Inventory (Inventory_id, Product_id, Quantity_in_stock, Last_updated)

            VALUES (305, 105, 60, SYSTIMESTAMP);

            DBMS_OUTPUT.PUT_LINE('Inserted Inventory: 305 - Product ID 105 (Apples)');

        EXCEPTION

            WHEN v_constraint_violation THEN

                DBMS_OUTPUT.PUT_LINE('Duplicate Inventory_id/Product_id found. Skipping insertion.');

            WHEN OTHERS THEN

                DBMS_OUTPUT.PUT_LINE('An error occurred: ');

        END;

    ELSE

        DBMS_OUTPUT.PUT_LINE('Inventory 305 already exists. Skipping insert.');

    END IF;
 
    -- Commit the transaction

    COMMIT;
 
END;

/

 