#!/bin/bash
# Author: Artsiom
# Date: 08/09/2020
# Description: Show basic commands for pkg mgrs
# Modified: 08/09/2020

# resources for RPM packages
# http://mirrors.kernel.org
# http://rpm.pbone.net
# http://rpmfusion.org.

# show info about a package, its files and configs
rpm -si bash
rpm -ql bash
rpm -qc bash

# show install time of a package
rpm -q --qf "[%{INSTALLTIME:date}\n]" bash
rpm -q --qf "[%{INSTALLTIME:date} - %{GROUP} - %{NAME} - %{SUMMARY}\n]" bash

# show packages depending on an INSTALLED package
rpm -q --whatrequires bash

# show packages depending on a NOT INSTALLED package
rpm -qip nodejs 

# download an RPM package
dnf download lynx

# make a test installation of the package (package is not actually installed)
sudo rpm --install --test --verbose --hash lynx

# install packages (RPM doesn't resolve missing dependencies)
sudo rpm -ivh lynx-*

# check which package provides a certain library
dnf whatprovides libmpc.so.*

# check consistency of all packages on the system
sudo dnf -Va
