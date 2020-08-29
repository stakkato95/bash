#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Delete files marked "*.old"
# Modified: 29/08/2020

FILES=$(ls)

for file in $FILES
do
	if [[ $file == *".old"*  ]]
	then
	rm $file
	echo "${file} is deleted"
	else
	echo "${file} is OK"
	fi
done
