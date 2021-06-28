#!/bin/sh

# Check on 2/2 becuase we're spinning 2 replicas in app-deploy.yaml file

until [ `kubectl get deploy sampleapp-deployment-nignx | grep "2/2" | wc -l` -gt 0 ]
do
    echo "Wait 2 seconds .."
    sleep 2
done