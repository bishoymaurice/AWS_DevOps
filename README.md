# Project Description
This project simulates needed steps to create Kubernetes cluster on AWS using CoudFormation then build and deploy dockerized NginX app using Blue/Green deployment strategy.

### Tools Used
- AWS
    - Kubernetes
    - CloudFormation
        - VPC (2 Public Subnets)
        - IAM Roles for EKS & Worker Nodes
        - Security Groups for EKS
        - Kubernetes Cluster
- Dockerfile
- Circle CI
- Kuebctl
- AWS CLI


### Prerequisites

1. Install AWS CLI.
2. Install Kubectl.
3. Configure below variables on CircleCI:
    - AWS_ACCESS_KEY_ID
    - AWS_SECRET_ACCESS_KEY
    - AWS_DEFAULT_REGION
    - DOCKERHUB_USERNAME
    - DOCKERHUB_PASSWORD
4. Docker and Python are optional. You can install them if you want to try the build process locally and not on CircleCI.


### Deployment Strategy

- The pipeline will spin up new instance of the application, wait until it's ready (in this stage you can add your smoke tests).
- Then load balancer is switched to forward traffic to the new instance.
- At the end of the pipeline, the old version of the application is removed from Kubernetes cluster.

### How To

#### Build Kubernetes cluster on AWS

1. Login to AWS Account using below command (for more info, please refer to AWS docs).

```
aws configure
```

2. Run below script to create VPC, IAM Role and Kubernetes Cluster on EKS.

```
cd aws-eks
sh ./deploy-aws-eks.sh
```

#### Deploy Nginx app

1. Go to docker/app.
2. Replace index.html file with the new one.
3. Commit changes to main branch.
4. CircleCI will be triggered automatically and will do the following.
    - Linting for both HTML code and Dockerfile.
    - Build new docker image with the new HTML code pushed.
    - Push the new docker image into your personal docker hub account.
    - Deploy the new version on Kubernetes cluster using simple Blue/Green strategy.