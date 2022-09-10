#!/bin/bash

# --- Security Addons
groupadd ssh-users
usermod -aG ssh-users shay
sed -i '15i\AllowGroups ssh-users\n' /etc/ssh/sshd_config

mv /opt/picasso/.scripts/jail.local /etc/fail2ban/jail.local

echo "#  ---  Samba share created --- #"

# ----> Next Script
./picasso_net.sh