#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: This is a script
# Date Modified: 28/08/2020

if [[ -e ./text.txt ]]
then
  echo File exists
else
  echo File does not exist. Creating new file..
  touch text.txt
fi
