--Create Sales Database

CREATE DATABASE Sales ;
GO

USE Sales ;
GO

CREATE TABLE [dbo].[Orders](
         [OrderNumber] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
         [OrderDate] [date]  NOT NULL,
         [CustomerID] [int]  NOT NULL,
         [ProductID] [int]   NOT NULL,
         [Quantity] [int]    NOT NULL,
         [NetAmount] [money] NOT NULL,
         [TaxAmount] [money] NOT NULL,
         [InvoiceAddressID] [int] NOT NULL,
         [DeliveryAddressID] [int] NOT NULL,
         [DeliveryDate] [date] NULL,
) ;

DECLARE @Numbers TABLE
(
        Number        INT
)

--Populate ExistingOrders with data

;WITH CTE(Number)
AS
(
        SELECT 1 Number
        UNION ALL
        SELECT Number + 1
        FROM CTE
        WHERE Number < 100
)
INSERT INTO @Numbers
SELECT Number FROM CTE

INSERT INTO Orders
	SELECT
         (SELECT CAST(DATEADD(dd,(SELECT TOP 1 Number 
                                  FROM @Numbers 
                                  ORDER BY NEWID()),getdate())as DATE)),
         (SELECT TOP 1 Number -10 FROM @Numbers ORDER BY NEWID()),
         (SELECT TOP 1 Number FROM @Numbers ORDER BY NEWID()),
         (SELECT TOP 1 Number FROM @Numbers ORDER BY NEWID()),
        500,
        100,
         (SELECT TOP 1 Number FROM @Numbers ORDER BY NEWID()),
         (SELECT TOP 1 Number FROM @Numbers ORDER BY NEWID()),
         (SELECT CAST(DATEADD(dd,(SELECT TOP 1 Number - 10 
	FROM @Numbers 
          ORDER BY NEWID()),getdate()) as DATE))
FROM @Numbers a
CROSS JOIN @Numbers b ;

--SET FULL recovery mode on the database - required for Availability Groups

ALTER DATABASE Sales SET RECOVERY FULL ;
GO

--Backup the Sales Database

BACKUP DATABASE Sales 
TO  DISK = N'/var/opt/mssql/data/Sales.bak' 
WITH NAME = N'Sales-Full Database Backup' ;
GO
