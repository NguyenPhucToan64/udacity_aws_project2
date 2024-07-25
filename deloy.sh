#!/bin/bash
# Script to update an AWS CloudFormation stack

# Check if the correct number of arguments is passed
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <name stack> <template file path> <parameters file path>"
    exit 1
fi
STACK_NAME="$1"
TEMPLATE_PATH="$2"
PARAMETERS_PATH="$3"

# AWS CLI command to update the stack
aws cloudformation deloy --stack-name $STACK_NAME --template-body file://"$TEMPLATE_PATH" --parameters file://"$PARAMETERS_PATH" --region us-east-1 --profile udacity
