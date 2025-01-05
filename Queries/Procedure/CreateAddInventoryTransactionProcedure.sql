CREATE PROCEDURE InventorySchema.AddInventoryTransaction
    @ProductID INT,
    @Quantity INT,
    @TransactionType NVARCHAR(50),
    @UserID INT,
    @Price DECIMAL(10,2)
AS
BEGIN
    IF @ProductID IS NULL OR @Quantity = 0 OR @TransactionType IS NULL
    BEGIN
        RAISERROR('Product, quantity, and transaction type are required.', 16, 1);
        RETURN;
    END;

    INSERT INTO InventorySchema.InventoryTransactions (ProductID, Quantity, TransactionType, UserID, Price)
    VALUES (@ProductID, @Quantity, @TransactionType, @UserID, @Price);

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Inventory Transaction Added', @UserID, 'New transaction added for ProductID ' + CAST(@ProductID AS NVARCHAR));
END;
GO