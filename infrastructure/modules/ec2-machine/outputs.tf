output "instance_ids" {
  value = aws_instance.this[*].id # Splash operator
  description = "Instance Id of the ec2 machine"
  # sensitive = false
}

// for-each each
//output "instance_arns" {
//  value = [for key, instance in aws_instance.this: instance.arn]
//  description = "Instance Id of the ec2 machine"
//  # sensitive = false
//}
