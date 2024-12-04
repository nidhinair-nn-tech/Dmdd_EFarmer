SET SERVEROUTPUT ON;

-- Sequence for Orders table
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'ORDER_SEQ';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE Order_SEQ';
        DBMS_OUTPUT.PUT_LINE('Sequence "Order_SEQ" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE Order_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('Sequence "Order_SEQ" created successfully.');
END;
/

-- Sequence for Order Items table
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'ORDER_ITEM_SEQ';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE Order_Item_SEQ';
        DBMS_OUTPUT.PUT_LINE('Sequence "Order_Item_SEQ" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE Order_Item_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('Sequence "Order_Item_SEQ" created successfully.');
END;
/

-- Sequence for Payments table
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'PAYMENT_SEQ';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE Payment_SEQ';
        DBMS_OUTPUT.PUT_LINE('Sequence "Payment_SEQ" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE Payment_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('Sequence "Payment_SEQ" created successfully.');
END;
/

-- Sequence for Logistics table
DECLARE
    seq_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO seq_count
    FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME = 'LOGISTICS_SEQ';

    IF seq_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP SEQUENCE Logistics_SEQ';
        DBMS_OUTPUT.PUT_LINE('Sequence "Logistics_SEQ" dropped successfully.');
    END IF;

    EXECUTE IMMEDIATE 'CREATE SEQUENCE Logistics_SEQ START WITH 1 INCREMENT BY 1 NOCACHE';
    DBMS_OUTPUT.PUT_LINE('Sequence "Logistics_SEQ" created successfully.');
END;
/
