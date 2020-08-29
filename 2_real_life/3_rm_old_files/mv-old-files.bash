#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Delete file older than 90 days
# Modified: 29/08/2020

find $(pwd) -mtime +90 -exec mv {} {}.old \;
