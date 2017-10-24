#!/usr/bin/env bash

# Change to script directory
cd `dirname $0`

# Create service
docker service create --replicas 2 --name couchdb --network couchdb-network \
  --hostname="couchdb{{.Task.Slot}}" \
  --mount type=bind,source=/home/ubuntu/common,destination=/common \
  --mount type=bind,source=/home/ubuntu/common/etc/local.ini,destination=/home/couchdb/couchdb/etc/local.d/local.ini \
  -e COUCHDB_COOKIE="mycookie" \
  -e COUCHDB_USER="admin" \
  -e COUCHDB_PASSWORD="admin" \
  -e COUCHDB_HASHED_PASSWORD="-pbkdf2-b1eb7a68b0778a529c68d30749954e9e430417fb,4da0f8f1d98ce649a9c5a3845241ae24,10" \
  -e COUCHDB_SECRET="mysecret" \
  -e NODENAME="couchdb{{.Task.Slot}}" \
  -e SERVICE_NAME="{{.Service.Name}}" \
  -e TASK_SLOT="{{.Task.Slot}}" \
  -e COUCHDB_DATA_DIR="/common/data/{{.Service.Name}}{{.Task.Slot}}" \
  -p 5984:5984 \
  --detach=true \
  redgeoff/couchdb-service

# Give the DB a chance to start and set up the system DBs
./wait-for-it.sh localhost:5984 -t 300
echo 'sleeping to allow for DB to start and set up system DBs...'
sleep 90
