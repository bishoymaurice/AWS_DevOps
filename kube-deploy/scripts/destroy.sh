#!/bin/sh

kubectl get deployments | grep -v sampleapp-deployment-nginx

OLD_DEPLOYMENT=$(kubectl get deployments | grep -v sampleapp-deployment-nginx | awk '{ print $1 }' | grep -v NAME)

echo 'Old deployment is: "$OLD_DEPLOYMENT" and will be destroyed'

kubectl delete deployment "$OLD_DEPLOYMENT" || echo "Not found"