DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN bookingID INT,
    IN newBookingDate DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = newBookingDate
    WHERE BookingID = bookingID;
    
    SELECT CONCAT('Booking ', bookingID, ' updated successfully.') AS 'Confirmation';
END //

DELIMITER ;