#!/bin/bash
# Author: Artsiom
# Date: 20/09/2020
# Description: Linux networking lab
# Modified: 20/09/2020


# Command descriptions
# https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf

# ip link - show information about interfaces
# ip link set dev eth0 down - bring interface up / down

# ip addr - what IP addresses have been assigned to interfaces (like call to ifconfig without parameters)
# ip -4 addr - only IPv4
# ip -6 addr - only IPv6
# ip -4 addr show wlan0 - only IPv4 for an interface

# ip route - show routing table; list all route entries in the kernel
# ip route add default via 192.168.1.254
# ip route add 192.168.1.0/24 dev eth0 - route all traffic via 192.168.1.254 gateway connected via eth0 interface

# traceroute - display possible routes and transit delays of packets
# nslookup - query DNS

# show information about ethernet interface
ethtool enp0s3
# show information about wireless interface
# https://www.2daygeek.com/linux-find-out-wireless-network-wifi-speed-signal-strength-quality/
sudo ethtool -i wlp4s0 # wifi kernel driver, firmware version and bus info
iwconfig wlp4s0 # ifconfig for wireless
iwlist wlp4s0 scan # display some additional information not displayed by iwconfig

# ip neigh - show MAC addresses of ARP-discovered devices
arp -i wlp4s0 # show devices reachable from a certain interface



# Network adapter management (ip link)
# show mac address of enp0s8 interface
ip link show enp0s8 | tail -1 | awk -F" " '{print $2}'
# set intrface up / down
sudo ip link set dev enp0s8 up
# set new intrface MAC address
sudo ip link set dev enp0s8 address XX:XX:XX:XX:XX:XX


# IP configuration (ip addr)
# Show the IP address, netmask and broadcast of VM
ip a show wlp4s0 | head -3 | tail -1
# Show the routing table of VM. Give the description for each line from the table.
# http://linux-ip.net/html/tools-ip-route.html
ip route
route -n
# Find the MAC address of the default gateway.
arping -I wlp4s0 -c 1 192.168.1.1 | sed -n '2 p' | awk -F" " '{print $5}'


# Router in linux
# for netowrk in VirtualBox apply rules from
# https://www.brianlinkletter.com/how-to-use-virtualbox-to-emulate-a-network/
# 1 configure interfaces and addresses on all machines
# https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-configure-centos-7-network-settings/
# 2 enable ip forward on router machine https://wiki.centos.org/TipsAndTricks/IPForwarding
# 3 add router as gateway for machine from 1st network to access 2nd network
# add router as gateway for machine from 2nd network to access 1st network
# https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/
