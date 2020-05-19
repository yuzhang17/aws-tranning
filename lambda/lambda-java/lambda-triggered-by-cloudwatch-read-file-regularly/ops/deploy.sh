#!/usr/bin/env bash
aws cloudformation deploy --template-file cloudformation.yaml --stack-name "zhangyu-lambda-triggered-by-cloudwatch-read-file-regularly"
