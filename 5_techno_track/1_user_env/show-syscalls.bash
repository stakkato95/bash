#!/bin/bash
# Author: Artsiom
# Date: 03/09/2020
# Description: Show syscalls
# Modified: 03/09/2020

# show syscalls for "ls"
strace ls

# show syscalls for process
sudo trace -p 6666

# profile process calls (in case process has poor performance because of system calls)
sudo strace -c -p 1
