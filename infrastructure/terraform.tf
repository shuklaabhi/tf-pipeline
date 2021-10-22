terraform {
  required_version = "0.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.57.0"
    }
  }
  backend "s3" {
    bucket         = "xen-infra-terraform-pipeline-state"
    key            = "pipeline.tfstate"
    encrypt        = false
    region         = "eu-west-1"
    dynamodb_table = "terraform-pipeline-state-lock"
    profile        = "terraform_user_infrastructure"
  }
}

