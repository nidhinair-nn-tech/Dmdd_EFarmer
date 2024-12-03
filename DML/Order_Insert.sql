SET SERVEROUTPUT ON;
 
DECLARE
    v_constraint_violation_pk EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_constraint_violation_pk, -1); -- Primary key violation error code
    
    v_consumer_null EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_consumer_null, -1400); -- ORA-01400: cannot insert NULL error code


BEGIN
    -- Inserting data into the ORDERS table
    BEGIN
        INSERT INTO ORDERS (order_id, order_date, order_amount, delivery_date, order_status,consumer_id)
        VALUES (123456, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 100.00,TO_DATE('2024-03-25', 'YYYY-MM-DD'),'Pending',1);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN v_consumer_null THEN
            DBMS_OUTPUT.PUT_LINE('Consumer_id cannot be null. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;


    BEGIN
        INSERT INTO ORDERS (order_id, order_date, order_amount, delivery_date, order_status,consumer_id)
        VALUES (654321, TO_DATE('2024-03-16', 'YYYY-MM-DD'), 150.50,TO_DATE('2024-03-26', 'YYYY-MM-DD'), 'Completed',2);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN v_consumer_null THEN
            DBMS_OUTPUT.PUT_LINE('Consumer_id cannot be null. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    BEGIN
        INSERT INTO ORDERS (order_id, order_date, order_amount, delivery_date, order_status,consumer_id)
        VALUES (234567, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 75.25, TO_DATE('2024-03-27', 'YYYY-MM-DD'), 'Pending',3);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN v_consumer_null THEN
            DBMS_OUTPUT.PUT_LINE('Consumer_id cannot be null. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
     BEGIN
       INSERT INTO ORDERS (order_id, order_date, order_amount, delivery_date, order_status,consumer_id)
        VALUES (324511, TO_DATE('2024-03-18', 'YYYY-MM-DD'), 200.00,TO_DATE('2024-03-28', 'YYYY-MM-DD'), 'Processing',4);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN v_consumer_null THEN
            DBMS_OUTPUT.PUT_LINE('Consumer_id cannot be null. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    BEGIN
       INSERT INTO ORDERS (order_id, order_date, order_amount, delivery_date, order_status,consumer_id)
        VALUES (987654, TO_DATE('2024-03-19', 'YYYY-MM-DD'), 50.75, TO_DATE('2024-03-29', 'YYYY-MM-DD'), 'Completed',5);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN v_consumer_null THEN
            DBMS_OUTPUT.PUT_LINE('Consumer_id cannot be null. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
END;
/
