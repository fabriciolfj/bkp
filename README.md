# bkp

```
#!/bin/bash

awslocal dynamodb create-table \
--table-name example \
--attribute-definitions \
	AttributeName=id,AttributeType=S \
--key-schema \
	AttributeName=id,KeyType=HASH \
--provisioned-throughput \
ReadCapacityUnits=5,WriteCapacityUnits=5 \
--global-secondary-indexes \
'[
  {
    "IndexName": "idIndex",
    "KeySchema": [
      {
        "AttributeName": "id",
        "KeyType": "HASH"
      }
    ],
    "Projection": {
      "ProjectionType": "ALL"
    },
    "ProvisionedThroughput": {
      "ReadCapacityUnits": 10,
      "WriteCapacityUnits": 5
    }
  }
]'

#!/usr/bin/env bash

check_services () {
  TABLES_OUTPUT="$(awslocal dynamodb list-tables)"
  if [[ $TABLES_OUTPUT == *"example"*]]; then
    echo "$TABLES_OUTPUT"
    echo "$QUEUES_OUTPUT"
    return 0
  else
    echo "$TABLES_OUTPUT"
    echo "$QUEUES_OUTPUT"
    return 1
  fi
}
check_services

```
