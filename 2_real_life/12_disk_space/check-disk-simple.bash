#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Simple script to check disk usage
# Modified: 30/08/2020

echo
echo Following is the disk usage
echo
df -h | tail -n+2 | grep -vE "/dev/loop*" | awk '0+$5 >= 50 {print}'
