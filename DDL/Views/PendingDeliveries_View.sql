SET SERVEROUTPUT ON;

DECLARE
    v_count NUMBER;
BEGIN
    -- Check if the view exists
    SELECT COUNT(*)
    INTO v_count
    FROM user_views
    WHERE view_name = 'PENDINGDELIVERIES_VIEW';

    -- Drop the view if it exists
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP VIEW PENDINGDELIVERIES_VIEW';
        DBMS_OUTPUT.PUT_LINE('PENDINGDELIVERIES_VIEW dropped successfully.');
    END IF;

    -- Recreate the view
    EXECUTE IMMEDIATE '
        CREATE VIEW PENDINGDELIVERIES_VIEW AS
        SELECT *
        FROM Logistics
        WHERE delivery_status = ''Pending''
    ';

    DBMS_OUTPUT.PUT_LINE('PENDINGDELIVERIES_VIEW created successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error creating PENDINGDELIVERIES_VIEW: ' || SQLERRM);
END;
/