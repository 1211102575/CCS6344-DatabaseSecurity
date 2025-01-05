EXEC InventorySchema.AddInventoryTransaction
    @ProductID = 1,       
    @Quantity = 16,        
    @TransactionType = 'Adjustment',
    @UserID = 2,      
    @Price = 50.00; 
GO