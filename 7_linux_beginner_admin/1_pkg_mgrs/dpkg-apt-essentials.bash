#!/bin/bash
# Author: Artsiom
# Date: 09/09/2020
# Description: Show basic commands for dpkg and apt
# Modified: 09/09/2020

# list all installed packages
dpkg -l

# detailed info about a package
dpkg --print-avail bash
dpkg-query -L bash
dpkg-query -W --showformat='${Package} ${Installed-Size}\n' bash

# delete a package completely (including all configs)
sudo apt purge qemu-kvm

# install from source dode
# ./configure
# make
# sudo make install

# path of libs
# /urs/lib
# /usr/lib64
# /usr/local/lib

# show default paths for libs
cd /etc/ld.so.conf.d/
cat fakeroot-x86_64-linux-gnu.conf  libc.conf x86_64-linux-gnu.conf | grep -v "#"
# config file for the files above
/etc/ld.so.conf

