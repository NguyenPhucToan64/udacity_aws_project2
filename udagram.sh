#!/bin/bash
if [[ $1 != "network" && $1 != "udagram" && $1 != "delete" ]] 
then
    echo "ERROR: Incorrect execution mode. Valid values: deploy, delete, preview." >&2
    exit 1
fi

if [ $1 == "network" ]
then
    aws cloudformation deploy --stack-name network-udagram --template-file ./network.yml --parameter-overrides file://network-parameters.json --region us-east-1 --profile quang
fi

if [ $1 == "udagram" ]
then
    aws cloudformation deploy --stack-name udagram-app --template-file ./udagram.yml --parameter-overrides file://udagram-parameters.json --region us-east-1 --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM --profile quang
fi

if [ $1 == "delete" ]
then
    aws cloudformation delete-stack --stack-name udagram --region us-east-1 --profile quang
    aws cloudformation delete-stack --stack-name network-udagram --region us-east-1 --profile quang
fi