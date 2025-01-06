CREATE PROCEDURE ProductSchema.AddProduct
    @ProductName NVARCHAR(100),
    @CategoryID INT,
    @SupplierID INT,
    @Quantity INT,
    @Price DECIMAL(10,2),
    @ReorderLevel INT
AS
BEGIN
    IF @ProductName IS NULL OR @CategoryID IS NULL OR @SupplierID IS NULL
    BEGIN
        RAISERROR('Product name, category, and supplier are required.', 16, 1);
        RETURN;
    END;

    INSERT INTO ProductSchema.Products (ProductName, CategoryID, SupplierID, Quantity, Price, ReorderLevel)
    VALUES (@ProductName, @CategoryID, @SupplierID, @Quantity, @Price, @ReorderLevel);

    INSERT INTO InventorySchema.StockLevels (ProductID, CurrentStockLevel)
    VALUES (SCOPE_IDENTITY(), @Quantity);

    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('Product Added', NULL, 'New product added: ' + @ProductName);
END;
GO