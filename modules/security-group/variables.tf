variable "vpc_id" {
  description = "The VPC ID where the security groups will be created."
  type        = string
}

variable "public_ip" {
  description = "Your public IP address for SSH access."
  type        = string
}

variable "environment" {
  description = "Nom de l'environnement"
  type        = string
}


