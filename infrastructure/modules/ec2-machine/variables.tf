variable "ami_id" {
  type = string
  description = "AMI Id"
  sensitive = false
}

variable "instance_type" {
  type = string
  description = "Instance type eg t2.micro, t2.mini"
  default = "t2.micro"
}

variable "tags" {
  type = map(string)
}

locals {
  complexity = "simple"
}
