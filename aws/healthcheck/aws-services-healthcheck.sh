#!/usr/bin/env bash

check_services () {
  TABLES_OUTPUT="$(awslocal dynamodb list-tables)"
  if [[ $TABLES_OUTPUT == *"termosaceite"*]]; then
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