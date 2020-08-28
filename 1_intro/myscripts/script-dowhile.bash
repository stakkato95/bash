#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: This is a do-while script
# Date Modified: 28/08/2020

count=0

while [ $count -lt 10 ]
do
  echo $count
  count=`expr $count + 1`
  sleep 1
done

echo
echo This process is stopped
echo
