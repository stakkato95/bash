#!/bin/bash
# Author: Artsiom Kaliaha
# Date Created: 28/08/2020
# Description: This is a script for administrating some stuff
# Date Modified: 28/08/2020

echo
echo This script will run basic administratign commands
echo

top | head -10
echo

df -h | head -10
echo

free -m
echo

uptime
echo
