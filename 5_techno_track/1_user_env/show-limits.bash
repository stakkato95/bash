#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show limits for a user
# Modified: 03/09/2020

# limit for current user
ulimit -a

# set limits in a file
sudo less /etc/security/limits.conf
