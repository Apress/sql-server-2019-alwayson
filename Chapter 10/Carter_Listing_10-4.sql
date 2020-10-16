SELECT 
	 ar.replica_server_name
	,ag.name
	,ars.last_connect_error_description
	,ars.last_connect_error_timestamp
FROM sys.dm_hadr_availability_replica_states ars
INNER JOIN sys.availability_replicas ar
	ON ar.group_id = ars.group_id
		AND ars.replica_id = ar.replica_id 
INNER JOIN sys.availability_groups ag
	ON ag.group_id = ar.group_id ;
