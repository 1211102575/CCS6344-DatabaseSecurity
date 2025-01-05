CREATE PROCEDURE OrderSchema.FulfillPurchaseOrder
    @PurchaseOrderID INT,
    @UserID INT
AS
BEGIN
    DECLARE @ProductID INT, @Quantity INT;
    SELECT @ProductID = ProductID, @Quantity = Quantity
    FROM OrderSchema.PurchaseOrders
    WHERE PurchaseOrderID = @PurchaseOrderID;

    UPDATE OrderSchema.PurchaseOrders
    SET Status = 'Received'
    WHERE PurchaseOrderID = @PurchaseOrderID;

    UPDATE InventorySchema.StockLevels
    SET CurrentStockLevel = CurrentStockLevel + @Quantity
    WHERE ProductID = @ProductID;

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Purchase Order Fulfilled', @UserID, 'Purchase order fulfilled: ' + CAST(@PurchaseOrderID AS NVARCHAR));
END;
GO