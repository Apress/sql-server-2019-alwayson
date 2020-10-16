SELECT NodeName
FROM sys.dm_os_cluster_nodes
WHERE is_current_owner = 1 ;
