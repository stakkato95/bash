#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Filter error messages from /var/log/messages and save them into a separate file
# Modified:

tail -fn0 /var/log/messages | while read line
do
	echo $line | egrep "refused|invalid|error|fail|lost|shut|down|offline"
	if [ $? -eq 0 ]
	then
	echo $line >> /tmp/filtered-messages
	fi
done
