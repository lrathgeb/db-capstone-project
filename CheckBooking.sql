DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNo INT)
BEGIN
    DECLARE isBooked INT;
    
    SELECT COUNT(*) INTO isBooked
    FROM Bookings
    WHERE BookingDate = bookingDate AND TableNo = tableNo;
    
    IF isBooked > 0 THEN
        SELECT CONCAT('Table ', tableNo, ' is already booked on ', bookingDate) AS 'Booking Status';
    ELSE
        SELECT CONCAT('Table ', tableNo, ' is available on ', bookingDate) AS 'Booking Status';
    END IF;
END //

DELIMITER ;