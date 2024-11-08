SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*)
    INTO v_count
    FROM user_views
    WHERE view_name = 'INACTIVE_PRODUCTS_VIEW';
  
    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW INACTIVE_PRODUCTS_VIEW';
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
        CREATE VIEW INACTIVE_PRODUCTS_VIEW AS
        SELECT 
            product_id,
            product_name,
            category,
            price_per_quantity,
            unit_of_measure,
            available_quantity,
            reorder_threshold
            
        FROM 
            Product
        WHERE 
            Status = ''Inactive''
    ';

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred, please check for any missing dependent values ');
END;
/