DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNo INT)
BEGIN
    DECLARE isBooked INT;
    
    START TRANSACTION;
    
    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNo = tableNo;
    
    IF isBooked > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', tableNo, ' is already booked on ', bookingDate) AS 'Booking Status';
    ELSE
        INSERT INTO Bookings (BookingDate, TableNo)
        VALUES (bookingDate, tableNo);
        COMMIT;
        SELECT CONCAT('Table ', tableNo, ' has been successfully booked on ', bookingDate) AS 'Booking Status';
    END IF;
END //

DELIMITER ;