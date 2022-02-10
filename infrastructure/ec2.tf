# consider this as a class
# class aws_instance (ami: str, instance_type: str, ...){
# }
# web = aws_instance(ami = "ami-047d41821c231284a", instance_type = "t2.micro", tags = { "Name" = "anyname" })

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "web" {
  # https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#Images:visibility=public-images;
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "${var.resource_prefix}-test-tf"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



module "web" {
  source = "./modules/ec2-machine"
  ami_id = "ami-081ff4b9aa4e81a08"
  instance_type = "t2.micro"
  tags = {
    Name = "test-tf"
    currentAccountId = data.aws_caller_identity.current.account_id
    caller_user_id = data.aws_caller_identity.current.user_id
  }
  prefix = var.resource_prefix
  users = ["0", "abhishek", "abhishek", "0", "1"]
}
