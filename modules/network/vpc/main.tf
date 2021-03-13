resource "aws_vpc" "phani" {
  count = length(var.vpc)
  cidr_block       = lookup(var.vpc[count.index],"cidr")
  instance_tenancy = lookup(var.vpc[count.index],"tenancy")
  enable_dns_support = lookup(var.vpc[count.index],"enable_dns_support")
  enable_dns_hostnames = lookup(var.vpc[count.index],"enable_dns_hostnames")
  tags = {
    Name = format("${var.environment}-%s",lookup(var.vpc[count.index],"name"))
    Environment = var.environment
    Terraformed = "True"
  }
} 