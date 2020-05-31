#!/usr/bin/env bash

aws kms encrypt --key-id 784c6d3f-9528-4d9b-8c64-6d6f3707dace --plaintext fileb:///Users/yu.zhang2/WorkSpace/aws-tranning/kms/plaintFile.json --output text --query CiphertextBlob | base64 --decode > secrets.encrypted.json


#aws kms encrypt --key-id 784c6d3f-9528-4d9b-8c64-6d6f3707dace  --plaintext file:///Users/yu.zhang2/WorkSpace/aws-tranning/kms/plaintFile.json

#{
#    "CiphertextBlob": "AQICAHgvGHfRwbbKkrOJHxaYouxixT/jTFeShdiqCljv/SXRSQEsh8KNagirk3WrChvnsDfRAAAAzzCBzAYJKoZIhvcNAQcGoIG+MIG7AgEAMIG1BgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDL0Hn88UJL1qDLz35wIBEICBh0kowJI3ryZ/lC4ryeaocGinkIkxypKeWKAW+TpDU3HbfAMtIVjvoYDs8zPAhv28oikxqeXjMGaWO4c6WLvEaOHZ3tDyjOH9s2tZ5FOjlsLW4Vk5hEDHKQKgyPDFCijuuLLSXFKmY1VOgN4Mkw4Tyo+gOzH1SJklnHrdYBWkjozl1EsEYiMkjw==",
#    "KeyId": "arn:aws:kms:ap-southeast-1:494526681395:key/784c6d3f-9528-4d9b-8c64-6d6f3707dace",
#    "EncryptionAlgorithm": "SYMMETRIC_DEFAULT"
#}
