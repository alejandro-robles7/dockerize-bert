#!/bin/sh

# create an ECR repository with the name bert-lambda
aws ecr create-repository --repository-name bert-lambda > /dev/null --profile aleja_fourthbrain

# define some environment variables to make deploying easier
export aws_region=us-west-1
export aws_account_id=681261969843

aws ecr get-login-password \
    --region $aws_region \
    --profile aleja_fourthbrain \
| docker login \
    --username AWS \
    --password-stdin $aws_account_id.dkr.ecr.$aws_region.amazonaws.com

# tag / rename our previously created image to an ECR format
docker tag bert-lambda $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/bert-lambda

# push image
docker push $aws_account_id.dkr.ecr.$aws_region.amazonaws.com/bert-lambda

# Get session token
aws sts get-session-token --serial-number arn:aws:iam::681261969843:mfa/Alejandro_Robles --token-code 839559 --duration-seconds 129600 --profile aleja_fourthbrain

# Add to default and fourth brain profile
aws configure set aws_session_token <aws_session_token>
aws configure set aws_session_token <aws_session_token> --profile aleja_fourthbrain

# Not able to specify fourthbrain profile so used default
sls deploy --config serverless.yml