--Create The Endpoint

CREATE ENDPOINT ClusterlessEndpoint
    AS TCP (LISTENER_PORT = 5022)
    FOR DATA_MIRRORING (
	    ROLE = ALL,
		ENCRYPTION = REQUIRED ALGORITHM AES
	) ;
GO

--Start The Endpoint
ALTER ENDPOINT ClusterlessEndpoint STATE = STARTED ;
GO

--Grant Permissions To The Service Account

GRANT CONNECT ON ENDPOINT::ClusterlessEndpoint TO [ALWAYSON\SQLServiceAccount];
GO
