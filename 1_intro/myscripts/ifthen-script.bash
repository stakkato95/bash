#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: This is an interesting if then else script
# Date Modified: 28/08/2020

count=100

clear
if [ $count -eq 100 ]
then
  echo Count is 100
else
  echo Count is not 100
fi

anotherCount=100500
if [ $anotherCount -eq 100500 ]
then
  echo This is a correct number
fi
