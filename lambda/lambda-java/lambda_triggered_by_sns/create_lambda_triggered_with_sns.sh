#!/usr/bin/env bash
#Create an Amazon SNS topic
#arn:aws:sns:ap-southeast-1:494526681395:lambda-x-account
aws sns create-topic --name zhangyu-sns-topic
#"TopicArn": "arn:aws:sns:ap-southeast-1:494526681395:zhangyu-sns-topic"



aws sns subscribe --protocol lambda --topic-arn arn:aws:sns:ap-southeast-1:494526681395:zhangyu-sns-topic --notification-endpoint arn:aws:lambda:ap-southeast-1:494526681395:function:zhangyu-lambda-sns

#    "SubscriptionArn": "arn:aws:sns:ap-southeast-1:494526681395:zhangyu-sns-topic:2940f0c6-a23c-493c-8c9b-08bda7571a80"

aws lambda create-function --function-name zhangyu-lambda-sns \
--zip-file fileb:///Users/yu.zhang2/WorkSpace/aws-tranning/lambda/lambda-java/lambda_triggered_by_sns/funciton.zip --handler index.handler --runtime nodejs12.x \
--role arn:aws:iam::494526681395:role/for-aws-training-2

{
    "FunctionName": "zhangyu-lambda-sns",
    "FunctionArn": "arn:aws:lambda:ap-southeast-1:494526681395:function:zhangyu-lambda-sns",
    "Runtime": "nodejs12.x",
    "Role": "arn:aws:iam::494526681395:role/for-aws-training-2",
    "Handler": "index.handler",
    "CodeSize": 358,
    "Description": "",
