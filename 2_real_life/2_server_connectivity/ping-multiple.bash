#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Ping multiple IPs
# Modified: 29/08/2020

IP_FILE="/home/artsiom/Documents/bash/2_real_life/2_server_connectivity/ip.txt"

for host in $(cat $IP_FILE)
do
	ping -c1 $host &> /dev/null
	if [ $? -eq 0 ]
	then
	echo "${host} is OK"
	else
	echo "${host} is NOT OK"
	fi
done
