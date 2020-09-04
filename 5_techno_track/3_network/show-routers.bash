#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show path to a destination server
# Modified: 03/09/2020

# mtr = traceroute + ping
mtr onliner.by

# Protocols
# Adress Resolution Protocol (resolve host in local net)
# IPv4 - packet switching, Internet Control Message Protocol - report dropped packets, Internet Group Management P - multicast (for video streaming)
# Domain Name System

# track TCP packet transfer
sudo tcpdump -As0 -i any port 80 and host 77.88.55.80
