EXEC UserSchema.RegisterUser
    @UserName = 'ProductManagerUser',
    @Email = 'productmanager@example.com',
    @Phone = '123-456-7890',
    @Password = 'StrongPassword1!',
    @RoleID = 1;

EXEC UserSchema.RegisterUser
    @UserName = 'ProductEmployeeUser',
    @Email = 'productemployee@example.com',
    @Phone = '123-456-7891',
    @Password = 'StrongPassword4!',
    @RoleID = 2;

EXEC UserSchema.RegisterUser
    @UserName = 'InventoryManagerUser',
    @Email = 'inventorymanager@example.com',
    @Phone = '123-456-7892',
    @Password = 'StrongPassword6!',
    @RoleID = 3;

EXEC UserSchema.RegisterUser
    @UserName = 'InventoryEmployeeUser',
    @Email = 'inventoryemployee@example.com',
    @Phone = '123-456-7893',
    @Password = 'StrongPassword7!',
    @RoleID = 4;

EXEC UserSchema.RegisterUser
    @UserName = 'OrderManagerUser',
    @Email = 'ordermanager@example.com',
    @Phone = '123-456-7894',
    @Password = 'StrongPassword9!',
    @RoleID = 5;

EXEC UserSchema.RegisterUser
    @UserName = 'OrderEmployeeUser',
    @Email = 'orderemployee@example.com',
    @Phone = '123-456-7895',
    @Password = 'StrongPassword11!',
    @RoleID = 6;
