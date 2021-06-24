@REM Get parameters
set mypath=%cd%
set aws_region=eu-west-2
set ec2_key_name=my-eks-key

@REM Deploy VPC
aws cloudformation deploy --template-file %mypath%\vpc\vpc.yaml --tags eks=eks-vpc --stack-name eks-vpc --parameter-overrides file://%mypath%\vpc\vpc-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%aws_region%

@REM Create IAM Role
aws cloudformation deploy --template-file %mypath%\iam\iam.yaml --tags eks=eks-iam --stack-name eks-iam --parameter-overrides file://%mypath%\iam\iam-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%aws_region%

aws ec2 create-key-pair --region %aws_region% --key-name %ec2_key_name% --query "KeyMaterial" --output text > %ec2_key_name%.pem

@REM Deploy Kubernetes Cluster
aws cloudformation deploy --template-file %mypath%\cluster\cluster.yaml --tags eks=eks-cluster --stack-name eks-cluster --parameter-overrides file://%mypath%\cluster\cluster-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%aws_region%