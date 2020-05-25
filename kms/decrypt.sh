#!/usr/bin/env bash

#aws kms decrypt --ciphertext-blob fileb:///Users/yu.zhang2/WorkSpace/aws-tranning/kms/secrets.encrypted.json --output text --query Plaintext

aws kms decrypt --ciphertext-blob fileb:///Users/yu.zhang2/WorkSpace/aws-tranning/kms/secrets.encrypted.json --output text --query Plaintext | base64 --decode > secrets.decrypted.json
