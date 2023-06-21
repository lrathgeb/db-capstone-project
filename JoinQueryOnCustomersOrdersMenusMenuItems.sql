SELECT c.CustomerID, c.FullName, o.OrderID, o.TotalCost,
       m.Cuisine, mi.Name AS MenuItem
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Menu m ON o.MenuID = m.MenuID
JOIN MenuItems mi ON o.ItemID = mi.ItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;
