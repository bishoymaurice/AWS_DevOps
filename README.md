# [WIP]
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


### prerequisites:

1. Install AWS CLI
2. Install Kubectl

### How To:

#### Build Kubernetes cluster on AWS

```
cd aws-eks
chmod 777 deploy-aws-eks.sh
```