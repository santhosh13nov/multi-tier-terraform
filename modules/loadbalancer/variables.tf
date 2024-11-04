variable "load_balancer_name" {
  type    = string
  default = "ps-application-lb"
}

variable "internal" {
  type    = bool
  default = false
}

variable "load_balancer_type" {
  type    = string
  default = "application"
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}
