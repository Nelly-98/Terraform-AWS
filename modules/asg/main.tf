resource "aws_launch_template" "wordpress" {
  name_prefix   = "wordpress-launch-template-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(var.user_data)

  tags = {
    Name        = "MonInstanceWordpress"
    Environment = "Dev"
  }
}

resource "aws_autoscaling_group" "wordpress" {
  launch_template {
    id      = aws_launch_template.wordpress.id
    version = "$Latest"
  }

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids
}
