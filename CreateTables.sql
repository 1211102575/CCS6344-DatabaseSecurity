use InventoryManagementSystem ;
go

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
	CardNumber NVARCHAR(20) NOT NULL,
	FOREIGN KEY (RoleID) REFERENCES UserSchema.Roles(RoleID)
);

CREATE TABLE UserSchema.ActionLogs (
	LogID INT PRIMARY KEY IDENTITY(1,1),
	Action NVARCHAR(100),
	UserID INT,
	Time DATETIME DEFAULT GETDATE(),
	Details NVARCHAR(MAX),
	FOREIGN KEY (UserID) REFERENCES UserSchema.Users(UserID)
);

/* SUPPLIER AND CUSTOMER TABLES */
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

/* PRODUCT TABLES */
CREATE TABLE ProductSchema.Categories (
	CategoryID INT PRIMARY KEY IDENTITY(1,1),
	CategoryName NVARCHAR(50) NOT NULL
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

CREATE TABLE InventorySchema.StockLevels (
	ProductID INT PRIMARY KEY,
	CurrentStockLevel INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

/* ORDER TABLES */
CREATE TABLE OrderSchema.SalesOrders (
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	ProductID INT,
	OrderDate DATETIME NOT NULL,
	Price DECIMAL(10,2),
	Quantity INT,
	Status NVARCHAR(50),
	FOREIGN KEY (CustomerID) REFERENCES CustomerSchema.Customers(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);


CREATE TABLE OrderSchema.PurchaseOrders (
	PurchaseOrderID INT PRIMARY KEY IDENTITY(1,1),
	SupplierID INT,
	ProductID INT ,
	OrderDate DATETIME NOT NULL,
	Quantity INT,
	TotalAmount DECIMAL(10,2),
	Status NVARCHAR(50),
	FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID),
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);


/* INVENTORY TRANSACTIONS */
CREATE TABLE InventorySchema.InventoryTransactions (
	TransactionID INT PRIMARY KEY IDENTITY(1,1),
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	TransactionType NVARCHAR(50) NOT NULL,
	TransactionDate DATE DEFAULT GETDATE(),
	UserID INT NOT NULL,
	Price DECIMAL(10,2),
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID),
	FOREIGN KEY (UserID) REFERENCES UserSchema.Users(UserID)
);
