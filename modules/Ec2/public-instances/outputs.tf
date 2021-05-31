output "public_instance_id" {
  value = aws_instance.PublicInstance.*.id
}