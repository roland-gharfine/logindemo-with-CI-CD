#!/bin/bash

echo "########BUILDING########"
echo

cd logindemo

mvn install || exit 1

echo
echo "########Unit/Integration Testing########"
#mvn clean verify -P Unit-Testing
