#!/usr/bin/env bash
aws cloudformation deploy --template-file cloudformation.yaml --stack-name "zhangyu-lambda-triger-with-s3-copy"
