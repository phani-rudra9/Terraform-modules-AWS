output "task_def_arn" {
    value = aws_ecs_task_definition.taskdef.*.arn 
}

output "task_family" {
    value = aws_ecs_task_definition.taskdef.*.family
}

output "task_revision" {
    value = aws_ecs_task_definition.taskdef.*.revision
}