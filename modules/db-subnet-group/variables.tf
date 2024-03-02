variable "name" {
  description = "The name of the DB subnet group"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to include in the DB subnet group"
  type        = list(string)
}
