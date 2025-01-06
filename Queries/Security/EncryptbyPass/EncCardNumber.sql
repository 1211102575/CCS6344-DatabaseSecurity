UPDATE UserSchema.Users
SET CardEncrypted = ENCRYPTBYPASSPHRASE('Password!123', CardNumber);