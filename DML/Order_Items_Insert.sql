SET serveroutput ON;


DECLARE
    v_constraint_violation EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_constraint_violation, -1);
BEGIN
    -- Insert data into the Order_details table
    BEGIN
        INSERT INTO ORDER_ITEM (order_item_id,order_id,price_per_unit, quantity,subtotal, product_id)
        VALUES (1,123456, 1.5,5,7.5,101);
    EXCEPTION
        WHEN v_constraint_violation THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;


    BEGIN
        INSERT INTO ORDER_ITEM (order_item_id,order_id,price_per_unit, quantity,subtotal, product_id)
        VALUES (2, 654321, 1.8,10, 18, 102);
    EXCEPTION
        WHEN v_constraint_violation THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    BEGIN
        INSERT INTO ORDER_ITEM (order_item_id,order_id,price_per_unit, quantity,subtotal, product_id)
        VALUES (3, 987654, 8.75, 3,26.25,103);
    EXCEPTION
        WHEN v_constraint_violation THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    BEGIN
        INSERT INTO ORDER_ITEM (order_item_id,order_id,price_per_unit, quantity,subtotal, product_id)
        VALUES (4, 234567, 3, 3,6, 104);
    EXCEPTION
        WHEN v_constraint_violation THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    BEGIN
        INSERT INTO ORDER_ITEM (order_item_id,order_id,price_per_unit, quantity,subtotal, product_id)
        VALUES (5, 324511, 5.5, 5, 27.5,105);
    EXCEPTION
        WHEN v_constraint_violation THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate order_id found. Skipping insertion.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    END;
    
    -- Commit the transaction
    COMMIT;
END;
/
