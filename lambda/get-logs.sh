#!/usr/bin/env bash

aws lambda invoke --function-name zhangyu-helloworld-with-awscli --payload '{"key": "value"}' out
sed -i'' -e 's/"//g' out
sleep 15
aws logs get-log-events --log-group-name /aws/lambda/zhangyu-helloworld-with-awscli --log-stream-name $(cat out) --limit 5