USE master
BACKUP CERTIFICATE TDECert
TO FILE = 'C:\certificates\TDECert'
WITH PRIVATE KEY
(file='C:\certificates\TDECertKey',
ENCRYPTION BY PASSWORD='Password!123');