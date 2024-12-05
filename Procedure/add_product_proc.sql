CREATE OR REPLACE PROCEDURE add_product (
    p_product_id IN NUMBER,
    p_product_name IN VARCHAR2,
    p_category IN VARCHAR2,
    p_quantity_in_stock IN NUMBER,
    p_price_per_unit IN NUMBER,
    p_status IN VARCHAR2,
    p_unit_of_measure IN VARCHAR2,
    p_reorder_level IN NUMBER,
    p_farmer_id IN NUMBER,
    p_inventory_id IN NUMBER
)
IS
BEGIN
    -- Disable parallel operations for this session
    --ALTER SESSION DISABLE PARALLEL DML;

    -- Insert into Product table
    INSERT INTO Product (
        product_id, 
        product_name, 
        category, 
        price_per_quantity, 
        unit_of_measure, 
        available_quantity,
        reorder_threshold, 
        status, 
        farmer_id
    ) 
    VALUES (
        p_product_id, 
        p_product_name, 
        p_category, 
        p_price_per_unit, 
        p_unit_of_measure, 
        p_quantity_in_stock,
        p_reorder_level, 
        p_status, 
        p_farmer_id
    );

    -- Insert into Inventory table
    INSERT INTO Inventory (
        inventory_id,
        product_id, 
        quantity_in_stock, 
        last_updated
    ) 
    VALUES (
        p_inventory_id,
        p_product_id, 
        p_quantity_in_stock, 
        SYSDATE
    );

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Product added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error adding product: ' || SQLERRM);
END;
/
GRANT EXECUTE ON add_product TO farmer;
