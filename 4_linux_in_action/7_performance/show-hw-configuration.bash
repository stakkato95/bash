#!/bin/bash
# Author: Artsiom
# Date: 02/09/2020
# Description: Show info about hardware
# Modified: 02/09/2020

# info about usb devices
sudo susb

# info about all hardware
sudo lshw -html > hw-info.html

# show info only about memory
sudo lshw -c memory

# show network adapter
lspci | egrep "Network|Ethernet"
lshw -c network
