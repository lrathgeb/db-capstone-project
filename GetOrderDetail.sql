DELIMITER //

CREATE PROCEDURE GetOrderDetail(IN customerID INT)
BEGIN
    PREPARE stmt FROM 'SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = ?';
    SET @custID = customerID;
    EXECUTE stmt USING @custID;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;