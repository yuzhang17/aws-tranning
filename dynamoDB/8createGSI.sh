#!/usr/bin/env bash


aws dynamodb update-table \
    --table-name Project_ZHANGYU \
    --attribute-definitions AttributeName=mumberName,AttributeType=S \
        AttributeName=startDate,AttributeType=S \
    --global-secondary-index-updates \
    "[{\"Create\":{\"IndexName\": \"mumberName-index\",\"KeySchema\":[{\"AttributeName\":\"mumberName\",\"KeyType\":\"HASH\"}], \
    \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
