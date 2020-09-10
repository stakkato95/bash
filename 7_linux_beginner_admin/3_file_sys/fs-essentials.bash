#!/bin/bash
# Author: Artsiom
# Date: 10/09/2020
# Description: Show basic commands to work with a file sys
# Modified: 10/09/2020

# list all disks that should be mounted at system start
less /etc/fstab

# show disks information about mounted & not mounted disks
sudo parted -l
# show info about mounted disks and partitions
sudo fdisk -l
lsblk

# creating a new disk
https://www.youtube.com/watch?v=zYkzCmGIMkA

# list process using a specific file
ps -ef | grep $(fuser -m ./Disk/hello.txt 2>1 | awk -F" " '{print $1}')

# force unmount
umount -f
# lazy unmount (only old processes can access unmounted file system)
umount -l

# force an ext4 file system to be checked
sudo fsck.ext4 -f -y /dev/sbd1
