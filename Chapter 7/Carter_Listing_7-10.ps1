New-Cluster -Name AOAGWorkGroupCluster -Node ClusterNode1,ClusterNode2 -StaticAddress 10.0.0.52 -AdministrativeAccessPoint DNS

Set-ClusterQuorum -DiskWitness "Cluster Disk 1"
