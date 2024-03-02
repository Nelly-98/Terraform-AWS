provider "aws" {
  region     = "eu-west-3"
  profile = "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Appel des modules
module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.wp_vpc_id
  public_subnets_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["eu-west-3a", "eu-west-3b"]
}

module "nat_gateway" {
  source              = "./modules/nat-gateway"
  public_subnets_ids  = module.subnets.public_subnets_ids
  private_subnets_ids = module.subnets.private_subnets_ids
  vpc_id              = module.vpc.wp_vpc_id
}

module "security_group" {
  source      = "./modules/security-group"
  vpc_id      = module.vpc.wp_vpc_id
  environment = "prod"
  public_ip   = "82.125.205.192/32"
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.wp_vpc_id
  public_subnets_ids = module.subnets.public_subnets_ids
  key_name          = "Datascientest"
  security_groups   = [module.security_group.ec2_sg_id]
  ami_id            = "ami-0d32100ea85327283"  
}

module "asg" {
  source       = "./modules/asg"
  ami_id       = "ami-0d32100ea85327283"
  instance_type= "t2.micro"
  key_name     = "Datascientest"
  vpc_id       = module.vpc.wp_vpc_id
  subnet_ids   = module.subnets.public_subnets_ids
  user_data    = base64encode(file("${path.root}/install_wordpress.sh"))
  target_group_arns = [module.alb.web_target_group_arn]
}

module "db_subnet_group" {
  source     = "./modules/db-subnet-group"
  name       = "mywp-db-subnet-group"
  subnet_ids = module.subnets.private_subnets_ids
}

module "rds" {
  source = "./modules/rds"
  allocated_storage       = 20
  db_instance_class       = "db.t3.micro"
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  rds_subnet_group_name   = module.db_subnet_group.db_subnet_group_name
  vpc_security_group_ids  = [module.security_group.rds_sg_id]
}

module "alb" {
  source              = "./modules/alb"
  subnet_ids          = module.subnets.public_subnets_ids
  vpc_id              = module.vpc.wp_vpc_id
  environment         = "prod"
  alb_security_group_id = module.security_group.alb_sg_id
}

module "bastion" {
  source              = "./modules/bastion"
  ami_id              = "ami-0d32100ea85327283"
  vpc_id              = module.vpc.wp_vpc_id
  public_subnets_ids  = module.subnets.public_subnets_ids
  key_name            = "Datascientest"
  bastion_sg_id       = module.security_group.bastion_sg_id
}






