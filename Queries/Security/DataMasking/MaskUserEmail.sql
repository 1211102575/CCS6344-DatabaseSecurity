USE InventoryManagementSystem;

ALTER TABLE UserSchema.Users
ALTER COLUMN Email NVARCHAR(100) MASKED WITH (FUNCTION = 'email()');