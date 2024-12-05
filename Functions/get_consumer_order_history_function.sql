create or replace FUNCTION get_consumer_order_history(p_consumer_id IN NUMBER)
RETURN SYS_REFCURSOR
IS
    order_history_cursor SYS_REFCURSOR;
BEGIN
    OPEN order_history_cursor FOR
        SELECT 
            o.order_id,
            o.order_date,
            o.order_amount,
            o.delivery_date,
            o.order_status
        FROM 
            ORDERS o
        WHERE 
            o.consumer_id = p_consumer_id;

    RETURN order_history_cursor;
END;
