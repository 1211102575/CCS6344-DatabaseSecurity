CREATE VIEW TotalCounts AS
SELECT
    (SELECT COUNT(*) FROM UserSchema.Users) AS TotalUsers,
	(SELECT 
	    (SELECT COUNT(*) FROM OrderSchema.SalesOrders WHERE Status = 'Pending')
		+
		(SELECT COUNT(*) FROM OrderSchema.PurchaseOrders WHERE Status = 'Pending'))
	AS TotalActiveOrders,
	(SELECT COUNT(*) FROM ProductSchema.Products) AS TotalProducts,
	(SELECT COUNT(*) FROM SupplierSchema.Suppliers) AS Supplier;