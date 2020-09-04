#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show information about huge pages in kernel config file
# Modified: 03/09/2020

sysctl -a 2>/dev/null | grep "huge"
