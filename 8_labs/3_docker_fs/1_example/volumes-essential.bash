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

# host    volume "docker run -v hostpath:contpath"      - maping host path <--> container path
# anonym. volume "docker run -v contpath"               - mount vol at contpath, shareable w/ other cont. "--volumes-from", vol is del when cont. is del
# named   volume "docker run -v dockervolname:contpath" - mount vol at contpath, vol is managed by docker and has a name, vol is not del when cont. is del
# https://spin.atomicobject.com/2019/07/11/docker-volumes-explained/

# save image to file
sudo docker save -o exportedcontainer.tar mycontainer
# save container as an image
sudo docker commit mycontainer
