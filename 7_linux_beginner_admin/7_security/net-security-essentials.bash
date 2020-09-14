#!/bin/bash
# Author: Artsiom
# Date: 14/09/2020
# Description: Show cmds for net secutrity
# Modified: 14/09/2020

# show all open ports and all listening ports
netstat -natu

# show listening connections, which don't process any request now
netstat -natu | grep "0.0.0.0:\*"

# ask a server that you SSH into, to make requests on your behalf to "another server"
# aka Local Port Forwarding - map local port to a port of that "another server"
ssh -L 8888:192.168.1.3:8080 user@44.11.22.33
# chain
# localhost:8888 -> ssh tunnel with 44.11.22.33 -> 192.168.1.3:8080
# (tunnel start)                                   (tunnel end)

# Reverse Port Forwarding
ssh -R 8888:10.0.0.3:8080 user@44.11.22.33
# chain
# 10.0.0.3:8080 <- localhost (inited ssh) <- 44.11.22.33:8888 <- some other PC in network of 44.11.22.33 initiates request
# (tunnel end)                               (tunnel start)

# security tools
# 1 nmap - scan ports
# 2 

# other tools
# 1 https://www.snort.org/ - IDS Intrusion Detection System
# 2 Nessus and OpenVAS - estended nmap
# 3 https://icinga.com/
# 4 https://www.nagios.org/
