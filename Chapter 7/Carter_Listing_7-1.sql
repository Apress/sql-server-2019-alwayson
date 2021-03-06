CREATE AVAILABILITY GROUP BasicAGAG
WITH (
    AUTOMATED_BACKUP_PREFERENCE = PRIMARY,
    BASIC,
    REQUIRED_SYNCHRONIZED_SECONDARIES_TO_COMMIT = 0
)
FOR DATABASE Sales
REPLICA ON 'SQLSTDPROD’ WITH (
    ENDPOINT_URL = 'TCP://SQLSTDPROD.AlwaysOn.com:5022', 
    FAILOVER_MODE = AUTOMATIC, 
    AVAILABILITY_MODE = SYNCHRONOUS_COMMIT, 7
    SEEDING_MODE = AUTOMATIC
),
'SQLSTDSYNCHA' WITH (
    ENDPOINT_URL = N'TCP://SQLSTDSYNCHA.AlwaysOn.com:5022', 
    FAILOVER_MODE = AUTOMATIC, 
    AVAILABILITY_MODE = SYNCHRONOUS_COMMIT, 
    SEEDING_MODE = AUTOMATIC
);

GO
