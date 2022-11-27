#!/bin/bash

CONN_NAME='aws-sagemaker'

if [ -z "$AWS_ACCESS_KEY_ID" ]; then echo "Missing AWS_ACCESS_KEY_ID in environment"; FAIL=true; fi
if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then echo "Missing AWS_SECRET_ACCESS_KEY in environment"; FAIL=true; fi
if [ -z "$AWS_SESSION_TOKEN" ]; then echo "Missing AWS_SESSION_TOKEN in environment"; FAIL=true; fi

if [ ! -z "$FAIL" ]; then exit 1; fi

if [ -z "$AWS_DEFAULT_REGION" ]; then AWS_DEFAULT_REGION=us-east-2; fi

PROJNAME=$(basename $PWD)
SCHEDULER=$(docker ps | grep $PROJNAME | grep scheduler- | cut -f1 -d' ')

docker exec -it $SCHEDULER airflow connections add $CONN_NAME \
    --conn-json "{
        \"conn_type\": \"aws\",
        \"login\": \"$AWS_ACCESS_KEY_ID\",
        \"password\": \"$AWS_SECRET_ACCESS_KEY\",
        \"extra\": {
            \"aws_session_token\": \"$AWS_SESSION_TOKEN\",
            \"region_name\": \"$AWS_DEFAULT_REGION\"
        }
    }"
