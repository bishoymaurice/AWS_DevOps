#!/bin/bash

kubectl get deployments | grep -v sampleapp-deployment-TARGET_TAG

OLD_DEPLOYMENT=$(kubectl get deployments | grep -v sampleapp-deployment-TARGET_TAG | awk '{ print $1 }' | grep -v NAME)

echo "Old deployment is: $OLD_DEPLOYMENT and will be destroyed"

kubectl delete deployment $OLD_DEPLOYMENT || echo "Not found"