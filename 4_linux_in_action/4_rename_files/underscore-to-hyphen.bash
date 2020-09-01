#!/bin/bash
# Author: Artsiom
# Date: 01/09/2020
# Description: Replace underscores with hyphens in files
# Modified: 01/09/2020

echo Enter directory?
read dir

echo $dir | grep "/home/"

if [ $? -eq 0 ]
then
	echo Dir is placed in home OK
else
	echo It is not allowed to modify dirs outside home
	exit 0 
fi

find $dir -type f | while read filename_and_path
do
	filename=$(basename $filename_and_path)
	if [[ $filename == *"_"* ]]
	then
		mv $filename $(echo $filename | tr '_' '-')
	fi
done
