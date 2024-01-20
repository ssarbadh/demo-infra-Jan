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

## Configure the infra to Run
There is a yaml file to configure basic aspects of the infras to run. This can be updated to use other custom variables as well (later scope). 
```bash
bash-5.1$ cat infra-as-code/configuration/demo-infra.yaml
vpc_cidr: "10.0.0.0/16"
public_subnet_cidrs:
   - "10.0.1.0/24"
   - "10.0.2.0/24"
   - "10.0.3.0/24"
.
.
.
```

## Run the Project
1. Clone the repo into any server or laptop with terraform installed `terraform version 1.0.0+`. 
2. Run the shell script `setup.sh` 
```bash
./setup.sh
bash-5.1$ ./setup.sh
Please run the script as ./setup.sh -h to view available options
bash-5.1$ ./setup.sh -h
Add description of the script functions here.

Syntax: scriptTemplate [-h|c|d|V]
options:
h     Print this Help.
c     Create Infra
d     Destroy Infra
V     Print software version and exit.

bash-5.1$ ./setup.sh -V

1.0.0

bash-5.1$ ./setup.sh -c

Creating infra

Please enter AWS Credentials for an IAM User with R/W access to VPC, EC2
Enter ACCESS_KEY_ID: AKIA2UC3BAK43C7BEH56
Access Key is AKIA2UC3BAK43C7BEH56
Enter AWS_SECRET_ACCESS_KEY: Your secret access key is is tDMfZC2Rg9zwPplEwUcQg/+hVCbAVYCOrT44ehnA
Enter AWS_DEFAULT_REGION: eu-central-1
Default Region is eu-central-1
Check Terraform existance
“Terraform is installed, proceeding .....”
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
You can cleanup all the resources using `setup.sh` script with `-d`. Execute as below
```bash
bash-5.1$ ./setup.sh -d

Destroying infra

Please enter AWS Credentials for an IAM User with R/W access to VPC, EC2
Enter ACCESS_KEY_ID: AKIA2UC3BAK43C7BEH56
Access Key is AKIA2UC3BAK43C7BEH56
Enter AWS_SECRET_ACCESS_KEY: Your secret access key is is tDMfZC2Rg9zwPplEwUcQg/+hVCbAVYCOrT44ehnA
Enter AWS_DEFAULT_REGION: eu-central-1
Default Region is eu-central-1
Check Terraform existance
“Terraform is installed, proceeding .....”
AKIA2UC3BAK43C7BEH56
This script is to destroy the resources created by wrapper
.
.
.
.

```
