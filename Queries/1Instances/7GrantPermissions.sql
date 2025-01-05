GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::ProductSchema TO ProductManagerRole;
GRANT SELECT ON SCHEMA::ProductSchema TO ProductEmployeeRole;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::OrderSchema TO OrderManagerRole;
GRANT SELECT ON SCHEMA::OrderSchema TO OrderEmployeeRole;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::InventorySchema TO InventoryManagerRole;
GRANT SELECT ON SCHEMA::InventorySchema TO InventoryEmployeeRole;

GRANT SELECT ON UserSchema.Users TO ProductManagerRole;
GRANT SELECT ON UserSchema.Users TO ProductEmployeeRole;
GRANT SELECT ON UserSchema.Users TO OrderManagerRole;
GRANT SELECT ON UserSchema.Users TO OrderEmployeeRole;
GRANT SELECT ON UserSchema.Users TO InventoryManagerRole;
GRANT SELECT ON UserSchema.Users TO InventoryEmployeeRole;