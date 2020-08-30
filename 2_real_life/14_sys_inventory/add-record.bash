#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Add a record to a "database.txt" file
# Modified: 30/08/2020

clear
echo Please enter hostname?
read host
echo

grep -q $host ./database.txt
if [ $? -eq 0 ]
then
	echo "$host already exists in the database"
	echo
	exit 0
fi

echo Please enter ip address?
read IP
echo

grep -q $IP ./database.txt
if [ $? -eq 0 ]
then
	echo "$IP already exists"
	echo
	exit 0
fi

echo Please enter description?
read description
echo

echo $host $IP $description >> database.txt
echo The provided record has been written
