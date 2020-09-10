#!/bin/bash
# Author: Artsiom
# Date: 09/09/2020
# Description: Show basic commands to work with GRUB
# Modified: 09/09/2020

# check grub version (everything >= 1.9 is GRUB2)
rpm -qa | grep grub
dpkg -l | grep -i grub

# create a backup of MBR
dd if=/dev/sda of=/tmp/COPY_OF_MBR bs=512 count1
# check file content
xxd /tmp/COPY_OF_MBR

# check GRUB config file
sudo less /boot/efi/EFI/ubuntu/grub.cfg
