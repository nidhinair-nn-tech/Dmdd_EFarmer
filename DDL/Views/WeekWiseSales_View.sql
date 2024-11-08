
SET SERVEROUTPUT ON;


DECLARE 
    v_count NUMBER;
BEGIN 
    SELECT COUNT(*) INTO v_count FROM user_views WHERE view_name = 'WEEK_WISE_SELLINGS';
    
    IF v_count > 0 THEN 
        EXECUTE IMMEDIATE 'DROP VIEW WEEK_WISE_SELLINGS';
    END IF;
END;
/


-- Create Week-Wise Sellings View to show total sales per week based on Order date
CREATE VIEW WEEK_WISE_SELLINGS AS 
SELECT TO_CHAR(order_date,'IW') AS week_number,
       SUM(order_amount) AS total_sales 
FROM Orders 
GROUP BY TO_CHAR(order_date,'IW');

