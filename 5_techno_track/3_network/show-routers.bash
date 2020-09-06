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

# show mail servers
dig MX google.com

# debug NTP protocol
ntpdate -d -b ntp.zenon.net

# check thertificates of google
openssl s_client -connect www.google.com:443

# check google's certificate content
openssl asn1parse -in google.crt

# show info about ethernet cards
ethtool -S eth0

# show info about WLAN card
iwconfig

# settings of a socket in kernel
sysctl net.ipv4.tcp_wmem # TX - transmit | SO_SNDBUF
sysctl net.ipv4.tcp_rmem # RX - receive | SO_RCVBUF

# show HTTP2 packages
nghttp -nv https://www.facebook.com

# list ipv4 settings
cat /proc/sys/net/ipv4

# check congestion control algorithm
cat /proc/sys/net/ipv4/tcp_congestion_control
