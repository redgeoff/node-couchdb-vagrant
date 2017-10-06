#!/usr/bin/env bash

# NOTE: this script needs root access to destroy the CouchDB data

# Change to script directory
cd `dirname $0`

# Destroy the existing service
docker service rm couchdb

# Destroy the existing data
rm -rf /home/ubuntu/common/data/*

# Create service
./create-couchdb-service.sh
