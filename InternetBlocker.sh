#!/bin/bash

ITstaff=$(awk -F':' '/IT/{print $4}' /etc/group)


for staff in ${ITstaff//,/ }
do
	sudo iptables -A OUTPUT -p tcp --dport 443 -m owner --uid-owner $staff -j ACCEPT
	echo "USER $staff GRANTED ACCESS TO INTERNET."
done

sudo iptables -A OUTPUT -p tcp --dport 443 -d 192.168.2.3 -j ACCEPT
sudo iptables -t filter -A OUTPUT -p tcp --dport 80 -j DROP
sudo iptables -t filter -A OUTPUT -p tcp --dport 443 -j DROP

printf "\n\nOther users have been blocked from the Internet (Port 80, 443).\n"
