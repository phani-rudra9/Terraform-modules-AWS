resource "aws_internet_gateway" "gw" {
  count = length(var.igw)
  vpc_id = var.vpc_id
  tags = {
    Name = lookup(var.igw[count.index],"name")
  }
}