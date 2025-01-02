CREATE PROCEDURE InventorySchema.ProcessTransaction
    @ProductID INT,
    @Quantity INT,
    @TransactionType NVARCHAR(50),
    @UserID INT,
    @Price DECIMAL(10,2),
    @SupplierID INT = NULL,
    @CustomerID INT = NULL
WITH EXECUTE AS OWNER
AS
BEGIN
    BEGIN TRY
        IF @TransactionType NOT IN ('Purchase', 'Sale')
        BEGIN
            RAISERROR('Invalid Transaction Type.', 16, 1);
            RETURN;
        END
        INSERT INTO InventorySchema.InventoryTransactions (ProductID, Quantity, TransactionType, UserID, Price, SupplierID, CustomerID)
        VALUES (@ProductID, @Quantity, @TransactionType, @UserID, @Price, @SupplierID, @CustomerID);
        IF @TransactionType = 'Purchase'
        BEGIN
            UPDATE ProductSchema.Products
            SET Quantity = Quantity + @Quantity
            WHERE ProductID = @ProductID;

            UPDATE InventorySchema.StockLevels
            SET CurrentStockLevel = CurrentStockLevel + @Quantity
            WHERE ProductID = @ProductID;
        END
        ELSE IF @TransactionType = 'Sale'
        BEGIN
            UPDATE ProductSchema.Products
            SET Quantity = Quantity - @Quantity
            WHERE ProductID = @ProductID;

            UPDATE InventorySchema.StockLevels
            SET CurrentStockLevel = CurrentStockLevel - @Quantity
            WHERE ProductID = @ProductID;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;