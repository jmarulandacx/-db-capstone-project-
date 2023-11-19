USE LITTLELEMONDB;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    -- Update the booking date for the specified booking ID
    UPDATE Bookings
    SET BookingDate = p_BookingDate
    WHERE BookingID = p_BookingID;

    SELECT CONCAT('Booking ',p_BookingID,' Updated') AS Result;
END //

DELIMITER ;

CALL UpdateBooking(2,'2024-02-23');

-- DROP PROCEDURE UpdateBooking