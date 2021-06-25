# Set parameters
aws_region=eu-west-2
ec2_key_name=my-eks-key

# Deploy VPC
aws cloudformation deploy --template-file ./vpc/vpc.yaml --tags eks=eks-vpc --stack-name eks-vpc --parameter-overrides file://./vpc/vpc-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$aws_region

# Create IAM Role
aws cloudformation deploy --template-file ./iam/iam.yaml --tags eks=eks-iam --stack-name eks-iam --parameter-overrides file://./iam/iam-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$aws_region

aws ec2 create-key-pair --region $aws_region --key-name $ec2_key_name --query "KeyMaterial" --output text > $ec2_key_name.pem

# Deploy Kubernetes Cluster
aws cloudformation deploy --template-file ./cluster/cluster.yaml --tags eks=eks-cluster --stack-name eks-cluster --parameter-overrides file://./cluster/cluster-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$aws_region