#!/usr/bin/env bash
aws dynamodb get-item \
    --table-name Project_ZHANGYU \
    --key '{"projectName": {"S": "project1"}, "projectType": {"S": "projectType1"}}'