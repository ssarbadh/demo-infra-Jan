#!/bin/bash 
# Simple script pull the curtain .. thank audience and destroy all resources 

access_key_id=$1
secret_access_key=$2
aws_default_region=$3

# Check Terraform
echo "Check Terraform existance"
terraform -h > /dev/null
status=$?
if [ $status -eq 0 ]
then
    echo “Terraform is installed, proceeding .....”
else
    echo “Terraform not installed stop....”
    exit
fi
# # Ask for AWS Credentials if not passed
if [ -z "$access_key_id" ]
then
    read -p "Enter ACCESS_KEY_ID: " access_key_id
    echo "Access Key is $access_key_id"
fi
if [ -z "$secret_access_key" ]
then
    read -s -p "Enter AWS_SECRET_ACCESS_KEY: " secret_access_key
    echo "Your secret access key is is $secret_access_key"
fi
if [ -z "$aws_default_region" ]
then
    read -p "Enter AWS_DEFAULT_REGION: " aws_default_region
    echo "Default Region is $aws_default_region"
fi

## Regex validate inputs

#Export AWS Credentials
export AWS_ACCESS_KEY_ID=$access_key_id
export AWS_SECRET_ACCESS_KEY=$secret_access_key
export AWS_DEFAULT_REGION=$aws_default_region
echo $AWS_ACCESS_KEY_ID
echo "This script is to destroy the resources created by wrapper"
echo "Switch to Terraform directory"

#Switch to terraform directory
echo "Switching to terraform directory"
cd infra-as-code/terraform

#Clean up .terraform and lock (if exists)
rm -Rf .terraform
rm -Rf .terraform.*


#Terraform init
echo "Running Terraform init"
terraform init

#Terraform Apply
terraform destroy --auto-approve

# Thank you 