#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show disk utilization
# Modified: 03/09/2020

# show disk utilization (block written and read per second and total num of blocks read and written)
iostat -md 1 sda
