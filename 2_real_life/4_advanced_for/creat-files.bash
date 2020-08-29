#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description:
# Modified: 29/08/2020

for i in {1..3}
do
	echo "Creating file test-${i}.txt"
	touch test-$i.txt
done
