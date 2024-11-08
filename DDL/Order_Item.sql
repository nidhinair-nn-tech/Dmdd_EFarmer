set SERVEROUTPUT on;


DECLARE
    table_exists NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO table_exists
    FROM
        user_tables
    WHERE
        table_name = 'ORDER_ITEM';
        
    IF table_exists = 0 THEN
        EXECUTE IMMEDIATE '
       CREATE TABLE ORDER_ITEM (
    order_item_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    price_per_unit FLOAT NOT NULL,
    quantity INTEGER NOT NULL,
    subtotal FLOAT NOT NULL,
    product_id INTEGER NOT NULL,
    CONSTRAINT order_item_pk PRIMARY KEY (order_item_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT(PRODUCT_ID)
    
        )';
        dbms_output.put_line('ORDER_ITEM table created successfully.');
    ELSE
        dbms_output.put_line('ORDER_ITEM table already exists.');
    END IF;


EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error creating table ORDER_ITEM: ' || sqlerrm);
END;


/

