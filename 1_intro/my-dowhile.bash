#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: This is a new script with do while
# Date Modified: 28/08/2020

c=0

while [ $c -lt 5 ]
do
  echo Current value is $c
  ((c++))
done
