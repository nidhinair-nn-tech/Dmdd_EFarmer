SET SERVEROUTPUT ON;

DECLARE 
    v_count NUMBER;
BEGIN 
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'TOP_SELLING_PRODUCTS';
    
    IF v_count > 0 THEN 
        EXECUTE IMMEDIATE 'DROP VIEW TOP_SELLING_PRODUCTS';
    END IF;
END;
/


-- Create Top Selling Products View based on total quantity sold in Order Items
CREATE VIEW TOP_SELLING_PRODUCTS AS 
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold 
FROM Product p 
JOIN Order_item oi ON p.product_id = oi.product_id 
GROUP BY p.product_name 
ORDER BY total_quantity_sold DESC;


-- Test query to check the view output:
-- SELECT * FROM TOP_SELLING_PRODUCTS;

