SET SERVEROUTPUT ON;

DECLARE
    failed_payment_cursor SYS_REFCURSOR;
    v_consumer_id NUMBER;
    v_consumer_name VARCHAR2(100);
    v_email VARCHAR2(100);
    v_failed_payment_count NUMBER;
BEGIN
    -- Fetch the failed payment report
    failed_payment_cursor := get_failed_payment_consumer_report;

    -- Loop through the fetched records and display them
    LOOP
        FETCH failed_payment_cursor 
        INTO v_consumer_id, v_consumer_name, v_email, v_failed_payment_count;

        EXIT WHEN failed_payment_cursor%NOTFOUND;

        -- Display consumer details and failed payment count
        DBMS_OUTPUT.PUT_LINE(
            'Consumer ID: ' || v_consumer_id || ', ' ||
            'Name: ' || v_consumer_name || ', ' ||
            'Email: ' || v_email || ', ' ||
            'Failed Payment Count: ' || v_failed_payment_count
        );
    END LOOP;

    -- Close the cursor
    CLOSE failed_payment_cursor;
END;
/
