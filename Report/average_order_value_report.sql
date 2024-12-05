SET SERVEROUTPUT ON;

DECLARE
    avg_order_value_cursor SYS_REFCURSOR;
    v_consumer_id NUMBER;
    v_average_order_value NUMBER;
BEGIN
    -- Fetch the average order value report
    avg_order_value_cursor := get_average_order_value_report;

    -- Loop through the fetched records and display them
    LOOP
        FETCH avg_order_value_cursor INTO v_consumer_id, v_average_order_value;
        
        EXIT WHEN avg_order_value_cursor%NOTFOUND;

        -- Display the consumer ID and their average order value
        DBMS_OUTPUT.PUT_LINE(
            'Consumer ID: ' || v_consumer_id || ', ' ||
            'Average Order Value: ' || v_average_order_value
        );
    END LOOP;

    -- Close the cursor
    CLOSE avg_order_value_cursor;
END;
/
