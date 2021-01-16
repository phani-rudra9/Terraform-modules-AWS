output "ecs_arn" {
  value = aws_ecs_cluster.ecs.*.arn
}

output "ecs_id" {
  value = aws_ecs_cluster.ecs.*.id
}