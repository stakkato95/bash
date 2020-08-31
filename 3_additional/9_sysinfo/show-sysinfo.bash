#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Show all sys information
# Modified: 31/08/2020

echo Hostname
hostname
cat /etc/hostname
echo

echo Detailed sys info
uname -a
echo

echo RAM usage
free -h
echo

echo Disk usage
df -h | grep -v "/dev/loop*"
echo

echo Size of file in home dir
di -sh ~
echo

echo CPU info
cat /proc/cpuinfo | head -20
echo
