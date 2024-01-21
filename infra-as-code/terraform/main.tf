terraform {
  #   backend "s3" {
  #     bucket         = "tajawal-terraform-states"
  #     key            = "nonprod-account/dev/aws-ireland/eks/v1/master/terraform.tfstate"
  #     region         = "eu-west-1"
  #     # dynamodb_table = "tajawal-terraform-states"
  #     # profile        = "ct-nonprod" #this profile is only used for s3 backend
  #   }
  backend "local" {
    path = "../terraform-state/terraform.tfstate"
  }
}

module "demo-infra" {
  source = "../../terraform-module"

  vpc_cidr             = local.demo-infra.vpc_cidr
  public_subnet_cidrs  = local.demo-infra.public_subnet_cidrs
  private_subnet_cidrs = local.demo-infra.private_subnet_cidrs
  #   azs                  = local.demo-infra.azs

  region = local.demo-infra.region

  #   ami-id        = local.demo-infra.ami-id
  instance-type = local.demo-infra.instance-type

  desired-node = local.demo-infra.desired-node
  maximum-node = local.demo-infra.maximum-node
  minimum-node = local.demo-infra.minimum-node

  launch_template_version = local.demo-infra.launch_template_version


}

output "Endpoint" {
  description = "The DNS name of the load balancer."
  value       = module.demo-infra.dns_name
}
