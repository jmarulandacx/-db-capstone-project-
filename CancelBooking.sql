USE LITTLELEMONDB;
DELIMITER //

CREATE PROCEDURE CancelBooking(IN p_BookingID INT)
BEGIN
    DECLARE bookingExists INT;

    -- Check if the booking exists
    SELECT COUNT(*) INTO bookingExists
    FROM Bookings
    WHERE BookingID = p_BookingID;

    -- If the booking exists, proceed with the cancellation
    IF bookingExists > 0 THEN
        -- Delete the booking
        DELETE FROM Bookings
        WHERE BookingID = p_BookingID;

        SELECT CONCAT('Booking ', p_BookingID, ' Cancelled') AS Result;
    ELSE
        SELECT 'Booking Not Found. No Changes Made.' AS Result;
    END IF;
END //

DELIMITER ;

CALL CancelBooking(3);
