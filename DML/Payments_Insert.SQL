SET serveroutput ON;

DECLARE
    -- Exception for primary key violation (duplicate payment_id)
    v_constraint_violation_pk EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_constraint_violation_pk, -1); -- Primary key violation error code
    
    -- Exception for foreign key constraint violation
    v_fk_violation EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_fk_violation, -2291); -- ORA-02291: integrity constraint violation for foreign key


    -- Exception for null order_order_id (foreign key constraint)
    v_order_null EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_order_null, -1400); -- ORA-01400: cannot insert NULL error code


    -- Variable to hold count of orders for existence check
    v_order_exists NUMBER;


BEGIN
    -- Insert data into Payments table
    
    BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 123456;
        IF v_order_exists > 0 THEN
            INSERT INTO Payments (payment_id, payment_method, payment_status, transaction_date, order_order_id)
            VALUES (1, 'Credit Card', 'Completed', TO_TIMESTAMP('2024-11-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 123456);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_id 123456 does not exist. Skipping insertion for payment_id 1.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate payment_id found for 1. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for payment_id 1.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_id cannot be null for payment_id 1. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting payment 1: ' || SQLERRM);
    END;
    
        BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 123456;
        IF v_order_exists > 0 THEN
            INSERT INTO Payments (payment_id, payment_method, payment_status, transaction_date, order_order_id)
            VALUES (2, 'Credit Card', 'Completed', TO_TIMESTAMP('2024-11-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 654321);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_id 123456 does not exist. Skipping insertion for payment_id 1.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate payment_id found for 1. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for payment_id 1.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_id cannot be null for payment_id 1. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting payment 1: ' || SQLERRM);
    END;
    
        BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 123456;
        IF v_order_exists > 0 THEN
            INSERT INTO Payments (payment_id, payment_method, payment_status, transaction_date, order_order_id)
            VALUES (3, 'Credit Card', 'Completed', TO_TIMESTAMP('2024-11-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 234567);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_id 123456 does not exist. Skipping insertion for payment_id 1.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate payment_id found for 1. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for payment_id 1.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_id cannot be null for payment_id 1. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting payment 1: ' || SQLERRM);
    END;


    -- Repeat the above pattern for each payment record
    BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 654321;
        IF v_order_exists > 0 THEN
            INSERT INTO Payments (payment_id, payment_method, payment_status, transaction_date, order_order_id)
            VALUES (4, 'PayPal', 'Pending', TO_TIMESTAMP('2024-11-02 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 324511);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_id 654321 does not exist. Skipping insertion for payment_id 2.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate payment_id found for 2. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for payment_id 2.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_id cannot be null for payment_id 2. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting payment 2: ' || SQLERRM);
    END;
    
        BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 654321;
        IF v_order_exists > 0 THEN
            INSERT INTO Payments (payment_id, payment_method, payment_status, transaction_date, order_order_id)
            VALUES (5, 'PayPal', 'Pending', TO_TIMESTAMP('2024-11-02 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 987654);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_id 654321 does not exist. Skipping insertion for payment_id 2.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate payment_id found for 2. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for payment_id 2.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_id cannot be null for payment_id 2. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting payment 2: ' || SQLERRM);
    END;


    -- Continue this pattern for each remaining payment


END;

