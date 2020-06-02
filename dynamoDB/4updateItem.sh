#!/usr/bin/env bash
aws dynamodb update-item \
    --table-name Project_ZHANGYU \
    --key '{"projectName": {"S": "project1"}, "projectType": {"S": "projectType1"}}' \
    --update-expression "SET hasStarted = :newval" \
    --expression-attribute-values '{":newval":{"BOOL":false}}' \
    --return-values ALL_NEW