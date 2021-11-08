#!/bin/bash

awslocal dynamodb create-table \
--table-name aceiteTermoUsoAplicativo \
--attribute-definitions \
	AttributeName=codigoTermo,AttributeType=S \
--key-schema \
	AttributeName=codigoTermo,KeyType=HASH \
--provisioned-throughput \
ReadCapacityUnits=5,WriteCapacityUnits=5 \
--global-secondary-indexes \
'[
  {
    "IndexName": "codigoTermoIndex",
    "KeySchema": [
      {
        "AttributeName": "codigoTermo",
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