DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE max_quantity INT;

    SELECT MAX(Quantity) INTO max_quantity
    FROM Orders;

    SELECT max_quantity AS 'Maximum Ordered Quantity';
END //

DELIMITER ;