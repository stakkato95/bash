#!/bin/bash
# Author: Artsiom
# Date: 29/08/20202
# Description: Change permission for files by file name pattern
# Modified: 29/08/2020

sleepTime=0.5
total=$(ls test-* | wc -l)
totlaTime=$(echo "$total * $sleepTime" | bc)

echo
echo "It will take $total sec to add write permission for all files"
echo

for file in test-*
do
	echo "Adding write permissions for ${file}"
	chmod a+w $file
	sleep $sleepTime
done
