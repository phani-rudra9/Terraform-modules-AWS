resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)
  vpc_id     = var.vpc_id
  cidr_block = lookup(var.public_subnets[count.index],"cidr")
  availability_zone  = lookup(var.public_subnets[count.index],"availability_zone")
  map_public_ip_on_launch = lookup(var.public_subnets[count.index],"map_public_ip_on_launch")
  tags = {
    Name = format("${var.environment}-%s",lookup(var.public_subnets[count.index],"name"))
    Environment = var.environment
  }
}