EXEC OrderSchema.AddPurchaseOrder
    @SupplierID = 1,  
    @ProductID = 1,    
    @OrderDate = '2023-10-05',
    @Quantity = 10,
    @TotalAmount = 500.00,  
    @UserID = 1;   
GO