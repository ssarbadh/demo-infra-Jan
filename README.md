# demo-infra-Jan
Demo Project to create infrastructure to run a webserver in Private subnet and serve traffic from internet via AWS ALB endpoint. 

## Folder Structure
The repository is structured the following way - 
```bash
.
├── README.md
├── application-code
│   ├── bootstrap.sh
│   ├── index.html
│   └── nginx-conf
│       └── hello-web.conf
├── infra-as-code
│   ├── Readme.md
│   ├── terraform
│   │   └── main.tf
│   ├── terraform-state
│   │   ├── ReadMe.md
│   └── wrapper
│       ├── end_of_show.sh
│       └── wrapper.sh
└── terraform-module
    ├── Readme.md
    ├── alb.tf
    ├── autoscalinggroup.tf
    ├── gateways.tf
    ├── launch_template.tf
    ├── outputs.tf
    ├── providers.tf
    ├── routetables.tf
    ├── security_group.tf
    ├── subnets.tf
    ├── targetgroup.tf
    ├── userdata.sh
    ├── vars.tf
    └── vpc.tf

```
| Directory  | Purpose |
| ------------- | ------------- |
| application-code  | Webserver specific configurations  |
| infra-as-code     | Script and code for infrastructure as code and startup scripts in wrapper folder |
| terraform-module     | Terraform module to create the infrastructure to use |


## Run the Project
1. Clone the repo into any server or laptop with terraform installed `terraform version 1.3.6`. 
2. Run the shell script `wrapper.sh` 
```bash
./infra-as-code/wrapper/wrapper.sh

Check Terraform existance
Terraform v1.3.6
on darwin_amd64

Your version of Terraform is out of date! The latest version
is 1.7.0. You can update by downloading from https://www.terraform.io/downloads.html
./wrapper.sh: line 12: 0: command not found
Please enter AWS Credentials for an IAM User with R/W access to VPC, EC2
Enter ACCESS_KEY_ID: xxxxxxxxxxxxxxx
Access Key is xxxxxxxxxxxxxx
Enter AWS_SECRET_ACCESS_KEY: Your secret access key is is xxxxxxx
Enter AWS_DEFAULT_REGION: eu-central-1
Default Region is eu-central-1
Switching to terraform directory
Running Terraform init
Initializing modules...
.
.
.
.

```
4. Access the URL presented as the script completes
```bash
Apply complete! Resources: 31 added, 0 changed, 0 destroyed.

Outputs:

Endpoint = "demo-infra-alb-2082237740.eu-central-1.elb.amazonaws.com"
Please browse the endpoint - "http://demo-infra-alb-2082237740.eu-central-1.elb.amazonaws.com"

```

5. Cleanup 
You can cleanup all the resources using `end_of_show.sh` script. Execute as below
```bash
bash-5.1$ ./infra-as-code/wrapper/end_of_show.sh
This script is to destroy the resources created by wrapper
Switch to Terraform directory
Switching to terraform directory
Running Terraform init
Initializing modules...
.
.
.
.

```
