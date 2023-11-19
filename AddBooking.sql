USE LITTLELEMONDB;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Insert the new booking
    INSERT INTO Bookings (BookingID, ClientID, BookingDate, TableNumber)
    VALUES (p_BookingID, p_CustomerID, p_BookingDate, p_TableNumber);
    
    SELECT 'New Booking Added' AS Result;
END //

DELIMITER ;

CALL AddBooking(25,2,'2023-11-11',8);

-- drop procedure AddBooking;