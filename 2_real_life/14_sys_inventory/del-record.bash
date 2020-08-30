#!/bin/bash
# Authro: Artsiom
# Date: 30/08/2020
# Description: Deletes record from a database
# Modified: 30/08/2020

clear
echo Please enter hostname or IP address?
read hostip
echo

grep -q $hostip ./database.txt
if [ $? -eq 0 ]
then
	echo
	sed -i '/'$hostip'/d' ./database.txt
	echo The $hostip has been deleted
else
	echo Record with provided ip or hostname is not found
fi
