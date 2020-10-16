USE master
GO

RESTORE DATABASE Sales 
FROM  DISK = '/var/opt/mssql/data/Sales.bak' 
WITH  
	FILE = 1,  
	MOVE N'Sales' TO N'/var/opt/mssql/data/Sales.mdf',  
	MOVE N'Sales_log' TO N'/var/opt/mssql/data/Sales_log.ldf',  
	NORECOVERY ;
