#!/bin/bash

setup:
	kubectl create -f deployment.yaml
	kubectl create -f app-expose.yaml
	kubectl create -f load-balancer.yaml

deploy:
	kubectl create -f deployment.yaml

undeploy:
	kubectl delete -f deployment.yaml