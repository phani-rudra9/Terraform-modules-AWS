resource "aws_route_table" "private_subnet_route_table" {
  count = length(var.private_subnet_route_tables)
  vpc_id     = var.vpc_id
  route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(var.nat_gw_id,count.index)
  }
  tags = {
   Terraformed = "True"
   Environment = var.environment
   Name = lookup(var.private_subnet_route_tables[count.index],"name")
   RouteTableType = "Private"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count = length(var.private_subnet_route_tables)
  subnet_id     = element(var.private_subnets,count.index)
  route_table_id = element(aws_route_table.private_subnet_route_table.*.id,count.index)
}