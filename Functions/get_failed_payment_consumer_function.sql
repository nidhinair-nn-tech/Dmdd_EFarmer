CREATE OR REPLACE FUNCTION get_failed_payment_consumer_report
RETURN SYS_REFCURSOR
IS
    failed_payment_cursor SYS_REFCURSOR;
BEGIN
    OPEN failed_payment_cursor FOR
        SELECT 
            c.consumer_id,
            c.first_name,
            c.email,
            COUNT(p.payment_id) AS failed_payment_count
        FROM 
            CONSUMER c
        JOIN 
            ORDERS o ON c.consumer_id = o.consumer_id
        JOIN 
            PAYMENTS p ON o.order_id = p.order_order_id
        WHERE 
            p.payment_status = 'Failed'
        GROUP BY 
            c.consumer_id, c.first_name, c.email
        ORDER BY 
            failed_payment_count DESC;

    RETURN failed_payment_cursor;
END;
/
