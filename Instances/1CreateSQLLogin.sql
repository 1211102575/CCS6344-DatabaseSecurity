USE master;

CREATE LOGIN DBA_Login WITH PASSWORD = 'Password!123';
CREATE USER DBA_User FOR LOGIN DBA_Login;
ALTER ROLE db_owner ADD MEMBER DBA_User;

CREATE LOGIN DevAdmin_Login WITH PASSWORD = 'Password!123';
CREATE USER DevAdmin_User FOR LOGIN DevAdmin_Login;
ALTER ROLE db_datareader ADD MEMBER DevAdmin_User;
ALTER ROLE db_datawriter ADD MEMBER DevAdmin_User;
GRANT CREATE TABLE TO DevAdmin_User;
GRANT CREATE PROCEDURE TO DevAdmin_User;

CREATE LOGIN AppPowerUser_Login WITH PASSWORD = 'Password!123';
CREATE USER AppPowerUser_User FOR LOGIN AppPowerUser_Login;
ALTER ROLE db_datareader ADD MEMBER AppPowerUser_User;
ALTER ROLE db_datawriter ADD MEMBER AppPowerUser_User;
GRANT CREATE VIEW TO AppPowerUser_User;