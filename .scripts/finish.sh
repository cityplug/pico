#!/bin/bash

# --- Build Homer
docker stop homer
rm -rf /pico/.AppData/homer/*
mv /opt/pico/.scripts/homer/assets /pico/.AppData/homer/assets
docker start homer

echo "# --- Enter pihole user password --- #"
docker exec -it pihole pihole -a -p
echo "#  ---  COMPLETED | REBOOT SYSTEM  ---  #"
exit



