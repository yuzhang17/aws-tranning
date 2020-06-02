#!/usr/bin/env bash

aws dynamodb list-backups


aws dynamodb restore-table-from-backup \
--target-table-name Project_ZHANGYU_test \
--backup-arn arn:aws:dynamodb:ap-southeast-1:494526681395:table/Project_ZHANGYU/backup/01591101004441-25d4f3d1
