#Create connection to CLSUETERNODE1\PROD
$PrimaryServer = Get-Item "SQLSERVER:\SQL\CLUSTERNODE1\PROD" -Verbose

#Create connection to CLUSTERNODE2\SYNCHA

$SecondaryServer = Get-Item "SQLSERVER:\SQL\CLUSTERNODE2\SYNCHA"

#Set the properties of the primary Replica

$PrimaryReplicaOptions = @{
    Name             = "CLUSTERNODE1\PROD"
    EndpointUrl      = "TCP://CLUSTERNODE1.ALWAYSON.COM:5022"
    FailoverMode     = "Automatic"
    AvailabilityMode = "SynchronousCommit"
    Version          = ($PrimaryServer.Version)
}

#Create the primary Replica Object

$PrimaryReplica = New-SqlAvailabilityReplica @PrimaryReplicaOptions  -AsTemplate 

#Set the properties of the secondary Replica

$SecondaryReplicaOptions = @{
    Name             = "CLUSTERNODE2\SYNCHA"
    EndpointUrl      = "TCP://CLUSTERNODE2.ALWAYSON.COM:5022"
    FailoverMode     = "Automatic"
    AvailabilityMode = "SynchronousCommit"
    Version          = ($SecondaryServer.Version)
}

#Create the secondary replica object

$SecondaryReplica = New-SqlAvailabilityReplica @SecondaryReplicaOption -AsTemplate

$AvailabilityGroupOptions = @{
    InputObject         = $PrimaryServer
    Name =              = "Foo"
    AvailabilityReplica = ($PrimaryReplica, $SecondaryReplica)
    Database            = @("Foo")
}
New-SqlAvailabilityGroup @AvailabilityGroupOptions 
