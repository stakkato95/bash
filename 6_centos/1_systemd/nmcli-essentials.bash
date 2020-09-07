#!/bin/bash
# Author: Artsiom
# Date: 08/09/2020
# Description: Show common nmcli (NetworkManager CLI) cmds
# Modified: 08/09/2020

# show network reachability and state of network in general
nmcli general status

# info about a specific device and all devices
nmcli device show enp0s3
nmcli dev status

# NIC -> device (physical + virtual devices like loopback) -> connection (like a session) -> interface (connection profile)
nmcli con show

# enable disable connection
nmcli con down enp0s3
nmcli con down enp0s3
