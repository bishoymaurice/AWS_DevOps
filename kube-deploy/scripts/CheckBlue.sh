#!/bin/bash

while true; do
  echo "Wait 2 seconds .."
  sleep 2
  kubectl get deploy sampleapp-deployment-c4c13b9
  READY=$(kubectl get deploy sampleapp-deployment-c4c13b9 | grep "1/1" | wc -l)
  if [ $READY == 1 ]
  then
    break;
  fi
done