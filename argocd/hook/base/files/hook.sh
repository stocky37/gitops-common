#!/bin/bash

set -eux

SCRIPT_DIR="$( realpath "$( dirname "${BASH_SOURCE[0]}")")"
TEMPLATE_FILE="$SCRIPT_DIR/payload-template.json"

curl -sX POST \
  -H "Content-Type: application/json" \
  -H "X-ArgoCD-Hook: $HOOK" \
  -d "$(envsubst < "$TEMPLATE_FILE")" \
  "$WEBHOOK_URL"
