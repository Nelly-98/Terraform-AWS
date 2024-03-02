resource "aws_launch_configuration" "bastion" {
  name_prefix          = "bastion-"
  image_id             = var.ami_id # L'AMI pour l'instance Bastion
  instance_type        = "t2.micro"
  key_name             = var.key_name
  security_groups      = [var.bastion_sg_id]

  # Assurez-vous que l'AMI utilisée est adaptée à un hôte bastion et sécurisée
  # Ajoutez la configuration nécessaire pour hardening l'instance

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bastion" {
  launch_configuration    = aws_launch_configuration.bastion.id
  min_size                = 1
  max_size                = 2
  desired_capacity        = 1
  vpc_zone_identifier     = var.public_subnets_ids

  tag {
    key                 = "Name"
    value               = "Bastion"
    propagate_at_launch = true
  }
}

resource "aws_instance" "bastion" {
  ami           = var.ami_id 
  instance_type = "t2.micro"    
  key_name      = var.key_name  

  subnet_id                   = var.public_subnets_ids[0] # ID du sous-réseau public
  vpc_security_group_ids      = [var.bastion_sg_id] 

  associate_public_ip_address = true

  tags = {
    Name = "BastionHost"
  }
}


