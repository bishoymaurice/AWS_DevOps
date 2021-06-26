# Project Description
This project simulates needed steps to create Kubernetes cluster on AWS using CoudFormation then build and deploy dockerized NginX app using Blue/Green deployment strategy.

### Tools Used:
- AWS
    - Kubernetes
    - CloudFormation:
        - VPC (2 Public Subnets)
        - IAM Roles for EKS & Worker Nodes
        - Security Groups for EKS
        - Kubernetes Cluster
- Dockerfile
- Circle CI
- Kuebctl
- AWS CLI


### Prerequisites:

1. Install AWS CLI
2. Install Kubectl
3. Configure below variables on CircleCI
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY
    - AWS_DEFAULT_REGION
    - DOCKERHUB_USERNAME
    - DOCKERHUB_PASSWORD
4. Docker (optional) if you want to try the build process locally and not on CircleCI

### How To:

#### Build Kubernetes cluster on AWS

1. Login to AWS Account using below command (for more info, please refer to AWS docs)

```
aws configure
```

2. Run below script to create VPC, IAM Role and Kubernetes Cluster on EKS

```
cd aws-eks
sh ./deploy-aws-eks.sh
```

#### Deploy Nginx app

1. Go to docker/app
2. Replace index.html file with the new one
3. Commit changes to main branch
4. CircleCI will be triggered automatically and will do the following:
    - Build new docker image with the new html code pushed
    - Push the new docker image into your personal docker hub account
    - Deploy the new version on Kubernetes cluster using simple Blue/Green strategy