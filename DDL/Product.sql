SET SERVEROUTPUT ON;

DECLARE
    -- Variable to check if the product table already exists
    table_exists NUMBER;
BEGIN
    -- Check if the product table already exists
    SELECT COUNT(*)
    INTO table_exists
    FROM user_tables
    WHERE table_name = 'PRODUCT';

    -- If product table does not exist, create it
    IF table_exists = 0 THEN
        EXECUTE IMMEDIATE '
        CREATE TABLE PRODUCT (
            product_id           INTEGER NOT NULL,
            product_name         VARCHAR2(100) NOT NULL,
            category             VARCHAR2(50) NOT NULL,
            price_per_quantity   NUMBER(10, 2) CHECK (price_per_quantity > 0),
            unit_of_measure      VARCHAR2(20),
            available_quantity   INTEGER CHECK (available_quantity >= 0),
            status               VARCHAR2(20),
            reorder_threshold    INTEGER,
            farmer_id            INTEGER,
            CONSTRAINT product_pk PRIMARY KEY (product_id),
            CONSTRAINT product_unique_name_category UNIQUE (product_name, category),
            CONSTRAINT fk_farmer FOREIGN KEY (farmer_id) REFERENCES FARMER (farmer_id)
        )';
        
        DBMS_OUTPUT.PUT_LINE('PRODUCT table created successfully.');
    ELSE
        -- If the PRODUCT table already exists, inform the user
        DBMS_OUTPUT.PUT_LINE('PRODUCT table already exists.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating table PRODUCT: ' || SQLERRM);
END;
/


