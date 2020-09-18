#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Show how to mount volumes
# Modified: 18/09/2020

# mount current folder to a container
sudo docker run --rm -it -v $(pwd):/test busybox /bin/sh
sudo docker run --rm -it --mount type=bind,source=$(pwd),target=/test busybox /bin/sh

# share folder between containers
sudo docker run --name testbox -it -v /perstore busybox
sudo docker run --name testbox2 -it --volumes-from testbox busybox
# then launch both containers and try to modify content of /perstore

# create a docker managed volume and attach it to a container
# (volume is mounted at some point in file system)
sudo docker volume create vol1
sudo docker volume ls
sudo docker volume inspect vol1
sudo docker run --rm -ti -v vol1:/zpace busybox

# copy container frolder to current host folder
sudo docker cp containername:/test/hello/* ./

# copy host file to container file
sudo docker cp fileon.host  containername:fileon.container
