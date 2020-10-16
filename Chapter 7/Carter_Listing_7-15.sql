CREATE AVAILABILITY GROUP DistributedAG  
   WITH (DISTRIBUTED)   
   AVAILABILITY GROUP ON  
      'HR' WITH    
      (   
         LISTENER_URL = 'tcp://HRListener.alwayson.com:1433',    
         AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT,   
         FAILOVER_MODE = MANUAL,   
         SEEDING_MODE = AUTOMATIC   
      ),   
      'Linux_AOAG' WITH    
      (   
         LISTENER_URL = 'tcp://LinuxListener:5022',   
         AVAILABILITY_MODE = ASYNCHRONOUS_COMMIT,   
         FAILOVER_MODE = MANUAL,   
         SEEDING_MODE = AUTOMATIC   
      );    
GO   
