#!/bin/bash

setup:
	kubectl create -f ./app-expose.yaml
	kubectl create -f ./load-balancer.yaml

deploy:
	kubectl create -f ./app-deploy.yaml

undeploy:
	kubectl delete -f ./app-deploy.yaml