resource "aws_eip" "eip" {
  count = length(var.public_subnets)
}

resource "aws_nat_gateway" "nat_gws" {
  count = length(var.public_subnets)
  allocation_id = element(aws_eip.eip.*.id,count.index)
  subnet_id     = element(var.public_subnets,count.index)
  tags = {
    Name = format("${var.environment}-%s",element(var.public_subnets,count.index))
    Environment = var.environment
  }
}