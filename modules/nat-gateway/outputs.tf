output "nat_gateway_ids" {
  value = aws_nat_gateway.nat[*].id
}

output "private_route_table_ids" {
  value = aws_route_table.private[*].id
}
