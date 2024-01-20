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

}

output "Endpoint" { 
  description = "The DNS name of the load balancer."
  value       = module.demo-infra.dns_name
}
