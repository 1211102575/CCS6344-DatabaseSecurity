USE master;

ALTER SERVER ROLE sysadmin ADD MEMBER DBA_Login;
ALTER SERVER ROLE dbcreator ADD MEMBER DevAdmin_Login;
ALTER SERVER ROLE bulkadmin ADD MEMBER AppPowerUser_Login;