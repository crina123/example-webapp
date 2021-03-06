#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-2 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=191414186247.dkr.ecr.us-east-2.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-2736394f \
    ParameterKey=Cluster,ParameterValue=default2 \
    ParameterKey=Listener,ParameterValue=$ALB_LISTENER_ARN
