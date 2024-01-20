#!/bin/bash

# Simple script to take Access Key and Secret Access Key from user 
# Run terraform files to create the resource 
# Return the Endpoint
# Map it to DNS if necessary

set +x
# Check Terraform
echo "Check Terraform existance"
terraform version
if ($? ! = 0 ) then 
  echo "Terraform is not installed"
fi

# Ask for AWS Credentials
echo "Please enter AWS Credentials for an IAM User with R/W access to VPC, EC2"

read -p "Enter ACCESS_KEY_ID: " access_key_id
echo "Access Key is $access_key_id"

read -s -p "Enter AWS_SECRET_ACCESS_KEY: " secret_access_key
echo "Your secret access key is is $secret_access_key"

read -p "Enter AWS_DEFAULT_REGION: " aws_default_region
echo "Default Region is $aws_default_region"

## Regex validate inputs

#Export AWS Credentials
export AWS_ACCESS_KEY_ID=$access_key_id
export AWS_SECRET_ACCESS_KEY=$secret_access_key
export AWS_DEFAULT_REGION=$aws_default_region

#Switch to terraform directory
echo "Switching to terraform directory"
cd ../terraform

#Clean up .terraform and lock (if exists)
rm -Rf .terraform
rm -Rf .terraform.*


#Terraform init
echo "Running Terraform init"
terraform init

#Terraform Apply
terraform apply --auto-approve

#Terraform Output 
endpoint=$(terraform output Endpoint)

echo "Please browse the endpoint ---    http://$endpoint  "



