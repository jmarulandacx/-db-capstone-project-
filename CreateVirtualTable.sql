USE LITTLELEMONDB;

CREATE VIEW  OrdersView  as
SELECT OrderID,Quantity, TotalCost from orders;