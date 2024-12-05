SET SERVEROUTPUT ON;

DECLARE
    category_inventory_cursor SYS_REFCURSOR;
    v_category VARCHAR2(255);
    v_total_products NUMBER;
    v_total_quantity_in_stock NUMBER;
BEGIN
    -- Fetch the category-wise inventory report
    category_inventory_cursor := get_category_wise_inventory_report;

    -- Loop through the fetched records and display them
    LOOP
        FETCH category_inventory_cursor INTO v_category, v_total_products, v_total_quantity_in_stock;
        
        EXIT WHEN category_inventory_cursor%NOTFOUND;

        -- Display the category, total number of products, and total quantity in stock
        DBMS_OUTPUT.PUT_LINE(
            'Category: ' || v_category || ', ' ||
            'Total Products: ' || v_total_products || ', ' ||
            'Total Quantity in Stock: ' || v_total_quantity_in_stock
        );
    END LOOP;

    -- Close the cursor
    CLOSE category_inventory_cursor;
END;
/
