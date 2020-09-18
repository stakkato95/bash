#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Show creation of a basic container with docker
# Modified: 18/09/2020

docker build -t myfirstapp .
docker run --rm -d -p 127.0.0.1:8080:80 myfirstapp
curl http://127.0.0.1:8080

# stop all running containers
sudo docker stop $(docker ps -aq)
