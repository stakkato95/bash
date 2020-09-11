#!/bin/bash
# Author: Artsiom
# Date: 11/09/2020
# Description: Show basic cmds to setup routes
# Modified: 11/09/2020

# add default route
sudo route add -net default gw 192.168.1.1 dev eth0
sudo ip route add default via 192.168.1.1

# replace route
sudo ip route replace default via 192.168.1.1

# setup route to a host via specific interface
sudo ip route add 192.168.2.50 dev ens2
# delete route to a host
sudo route del 192.168.2.50
sudo ip route del 192.168.2.50 dev eth2o

# show routes without symbolic names
route -n
ip route show table main
ip route show table all
