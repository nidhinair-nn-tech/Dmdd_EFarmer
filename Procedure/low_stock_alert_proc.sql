CREATE OR REPLACE PROCEDURE low_stock_alert(
    p_product_id IN NUMBER
)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_remaining_stock NUMBER;
BEGIN
    -- Check remaining stock
    SELECT quantity_in_stock
    INTO v_remaining_stock
    FROM Inventory
    WHERE product_id = p_product_id;

    -- Raise low-stock alert if applicable
    IF v_remaining_stock < 10 THEN
        DBMS_OUTPUT.PUT_LINE('Low stock alert for product ID: ' || p_product_id || '. Current stock: ' || v_remaining_stock);
    END IF;

    COMMIT; -- Autonomous transactions require explicit commit
END;
/
