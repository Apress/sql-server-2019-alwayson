--Back Up Sales Database

BACKUP DATABASE Sales 
TO  DISK = N'C:\Backups\Sales.bak' 
WITH NAME = N'Sales-Full Database Backup' ;
GO

--Back Up Customers Database

BACKUP DATABASE Customers 
TO  DISK = N'C:\Backups\Customers.bak' 
WITH NAME = N'Customers-Full Database Backup' ;
GO
