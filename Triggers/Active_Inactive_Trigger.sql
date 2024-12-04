----Active Inactive Trigger------

CREATE TRIGGER UpdateProductStatus
BEFORE UPDATE ON Product
FOR EACH ROW
BEGIN
    -- Check if available quantity falls below reorder threshold
    IF NEW.available_quantity < NEW.reorder_threshold THEN
        SET NEW.status = 'INACTIVE';
    ELSE
        SET NEW.status = 'ACTIVE'; -- Optional: Reset status if quantity increases above threshold
    END IF;
END

