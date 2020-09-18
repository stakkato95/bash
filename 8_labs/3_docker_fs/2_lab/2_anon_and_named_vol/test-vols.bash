#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Create 2 docker anonymous and named volumes
# Modified: 18/09/2020

# anonymous volumes
# create create first container
sudo docker run --name c1 -ti -v /containerdata busybox # create a file in /containerdata
# create second container with volumes from previous container
sudo docker run --name c2 -ti --volumes-from c1 busybox # check files created in /containerdata
# remove 1st container
sudo docker rm c1
# start 2nd container and check that /containerdata still exists


# name volumes
# create a named volume
sudo docker volume create containerdata
# create 1st container
sudo docker run --name c1 -ti -v containerdata:/containerdata busybox # add a file to /containerdata
# check that file exists
sudo less $(sudo docker volume inspect containerdata | grep Mountpoint | awk -F"\"" '{print $4}')/<filename>
# create 2ns container
sudo docker run --name c2 -ti -v containerdata:/containerdata busybox # update the file in /containerdata
# check file updates
sudo less $(sudo docker volume inspect containerdata | grep Mountpoint | awk -F"\"" '{print $4}')/<filename>
# remove old containes
sudo docker rm c1 c2
# check that file still exists
sudo less $(sudo docker volume inspect containerdata | grep Mountpoint | awk -F"\"" '{print $4}')/<filename>
