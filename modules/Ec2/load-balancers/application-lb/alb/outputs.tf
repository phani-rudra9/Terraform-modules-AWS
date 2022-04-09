output "aws_elb_id" {
  value = aws_lb.phani.*.id
}

output "aws_elb_dnsname" {
  value = aws_lb.phani.*.dns_name
}

output "aws_elb_arn" {
  value = aws_lb.phani.*.arn
}

output "zoneid" {
  value = aws_lb.phani.*.zone_id
}