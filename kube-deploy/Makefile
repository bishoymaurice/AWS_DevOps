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

check-blue:
	while true; do \
		sleep 2; \
		READY=$(kubectl get deploy sampleapp-deployment-TARGET_TAG | grep "1/1" | wc -l); \
		[[ "${READY}" != "1" ]] || break; \
	done

switch-load-balancer:
	kubectl apply -f ./load-balancer.yaml

destroy-old-version:
	export OLD_DEPLOYMENT=$(kubectl get deployments|grep -v sampleapp-deployment-847fa52|awk '{ print$1 }'|grep -v NAME)
	echo "Old deployment is: ${OLD_DEPLOYMENT} and will be destroyed"
	kubectl delete deployment ${OLD_DEPLOYMENT} || echo "Not found"