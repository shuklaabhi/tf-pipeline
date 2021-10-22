terraform {
  backend "remote" {
    organization = "shopzipp"
    workspaces {
      name = "xen-infrastructure"
    }
  }

  required_version = ">=0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.57.0"
    }
  }
}
