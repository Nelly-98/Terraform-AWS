resource "aws_db_instance" "default" {
  allocated_storage       = var.allocated_storage
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.mysql5.7"
  db_subnet_group_name    = var.rds_subnet_group_name
  vpc_security_group_ids  = var.vpc_security_group_ids
  multi_az                = true
  skip_final_snapshot     = true
  
}
