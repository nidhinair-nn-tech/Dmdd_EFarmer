SET SERVEROUTPUT ON;


DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*)
    INTO v_count
    FROM user_views
    WHERE view_name = 'DISCOUNT_ON_PERISHABLE_ITEMS';


    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW DISCOUNT_ON_PERISHABLE_ITEMS';
    END IF;


    -- Recreate the view
    EXECUTE IMMEDIATE '
    CREATE OR REPLACE VIEW DISCOUNT_ON_PERISHABLE_ITEMS AS
    SELECT
        product_id,
        farmer_id,
        product_name,
        category,
        price_per_quantity,
        available_quantity,
        CASE 
            WHEN category = ''Perishable'' THEN price_per_quantity * 0.9  -- 10% discount
            ELSE price_per_quantity  -- No discount for non-perishable items
        END AS discounted_price
    FROM 
        PRODUCT
    WHERE 
        status = ''Active''';
END;
/