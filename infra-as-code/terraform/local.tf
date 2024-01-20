locals {
  demo-infra = yamldecode(file("${path.module}/../configuration/demo-infra.yaml"))
}

