USE master
GO

CREATE CERTIFICATE TDECert WITH SUBJECT = 'Certificate For TDE';
GO
USE InventoryManagementSystem
GO

CREATE DATABASE ENCRYPTION KEY WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE TDECert;
GO

ALTER DATABASE InventoryManagementSystem
SET ENCRYPTION ON;
GO