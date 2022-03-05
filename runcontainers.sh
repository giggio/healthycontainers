#!/usr/bin/env bash

set -euo pipefail

docker rm -f healthy || true
docker rm -f unhealthy || true
docker rm -f nohealthinfo || true

docker run -d --name healthy   --health-interval 3s --health-timeout 2s                     \
  --health-start-period 1ms --health-cmd true  --entrypoint sleep alpine:3 infinity
docker run -d --name unhealthy --health-interval 1s --health-timeout 1ms --health-retries 1 \
  --health-start-period 1ms --health-cmd false --entrypoint sleep alpine:3 infinity
docker run -d --name nohealthinfo --entrypoint sleep alpine:3 infinity
