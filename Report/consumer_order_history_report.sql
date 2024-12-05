SET SERVEROUTPUT ON;

DECLARE
    order_history_cursor SYS_REFCURSOR;
    v_order_id NUMBER;
    v_order_date DATE;
    v_order_amount NUMBER;
    v_delivery_date DATE;
    v_order_status VARCHAR2(50);
BEGIN
    -- Fetch the order history for consumer ID 1 (replace with the desired consumer ID)
    order_history_cursor := get_consumer_order_history(1);

    -- Loop through the fetched records and display them
    LOOP
        FETCH order_history_cursor INTO v_order_id, v_order_date, v_order_amount, v_delivery_date, v_order_status;
        
        EXIT WHEN order_history_cursor%NOTFOUND;

        -- Display the order details
        DBMS_OUTPUT.PUT_LINE(
            'Order ID: ' || v_order_id || ', ' ||
            'Order Date: ' || v_order_date || ', ' ||
            'Order Amount: ' || v_order_amount || ', ' ||
            'Delivery Date: ' || v_delivery_date || ', ' ||
            'Order Status: ' || v_order_status
        );
    END LOOP;

    -- Close the cursor
    CLOSE order_history_cursor;
END;
/
