#!/bin/bash
# Author: Artsiom
# Date: 11/09/2020
# Description: Show basic cmds to check TCP/IP traffic
# Modified: 11/09/2020

# show Ethernet headers of current connections
sudo tcpdump -e -n

# dump ip headers
sudo tcpdump -v -n -c 2 ip

# write all traffic on interface "wlp4s0" 
# (it writes raw packets to disk to keep performance of other network bound apps acceptable)
sudo tcpdump -w trace.pcap -i wlp4s0

# read written file and filter "only ICMP packets"
sudo tcpdump -r trace.pcap -n icmp

# when connected via SSH (port 22) avoid recording your own traffic
sudo tcpdump not tcp port 22
# if your want to exclude only your SSH session and listen to other SSH sessions
sudo tcpdump "not (host 192.168.1.8 and tcp port 22)"
