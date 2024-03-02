variable "vpc_id" {
  description = "L'ID du VPC où les sous-réseaux seront créés."
  type        = string
}

variable "public_subnets_cidrs" {
  description = "Liste des blocs CIDR pour les sous-réseaux publics."
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "Liste des blocs CIDR pour les sous-réseaux privés."
  type        = list(string)
}

variable "availability_zones" {
  description = "Liste des zones de disponibilité où les sous-réseaux seront créés."
  type        = list(string)
}
