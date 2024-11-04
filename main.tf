# Provider Configuration
provider "aws" {
  region = var.region
}

# VPC Module
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

# Subnet Module
module "subnets" {
  source                     = "./modules/subnet"
  vpc_id                     = module.vpc.vpc_id
  subnet_1_cidr_block        = var.subnet_1_cidr_block
  subnet_2_cidr_block        = var.subnet_2_cidr_block
  private_subnet_1_cidr_block = var.private_subnet_1_cidr_block
  private_subnet_2_cidr_block = var.private_subnet_2_cidr_block
  availability_zone_1        = var.availability_zone_1
  availability_zone_2        = var.availability_zone_2
}

# Internet Gateway Module
module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

# Route Table Module
module "route_table" {
  source              = "./modules/route_table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
}

# Security Groups Module
module "security_groups" {
  source           = "./modules/security_groups"
  vpc_id           = module.vpc.vpc_id
  ssh_ingress_cidr = var.ssh_ingress_cidr
  db_ingress_cidr  = module.subnets.private_subnet_1_cidr_block
}

# EC2 Instances Module
module "ec2_instances" {
  source             = "./modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.subnets.public_subnet_1_id
  security_group_ids = [module.security_groups.ec2_sg_id]
  user_data          = var.user_data
  instance_count     = var.instance_count
}

# RDS MySQL Database Module
module "rds_instance" {
  source               = "./modules/mysql"
  allocated_storage    = var.allocated_storage
  db_engine            = var.db_engine
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = module.subnets.db_subnet_group_name
  publicly_accessible  = var.publicly_accessible
  storage_type         = var.storage_type
}
# Load Balancer Module
module "load_balancer" {
  source             = "./modules/loadbalancer"
  load_balancer_name = var.load_balancer_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_group_ids = [module.security_groups.ec2_sg_id]
  subnet_ids         = [module.subnets.public_subnet_1_id, module.subnets.public_subnet_2_id]

  # Ensure the load balancer waits for these resources to be created
  depends_on = [
    module.ec2_instances,  # Ensure EC2 instances are created first
    module.rds_instance    # If applicable, wait for RDS instance creation
  ]
}
# Load Balancer Listener and Target Group Module
module "load_balancer_listener" {
  source            = "./modules/lb_listener_and_tg"
  load_balancer_arn = module.load_balancer.load_balancer_arn
  target_group_name = var.target_group_name
  vpc_id            = module.vpc.vpc_id
  listener_port     = var.listener_port
  protocol          = var.protocol
  health_check_path = var.health_check_path
}
