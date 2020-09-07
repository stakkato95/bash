#!/bin/bash
# Author: Artsiom
# Date: 07/09/2020
# Description: Most important cmds for rpm package manager
# Modified: 07/09/2020

# show info about an instellaed package
rpm -qi glibc

# show dependencies
rpm -qR glibc

# check consistency of an installed package (no files are changed)
rpm -qV glibc

# check files from this package
rpm -qlv glibc

# show dependencies of a shared object
ldd /bin/bash

# list available updates
yum list updates

# show repos used by yum
yum repolist

# install a group of packages
yum grouplist

# show dependenciess of a systemd target
ls -l /usr/lib/systemd/system/multi-user.target.wants/

# show how to start a service
less /usr/lib/systemd/system/nginx.service

# check log rotation of a specific service
less /etc/logrotate.d/nginx
