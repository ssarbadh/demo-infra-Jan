# terraform {
#   required_version = "~> 1.5.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 5.0.0"
#     }
#   }
# }


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #   version = "4.49.0"
      version = ">= 5.30.0"

    }
    # template = {
    #   source = "hashicorp/template"
    # }
  }
#   required_version = ">= 1.3.6"
  required_version = ">= 1.0.0"
}