#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Create a container with a sample Spring application
# Modified: 18/09/2020

sudo docker build -t javaapp .
sudo docker run --rm -p 8181:8080 javaapp
curl localhost:8181/ping/helloworld
