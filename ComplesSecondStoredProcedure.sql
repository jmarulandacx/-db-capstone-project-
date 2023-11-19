USE LITTLELEMONDB;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DECLARE orderExists INT;

    -- Check if the order exists
    SELECT COUNT(*) INTO orderExists
    FROM Orders
    WHERE OrderID = orderId;

    -- If the order exists, cancel it; otherwise, display a message
    IF orderExists > 0 THEN
        DELETE FROM Orders
        WHERE OrderID = orderId;
        SELECT CONCAT('ORDER ', orderId, ' IS CANCELLED') AS Confirmation;
    ELSE
        SELECT 'ORDER NOT FOUND' AS Confirmation;
    END IF;
END //

DELIMITER ;

CALL CancelOrder(1);
