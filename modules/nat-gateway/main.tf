# Création d'une Elastic IP pour chaque NAT Gateway
resource "aws_eip" "nat" {
  count = length(var.public_subnets_ids)
  //vpc   = true # Assurez que l'EIP est pour un environnement VPC
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
}

# Création des NAT Gateways dans les sous-réseaux publics
resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets_ids)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = var.public_subnets_ids[count.index]
  
  tags = {
    Name = "NAT-Gateway-${count.index}"
  }
}

# Création des route tables pour les sous-réseaux privés
resource "aws_route_table" "private" {
  count  = length(var.private_subnets_ids)
  vpc_id = var.vpc_id

  tags = {
    Name = "Private-Route-Table-${count.index}"
  }
}

# Création des routes pour diriger le trafic externe via la NAT Gateway
resource "aws_route" "private_nat" {
  count                  = length(var.private_subnets_ids)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}

# Association des sous-réseaux privés avec les route tables privées
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_ids)
  subnet_id      = var.private_subnets_ids[count.index]
  route_table_id = aws_route_table.private[count.index].id
}
