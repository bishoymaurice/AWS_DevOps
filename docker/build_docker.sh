#!/usr/bin/env bash
TAG=v1.0.0

# Build
docker build -t bishoy/sampleapp:${TAG} --tag=${TAG} .

# Push to dockerhub
docker run -p 8000:80 bishoy/sampleapp:${TAG}