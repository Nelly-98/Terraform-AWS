variable "subnet_ids" {
  description = "Subnets où l'ALB sera déployé"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "environment" {
  description = "Nom de l'environnement"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID du groupe de sécurité pour l'ALB"
  type        = string
}

/*variable "ssl_certificate_arn" {
  description = "ARN du certificat SSL à utiliser avec l'ALB"
  type        = string
  default = "arn:aws:acm:eu-west-3:654654466828:certificate/befb6081-7d93-43dc-9576-ddf512c13b63"
}*/

