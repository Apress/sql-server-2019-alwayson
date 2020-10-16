#Specify the options for the Listener

$ListenerOptions = @{
    Name = "Foo"
    StaticIp = "10.0.0.14/255.255.255.0"
    Path = "SQLSERVER:\Sql\CLUSTERNODE1\PROD\AvailabilityGroups\Foo"
}

#Create the Listener

New-SqlAvailabilityGroupListener @ListenerOptions 
