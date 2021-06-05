output "tg_arn" {
  value = aws_lb_target_group.tg.*.arn
}

output "tg_id" {
  value = aws_lb_target_group.tg.*.id
}