CREATE OR REPLACE PROCEDURE process_payment (
    p_payment_method IN VARCHAR2,
    p_order_id IN NUMBER,
    p_payment_status IN VARCHAR2
)
IS
BEGIN
    -- Insert payment record
    INSERT INTO Payments (payment_id, payment_method, order_order_id, payment_status, transaction_date)
    VALUES (Payment_SEQ.NEXTVAL, p_payment_method, p_order_id, p_payment_status, SYSDATE);
    
    -- Commit the insert operation
    COMMIT;

    IF p_payment_status = 'Failed' THEN
        -- Update order status to 'Failed'
        UPDATE Orders
        SET order_status = 'Failed'
        WHERE order_id = p_order_id;

        -- Commit the update operation
        COMMIT;

        -- Raise an error indicating payment failure
        RAISE_APPLICATION_ERROR(-20003, 'Payment failed. Order cannot be processed.');
    ELSE
        -- Update order status to 'Completed'
        UPDATE Orders
        SET order_status = 'Completed'
        WHERE order_id = p_order_id;

        -- Commit the update operation
        COMMIT;

        -- Log a success message
        DBMS_OUTPUT.PUT_LINE('Payment successful. Order processed.');
    END IF;
END;
/
GRANT EXECUTE ON process_payment TO consumer;