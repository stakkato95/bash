#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Create csv file from components
# Modified: 31/08/2020

header=$(paste -s -d"," headers.txt)
echo "$header" > users.csv

paste -d"," id.txt name.txt city.txt | while read line
do
echo "$line" >> users.csv
done
