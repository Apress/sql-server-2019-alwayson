--Back Up Customers Database

BACKUP DATABASE Customers 
TO  DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Customers.bak' 
WITH NAME = 'Customers-Full Database Backup' ;
GO
