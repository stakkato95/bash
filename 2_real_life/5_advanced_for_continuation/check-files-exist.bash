#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: CHeck whether files exist
# Modified: 29/08/2020

FILES="/etc/passwd
/etc/group
/etc/shadow
/etc/nsswitch.conf'
/etc/sshd_ssh_config
/etc/fake"

echo
for file in $FILES
do
	if [ ! -e $file ]
	then
	echo $file does not exist
	fi
done
