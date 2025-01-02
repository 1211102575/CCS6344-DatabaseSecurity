CREATE PROCEDURE UserSchema.RegisterUser
    @UserName NVARCHAR(50),
    @Password NVARCHAR(50),
    @RoleID INT
AS
BEGIN
    DECLARE @PasswordHash VARBINARY(64);
    SET @PasswordHash = HASHBYTES('SHA2_256', @Password);
    INSERT INTO UserSchema.Users (UserName, PasswordHash, RoleID)
    VALUES (@UserName, @PasswordHash, @RoleID);
END;