resource "aws_route_table" "public_subnet_route_table" {  
  count  = length(var.public_subnet_route_tables)
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
	  gateway_id = var.internet_gateway_id
  }
  tags = {
      Name = format("${var.environment}-%s", lookup(var.public_subnet_route_tables[count.index],"name"))
	    Environment = var.environment
	    Terraformed = "True"
  }
}


resource "aws_route_table_association" "public_subnet_route_table_association" {
  count = length(var.public_subnets)
  subnet_id      =  element(var.public_subnets,count.index)
  route_table_id =  aws_route_table.public_subnet_route_table.*.id[0]
} 
