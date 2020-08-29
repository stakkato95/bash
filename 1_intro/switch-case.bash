#!/bin/bash
# Author: Artsiom
# Date Created: 28/08/2020
# Description: This is a test for switch-case
# Date Modified: 28/08/2020

clear
echo
echo Please choose one of the options below
echo
echo 'a = date and time'
echo 'b = list files'
echo 'c = list logged in users'
echo 'd = check system up time'

	read choices

	case $choices in

a)
date
echo Date has been printed;;
b) ls;;
c) who;;
d) uptime;;
*) echo Invalid input. Bye.

	esac
