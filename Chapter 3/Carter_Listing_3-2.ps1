#Run the validation tests

Test-Cluster -Node Clusternode1,Clusternode2

#Create the cluster

New-Cluster -Node ClusterNode1,ClusterNode2 -Name ALWAYSON-C
