CREATE ROLE ProductManagerRole;
CREATE ROLE ProductEmployeeRole;
CREATE ROLE InventoryManagerRole;
CREATE ROLE InventoryEmployeeRole;
CREATE ROLE OrderManagerRole;
CREATE ROLE OrderEmployeeRole;

GRANT SELECT, INSERT, UPDATE, DELETE ON ProductSchema.Products TO ProductManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON ProductSchema.Categories TO ProductManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON SupplierSchema.Suppliers TO ProductManagerRole;
GRANT SELECT ON UserSchema.Users TO ProductManagerRole;

GRANT SELECT, INSERT, UPDATE ON ProductSchema.Products TO ProductEmployeeRole;
GRANT SELECT ON ProductSchema.Categories TO ProductEmployeeRole;
GRANT SELECT ON UserSchema.Users TO ProductEmployeeRole;

GRANT SELECT, INSERT, UPDATE, DELETE ON InventorySchema.InventoryTransactions TO InventoryManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON InventorySchema.StockLevels TO InventoryManagerRole;
GRANT SELECT ON ProductSchema.Products TO InventoryManagerRole;
GRANT SELECT ON UserSchema.Users TO InventoryManagerRole;

GRANT SELECT, INSERT, UPDATE ON InventorySchema.InventoryTransactions TO InventoryEmployeeRole;
GRANT SELECT, UPDATE ON InventorySchema.StockLevels TO InventoryEmployeeRole;
GRANT SELECT ON UserSchema.Users TO InventoryEmployeeRole;

GRANT SELECT, INSERT, UPDATE, DELETE ON OrderSchema.SalesOrders TO OrderManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderSchema.OrderDetails TO OrderManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderSchema.PurchaseOrders TO OrderManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderSchema.PurchaseOrderDetails TO OrderManagerRole;
GRANT SELECT ON CustomerSchema.Customers TO OrderManagerRole;
GRANT SELECT ON UserSchema.Users TO OrderManagerRole;

GRANT SELECT, INSERT, UPDATE ON OrderSchema.SalesOrders TO OrderEmployeeRole;
GRANT SELECT, INSERT, UPDATE ON OrderSchema.OrderDetails TO OrderEmployeeRole;
GRANT SELECT ON CustomerSchema.Customers TO OrderEmployeeRole;
GRANT SELECT ON UserSchema.Users TO OrderEmployeeRole;

ALTER ROLE ProductManagerRole ADD MEMBER ProductManagerUser;
ALTER ROLE ProductEmployeeRole ADD MEMBER ProductEmployeeUser;
ALTER ROLE InventoryManagerRole ADD MEMBER InventoryManagerUser;
ALTER ROLE InventoryEmployeeRole ADD MEMBER InventoryEmployeeUser;
ALTER ROLE OrderManagerRole ADD MEMBER OrderManagerUser;
ALTER ROLE OrderEmployeeRole ADD MEMBER OrderEmployeeUser;
