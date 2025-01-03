USE MASTER;
ALTER SERVER AUDIT [ServerAudit] WITH (STATE = ON);
ALTER SERVER AUDIT SPECIFICATION [ServerAuditSpecification-InventoryManagementSystem] WITH (STATE = ON);
GO