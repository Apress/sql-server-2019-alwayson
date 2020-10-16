sudo pcs resource create LinuxAOAG ocf:mssql:ag ag_name=LinuxAOAG meta failure-timeout=60s master meta notify=true
sudo pcs resource create VirtualIP ocf:heartbeat:IPaddr2 ip=10.0.0.25 cidr_netmask=24
