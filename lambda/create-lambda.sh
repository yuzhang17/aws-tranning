#!/usr/bin/env bash

zip function.zip index.js
aws lambda create-function --function-name zhangyu-helloworld-with-awscli \
--zip-file fileb:///Users/yu.zhang2/WorkSpace/aws-tranning/lambda/aws-cli-js/function.zip --handler index.handler --runtime nodejs12.x \
--role arn:aws:iam::494526681395:role/for-aws-training-2