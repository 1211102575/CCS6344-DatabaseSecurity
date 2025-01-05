USE InventoryManagementSystem;
GO

CREATE SCHEMA ProductSchema;
GO
CREATE SCHEMA SupplierSchema;
GO
CREATE SCHEMA CustomerSchema;
GO
CREATE SCHEMA OrderSchema;
GO
CREATE SCHEMA InventorySchema;
GO
CREATE SCHEMA UserSchema;
GO

CREATE TABLE UserSchema.Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50) NOT NULL
);

CREATE TABLE UserSchema.Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(50) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    RoleID INT NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    CardNumber NVARCHAR(20),
    FOREIGN KEY (RoleID) REFERENCES UserSchema.Roles(RoleID)
);

CREATE TABLE ProductSchema.Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE SupplierSchema.Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(100),
    ContactEmail NVARCHAR(100),
    Phone NVARCHAR(20)
);

CREATE TABLE CustomerSchema.Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(255)
);

CREATE TABLE ProductSchema.Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    ReorderLevel INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES ProductSchema.Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID)
);

CREATE TABLE OrderSchema.PurchaseOrders (
    PurchaseOrderID INT PRIMARY KEY IDENTITY(1,1),
    SupplierID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

CREATE TABLE OrderSchema.SalesOrders (
    SalesOrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerSchema.Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

CREATE TABLE InventorySchema.StockLevels (
    ProductID INT PRIMARY KEY,
    CurrentStockLevel INT NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

CREATE TABLE InventorySchema.InventoryTransactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    TransactionType NVARCHAR(50) NOT NULL,
    TransactionDate DATETIME DEFAULT GETDATE(),
    UserID INT NOT NULL,
    Price DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES UserSchema.Users(UserID)
);