Use InventoryManagementSystem ;
GO 
/* CREATE TABLE */
CREATE TABLE UserSchema.Users (
	UserID INT PRIMARY KEY IDENTITY(1,1),
	UserName NVARCHAR(50) NOT NULL,
	PasswordHash NVARCHAR(255) NOT NULL,
	RoleID INT NOT NULL,
	Email NVARCHAR(100),
	Phone NVARCHAR(20),
	FOREIGN KEY (RoleID) REFERENCES UserSchema.Roles(RoleID),
);

CREATE TABLE UserSchema.Roles (
	RoleID INT PRIMARY KEY IDENTITY(1,1),
	RoleName NVARCHAR(50) NOT NULL
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
	FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID),
	
);

CREATE TABLE ProductSchema.Categories (
	CategoryID INT PRIMARY KEY  IDENTITY(1,1),
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

CREATE TABLE InventorySchema.InventoryTransactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    TransactionType NVARCHAR(50) NOT NULL,
    TransactionDate DATE DEFAULT GETDATE(),
    UserID INT NOT NULL,
    Price DECIMAL(10,2),
    SupplierID INT,
    CustomerID INT,
    TotalAmount AS (Quantity * Price),
    FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES UserSchema.Users(UserID),
    FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID),
    FOREIGN KEY (CustomerID) REFERENCES CustomerSchema.Customers(CustomerID)
);

CREATE TABLE ProductSchema.ProductSuppliers (
	ProductID INT,
	SupplierID INT,
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID),
	FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID)
);

CREATE TABLE InventorySchema.StockLevels (
	ProductID INT PRIMARY KEY,
	CurrentStockLevel INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

CREATE TABLE OrderSchema.SalesOrders (
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	CustomerDate DATETIME NOT NULL,
	TotalAmount DECIMAL(10,2),
	Status NVARCHAR(50),
	FOREIGN KEY (CustomerID) REFERENCES CustomerSchema.Customers(CustomerID)
);

CREATE TABLE OrderSchema.OrderDetails (
	OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
	OrderID INT,
	ProductID INT,
	Quantity INT,
	Price DECIMAL(10,2),
	Total AS (Quantity * Price),
	FOREIGN KEY (OrderID) REFERENCES OrderSchema.SalesOrders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

CREATE TABLE OrderSchema.PurchaseOrders (
	PurchaseOrderID INT PRIMARY KEY IDENTITY(1,1),
	SupplierID INT,
	OrderDate DATETIME NOT NULL,
	TotalAmount DECIMAL(10,2),
	Status NVARCHAR(50),
	FOREIGN KEY (SupplierID) REFERENCES SupplierSchema.Suppliers(SupplierID)
);

CREATE TABLE OrderSchema.PurchaseOrderDetails (
	PurchaseOrdeerDetailID INT PRIMARY KEY IDENTITY(1,1),
	PurchaseOrderID INT,
	ProductID INT,
	Quantity INT,
	Price DECIMAL(10,2),
	FOREIGN KEY (PurchaseOrderID) REFERENCES OrderSchema.PurchaseOrders(PurchaseOrderID),
	FOREIGN KEY (ProductID) REFERENCES ProductSchema.Products(ProductID)
);

/* CREATE ACTION LOG TABLE */
CREATE TABLE UserSchema.ActionLogs (
	LogID INT PRIMARY KEY IDENTITY(1,1),
	Action NVARCHAR(100),
	ActionUser NVARCHAR(50),
	Time DATETIME DEFAULT GETDATE(),
	Details NVARCHAR(MAX)
);
