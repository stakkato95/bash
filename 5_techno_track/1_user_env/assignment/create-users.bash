#!/bin/bash
# Author: Artsiom
# Date: 04/09/2020
# Description: Create users from username, group, passwrd hash, home dir
# Modified: 04/09/2020

days_since_epoch=$(expr $(date +%s) / 86400)
max_user_id=$(cat /etc/passwd | awk -F":" '{if($3<65500) print $3}' | sort -n | tail -1)

cat users.csv | tail -n +2 | while read line
do
	max_user_id=$(expr $max_user_id + 1)

	# write /etc/passwd
	passwd_line=$(echo $line | awk -F"," -v max_user_id="$max_user_id" '{printf "%s:x:%s:1000::%s:/bin/bash", $1,max_user_id,$4}')
	echo $passwd_line >> /etc/passwd

	# write /etc/shadow
	shadow_line=$(echo $line | awk -F"," -v days_since_epoch="$days_since_epoch" '{printf "%s:%s:%s:0:99999:7:::", $1,$3,days_since_epoch}')
	echo $shadow_line >> /etc/shadow

	# create home
	username=$(echo $line | awk -F"," '{print $4}')
	mkdir $username
done
