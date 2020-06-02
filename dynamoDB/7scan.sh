#!/usr/bin/env bash

aws dynamodb scan \
     --table-name Project_ZHANGYU \
     --filter-expression "projectName = :name" \
     --expression-attribute-values '{":name":{"S":"project1"}}'