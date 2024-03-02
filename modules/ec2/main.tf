resource "aws_instance" "ec2" {
  count                       = length(var.public_subnets_ids)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(var.public_subnets_ids, count.index)
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  tags = {
    Name = "EC2-instance-${count.index}"
  }
}
