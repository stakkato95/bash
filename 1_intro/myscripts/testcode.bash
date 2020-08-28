#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: Some test script
# Date Modified: 28/08/2020

ls -l /home/artsiom

if [[ $? -eq 0 ]]
then
  echo Success
else
  echo Error
fi
