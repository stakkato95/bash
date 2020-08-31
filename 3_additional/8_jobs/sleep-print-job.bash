#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Sleep for 5 min
# Modified: 31/08/2020

for i in $(seq 300)
do
echo $i > /dev/null
sleep 1
done
