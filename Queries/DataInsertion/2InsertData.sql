USE InventoryManagementSystem;
GO

INSERT INTO UserSchema.Roles (RoleName)
VALUES ('Admin'), ('Manager'), ('Employee');
GO

INSERT INTO ProductSchema.Categories (CategoryName)
VALUES ('Electronics'), ('Clothing'), ('Furniture'), ('Office Supplies'), ('Gadgets');
GO

INSERT INTO SupplierSchema.Suppliers (SupplierName, ContactName, ContactEmail, Phone)
VALUES 
('Electronics Supplier Inc.', 'Liam Nguyen', 'liam.nguyen@electronicsupplier.com', '+1234567890'),
('Clothing Wholesalers Ltd.', 'Emma Patel', 'emma.patel@clothingwholesalers.com', '+2345678901'),
('Office Supplies Co.', 'Noah Kim', 'noah.kim@officesupplies.com', '+3456789012'),
('Furniture World', 'Olivia Garcia', 'olivia.garcia@furnitureworld.com', '+4567890123'),
('Gadget Galaxy', 'Ahmad Ali', 'ahmad.ali@gadgetgalaxy.com', '+5678901234');
GO

INSERT INTO CustomerSchema.Customers (CustomerName, Email, Phone, Address)
VALUES 
('John Doe', 'john.doe@example.com', '+1234567890', '123 Main St, City A'),
('Jane Smith', 'jane.smith@example.com', '+2345678901', '456 Elm St, City B'),
('Alice Brown', 'alice.brown@example.com', '+3456789012', '789 Oak St, City C'),
('Bob Johnson', 'bob.johnson@example.com', '+4567890123', '101 Pine St, City D'),
('Charlie Davis', 'charlie.davis@example.com', '+5678901234', '202 Maple St, City E');
GO