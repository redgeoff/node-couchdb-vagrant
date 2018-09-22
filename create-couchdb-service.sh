#!/usr/bin/env bash

# Change to script directory
cd `dirname $0`

sudo docker run -d --name couchdb \
  --log-opt max-size=100m \
  --restart always \
  -p 5984:5984 \
  -p 5986:5986 \
  -p 4369:4369 \
  -p 9100-9200:9100-9200 \
  -e COUCHDB_USER='admin' \
  -e COUCHDB_PASSWORD='-pbkdf2-b1eb7a68b0778a529c68d30749954e9e430417fb,4da0f8f1d98ce649a9c5a3845241ae24,10' \
  -v /home/ubuntu/common/etc/local.ini:/opt/couchdb/etc/default.d/10-docker-default.ini \
  -v /home/ubuntu/common/data:/opt/couchdb/data \
  couchdb

# Give the DB a chance to start
./wait-for-it.sh localhost:5984 -t 300

# Wait for DB to be ready to create DBs
sleep 20

# Create system DBs
curl -X PUT http://admin:admin@localhost:5984/_users
curl -X PUT http://admin:admin@localhost:5984/_replicator
curl -X PUT http://admin:admin@localhost:5984/_global_changes
