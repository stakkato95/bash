#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Extract some information from ifconfig file
# Modified: 31/08/2020

ifconfig | grep -A1 -B1 -n inet | grep -v inet6 | tr -d '-' > ifconfig-processed.txt
