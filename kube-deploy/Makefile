#!/bin/bash

setup:
	kubectl apply -f deployment.yaml
	kubectl apply -f app-expose.yaml
	kubectl apply -f load-balancer.yaml

deploy-blue: