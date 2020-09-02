#!/bin/bash
# Author: Artsiom
# Date: 02/03/2020
# Description: Show number of files in each directory
# Modified: 02/09/2020

find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n
