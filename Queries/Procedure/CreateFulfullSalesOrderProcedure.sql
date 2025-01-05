CREATE PROCEDURE OrderSchema.FulfillSalesOrder
    @SalesOrderID INT,
    @UserID INT
AS
BEGIN
    DECLARE @ProductID INT, @Quantity INT;
    SELECT @ProductID = ProductID, @Quantity = Quantity
    FROM OrderSchema.SalesOrders
    WHERE SalesOrderID = @SalesOrderID;

    UPDATE OrderSchema.SalesOrders
    SET Status = 'Completed'
    WHERE SalesOrderID = @SalesOrderID;

    UPDATE InventorySchema.StockLevels
    SET CurrentStockLevel = CurrentStockLevel - @Quantity
    WHERE ProductID = @ProductID;

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Sales Order Fulfilled', @UserID, 'Sales order fulfilled: ' + CAST(@SalesOrderID AS NVARCHAR));
END;
GO