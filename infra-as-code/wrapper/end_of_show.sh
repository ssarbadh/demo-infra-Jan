#!/bin/bash 
# Simple script pull the curtain .. thank audience and destroy all resources 

echo "This script is to destroy the resources created by wrapper"
echo "Switch to Terraform directory"

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
terraform destroy --auto-approve

# Thank you 