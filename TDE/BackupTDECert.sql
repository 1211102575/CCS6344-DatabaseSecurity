USE master
GO
BACKUP CERTIFICATE TDECert
TO FILE = 'C:\certificates\TDECert.cer'
WITH PRIVATE KEY
(file='C:\certificates\TDECertKey.pvk',
ENCRYPTION BY PASSWORD='Password!123');
GO