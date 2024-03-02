output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ID of the Security Group for web servers."
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "The ID of the Security Group for the database."
}

output "alb_sg_id" {
  description = "L'ID du groupe de sécurité de l'ALB"
  value       = aws_security_group.alb_sg.id
}

output "bastion_sg_id" {
  description = "L'ID du groupe de sécurité de l'ALB"
  value       = aws_security_group.bastion_sg.id
}
