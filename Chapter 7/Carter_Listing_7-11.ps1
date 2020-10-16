USE master
GO

--Create the Database Master key

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Pa$$w0rd';
GO

-- Create the certificate

CREATE CERTIFICATE Node1Cert
WITH SUBJECT = 'ClusterNode1 Certificate';
GO

--Backup the certificate

BACKUP CERTIFICATE Node1Cert 
TO FILE = 'c:\Certificates\Node1Cert.cer';
GO
