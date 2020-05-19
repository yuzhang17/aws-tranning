#!/usr/bin/env bash

aws lambda invoke --function-name zhangyu-helloworld-with-awscli out --log-type Tail \
--query 'LogResult' --output text |  base64 -d