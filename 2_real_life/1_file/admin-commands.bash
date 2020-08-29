#!/bin/bash
# Author: Artsiom
# Date Created: 29/08/2020
# Description: Format the output of admin commands
# Date Modified: 29/08/2020

date | awk '{print $1}'
uptime | awk '{print $3}'
df -h | grep gnome
