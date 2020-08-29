#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Disable users with a modern script syntax
# Modified: 29/08/2020

lastlog | tail -n+2 | grep test | awk '{print $1}' | xargs -I{} usermod -L {}
