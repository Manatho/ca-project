#!/bin/bash
SERVER_IP=$1
SHA=$2

echo "Deploying sha($SHA) to $SERVER_IP"

scp -o StrictHostKeyChecking=no ./docker-compose.yml ubuntu@$SERVER_IP:/tmp/
ssh -o StrictHostKeyChecking=no -t ubuntu@35.233.86.108 "export DH_SHA=$SHA ; cd /tmp/ ; docker-compose pull && docker-compose up -d"

echo "Deployed!"