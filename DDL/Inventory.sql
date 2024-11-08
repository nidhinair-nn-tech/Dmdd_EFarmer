---Inventory Table -----
SET SERVEROUTPUT ON;
DECLARE
 
    -- Variable to store the count of existing Inventory table
 
    inventory_exists NUMBER;
 
BEGIN
 
    -- Check if the Inventory table already exists
 
    SELECT COUNT(*) INTO inventory_exists
 
    FROM user_tables
 
    WHERE table_name = 'INVENTORY';
    -- If Inventory table does not exist, create it
 
    IF inventory_exists = 0 THEN
 
        EXECUTE IMMEDIATE '
 
        CREATE TABLE Inventory (
 
            Inventory_id       INTEGER NOT NULL,
 
            Product_id         INTEGER NOT NULL,
 
            Quantity_in_stock  INTEGER DEFAULT 0,
 
            Last_updated       TIMESTAMP,
 
            CONSTRAINT inventory_pk PRIMARY KEY (Inventory_id),
 
            CONSTRAINT fk_inventory_product FOREIGN KEY (Product_id) REFERENCES Product (Product_id) ON DELETE CASCADE
 
        )';
 
        DBMS_OUTPUT.PUT_LINE('Inventory table created successfully.');
 
    ELSE
 
        -- If Inventory table already exists, inform the user
 
        DBMS_OUTPUT.PUT_LINE('Inventory table already exists.');
 
    END IF;
-- Exception handling block to catch any errors during table creation
 
EXCEPTION
 
    WHEN OTHERS THEN
 
        DBMS_OUTPUT.PUT_LINE('Error creating table Inventory. ');
 
END;
 
/
-- Add constraint to ensure Quantity_in_stock is non-negative
 
BEGIN
 
    EXECUTE IMMEDIATE 'ALTER TABLE Inventory ADD CONSTRAINT chk_quantity_in_stock CHECK (Quantity_in_stock >= 0)';
 
    DBMS_OUTPUT.PUT_LINE('Check constraint on Quantity_in_stock added successfully.');
 
EXCEPTION
 
    WHEN OTHERS THEN
 
        DBMS_OUTPUT.PUT_LINE('Check constraint on Quantity_in_stock already exists');
 
END;
 
/