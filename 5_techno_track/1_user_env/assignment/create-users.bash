#!/bin/bash
# Author: Artsiom
# Date: 04/09/2020
# Description: Create users from username, group, passwrd hash, home dir
# Modified: 04/09/2020

days_since_epoch=$(expr $(date +%s) / 86400)
cat users.csv | tail -n +2 | while read line
do
	# write /etc/passwd
	passwd_line=$(echo $line | awk -F"," '{printf "%s:x:1001:1000::%s:/bin/bash", $1,$4}')
	echo $passwd_line >> passwd.txt

	# write /etc/shadow
	shadow_line=$(echo $line | awk -F"," -v days_since_epoch="$days_since_epoch" '{printf "%s:%s:%s:0:99999:7:::", $1,$3,days_since_epoch}')
	echo $shadow_line >> shadow.txt

	# create home
	username=$(echo $line | awk -F"," '{print $1}'
	mkdir $username
done
