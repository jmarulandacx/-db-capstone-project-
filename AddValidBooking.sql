USE LITTLELEMONDB;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN p_BookingDate DATE,IN p_TableNumber INT)
BEGIN
    DECLARE isTableAlreadyBooked BOOLEAN DEFAULT FALSE;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked
    SELECT TRUE INTO isTableAlreadyBooked
    FROM Bookings
    WHERE TableNumber = p_TableNumber AND BookingDate = p_BookingDate
    LIMIT 1;

    -- If the table is not already booked, proceed with the reservation
    IF NOT isTableAlreadyBooked THEN
        -- Insert the new booking
        INSERT INTO Bookings (BookingDate, TableNumber,ClientID,BookingID)
        VALUES (p_BookingDate, p_TableNumber,1,RAND()*1000);

        -- Commit the transaction if everything is successful
        COMMIT;
        SELECT 'Booking Added Successfully' AS BookingStatus;
    ELSE
        -- Rollback the transaction if the table is already booked
        ROLLBACK;
        SELECT concat('Table ',p_TableNumber,'Is Already Booked-Booking Cancelled') AS BookingStatus;
    END IF;
END //

DELIMITER ;

CALL AddValidBooking('2023-01-06',6);

-- DROP PROCEDURE AddValidBooking;


