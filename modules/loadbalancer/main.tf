resource "aws_lb" "application_lb" {
  name               = var.load_balancer_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  tags = {
    Name = "ps-application-lb"
  }
}
