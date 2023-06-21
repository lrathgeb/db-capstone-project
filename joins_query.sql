SELECT c.CustomerID, c.FullName, o.OrderID, o.TotalCost, m.MenuName, mi.CourseName, mi.StarterName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Menu m ON o.MenuID = m.MenuID
JOIN MenuItems mi ON m.MenuItemsID = mi.MenuItemsID
WHERE o.TotalCost > 150;