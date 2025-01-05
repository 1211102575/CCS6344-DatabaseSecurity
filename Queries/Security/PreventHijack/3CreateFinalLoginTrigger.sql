CREATE TRIGGER PreventHijack2
ON ALL SERVER WITH EXECUTE AS 'NotSa'
FOR LOGON
AS
BEGIN
 DECLARE @SingleUser INT ;
 SET @SingleUser =
 (
  SELECT COUNT(*) FROM sys.dm_server_registry
  WHERE value_data = '-m'
 );

 IF @SingleUser <> 0
 BEGIN
  IF (
   SELECT COUNT(*)
   FROM dbo.sysadminmembers
   WHERE LoginName = ORIGINAL_LOGIN()
   ) = 0
  BEGIN
   ROLLBACK ;
  END
 END
END