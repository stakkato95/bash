#!/bin/bash
# Author: Artsiom
# Date: 11/09/2020
# Description: Show basic cmds for firewall management
# Modified: 11/09/2020

# protocols supported by iptables
less /etc/protocols

# show Netfilter rules for all tables
sudo iptables -L
# show Netfilter rules for "nat" table
sudo iptables -t nat -L

# create a chain called to_net10 that handles all the packets destined to the 10.0.0.0/8 network that is going through the FORWARD chain
# at the end to_net10 chain returns control back to the FORWARD chain
iptables -t filter -N to_net10
iptables -t filter -A FORWARD -d 10.0.0.0/8 -j to_net10
iptables -t filter -A to_net10 -j RETURN
# -d destination
# -j jump

# accept all packets destined to TCP port 80 on the INPUT chain
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p ! tcp --dport 80 -j ACCEPT # accept all non-TCP packets
# -p protocol

# drop all packets from the 172.16.0.0/16 (172.16.0.0/255.255.0.0)
iptables -t filter -A INPUT -s 172.16/16 -j DROP

# allow all packets going through the FORWARD chain that are destined for the 10.100.93.0/24 network
iptables -t filter -A FORWARD -d 10.100.93.0/24 -j ACCEPT

# allow to send packets arriving at interface eth1 with destination 10.4.3.2
iptable -A FORWARD -i eth1 -d 10.4.3.2 -j ACCEPT

# forward packets arriving at "enp2s0" to "eth1"
iptables -A FORWARD -i enp2s0 -o eth1 -j ACCEPT

# disable ping on all ports
iptables -t filter -p icmp -A INPUT -m icmp --icmp-type echo-request
# -m extension module

# list all supported ICMP packet types
iptables -m icmp -h
# list all supported TCP packet types
iptables -m tcp -h

# avoid SYN flood
iptables -N syn-flood
iptables -A INPUT -p tcp --syn -j syn-flood
iptables -A syn-flood -m limit --limit 1/s -j RETURN
iptables -A syn-flood -j DROP

# drop new TCP connections without a SYN flag set
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
# "-p tcp ! --syn" if packet is a non SYN TCP packet
# "-m state --state NEW" if packet is a part of a new connection

# firewalld config files
# /usr/lib/firewalld
# /etc/firewalld

# start firewall
systemctl status firewalld.service
systemctl start firewalld.service
firewall-cmd --state

# get current zones
sudo firewall-cmd --get-default-zone
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --get-zone-of-interface=wlp4s0

# forward all traffic on port 80 on your server to port 443 on another server whose IP address is 10.0.0.10
sudo firewall-cmd --zone=public --add-forward-port=port=80:proto=tcp:toaddr=10.0.0.10:toport=443

# save currently running iptables
sudo iptables-save > iptables

# enable SNAT
sudo modprobe iptable_nat
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
sudo iptables-save > /etc/sysconfig/iptables # make the iptables configuration part of your startup script
sudo iptables -t nat -L # check if rule is added

# ip forwarding status
sysctl net.ipv4.ip_forward
cat /proc/sys/net/ipv4/ip_forward
# enable ip forwarding
sysctl -w net.ipv4.ip_forward=1
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
# disable ip forwarding
sysctl -w net.ipv4.ip_forward=0
echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
# permanently enable
sysctl -w net.ipv4.ip_forward=1 >> /etc/sysctl.d/99-sysctl.conf

# block incoming SSH
sudo iptables -t filter -A INPUT -p tcp --destination-port 22 -j DROP

# NAT for OUTPUT. Reroute  google.com -> yandex.com (check if it works)
sudo iptables -t nat -A OUTPUT -d 216.58.201.78 -j DNAT --to-destination 5.255.255.80

# Block all connections to onliner.by
sudo iptables -t filter -A INPUT -s 178.124.129.12 -j DROP
sudo iptables -t filter -A INPUT -s 178.124.129.14 -j DROP
sudo iptables -t filter -A INPUT -s 178.124.129.16 -j DROP

# DNAT is done in PREROUTING
# SNAT is done in POSTROUTING (aka MASQUERADE)
https://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html

# create a firewall declining all incoming connections
sudo modprobe iptable_nat
sudo modprobe ip_nat_ftp
sudo iptable -P INPUT DROP
sudo iptable -P FORWARD DROP
sudo iptable -P OUTPUT DROP
sudo iptable -t nat -P POSTROUTING ACCEPT # -P defines default policy
sudo iptable -t nat -P PREROUTING ACCEPT
# define new chain allowing new connection only from the private network (eth1), not from the internet (eth0)
sudo iptables -N block
sudo iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT #load module "state" and allow established connections
sudo iptables -A block -m state --state NEW ! -i eth0 -j ACCEPT # allow new connections coming NOT from the internet
sudo iptables -A block -j DROP 
# call "block" chain from INPUT and FORWARD chains
sudo iptables -A INPUT -j block
sudo iptables -A FORWARD -j block
# apply masquerading (aka SNAT) to outgoing connections from interface eth0, i.e. going to the internet
sudo iptable -t nat -A POSTROUTING -o eth0 -j MASQUERADE	
# enable ip forwarding and SYN cookie protection, ignore ICMP broadcasts
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
echo 1 | sudo tee /proc/sys/net/ipv4/tcp_syncookies
echo 1 | sudo tee /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts 
# enable SSH to a host behind NAT and enable usage of a torrent client behind NAT
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp -dport 22 -j DNAT --to-destination 172.16.1.3 --dport 22 -j ACCEPT
sudo iptables -I FORWARD -p tcp -d 172.16.1.3 --dport 22 -j ACCEPT #after destination is changed, allow forwarding it to target host
# enable torrent
sudo iptables -t nat -A PREROUTING -t etho -p tcp -dport 6881:6889 -j DNAT --to-destination 172.16.1.2
sudo iptables -I FORWARD -p tcp -d 172.16.1.2 --dport 6881:6889 -j ACCEPT


https://www.debuntu.org/how-to-redirecting-network-traffic-to-a-new-ip-using-iptables/
http://gsoc-blog.ecklm.com/iptables-redirect-vs.-dnat-vs.-tproxy/
http://linux-ip.net/html/nat-dnat.html
http://linux-training.be/security/ch11.html
https://learning.oreilly.com/library/view/linux-iptables-pocket/9780596801861/
https://www.booleanworld.com/depth-guide-iptables-linux-firewall/
https://пантюхин.рф/%D0%BE%D0%B8%D0%B1/lr8.html
https://www.cyberciti.biz/faq/how-to-list-all-iptables-rules-in-linux/
https://habr.com/ru/post/473222/
https://habr.com/ru/sandbox/18975/
https://www.booleanworld.com/depth-guide-iptables-linux-firewall/
https://www.karlrupp.net/en/computer/nat_tutorial

