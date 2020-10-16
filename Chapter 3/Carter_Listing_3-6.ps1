#Create the Role

Add-ClusterServerRole -Name ALWAYSON-MSDTC-C -Storage "Cluster Disk 3" -StaticAddress 192.168.0.50

#Create the DTC Resource

Add-ClusterResource -Name MSDTC-ALWAYSON-MSDTC-C -ResourceType "Distributed Transaction Coordinator" -Group ALWAYSON-MSDTC-C

#Create the dependencies

Add-ClusterResourceDependency MSDTC-ALWAYSON-MSDTC-C ALWAYSON-MSDTC-C

Add-ClusterResourceDependency MSDTC-ALWAYSON-MSDTC-C "Cluster Disk 3"

#Bring the Role online

Start-ClusterGroup ALWAYSON-MSDTC-C
