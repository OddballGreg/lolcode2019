#!/bin/bash

APPNAME='lolcode'

# git pull

docker build . -t ${APPNAME}

response=$?

if [ $response == 0 ]
then
  docker tag ${APPNAME}:latest ${APPNAME}:rollback_1
  docker tag ${APPNAME} ${APPNAME}:latest
fi

echo

echo $response