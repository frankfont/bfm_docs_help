#!/bin/bash
echo "Starting HELP $0"

NOW=$(date)
UEPOC=$(date +%s)

ENV="$1"
if [ -z "$ENV" ]; then
    ENV="beta"
    echo "Using default ENV"
fi    
BUCKET="bigfathom-docs-${ENV}"
S3_PATH="s3://${BUCKET}/help/"

CMD="aws s3 sync ./assets/ ${S3_PATH}"
echo $CMD
eval $CMD

echo "Finished HELP $0 $ENV $S3_PATH"