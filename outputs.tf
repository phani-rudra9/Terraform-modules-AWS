output "vpc_id" {
  value = module.vpc.*.vpc_id
}

output "private_subnets_id" {
  value = module.private_subnets.*.private_subnets_id
}

output "public_subnets_id" {
  value = module.public_subnets.*.public_subnets_id
}

output "igw_id" {
  value = module.igw.igw_id
}

output "public_route_table_id" {
  value = module.public_route_tables.*.public_route_table_id
}

output "public_route_table_owner_id" {
  value = module.public_route_tables.*.public_route_table_owner_id
}

output "private_route_table_id" {
  value = module.private_route_tables.*.private_route_table_id
}

output "private_route_table_owner_id" {
  value = module.private_route_tables.*.private_route_table_owner_id
}

output "nat_gw_id" {
  value = module.nat_gws.*.nat_gw_id
}

output "public_instance_id" {
  value = module.public_instances.*.public_instance_id
}

output "public_sg_id" {
  value = module.public_security_group.*.public_sg_id
}

output "private_instance_id" {
  value = module.private_instances.*.private_instance_id
}

output "private_sg_id" {
  value = module.private_security_group.*.private_sg_id
}

output "aws_elb_id" {
  value = module.lb.*.aws_elb_id
}

output "aws_elb_dnsname" {
  value = module.lb.*.aws_elb_dnsname
}

output "aws_elb_arn" {
  value = module.lb.*.aws_elb_arn
}

output "zoneid" {
  value = module.lb.*.zoneid
}

output "private_instance_ip" {
  value = module.public_instances.*.private_instance_ip
}

output "private_instance_ip_addr" {
  value = module.private_instances.*.private_instance_ip_addr
}

# output "ami_id" {
#   value = module.private_instances.*.ami_id
# }
