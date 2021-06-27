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

deploy-blue:
	kubectl apply -f ./app-deploy.yaml

expose-blue-node:
	kubectl apply -f ./node-port.yaml

check-blue:
	sh ./scripts/CheckBlue.sh

switch-load-balancer:
	kubectl apply -f ./load-balancer.yaml

destroy-old-version:
	sh ./scripts/DestroyBlue.sh