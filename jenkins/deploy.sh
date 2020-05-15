#!/bin/bash


echo "Creating container image"
echo

cp logindemo/target/logindemo-*.jar docker/
cd docker

sudo docker build . -t logindemo || exit 1

CONTAINER=logindemo-latest
RUNNING=`sudo docker inspect $CONTAINER`

if [ $? -eq 1 ]
then
	echo "Container is not running"
else
	echo "Container is already running, stopping existing container..."
    sudo docker stop logindemo-latest || exit 1
	sudo docker rm logindemo-latest || exit 1

fi

echo "Launching container"
sudo docker run -d -p 8180:8080 --name logindemo-latest -t logindemo || exit 1

