#!/bin/bash

LOG_FILE="PATH/TO/LOG/FILE"
DISCORD_WEBHOOK_URL="ENTER YOUR WEBHOOK LINK HERE"

tail -n0 -F "$LOG_FILE" | while read -r line; do
  if echo "$line" | grep -q "SERVICE ON LOG"; then
    message="<@DISCORD USER ID>, $(echo "$line" | awk -F 'FILTER' '{print $2}' | sed 's/^[[:space:]]*//')"
    curl -H "Content-Type: application/json" -X POST -d "{\"content\":\"$message\"}" "$DISCORD_WEBHOOK_URL"
  fi
done



