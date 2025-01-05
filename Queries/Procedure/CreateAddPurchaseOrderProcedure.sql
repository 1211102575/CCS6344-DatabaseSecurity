CREATE PROCEDURE OrderSchema.AddPurchaseOrder
    @SupplierID INT,
    @ProductID INT,
    @OrderDate DATETIME,
    @Quantity INT,
    @TotalAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    IF @SupplierID IS NULL OR @ProductID IS NULL OR @Quantity <= 0
    BEGIN
        RAISERROR('Supplier, product, and quantity are required.', 16, 1);
        RETURN;
    END;

    INSERT INTO OrderSchema.PurchaseOrders (SupplierID, ProductID, OrderDate, Quantity, TotalAmount, Status)
    VALUES (@SupplierID, @ProductID, @OrderDate, @Quantity, @TotalAmount, 'Pending');

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Purchase Order Added', @UserID, 'New purchase order added for ProductID ' + CAST(@ProductID AS NVARCHAR));
END;
GO