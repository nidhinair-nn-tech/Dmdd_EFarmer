SET SERVEROUTPUT ON;

DECLARE
    -- Variable to check if the view already exists
    view_exists NUMBER;
BEGIN
    -- Check if the CURRENT_INVENTORY view already exists
    SELECT COUNT(*)
    INTO view_exists
    FROM user_views
    WHERE view_name = 'CURRENT_INVENTORY';

    -- If CURRENT_INVENTORY view exists, drop it
    IF view_exists > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW CURRENT_INVENTORY';
        DBMS_OUTPUT.PUT_LINE('CURRENT_INVENTORY view dropped successfully.');
    END IF;

    -- Create the CURRENT_INVENTORY view
    EXECUTE IMMEDIATE '
        CREATE VIEW CURRENT_INVENTORY AS
        SELECT 
            p.product_id,
            p.product_name,
            p.category,
            p.price_per_quantity,
            i.quantity_in_stock,
            i.last_updated
        FROM 
            PRODUCT p
        JOIN 
            INVENTORY i ON p.product_id = i.product_id
        WHERE 
            i.quantity_in_stock > 0';

    DBMS_OUTPUT.PUT_LINE('CURRENT_INVENTORY view created successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating CURRENT_INVENTORY view: ' || SQLERRM);
END;
/