#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Count files
# Modified: 30/08/2020

total=$(ls file* | wc -l)

if [ $total -eq	20 ]
then
	echo There are 20 files. Jobs can be started.
else
	echo There are less than 20 files. Start jobs later.
fi
