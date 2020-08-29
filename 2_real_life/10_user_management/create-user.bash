#!/bin/bash
# Author: Artsiom
# Date: 29/08/2020
# Description: Create a new user
# Modified: 29/08/2020

echo Please provide a user name?
read u

userInPasswd=$(grep -c $u /etc/passwd)
if [ $userInPasswd -eq 0 ]
then
	echo Please provide a comment?
	read comment

	echo "Do you want to provide a user ID (y/n)?"
	read assignId
	if [ $assignId == y ]
	then
		echo Please enter user id?
		read uid

		grep -q $uid /etc/passwd
		if [ $? -eq 0 ]
		then
			echo User with id $uid already exists
			exit 1
		fi

		useradd $u -c "$comment" -u $uid
	elif [ $assignId == n ]
	then
		echo No worries we will assign an id!
		useradd $u -c "$comment"
	else
		echo Unknown decision
		exit 1
	fi

	if [ $? -eq 0  ]
	then
		echo $u account has been created
		exit 0
	else
		echo Run script with sudo
		exit 1
	fi
fi

echo $u already exists
exit 1
