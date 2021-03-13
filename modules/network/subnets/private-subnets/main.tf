resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets)
  vpc_id     = var.vpc_id
  cidr_block = lookup(var.private_subnets[count.index],"cidr")
  availability_zone  = lookup(var.private_subnets[count.index],"availability_zone")
  tags = {
    Name = format("${var.environment}-%s",lookup(var.private_subnets[count.index],"name"))
    Environment = var.environment
  }
}