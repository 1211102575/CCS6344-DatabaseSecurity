CREATE PROCEDURE GetUserDetails
    @Username NVARCHAR(50)
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX)
    SET @Query = 'SELECT * FROM UserSchema.Users WHERE Username = ''' + @Username + ''''
    EXEC sp_executesql @Query
END