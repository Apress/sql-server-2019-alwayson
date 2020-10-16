$ClusterNetworkName = ‘AlwaysOnAzure’
$LoadBalancerIP = ‘10.0.10.10’
[int]$LoadBalancerProbePort = 50001

Get-ClusterResource ‘IP Address 10.0.0.35’ | Set-ClusterParameter -Multiple @{"Address"="$LoadBalancerIP";"ProbePort"=$LoadBalancerProbePort;"SubnetMask"="255.255.255.0";"Network"="$ClusterNetworkName";"EnableDhcp"=0}

Get-ClusterResource ‘IP Address 10.0.0.35’ | Set-ClusterParameter -Multiple @{"Address"="$LoadBalancerIP";"ProbePort"=$LoadBalancerProbePort;"SubnetMask"="255.255.255.0";"Network"="$ClusterNetworkName";"EnableDhcp"=0}
