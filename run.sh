#!/bin/bash

[ ! -f .env ] || export $(grep -v '^#' .env | xargs)

API_ENDPOINT=$API_URL
NAMESPACE="default"
TOKEN="$API_TOKEN:$API_SECRET" 
VM_DEFINITION_FILE="tinycore.yaml"


curl -k -X POST \
  -H "Content-Type: application/yaml" \
  -H "Authorization: Bearer $TOKEN" \
  --data "@${VM_DEFINITION_FILE}" \
  "${API_ENDPOINT}/apis/kubevirt.io/v1/namespaces/${NAMESPACE}/virtualmachines"
