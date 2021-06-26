#!/bin/sh

until [ `kubectl get deploy sampleapp-deployment-TARGET_TAG | grep "1/1" | wc -l` -gt 0 ]
do
    echo "Wait 2 seconds .."
    sleep 2
done