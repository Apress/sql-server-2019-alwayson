sudo systemctl enable pcsd
sudo systemctl start pcsd
sudo pcs cluster destroy 
sudo systemctl enable pacemaker
