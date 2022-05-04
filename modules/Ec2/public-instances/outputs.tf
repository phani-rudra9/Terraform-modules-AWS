output "public_instance_id" {
  value = aws_instance.PublicInstance.*.id
}

output "private_instance_ip" {
  value = aws_instance.PublicInstance.*.private_ip
}