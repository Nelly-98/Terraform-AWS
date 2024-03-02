variable "vpc_id" {
  description = "The ID of the VPC where the instances will be launched."
  type        = string
}

variable "public_subnets_ids" {
  description = "List of public subnet IDs to host the EC2 instances."
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for the EC2 instances."
  default     = "t2.micro"
  type        = string
}

variable "key_name" {
  description = "The key pair name to be used for the instance."
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs to associate with the EC2 instances."
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instances."
  type        = string
}
