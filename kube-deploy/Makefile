#!/bin/bash

configure:
	export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
	export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
	export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
	aws s3 ls
	aws eks --region eu-west-2 update-kubeconfig --name eks-cluster
	kubectl get svc
	kubectl get po
	kubectl get rs

deploy:
	kubectl apply -f ./app-deploy.yaml

expose:
	kubectl apply -f ./load-balancer.yaml
	kubectl apply -f ./node-port.yaml

auto-scale:
	kubectl apply -f ./auto-scaler.yaml

wait:
	sh ./scripts/wait.sh