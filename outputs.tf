output "vpc_id" {
    value = module.vpc.vpc_id
}

output "subnet_id" {
    value = module.public_subnets.*.subnet_id
}

output "igw_id" {
    value = module.igw.*.igw_id
}

# output "nat_id" {
#     value = module.nat.*.nat_id
# }

# output "eip_id" {
#   value = module.nat.*.eip_id
# }
output "repo_url" {
    value = module.ecrrepo.*.repo_url
}

output "task_def_arn" {
    value = module.taskdef.*.task_def_arn
}

output "task_family" {
    value = module.taskdef.*.task_family
}

output "task_revision" {
    value = module.taskdef.*.task_revision
}

output "ecs_arn" {
  value = module.ecs.*.ecs_arn
}

output "ecs_id" {
  value = module.ecs.*.ecs_id
}