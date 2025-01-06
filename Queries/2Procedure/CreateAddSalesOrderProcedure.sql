CREATE PROCEDURE OrderSchema.AddSalesOrder
    @CustomerID INT,
    @ProductID INT,
    @OrderDate DATETIME,
    @Quantity INT,
    @Price DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    IF @CustomerID IS NULL OR @ProductID IS NULL OR @Quantity <= 0
    BEGIN
        RAISERROR('Customer, product, and quantity are required.', 16, 1);
        RETURN;
    END;

    INSERT INTO OrderSchema.SalesOrders (CustomerID, ProductID, OrderDate, Quantity, Price, Status)
    VALUES (@CustomerID, @ProductID, @OrderDate, @Quantity, @Price, 'Pending');

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Sales Order Added', @UserID, 'New sales order added for ProductID ' + CAST(@ProductID AS NVARCHAR));
END;
GO