CREATE TRIGGER trg_UpdateReorderLevel
ON ProductSchema.Products
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ProductID INT, @Quantity INT;
    DECLARE cursor_Reorder CURSOR FOR 
    SELECT ProductID, Quantity 
    FROM inserted;

    OPEN cursor_Reorder;
    FETCH NEXT FROM cursor_Reorder INTO @ProductID, @Quantity;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @Quantity < 20
        BEGIN
            UPDATE ProductSchema.Products
            SET ReorderLevel = 1
            WHERE ProductID = @ProductID;
        END
        ELSE
        BEGIN
            UPDATE ProductSchema.Products
            SET ReorderLevel = 0
            WHERE ProductID = @ProductID;
        END
        FETCH NEXT FROM cursor_Reorder INTO @ProductID, @Quantity;
    END
    CLOSE cursor_Reorder;
    DEALLOCATE cursor_Reorder;
END;
GO