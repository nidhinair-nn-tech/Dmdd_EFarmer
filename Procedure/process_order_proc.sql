CREATE OR REPLACE PROCEDURE process_order(
    p_consumer_id IN NUMBER,
    p_product_id IN NUMBER,
    p_quantity IN NUMBER
)
IS
    v_available_quantity NUMBER;
    v_total_price NUMBER;
    v_order_id NUMBER;
    v_price_per_unit NUMBER;
BEGIN
    -- Check product stock and price
    SELECT quantity_in_stock, price_per_quantity
    INTO v_available_quantity, v_price_per_unit
    FROM Inventory i
    JOIN Product p ON i.product_id = p.product_id
    WHERE i.product_id = p_product_id;

    IF v_available_quantity < p_quantity THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient stock for the order.');
    END IF;

    -- Calculate total price
    v_total_price := v_price_per_unit * p_quantity;

    IF v_total_price < 10 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Order total value must be greater than $10.');
    END IF;

    -- Insert into Orders
    INSERT INTO Orders (order_id,order_date, order_amount, order_status, consumer_id)
    VALUES (Order_SEQ.NEXTVAL,SYSDATE, v_total_price, 'Pending', p_consumer_id)
    RETURNING order_id INTO v_order_id;

    -- Insert into Order_Items
    INSERT INTO Order_Item (order_item_id, order_id, product_id, price_per_unit, quantity, subtotal)
    VALUES (Order_Item_SEQ.NEXTVAL, v_order_id, p_product_id, v_price_per_unit, p_quantity, v_total_price);
    
    -- Deduct stock in Product
    UPDATE Product
    SET Available_quantity = Available_quantity - p_quantity
    WHERE product_id = p_product_id;

    
    -- Deduct stock in Inventory
    UPDATE Inventory
    SET quantity_in_stock = quantity_in_stock - p_quantity
    WHERE product_id = p_product_id;
    COMMIT;

    -- Call low-stock alert as an autonomous transaction
    low_stock_alert(p_product_id);

    -- Mark the order as processed
    UPDATE Orders
    SET order_status = 'Processed'
    WHERE order_id = v_order_id;

    DBMS_OUTPUT.PUT_LINE('Order successfully placed. Order ID: ' || v_order_id);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error while processing order: ' || SQLERRM);
        ROLLBACK; -- Ensure atomicity
END;
/
GRANT EXECUTE ON process_order TO consumer;