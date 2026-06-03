#!/bin/bash
HOST="http://quote-api.local"
COUNT=30

echo "=== Traffic Distribution Demo ==="
echo "Sending $COUNT requests to $HOST"
echo ""

for i in $(seq 1 $COUNT); do
  RESPONSE=$(curl -s "$HOST")
  POD=$(echo "$RESPONSE" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['pod'])")
  QUOTE=$(echo "$RESPONSE" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['quote'][:40])")
  echo "Request $i -> Pod: $POD | $QUOTE..."
  sleep 0.2
done
