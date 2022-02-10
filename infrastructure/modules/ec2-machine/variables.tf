variable "prefix" {
  type = string
  description = "Prefix with your name"
  sensitive = true
}

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

variable "instance_count" {
  type = number
  default = 1
  description = "How many instances"
}

variable "prefix_tags" {
  type = bool
  default = true
}

variable "tags" {
  type = map(string)
}

variable "owner_names" {
  type = list(string)
  default = ["RMT", "data-science"]
}

variable "creation_date" {
  type = object({year = number, month = string, date = number})
  default = {
    year = 2021
    month = "JAN"
    date = 9
  }
}

variable "project_start_date" {
  type = tuple([number, string, number])
  default = [9, "FEB", 2022]
}

variable "users" {
  type = set(string)
}

locals {
  complexity = "simple"
}
