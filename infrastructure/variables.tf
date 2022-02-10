variable "resource_prefix" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region

data "aws_caller_identity" "current" {}
