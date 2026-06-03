#!/bin/bash
echo "=== Chaos Test ==="
echo ""

echo "[1] Pods BEFORE chaos:"
microk8s kubectl get pods -l app=quote-api -o wide
echo ""

VICTIM=$(microk8s kubectl get pods -l app=quote-api -o jsonpath='{.items[0].metadata.name}')
echo "[2] Deleting pod: $VICTIM"
microk8s kubectl delete pod "$VICTIM"
echo ""

echo "[3] Firing requests during recovery:"
for i in $(seq 1 15); do
  RESPONSE=$(curl -s --max-time 2 "http://quote-api.local")
  if [ $? -eq 0 ]; then
    POD=$(echo "$RESPONSE" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['pod'])" 2>/dev/null)
    echo "  Request $i -> OK (pod: $POD)"
  else
    echo "  Request $i -> FAILED"
  fi
  sleep 0.5
done
echo ""

echo "[4] Pods AFTER — replacement should be Running:"
microk8s kubectl get pods -l app=quote-api -o wide
