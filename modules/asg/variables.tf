variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances."
  default     = "t2.micro"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the instances will be launched."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in."
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of instances in the ASG."
  default     = 1
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the ASG."
  default     = 2
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG."
  default     = 1
  type        = number
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "user_data" {
  description = "User data to be used on each instance launched"
  type        = string
  default     = ""
}

variable "target_group_arns" {
  type = list(string)
}
