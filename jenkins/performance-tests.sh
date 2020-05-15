#!/bin/bash

cd apache-jmeter-5.2.1/bin
rm results/results*.jtl
sudo ./jmeter -n -t DemoLogin_performance.jmx



echo "Stopping performance container"
echo

sudo docker stop logindemo-latest-performance

echo
echo "Removing performance container"

sudo docker rm logindemo-latest-performance

