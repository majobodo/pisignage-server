#!/usr/bin/env bash

set -e

cd /usr/src/app || exit 9

MONGO_HOST=${MONGO_HOST:-mongo}
MONGO_PORT=${MONGO_PORT:-27017}
MONGO_DB=${MONGO_DB:-pisignage-server}

sed -i "s/uri:.*/uri: 'mongodb:\/\/${MONGO_HOST}:${MONGO_PORT}\/${MONGO_DB}'/" config/env/development.js

exec node server.js
