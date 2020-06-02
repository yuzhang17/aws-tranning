#!/usr/bin/env bash


#aws dynamodb update-continuous-backups \
#--table-name Project_ZHANGYU \
#--point-in-time-recovery-specification PointInTimeRecoveryEnabled=True

aws dynamodb describe-continuous-backups \
--table-name Project_ZHANGYU


#aws dynamodb restore-table-to-point-in-time \
#--source-table-name Project_ZHANGYU \
#--target-table-name Project_ZHANGYU_point \
#--use-latest-restorable-time

aws dynamodb restore-table-to-point-in-time \
--source-table-name Project_ZHANGYU \
--target-table-name Project_ZHANGYU_point \
--no-use-latest-restorable-time \
--restore-date-time 2020-06-02T20:35:44+08:00