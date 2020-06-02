#!/usr/bin/env bash

aws dynamodb update-table \
    --table-name Project_ZHANGYU \
    --attribute-definitions \
        AttributeName=projectName,AttributeType=S \
        AttributeName=projectType,AttributeType=S \
        AttributeName=mumberName,AttributeType=S \
        AttributeName=startDate,AttributeType=S \
    --provisioned-throughput ReadCapacityUnits=20,WriteCapacityUnits=10

