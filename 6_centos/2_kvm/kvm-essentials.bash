#!/bin/bash
# Author: Artsiom
# Date: 08/09/2020
# Description: Show basic commands for KVM with virt
# Modified: 08/09/2020

# create a VM via command line
sudo virt-install --name MyFedora --memory 1024 --disk path=~/Documents/MyFedora.img,size=10 --network network=default --os-variant fedora28 --cdrom ~/Downloads/Fedora-Server-dvd-x86_64-32-1.6.iso
 
# start / stop VM
virsh start MyFedora
virsh stop MyFedora
