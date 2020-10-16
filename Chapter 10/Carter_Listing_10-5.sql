SELECT 
	 DB_NAME(database_id)
	,ag.name
	,ar.replica_server_name
	,is_primary_replica
	,synchronization_state_desc
	,synchronization_health_desc
	,database_state_desc
FROM sys.dm_hadr_database_replica_states drs
INNER JOIN sys.availability_groups ag
	ON drs.group_id = ag.group_id
INNER JOIN sys.availability_replicas ar
	ON drs.replica_id = ar.replica_id 
WHERE ag.name = 'HR';
