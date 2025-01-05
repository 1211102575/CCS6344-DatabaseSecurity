USE InventoryManagementSystem;
GO

CREATE DATABASE AUDIT SPECIFICATION [DatabaseAuditSpecification-InventoryManagementSystem]
FOR SERVER AUDIT [ServerAudit]
ADD (SELECT, INSERT, UPDATE, DELETE ON DATABASE::InventoryManagementSystem BY [Public]);
GO

ALTER DATABASE AUDIT SPECIFICATION [DatabaseAuditSpecification-InventoryManagementSystem] WITH (STATE = ON);
GO