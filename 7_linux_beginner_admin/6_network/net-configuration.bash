#!/bin/bash
# Author: Artsiom
# Date: 11/09/2020
# Description: Show basic network commands
# Modified: 11/09/2020

# list all network drivers
ls /lib/modules/$(uname -r)/kernel/drivers/net

# show description of a driver
modinfo mdio | grep -i description

# show ip address for an interface
nmcli -f ip4.address device show wlp4s0

# ifconfig show curretn address and update it
ifconfig -a
sudo ifconfig dev enp0s3 10.0.2.16 netmask 255.255.255.0 broadcast 10.0.2.255

# ip show current address, add one more ip address and delete previous ip address
ip a
sudo ip address add 10.0.2.17/24 broadcast 10.0.2.255 dev enp0s3
sudo ip a ad 10.0.2.17/24 broadcast 10.0.2.255 dev enp0s3 # short version of the line above
sudo ip address del 10.0.2.16/24 broadcast 10.0.2.255 dev enp0s3

# nmcli create new connection
sudo nmcli connection add con-name foobar-ip4 ifname enp0s3 type ethernet ip4 10.0.2.18/24

# ifconfig - low level (deprecated)
# ip - low level (new)
# nmcli - high level (multiple connections per device, only 1 con active at a point in time)

# show ip6 addr
ip -6 a
nmcli -f ip6.address connection show enp0s3
nmcli -f ip6.address c s enp0s3 # short version of the line above

# show configurations for files at "/etc/sysconfig/network-scripts/"
less /usr/share/doc/initscripts/sysconfig.txt

# interfaces definition
# Ubuntu /etc/network/interfaces
# CentOS /etc/sysconfig/network-scripts
