output "private_instance_id" {
  value = aws_instance.PrivateInstance.*.id
}

output "private_instance_ip_addr" {
  value = aws_instance.PrivateInstance.*.private_ip
}