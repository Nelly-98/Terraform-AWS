variable "public_subnets_ids" {
  description = "Liste des IDs des sous-réseaux publics où les NAT Gateways seront placées."
  type        = list(string)
}

variable "private_subnets_ids" {
  description = "Liste des IDs des sous-réseaux privés qui utiliseront les NAT Gateways."
  type        = list(string)
}

variable "vpc_id" {
  description = "L'ID du VPC où les NAT Gateways seront déployées."
  type        = string
}
