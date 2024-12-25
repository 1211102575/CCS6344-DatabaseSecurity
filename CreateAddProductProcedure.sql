CREATE PROCEDURE AddProduct
@ProductName NVARCHAR(100),
@CategoryID INT,
@SupplierID INT,
@Quantity INT,
@Price DECIMAL(10, 2),
@ReorderLevel INT
WITH EXECUTE AS OWNER
AS
BEGIN
	BEGIN TRY
		IF LEN(@ProductName) = 0 OR @CategoryID <= 0 OR 
		@SupplierID <= 0 OR @Price < 0 OR @ReorderLevel < 0
		BEGIN
			RAISERROR('Invalid input.', 16, 1);
			RETURN;
		END
		INSERT INTO Products (ProductName, CategoryID, SupplierID, Quantity, Price, Reorderlevel)
		VALUES (@ProductName, @CategoryID, @SupplierID, @Quantity, @Price, @ReorderLevel);

		INSERT INTO ActionLogs (Action, ActionUser, Details)
		VALUES ('AddProduct', ORIGINAL_LOGIN(),
				CONCAT('ProductName: ', @ProductName,
					   ', CategoryID: ', @CategoryID,
					   ', SupplierID: ', @SupplierID,
					   ', Quantity: ', @Quantity,
					   ', Price: ', @Price,
					   ', ReorderLevel: ', @ReorderLevel));
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
		SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END;
GO
