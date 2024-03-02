variable "vpc_id" {
  description = "L'ID du VPC où le bastion sera déployé"
  type        = string
}

variable "public_subnets_ids" {
  description = "Les IDs des sous-réseaux publics pour le groupe d'auto-scaling du bastion"
  type        = list(string)
}

variable "key_name" {
  description = "Le nom de la paire de clés SSH pour accéder au bastion"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instances."
  type        = string
}

variable "bastion_sg_id" {
  description = "ID Security group of Bastion."
  type        = string
}