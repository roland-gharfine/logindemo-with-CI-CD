#!/bin/bash


echo "Creating container image"
echo

cp logindemo/target/logindemo-*.jar docker-performance/
cp -r ServerAgent-2.2.3/ docker-performance/
cd docker-performance

sudo docker build . -t logindemo-performance || exit 1

CONTAINER=logindemo-latest-performance
RUNNING=`sudo docker inspect $CONTAINER`

if [ $? -eq 1 ]
then
	echo "Container is not running"
else
	echo "Container is already running, stopping existing container..."
    sudo docker stop logindemo-latest-performance || exit 1
	sudo docker rm logindemo-latest-performance || exit 1

fi

echo "Launching performance test container"
sudo docker run -d -p 8280:8080 -p 4444:4444 --name logindemo-latest-performance -t logindemo-performance || exit 1

