variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with this DB instance"
  type        = list(string)
}

variable "rds_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance"
  type        = string
}


variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}
