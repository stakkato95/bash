#!/bin/bash
# Author: Artsiom
# Date Created: 29/08/2020
# Description: This script only error messages from /var/log/messages (file should be copied to the local directory)
# Date Modified: 29/08/2020

grep -i "Apr" ./messages.log > april-errors.log
