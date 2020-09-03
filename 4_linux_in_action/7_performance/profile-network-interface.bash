#!/bin/bash
# Author: Artsiom
# Date: 02/09/2020
# Description: Trace packets on an interface (iftop) and for all processes (nethogs)
# Modified: 02/09/2020

sudo iftop -i wlp4s0
nethogs

# show number of packets sent RX and received RX by each network interface
netstat

# show interfaces that are receiving packages
netstat -i | awk '($3 != 0) {print}'

# scan ports
nc -z -v google.com 80
