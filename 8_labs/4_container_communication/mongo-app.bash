#!/bin/bash
# Author: Artsiom
# Date: 18/09/2020
# Description: Create db container, container to view db content, app to insert new data to the db
# Modified: 18/09/2020

# start database container
sudo docker run -d --name mongo-server --expose 27017 -p 27017:27017 -v $(pwd)/db:/data/db -e MONGO_INITDB_ROOT_USERNAME="root" -e MONGO_INITDB_ROOT_PASSWORD="root" mongo:3.6

# start mongo express container
sudo docker run --name mongo-viewer -ti --link mongo-server -e ME_CONFIG_MONGODB_SERVER="mongo-server" -e ME_CONFIG_BASICAUTH_USERNAME="root" -e ME_CONFIG_BASICAUTH_PASSWORD="root" -e ME_CONFIG_MONGODB_ADMINUSERNAME="root" -e ME_CONFIG_MONGODB_ADMINPASSWORD="root" -p 8081:8081 mongo-express:0.54.0

# create app image
sudo docker build -t application .

# create app container
sudo docker run --name mongo-app -ti -p 8082:8080 --link mongo-server application

# open MongoExpress localhost:8081
# create database "test" and a collection "Paper"
# call localhost:8082/add/james/bookname
# check that book was added at MongoExpress localhost:8081
