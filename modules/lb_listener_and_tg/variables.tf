variable "load_balancer_arn" {
  type = string
}

variable "target_group_name" {
  type    = string
  default = "ps-ec2-target-group"
}

variable "vpc_id" {
  type = string
}

variable "listener_port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "health_check_path" {
  type    = string
  default = "/"
}
