Import-Module FailoverClusters

(Get-ClusterNode CLUSTERNODE2).NodeWeight = 0
