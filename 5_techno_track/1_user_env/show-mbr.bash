#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show information about first 512 bytes of disk (a.k.a. MBR)
# Modified: 03/09/2020

sudo dd if=/dev/sda bs=512 count=1 | file -
