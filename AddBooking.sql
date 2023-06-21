DELIMITER //

CREATE PROCEDURE AddBooking(
    IN bookingID INT,
    IN customerID INT,
    IN bookingDate DATE,
    IN tableNo INT
)
BEGIN
    INSERT INTO Bookings (BookingID, BookingDate, CustomerID, TableNo)
    VALUES (bookingID, bookingDate, customerID, tableNo);
    
    SELECT CONCAT('Booking ', bookingID, ' added successfully.') AS 'Status';
END //

DELIMITER ;