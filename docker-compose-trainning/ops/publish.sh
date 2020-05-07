#!/usr/bin/env bash


docker build -f web-app/mavencache/dockerfile . -t ericzhang08/mavencache:build-1
docker tag  ericzhang08/mavencache:build-1  ericzhang08/mavencache:latest
#docker push ericzhang08/mavencache:latest