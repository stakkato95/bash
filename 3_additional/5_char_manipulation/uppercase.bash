#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Translate all chars to upper case
# Modified: 31/08/2020

tr [:lower:] [:upper:] < names.txt > namesUpper.txt
cat names1.txt | tr [a-z] [A-Z] > names1Upper.txt 
