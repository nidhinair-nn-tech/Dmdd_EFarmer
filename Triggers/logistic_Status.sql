-----Logistic Status Trigger----

CREATE TRIGGER UpdateDeliveryStatus
BEFORE UPDATE ON Logistics
FOR EACH ROW
BEGIN
    -- Check if the current date is greater than the estimated delivery date
    IF CURDATE() > NEW.estimated_delivery_date THEN
        SET NEW.delivery_status = 'Delivered';
    END IF;
END
