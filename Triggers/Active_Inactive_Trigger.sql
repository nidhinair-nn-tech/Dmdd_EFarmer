-- Step 1: Drop the trigger if it already exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER UpdateProductStatus';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignore errors if the trigger does not exist
END;
/

-- Step 2: Create the trigger
CREATE OR REPLACE TRIGGER UpdateProductStatus
BEFORE UPDATE ON Product
FOR EACH ROW
BEGIN
    -- Check if available quantity falls below reorder threshold
    IF :NEW.available_quantity < :NEW.reorder_threshold THEN
        :NEW.status := 'INACTIVE';
    ELSE
        :NEW.status := 'ACTIVE'; -- Optional: Reset status if quantity increases above threshold
    END IF;
END;
/
