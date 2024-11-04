output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.subnets.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.subnets.public_subnet_2_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "route_table_id" {
  value = module.route_table.route_table_id
}

output "ec2_sg_id" {
  value = module.security_groups.ec2_sg_id
}

output "db_sg_id" {
  value = module.security_groups.db_sg_id
}

output "ec2_instance_ids" {
  value = module.ec2_instances.instance_ids
}

output "rds_instance_id" {
  value = module.rds_instance.rds_instance_id
}

output "load_balancer_arn" {
  value = module.load_balancer.load_balancer_arn
}

output "load_balancer_listener_arn" {
  value = module.load_balancer_listener.lb_listener_arn
}
