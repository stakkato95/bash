#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show process info
# Modified: 03/09/2020

less /proc/1/status

# show open file descriptors
sudo ls -l /proc/6656/fd | wc -lq

# show number of opened sockets in firefox process
sudo ls -l /proc/4471/fd | grep "socket" | wc -l

# show total number of opened descriptors in firefox process
sudo ls -l /proc/4471/fd | wc -l

# show total number of opened descriptors in firefox process (alternative)
firefox_proc_id=$(ps -ef | grep "firefox" | head -1 | awk '{print $2}')
lsof -p $firefox_proc_id | awk '{print $5}' | sort | uniq -c

# show current working dir of firefox process
lsof -p  $firefox_proc_id | grep "cwd"

# show environment vars of a process
# (not all chars in "environ" are printable. "strings" prints each env variable in a new line
sudo strings /proc/4471/environ

# show utilization of resources by a process
sudo perf stat -p 4471
