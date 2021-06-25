# [WIP]
# AWS DevOps
This project simulates needed steps to create Kubernetes cluster on AWS using CoudFormation then build and deploy dockerized NginX app using Blue/Green deployment strategy.

### Tools used:
- AWS
- CloudFormation:
    - VPC (2 Public Subnets)
    - IAM Roles for EKS & Worker Nodes
    - Security Groups for EKS
    - Kubernetes Cluster
- Docker
- Kubernetes (AWS EKS)
- Circle CI