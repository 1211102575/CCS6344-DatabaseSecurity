USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password!123';
BACKUP MASTER KEY TO FILE = 'C:\keys\masterkey' ENCRYPTION BY PASSWORD = 'Password!123';