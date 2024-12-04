SET serveroutput ON;

DECLARE
    -- Exception for primary key violation (duplicate shipment_id)
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
    -- Insert data into Logistics table


    BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 123456;
        IF v_order_exists > 0 THEN
            INSERT INTO Logistics (shipment_id, delivery_status, estimated_delivery_date, order_order_id)
            VALUES (Logistics_SEQ.NEXTVAL, 'Shipped', TO_DATE('2024-11-05', 'YYYY-MM-DD'), 123456);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_order_id 123456 does not exist. Skipping insertion for shipment_id 1.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate shipment_id found for 1. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for shipment_id 1.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_order_id cannot be null for shipment_id 1. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting shipment 1: ' || SQLERRM);
    END;


    BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 654321;
        IF v_order_exists > 0 THEN
            INSERT INTO Logistics (shipment_id, delivery_status, estimated_delivery_date, order_order_id)
            VALUES (Logistics_SEQ.NEXTVAL, 'In Transit', TO_DATE('2024-11-06', 'YYYY-MM-DD'), 654321);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_order_id 654321 does not exist. Skipping insertion for shipment_id 2.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate shipment_id found for 2. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for shipment_id 2.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_order_id cannot be null for shipment_id 2. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting shipment 2: ' || SQLERRM);
    END;


    BEGIN
        SELECT COUNT(1) INTO v_order_exists FROM Orders WHERE order_id = 234567;
        IF v_order_exists > 0 THEN
            INSERT INTO Logistics (shipment_id, delivery_status, estimated_delivery_date, order_order_id)
            VALUES (Logistics_SEQ.NEXTVAL, 'Delivered', TO_DATE('2024-11-07', 'YYYY-MM-DD'), 234567);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Order_order_id 234567 does not exist. Skipping insertion for shipment_id 3.');
        END IF;
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate shipment_id found for 3. Skipping insertion.');
        WHEN v_fk_violation THEN
            DBMS_OUTPUT.PUT_LINE('Foreign key constraint violated for shipment_id 3.');
        WHEN v_order_null THEN
            DBMS_OUTPUT.PUT_LINE('Order_order_id cannot be null for shipment_id 3. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred while inserting shipment 3: ' || SQLERRM);
    END;


    -- Repeat for additional shipment records as needed


END;
/
