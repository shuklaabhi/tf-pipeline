resource "aws_instance" "this" {
  # https://www.terraform.io/language/meta-arguments/count
   count = var.instance_count
  # consider this a for loop going for i in range(instance_count) { } i can be accessed via count.index
  # element(var.instance_count)
  # https://www.terraform.io/language/meta-arguments/for_each
  #for_each = toset([for i in range(var.instance_count) : "instance-${i}"])
  ami = var.ami_id
  instance_type = var.instance_type
  tags = local.final_tags
}
