# Set parameters
AWS_REGION=eu-west-2
EC2_KEY_NAME=my-eks-key

# Deploy VPC
aws cloudformation deploy --template-file ./vpc/vpc.yaml --tags eks=eks-vpc --stack-name eks-vpc --parameter-overrides file://./vpc/vpc-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$AWS_REGION

# Create IAM Role
aws cloudformation deploy --template-file ./iam/iam.yaml --tags eks=eks-iam --stack-name eks-iam --parameter-overrides file://./iam/iam-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$AWS_REGION

aws ec2 create-key-pair --region $AWS_REGION --key-name $EC2_KEY_NAME --query "KeyMaterial" --output text > $EC2_KEY_NAME.pem

# Deploy Kubernetes Cluster
aws cloudformation deploy --template-file ./cluster/cluster.yaml --tags eks=eks-cluster --stack-name eks-cluster --parameter-overrides file://./cluster/cluster-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$AWS_REGION