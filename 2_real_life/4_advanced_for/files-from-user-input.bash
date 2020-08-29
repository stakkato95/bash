#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description:
# Modified: 29/08/2020

echo How many files do you want to create?
read FILES_NUMBER

for i in $(seq 1 $FILES_NUMBER)
do
	echo "Name of the file #$i?"
	read NAME
	echo "Content of the file #$i?"
	read CONTENT
	echo $CONTENT > $NAME
done
