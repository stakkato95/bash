#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Copy files to remote host
# Modified: 29/08/2020

for host in redhat1 redhat2
do
	scp somefile $host:/tmp
done
