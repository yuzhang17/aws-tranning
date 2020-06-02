#!/usr/bin/env bash

 aws dynamodb query \
    --table-name Project_ZHANGYU \
    --index-name mumberName-index \
    --key-condition-expression "mumberName = :name" \
    --expression-attribute-values  '{":name":{"S":"name1"}}'