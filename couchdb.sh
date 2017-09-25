#!/usr/bin/env bash

# Change to script directory
cd `dirname $0`

# Initialize swarm manager
docker swarm init --advertise-addr 127.0.0.1

# Create network
docker network create \
  --driver overlay \
  --subnet 10.0.9.0/24 \
  --opt encrypted \
  couchdb-network

# Set up volume
mkdir -p /home/ubuntu/common/data /home/ubuntu/common/etc /home/ubuntu/common/ssl
cp local.ini /home/ubuntu/common/etc

./create-couchdb-service.sh
