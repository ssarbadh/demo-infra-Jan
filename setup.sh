#!/bin/bash

# Script to invoke wrapper or cleanup 

# To invoke help
# Usage setup.sh -h 

###############################################################################
# Version
###############################################################################
Version()
{
    echo
    echo "1.0.0"
    echo
}
###############################################################################
# Ask for AWS Credentials
###############################################################################
AWS_Creds() {
echo "Please enter AWS Credentials for an IAM User with R/W access to VPC, EC2"

read -p "Enter ACCESS_KEY_ID: " access_key_id
echo "Access Key is $access_key_id"

read -s -p "Enter AWS_SECRET_ACCESS_KEY: " secret_access_key
echo "Your secret access key is is $secret_access_key"

read -p "Enter AWS_DEFAULT_REGION: " aws_default_region
echo "Default Region is $aws_default_region"
}

###############################################################################
# Create
###############################################################################
Create()
{
    echo
    echo "Creating infra"
    echo
    AWS_Creds
    chmod +x infra-as-code/wrapper/wrapper.sh
    bash infra-as-code/wrapper/wrapper.sh $access_key_id $secret_access_key $aws_default_region

}


###############################################################################
# Destroy
###############################################################################
Destroy()
{
    echo
    echo "Destroying infra"
    echo
    AWS_Creds
    chmod +x infra-as-code/wrapper/end_of_show.sh
    bash infra-as-code/wrapper/end_of_show.sh $access_key_id $secret_access_key $aws_default_region
}

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-h|c|d|V]"
   echo "options:"
   echo "h     Print this Help."
   echo "c     Create Infra"
   echo "d     Destroy Infra"
   echo "V     Print software version and exit."
   echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":hcdV" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      V) # display Version
         Version
         exit;;
      c) # Create Resources
         Create
         exit;;
      d) # Destroy Resources
         Destroy
         exit;;                           
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

echo "Please run the script as ./setup.sh -h to view available options"