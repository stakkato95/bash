#!/bin/bash
# Author: Artsiom
# Date: 10/09/2020
# Description: Show basic cmds to work with virtual file systems

# avoid SYN DDOS
echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.conf

# list all loaded kernel modules
less /proc/modules

# list all detected physical devices
ls -l /sys/devices

# /proc - kernel runtime settings
# /sys - device settings
# /tmp - tmp files (size = RAM / 2)
