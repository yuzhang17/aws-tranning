#!/usr/bin/env bash

aws dynamodb create-table \
    --table-name Project_ZHANGYU \
    --attribute-definitions \
        AttributeName=projectName,AttributeType=S \
        AttributeName=projectType,AttributeType=S \
    --key-schema \
        AttributeName=projectName,KeyType=HASH \
        AttributeName=projectType,KeyType=RANGE \
--provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5