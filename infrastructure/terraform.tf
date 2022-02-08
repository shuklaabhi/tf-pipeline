terraform {
  required_version = ">=1.1.5"

  backend "local" {
    path = "terraform.tfstate"
  }
  # https://www.terraform.io/language/providers/requirements
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    # https://registry.terraform.io/providers/hashicorp/aws/
    aws = {
      source = "hashicorp/aws"
      version = "3.74.1"
    }
  }
}
