CREATE OR REPLACE PROCEDURE update_logistics (
    p_order_id IN NUMBER,
    p_estimated_days IN NUMBER
)
IS
    v_shipment_id NUMBER;
    v_estimated_delivery_date DATE;
    v_order_status VARCHAR2(20);
BEGIN
    -- Check if the order is marked as 'Paid'
    SELECT order_status
    INTO v_order_status
    FROM Orders
    WHERE order_id = p_order_id;

    IF v_order_status != 'Completed' THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot update logistics for an unpaid order.');
    END IF;

    -- Calculate estimated delivery date
    v_estimated_delivery_date := SYSDATE + p_estimated_days;

    -- Insert into Logistics table
    INSERT INTO Logistics (shipment_id, delivery_status, estimated_delivery_date, order_order_id)
    VALUES (Logistics_SEQ.NEXTVAL, 'Pending', v_estimated_delivery_date, p_order_id);

    DBMS_OUTPUT.PUT_LINE('Logistics record created successfully for Order ID: ' || p_order_id);
END;
/
GRANT EXECUTE ON update_logistics TO logistic_partner;