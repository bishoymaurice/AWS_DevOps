#!/bin/sh

a=0

while [ $a -lt 10 ] 
do
    echo "Wait 2 seconds .."
    sleep 2
    kubectl get deploy sampleapp-deployment-TARGET_TAG
    STATUS=$(kubectl get deploy sampleapp-deployment-TARGET_TAG | grep "1/1" | wc -l)
    READY="1"

    if [ "$STATUS" == "$READY" ]
    then
        break
    fi

done