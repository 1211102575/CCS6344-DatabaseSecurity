CREATE PROCEDURE UserSchema.RegisterUser
    @UserName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Password NVARCHAR(50),
    @RoleID INT
AS
BEGIN
    DECLARE @PasswordHash VARBINARY(64);
    SET @PasswordHash = HASHBYTES('SHA2_256', @Password);

    INSERT INTO UserSchema.Users (UserName, Email, Phone, PasswordHash, RoleID)
    VALUES (@UserName, @Email, @Phone, @PasswordHash, @RoleID);
END;
