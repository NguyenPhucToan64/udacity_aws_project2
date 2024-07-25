#!/bin/bash
# Script to update an AWS CloudFormation stack

# Check if the correct number of arguments is passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <template file path> <parameters file path>"
    exit 1
fi

TEMPLATE_PATH="$1"
PARAMETERS_PATH="$2"

# AWS CLI command to update the stack
aws cloudformation update-stack --stack-name example-stack-toannp1 --template-body file://"$TEMPLATE_PATH" --parameters file://"$PARAMETERS_PATH" --region us-east-1 --profile udacity
