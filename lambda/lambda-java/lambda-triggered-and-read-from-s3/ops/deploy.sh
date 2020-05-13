#!/usr/bin/env bash
aws cloudformation deploy --template-file cloudformation.yaml --stack-name "zhangyu-lambda-trigered-and-read-from-s3"
