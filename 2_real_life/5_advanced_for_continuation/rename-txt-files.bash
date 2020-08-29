#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Script renames files with txt-extension
# Modified: 29/08/2020

for file in *.txt
do
	mv $file ${file%.txt}.none
done
