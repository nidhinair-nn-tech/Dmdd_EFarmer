BEGIN
    -- Dropping user farmer if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER farmer CASCADE';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -01918 THEN -- Ignore "user does not exist" error
                RAISE;
            END IF;
    END;


    -- Creating user farmer
    EXECUTE IMMEDIATE 'CREATE USER farmer IDENTIFIED BY Agriculture234';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO farmer';


    -- Grant specific privileges to farmer
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON Product TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Orders TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Order_Item TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Inventory TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Logistics TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON discount_on_perishable_items TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON TOP_SELLING_PRODUCTS TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON WEEK_WISE_SELLINGS TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON INACTIVE_PRODUCTS_VIEW TO farmer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON CURRENT_INVENTORY TO farmer';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON add_product_proc TO farmer';




    -- Dropping user consumer if it exists
    BEGIN
        EXECUTE IMMEDIATE 'DROP USER consumer CASCADE';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -01918 THEN -- Ignore "user does not exist" error
                RAISE;
            END IF;
    END;


    -- Creating user consumer
    EXECUTE IMMEDIATE 'CREATE USER consumer IDENTIFIED BY Custagriculture123';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO consumer';


    -- Grant specific privileges to consumer
    EXECUTE IMMEDIATE 'GRANT SELECT ON Product TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Orders TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Order_Item TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Payments TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON Logistics TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON discount_on_perishable_items TO consumer';
    EXECUTE IMMEDIATE 'GRANT SELECT ON CONSUMER_PRODUCTS_VIEW TO consumer';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON process_order_proc TO consumer';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON payment_proc TO consumer';

    DBMS_OUTPUT.PUT_LINE('Users created and privileges granted successfully.');
END;


  -- Creating user logistic_partner
    EXECUTE IMMEDIATE 'CREATE USER logistic_partner IDENTIFIED BY logisticagriculture123';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO logistic_partner';


    -- Grant specific privileges to consumer
    EXECUTE IMMEDIATE 'GRANT SELECT ON Logistics TO logistic_partner';
    EXECUTE IMMEDIATE 'GRANT SELECT ON PendingDeliveries_View TO logistic_partner';
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON update_logistics_proc TO logistic_partner';


    DBMS_OUTPUT.PUT_LINE('Users created and privileges granted successfully.');
END;
/
