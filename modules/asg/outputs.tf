output "asg_name" {
  value       = aws_autoscaling_group.wordpress.name
  description = "The name of the Auto Scaling Group."
}
