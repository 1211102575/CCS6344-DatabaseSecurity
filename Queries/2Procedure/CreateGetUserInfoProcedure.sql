CREATE PROCEDURE UserSchema.GetUserInfo
	@UserID INT
AS 
BEGIN
	SELECT UserName, Email, Phone, CardNumber
	FROM UserSchema.Users
	WHERE UserID = @UserID;
END
GO