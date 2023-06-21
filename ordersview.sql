CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `little_lemon_dev`@`%` 
    SQL SECURITY DEFINER
VIEW `mydb`.`ordersview` AS
    SELECT 
        `mydb`.`orders`.`OrderID` AS `OrderID`,
        `mydb`.`orders`.`Quantity` AS `Quantity`,
        `mydb`.`orders`.`TotalCost` AS `TotalCost`
    FROM
        `mydb`.`orders`
    WHERE
        (`mydb`.`orders`.`Quantity` > 2)