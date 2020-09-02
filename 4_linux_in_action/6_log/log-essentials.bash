#!/bin/bash
# Author: Artsiom
# Date: 02/09/2020
# Description: Show information about logs in the system
# Modified: 02/09/2020

# log levels in linux: emerg, debug, info, notice, warning, err, crit, and alert
# count warnings on 1st of september
journalctl -p warning | grep "Sep 01" | wc -l

# print last 10 entries of the log and listen to new ones
journalctl -f

# print critical messages since yesterday
journalctl --since yesterday -p crit

# print log in timeframe
journalctl --since "2020-09-01 18:00:00" --until "2020-09-02 10:00:00"
