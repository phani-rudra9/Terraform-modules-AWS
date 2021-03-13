output "private_route_table_owner_id" {
     value = aws_route_table.private_subnet_route_table.*.owner_id
}

output "private_route_table_id" {
     value = aws_route_table.private_subnet_route_table.*.id
}