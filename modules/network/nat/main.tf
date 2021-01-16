# resource "aws_eip" "eip" {
#   count = length(var.public_subnets)
#   tags = {
#       Name = var.public_subnets
#       Environment = var.environment
#   }
# }

# resource "aws_nat_gateway" "natgw" {
#   count = length(var.public_subnets)
#   allocation_id = aws_eip.eip.*.id
#   subnet_id     = var.public_subnets
#   tags = {
#     Name = var.public_subnets
#     Environment = var.environment
#   }
# }