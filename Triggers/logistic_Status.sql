-- Step 1: Drop the trigger if it already exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TRIGGER UpdateDeliveryStatus';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignore errors if the trigger does not exist
END;
/

-- Step 2: Create the trigger
CREATE OR REPLACE TRIGGER UpdateDeliveryStatus
BEFORE UPDATE ON Logistics
FOR EACH ROW
BEGIN
    -- Check if the current date is greater than the estimated delivery date
    IF SYSDATE > :NEW.estimated_delivery_date THEN
        :NEW.delivery_status := 'Delivered';
    END IF;
END;
/