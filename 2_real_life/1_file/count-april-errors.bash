#!/bin/bash
# Author: Artsiom
# Date Created: 29/08/2020
# Description: This script counts number of warnings using output of another script
# Date Modified: 29/08/2020

messagesCount=`wc -l < april-errors.log`

echo "In total there were $messagesCount messages in April"
