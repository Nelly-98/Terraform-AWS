output "public_subnets_ids" {
    value = aws_subnet.public[*].id
    description = "Les IDs des sous-réseaux publics créés"
}

output "private_subnets_ids" {
    value = aws_subnet.private[*].id
    description = "Les IDs des sous-réseaux privés créés"
}