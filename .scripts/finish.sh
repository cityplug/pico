#!/bin/bash

# --- Build Homer
docker stop homer
rm -rf /picasso/.AppData/homer/*
mv /opt/picasso/.scripts/homer/assets /picasso/.AppData/homer/assets
docker start homer

echo "
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1" >> /etc/sysctl.conf
sysctl -p

echo "# --- Enter pihole user password --- #"
docker exec -it pihole pihole -a -p
echo "#  ---  COMPLETED | REBOOT SYSTEM  ---  #"
exit