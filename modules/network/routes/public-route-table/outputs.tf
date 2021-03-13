output "public_route_table_owner_id" {
     value = aws_route_table.public_subnet_route_table.*.owner_id
}

output "public_route_table_id" {
     value = aws_route_table.public_subnet_route_table.*.id
}