#!/bin/bash

SCHEDULER=$(docker ps | grep airflow | grep scheduler- | cut -f1 -d' ')

# put sagemaker_role_name and bucket_id in env vars
eval $( terraform output | sed 's/ = /=/' )

set -x
docker exec -it -e PYTHONWARNINGS=ignore $SCHEDULER airflow variables set role $sagemaker_role_name
docker exec -it -e PYTHONWARNINGS=ignore $SCHEDULER airflow variables set s3_bucket $bucket_id


