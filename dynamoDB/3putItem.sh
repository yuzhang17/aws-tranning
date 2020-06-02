#!/usr/bin/env bash

aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project1"}, "projectType": {"S": "projectType1"}, "paasword": {"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"}, "hasStarted": {"BOOL": true}}'

aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project2"}, "projectType": {"S": "projectType2"}, "binaryset": {"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]}, "list": {"L": [{"S": "Cookies"} , {"S": "Coffee"}, {"N": "3.14159"}]}}'


aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project3"}, "projectType": {"S": "projectType3"}, "map": {"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}}, "number set": {"NS": ["42.2", "-19", "7.5", "3.14"]}}'


aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project4"}, "projectType": {"S": "projectType4"}, "null": {"NULL": true}, "string set": {"SS": ["Giraffe", "Hippo" ,"Zebra"]}}'


aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project5"}, "projectType": {"S": "projectType5"}, "null": {"NULL": true}, "string set": {"SS": ["Giraffe", "Hippo" ,"Zebra"]}}'



aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project6"}, "projectType": {"S": "projectType6"}, "mumberName": {"S": "name1"}, "startDate": {"S": "2020-01-01"}}'


aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project7"}, "projectType": {"S": "projectType7"}, "mumberName": {"S": "name1"}, "startDate": {"S": "2020-01-01"}}'


aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project8"}, "projectType": {"S": "projectType8"}, "mumberName": {"S": "name1"}, "startDate": {"S": "2020-01-01"}}'

aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "project9"}, "projectType": {"S": "projectType9"}, "mumberName": {"S": "name1"}, "startDate": {"S": "2020-01-01"}}'
