#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description:
# Modified: 29/08/2020

userToDisable=$(lastlog -b 90 | tail -n+2 | grep test | awk '{print $1}')

for u in $userToDisable
do
	echo Disabling $u...
	usermod -L $u
done
