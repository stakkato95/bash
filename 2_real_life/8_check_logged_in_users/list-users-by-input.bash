#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: List users by user input
# Modified: 29/08/2020

echo "Please enter day (e.g. Mon)"
read w
echo "Please enter month (e.g. Aug)"
read m
echo "Please enter date (e.g. 27)"
read d

last | grep "$w $m $d"
