#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Check available disk space
# Modified: 30/09/2020

diskUsage=$(df -h | egrep -v "tmpfs|devtmpfs|/dev/loop*" | tail -n+2 | awk '{print $5}' | cut -d'%' -f1)

for usage in $diskUsage
do
	if [ $usage -ge 95 ]
	then
		echo Check disk space at $(df -h | grep $usage)
	fi
done
