output "instance_ids" {
  value = aws_instance.ec2.*.id
  description = "List of IDs of the instances."
}

output "instance_public_ips" {
  value = aws_instance.ec2.*.public_ip
  description = "Public IP addresses of the instances."
}
