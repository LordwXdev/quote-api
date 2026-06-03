#!/bin/bash
echo "=== HPA Stress Test ==="
echo "Watch in another terminal: microk8s kubectl get hpa -w"
echo "Starting load... (Ctrl+C to stop)"
echo ""

for worker in $(seq 1 10); do
  while true; do
    curl -s "http://quote-api.local/stress.php" > /dev/null
  done &
done

while true; do
  echo "$(date '+%H:%M:%S') — Pods running: $(microk8s kubectl get pods -l app=quote-api --no-headers | grep Running | wc -l)"
  sleep 15
done
