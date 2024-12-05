CREATE OR REPLACE FUNCTION get_category_wise_inventory_report
RETURN SYS_REFCURSOR
IS
    category_inventory_cursor SYS_REFCURSOR;
BEGIN
    OPEN category_inventory_cursor FOR
        SELECT 
            p.category,
            COUNT(p.product_id) AS total_products,
            SUM(i.quantity_in_stock) AS total_quantity_in_stock
        FROM 
            PRODUCT p
        JOIN 
            INVENTORY i ON p.product_id = i.product_id
        GROUP BY 
            p.category;

    RETURN category_inventory_cursor;
END;
/
