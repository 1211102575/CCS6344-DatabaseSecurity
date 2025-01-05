EXEC ProductSchema.AddProduct
    @ProductName = 'Gaming Mouse',
    @CategoryID = 1,
    @SupplierID = 1,
    @Quantity = 25,
    @Price = 50.00,
    @ReorderLevel = 10;
GO