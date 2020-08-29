#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: List users logged in by date
# Modified: 29/08/2020

#today=$(date +"%a %b %d")
today=$(date | awk '{print $1,$2,$3}')
echo "Users who jas logged in today $today"
last | grep "$today" | awk '{print $1}'
