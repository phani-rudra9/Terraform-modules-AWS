output "private_instance_id" {
  value = aws_instance.PrivateInstance.*.id
}