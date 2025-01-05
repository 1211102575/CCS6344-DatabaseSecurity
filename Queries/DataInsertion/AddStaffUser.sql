EXEC UserSchema.AddUser
    @UserName = 'admin_bobby',
    @Password = 'password!123',  
    @RoleID = 1,            
    @Email = 'bobby.bob@example.com',
    @Phone = '+1234567890',
    @CardNumber = '1234-5678-9012-3456';
GO

EXEC UserSchema.AddUser
    @UserName = 'manager_jack',
    @Password = 'password!123',
    @RoleID = 2,   
    @Email = 'jacky.jack@example.com',
    @Phone = '+2345678901',
    @CardNumber = '2345-6789-0123-4567';
GO

EXEC UserSchema.AddUser
    @UserName = 'employee_alice',
    @Password = 'password!123',
    @RoleID = 3, 
    @Email = 'alice.grey@example.com',
    @Phone = '+3456789012',
    @CardNumber = '3456-7890-1234-5678';
GO
