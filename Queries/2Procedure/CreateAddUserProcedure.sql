CREATE PROCEDURE UserSchema.AddUser
    @UserName NVARCHAR(50),
    @Password NVARCHAR(255),
    @RoleID INT,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20),
    @CardNumber NVARCHAR(20)
AS
BEGIN
    IF @UserName IS NULL OR @Password IS NULL OR @RoleID IS NULL
    BEGIN
        RAISERROR('Username, password, and role are required.', 16, 1);
        RETURN;
    END;
    DECLARE @PasswordHash NVARCHAR(255);
    SET @PasswordHash = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', @Password), 2);
    INSERT INTO UserSchema.Users (UserName, PasswordHash, RoleID, Email, Phone, CardNumber)
    VALUES (@UserName, @PasswordHash, @RoleID, @Email, @Phone, @CardNumber);
    INSERT INTO UserSchema.ActionLogs (Action, UserID, Details)
    VALUES ('User Added', SCOPE_IDENTITY(), 'New user added: ' + @UserName);
END;
GO