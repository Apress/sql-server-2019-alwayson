CREATE TABLE ##Server_Diagnostics
(
creation_time	DATETIME,
component_type	NVARCHAR(8),
component_name	NVARCHAR(128),
[state]		TINYINT,
state_desc	NVARCHAR(8),
[data]		XML
) ;

INSERT INTO ##Server_Diagnostics
EXEC sp_server_diagnostics ;

SELECT *,
data.value('(/system/@systemCpuUtilization)[1]','int') AS SystemCPUUtilization
,data.value('(/system/@sqlCpuUtilization)[1]','int') AS SQLServerCPU
,data.value('(/resource/@outOfMemoryExceptions)[1]','int') AS OutOfMemoryExceptions
FROM ##Server_Diagnostics ;


DROP TABLE ##Server_Diagnostics ;
