variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = "eu-central-1"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
#   default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
# }



## LT Vars ###
# Get it from data source 
# variable "ami-id" {
#   type        = string
#   description = "AMI ID to launch instance"
#   default     = "ami-0292a7daeeda6b851" #Amazon Linux in Frankfurt eu-central-1
# }

variable "instance-type" {
  #  type = list(string)   
  description = "Instance Type list"
  default     = "t3.micro" #Free Tier
}

variable "key" {
  type        = string
  description = "Private Key to Use"
  default     = "sohambasu.pem"
}

variable "desired-node" {
  description = "Number of Instances to run"
  default     = "2"
}

variable "maximum-node" {
  description = "Max no of instances"
  default     = "3"
}

variable "minimum-node" {
  description = "Min num of instances"
  default     = "2"
}

variable "launch_template_version" {
  description = "Launch template version to use"
  default     = "$Latest"
}


