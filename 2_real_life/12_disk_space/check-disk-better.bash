#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Check disk space
# Modified: 30/08/2020

df -H | grep -vE '^Filesystem|tmpfs|cdrom|/dev/loop*' | awk '{print $5,$1}' | while read output
do
	usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
	partition=$(echo $output | awk '{print $2}')

	if [ $usage -ge 50 ]
	then
		echo "Running out of memory on \"$partition\" with $usage%"
	fi
done
