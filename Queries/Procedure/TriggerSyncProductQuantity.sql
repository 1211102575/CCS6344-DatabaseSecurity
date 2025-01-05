CREATE TRIGGER InventorySchema.SyncProductQuantity
ON InventorySchema.StockLevels
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE p
    SET p.Quantity = s.CurrentStockLevel
    FROM ProductSchema.Products p
    JOIN InventorySchema.StockLevels s ON p.ProductID = s.ProductID;
END;
GO