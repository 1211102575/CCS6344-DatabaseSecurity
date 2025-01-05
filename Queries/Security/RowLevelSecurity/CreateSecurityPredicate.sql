USE InventoryManagementSystem
GO
CREATE SCHEMA Security;
GO

CREATE FUNCTION Security.fn_useraccesspredicate(@UserName NVARCHAR(50))
	RETURNS TABLE
WITH SCHEMABINDING
AS
	RETURN SELECT 1 AS AccessResult
    WHERE SUSER_SNAME() = 'IMS-SERVER\' + @UserName
    OR IS_MEMBER('db_owner') = 1;
GO