CREATE OR REPLACE FUNCTION get_average_order_value_report
RETURN SYS_REFCURSOR
IS
    avg_order_value_cursor SYS_REFCURSOR;
BEGIN
    OPEN avg_order_value_cursor FOR
        SELECT 
            o.consumer_id,
            AVG(o.order_amount) AS average_order_value
        FROM 
            ORDERS o
        GROUP BY 
            o.consumer_id
        ORDER BY 
            average_order_value DESC;

    RETURN avg_order_value_cursor;
END;
/
