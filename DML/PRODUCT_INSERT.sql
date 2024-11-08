SET SERVEROUTPUT ON;

DECLARE
    -- Define exceptions for constraint violations
    v_constraint_violation_pk EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_constraint_violation_pk, -1); -- Primary key violation error code
    
    v_constraint_violation_unique EXCEPTION;
    PRAGMA EXCEPTION_INIT(v_constraint_violation_unique, -2299); -- Unique constraint violation error code

BEGIN
    -- Insert sample data into PRODUCT table
    BEGIN
        INSERT INTO PRODUCT (product_id, farmer_id, product_name, category, price_per_quantity, unit_of_measure, available_quantity, status, reorder_threshold)
        VALUES (101, 1, 'Carrots', 'Vegetables', 1.50, 'kg', 50, 'Available', 10);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_id found. Skipping insertion.');
        WHEN v_constraint_violation_unique THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_name within the same category. Skipping insertion.');
    END;

    BEGIN
        INSERT INTO PRODUCT (product_id, farmer_id, product_name, category, price_per_quantity, unit_of_measure, available_quantity, status, reorder_threshold)
        VALUES (102, 2, 'Tomatoes', 'Vegetables', 2.00, 'kg', 80, 'Available', 20);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_id found. Skipping insertion.');
        WHEN v_constraint_violation_unique THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_name within the same category. Skipping insertion.');
    END;

    BEGIN
        INSERT INTO PRODUCT (product_id, farmer_id, product_name, category, price_per_quantity, unit_of_measure, available_quantity, status, reorder_threshold)
        VALUES (103, 1, 'Milk', 'Dairy', 1.20, 'liter', 100, 'Available', 30);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_id found. Skipping insertion.');
        WHEN v_constraint_violation_unique THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_name within the same category. Skipping insertion.');
    END;

    BEGIN
        INSERT INTO PRODUCT (product_id, farmer_id, product_name, category, price_per_quantity, unit_of_measure, available_quantity, status, reorder_threshold)
        VALUES (104, 2, 'Cheese', 'Dairy', 3.50, 'kg', 25, 'Available', 5);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_id found. Skipping insertion.');
        WHEN v_constraint_violation_unique THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_name within the same category. Skipping insertion.');
    END;

    BEGIN
        INSERT INTO PRODUCT (product_id, farmer_id, product_name, category, price_per_quantity, unit_of_measure, available_quantity, status, reorder_threshold)
        VALUES (105, 1, 'Apples', 'Fruit', 2.50, 'kg', 60, 'Available', 15);
    EXCEPTION
        WHEN v_constraint_violation_pk THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_id found. Skipping insertion.');
        WHEN v_constraint_violation_unique THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate product_name within the same category. Skipping insertion.');
    END;

    -- Commit the transaction to save all changes
    COMMIT;
END;
/