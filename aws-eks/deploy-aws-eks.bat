@REM Set parameters
set HERE=%cd%
set AWS_REGION=eu-west-2
set EC2_KEY_NAME=my-eks-key

@REM Deploy VPC
aws cloudformation deploy --template-file %HERE%\vpc\vpc.yaml --tags eks=eks-vpc --stack-name eks-vpc --parameter-overrides file://%HERE%\vpc\vpc-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%AWS_REGION%

@REM Create IAM Role
aws cloudformation deploy --template-file %HERE%\iam\iam.yaml --tags eks=eks-iam --stack-name eks-iam --parameter-overrides file://%HERE%\iam\iam-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%AWS_REGION%

aws ec2 create-key-pair --region %AWS_REGION% --key-name %EC2_KEY_NAME% --query "KeyMaterial" --output text > %EC2_KEY_NAME%.pem

@REM Deploy Kubernetes Cluster
aws cloudformation deploy --template-file %HERE%\cluster\cluster.yaml --tags eks=eks-cluster --stack-name eks-cluster --parameter-overrides file://%HERE%\cluster\cluster-param.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=%AWS_REGION%