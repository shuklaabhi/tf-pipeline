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
  final_tags = merge(
      var.prefix_tags ? {for tag_name,tag_value in var.tags: "${var.prefix}:${tag_name}" => tag_value} : var.tags,
      { for idx, owner in var.owner_names: "owner[${idx}]" => owner if owner != ""},
      { for idx, user in var.users: "user[${idx}]" => user if user != ""},
      {
        creation_date = "${var.creation_date.year}-${var.creation_date.month}-${var.creation_date.date}"
        project_start_date = "${var.project_start_date[2]}-${var.project_start_date[1]}-${var.project_start_date[0]}"
      },
      # Do some string functions
    {
      greetings = format("Hello %s", "Terraform")
    },
  {
    # https://www.terraform.io/language/functions/join
    _users = join(",", var.users)
    _owners = join(",", var.owner_names)
    sorted_owners = join(" -> ", sort(var.owner_names))
  }
  )
}
