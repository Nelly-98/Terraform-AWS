output "db_instance_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = "The connection endpoint for the RDS instance"
}



