#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Ping remote servers
# Modified: 29/08/2020

host="172.217.23.46"
ping -c1 $host &> /dev/null
	if [ $? -eq 0 ]
	then
	echo "${host} is OK"
	else
	echo "${host} is NOT OK"
	fi
