USE InventoryManagementSystem;
ALTER ROLE db_owner ADD MEMBER DBA_User;

ALTER ROLE db_datareader ADD MEMBER DevAdmin_User;
ALTER ROLE db_datawriter ADD MEMBER DevAdmin_User;
GRANT CREATE TABLE TO DevAdmin_User;
GRANT CREATE PROCEDURE TO DevAdmin_User;

ALTER ROLE db_datareader ADD MEMBER AppPowerUser_User;
ALTER ROLE db_datawriter ADD MEMBER AppPowerUser_User;
GRANT CREATE VIEW TO AppPowerUser_User;;