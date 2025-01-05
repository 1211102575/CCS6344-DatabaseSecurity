OPEN MASTER KEY DECRYPTION BY PASSWORD = 'Password!123';
CREATE CERTIFICATE BackupEncryptionCert WITH SUBJECT = 'Backup Encryption Certificate';
CREATE SYMMETRIC KEY BackupEncryptionKey WITH ALGORITHM = AES_128 ENCRYPTION BY CERTIFICATE BackupEncryptionCert;
OPEN SYMMETRIC KEY BackupEncryptionKey
DECRYPTION BY CERTIFICATE BackupEncryptionCert;
BACKUP CERTIFICATE BackupEncryptionCert
TO FILE = 'C:\certificates\BackupEncryptionCert.cer'
WITH PRIVATE KEY (file = 'C:\certificates\BackupEncryptionCert.pvk',
ENCRYPTION BY PASSWORD = 'Password!123');