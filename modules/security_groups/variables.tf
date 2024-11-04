variable "vpc_id" {
  type = string
}

variable "ssh_ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "db_ingress_cidr" {
  type = string
}
