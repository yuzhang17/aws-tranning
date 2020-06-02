#!/usr/bin/env bash

aws dynamodb query \
    --table-name Project_ZHANGYU \
    --key-condition-expression "projectName = :name" \
    --expression-attribute-values  '{":name":{"S": "project1"}}'


aws dynamodb query \
    --table-name Project_ZHANGYU \
    --key-condition-expression "projectName = :project_name and projectType = :project_type " \
    --expression-attribute-values  '{":project_name":{"S": "project1"}, ":project_type":{"S": "projectType1"}}'