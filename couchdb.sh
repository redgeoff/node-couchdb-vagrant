#!/usr/bin/env bash

# Change to script directory
cd `dirname $0`

# Set up volume
mkdir -p /home/ubuntu/common/data /home/ubuntu/common/etc /home/ubuntu/common/ssl
cp local.ini /home/ubuntu/common/etc

./create-couchdb-service.sh
