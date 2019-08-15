#!/bin/bash
set -e
SERVER_IP=$1

echo "Running smoke test on $SERVER_IP"

curl -m 30 http://$SERVER_IP

echo "Smoke test completed!"