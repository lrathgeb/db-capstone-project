DELIMITER //

CREATE PROCEDURE CancelBooking(
    IN bookingID INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = bookingID;
    
    SELECT CONCAT('Booking ', bookingID, ' cancelled successfully.') AS 'Confirmation';
END //

DELIMITER ;