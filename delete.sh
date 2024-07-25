#!/bin/bash
# Script to update an AWS CloudFormation stack

# Check if the correct number of arguments is passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <template file path>"
    exit 1
fi

STACK_NAME="$1"

# AWS CLI command to update the stack
aws cloudformation delete-stack --stack-name $STACK_NAME --region us-east-1 --profile udacity
