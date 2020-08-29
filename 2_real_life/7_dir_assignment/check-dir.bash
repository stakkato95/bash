#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description:
# Modified: 29/08/2020

cd /home

for dir in *
do
	check=$(grep -c "/home/$dir" /etc/passwd)
	if [ $check -ge 1 ]
	then
	echo "$dir is assigned to a user"
	else
	echo "$dir is not assigned to a user"
	fi
done
