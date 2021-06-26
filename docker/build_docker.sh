#!/usr/bin/env bash
TAG=v1.0.0

# Build
docker build -t bishoy/sampleapp:${TAG} --tag=${TAG} .

# Push to dockerhub
docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD
docker image push $dockerpath