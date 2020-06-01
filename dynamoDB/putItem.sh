#!/usr/bin/env bash

aws dynamodb put-item \
--table-name Project_ZHANGYU  \
--item \
    '{"projectName": {"S": "No One You Know"}, "projectType": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}, "Awards": {"N": "1"}}'

aws dynamodb put-item \
    --table-name Music \
    --item \
    '{"Artist": {"S": "Acme Band"}, "SongTitle": {"S": "Happy Day"}, "AlbumTitle": {"S": "Songs About Life"}, "Awards": {"N": "10"} }'
