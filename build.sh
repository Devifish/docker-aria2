#!/bin/bash
docker build \
  --no-cache \
  --force-rm \
  -t devifish/aria2:latest \
  .