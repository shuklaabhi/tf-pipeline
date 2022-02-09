output "instance_id" {
  value = aws_instance.this.id
  description = "Instance Id of the ec2 machine"
  # sensitive = false
}
