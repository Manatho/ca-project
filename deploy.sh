#!/bin/bash
set -e
SERVER_IP=$1
SHA=$2

echo "Deploying sha($SHA) to $SERVER_IP"

scp -o StrictHostKeyChecking=no ./docker-compose.yml ubuntu@$SERVER_IP:/tmp/
ssh -o StrictHostKeyChecking=no -t ubuntu@$SERVER_IP "export DH_SHA=$SHA ; cd /tmp/ ; docker-compose --verbose pull && docker-compose --verbose up -d"

echo "Deployed!"