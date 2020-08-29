#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Kills process
# Modified: 29/08/2020

ps -ef | grep "sleep 900" | grep -v grep | awk '{print $2}' | xargs -I{} kill {}

echo All sleeping processes are killed
