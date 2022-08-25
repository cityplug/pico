#!/bin/bash

# --- Security Addons
groupadd ssh-users
usermod -aG ssh-users shay
sed -i '15i\AllowGroups ssh-users\n' /etc/ssh/sshd_config

mv /opt/picasso/.scripts/jail.local /etc/fail2ban/jail.local
# --- Setup samba share and config
echo "#  ---  Setting up samba share --- #"
groupadd sambashare
usermod -aG sambashare shay
chmod -R 777 /picasso/*

systemctl stop smbd
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
mv /opt/picasso/.scripts/smb.conf /etc/samba/
echo "#  ---  Create samba user password --- #"
smbpasswd -a shay
echo
/etc/init.d/smbd restart && /etc/init.d/nmbd restart
echo "#  ---  Samba share created --- #"

# ----> Next Script
./picasso_net.sh