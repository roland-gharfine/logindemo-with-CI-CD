#!/bin/bash

cd apache-jmeter-5.2.1/bin
rm results.jtl
sudo ./jmeter -n -t DemoLogin.jmx

errors=`tail -n2 results.jtl | grep -v "200,OK" | wc -l`

echo $errors

if [ $errors -ne 0 ]
then
	echo "Functional tests failed! Please check the logs."
	exit 1
fi

echo "Successfully ran functional tests"


echo "Stopping container"
echo

sudo docker stop logindemo-latest

echo
echo "Removing container"

sudo docker rm logindemo-latest
