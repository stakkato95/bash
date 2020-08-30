#!/bin/bash
# Author: Artsiom
# Date: 30/08/2020
# Description: Add a record to or delete a record from a "database.txt" file
# Modified: 30/08/2020

clear

echo Select an option
echo "a = add a record"
echo "d = delete a record"
read choice

case $choice in
a) ./add-record.bash;;
d) ./del-record.bash;;
*) echo Unknown option
esac
