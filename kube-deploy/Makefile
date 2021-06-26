#!/bin/bash

configure:
	export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
	export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
	export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
	aws s3 ls
	aws eks --region eu-west-2 update-kubeconfig --name eks-cluster
	kubectl get svc

setup:
	kubectl create -f ./app-expose.yaml
	kubectl create -f ./load-balancer.yaml

deploy:
	kubectl create -f ./app-deploy.yaml

undeploy:
	kubectl delete -f ./app-deploy.yaml || echo "Deployment already not found"