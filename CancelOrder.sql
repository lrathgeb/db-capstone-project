DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderID INT)
BEGIN
    DECLARE confirmationMsg VARCHAR(255);
    
    DELETE FROM Orders WHERE OrderID = orderID;
    
    IF ROW_COUNT() > 0 THEN
        SET confirmationMsg = CONCAT('Order ', orderID, ' was cancelled.');
    ELSE
        SET confirmationMsg = CONCAT('Order ', orderID, ' does not exist.');
    END IF;
    
    SELECT confirmationMsg AS 'Confirmation';
END //

DELIMITER ;