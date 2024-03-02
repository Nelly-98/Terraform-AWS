variable "region" {
  description = "La région AWS où déployer les ressources"
  type = string
  default = "eu-west-3"
}

variable "db_username" {
  description = "Username for the WordPress database"
  type        = string
}

variable "db_password" {
  description = "Password for the WordPress database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the WordPress database"
  type        = string
}




