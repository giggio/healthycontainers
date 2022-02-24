#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build -t giggio/healthy -f $DIR/Dockerfile.healthy $DIR
docker build -t giggio/unhealthy -f $DIR/Dockerfile.unhealthy $DIR
docker rm -f healthy || true
docker rm -f unhealthy || true
docker run -d --name healthy giggio/healthy
docker run -d --name unhealthy giggio/unhealthy