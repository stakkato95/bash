#!/bin/bash
# Author: Artsiom
# Date: 31/08/2020
# Description: Show /etc/passwd content in a nice way
# Modified: 31/08/2020

cat /etc/passwd | tail -n5 | cut -d":" --output-delimiter=" --> " -f1,7
