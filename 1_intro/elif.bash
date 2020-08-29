#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Test elif statement
# Modified: 29/08/2020

SHELL="bash"

if [ $SHELL == "zsh" ]
then
echo "Your shell is zsh"
elif [ $SHELL == "csh" ]
then
echo "Your shelle is csh"
else
echo "Your shell is different"
fi
