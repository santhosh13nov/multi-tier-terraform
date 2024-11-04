variable "allocated_storage" {
  type    = number
  default = 20
}

variable "db_engine" {
  type    = string
  default = "mysql"
}

variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_name" {
  type    = string
  default = "psdatabase"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "password123"  # Replace with a secure password
  sensitive = true
}

variable "db_subnet_group_name" {
  type = string
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "storage_type" {
  type    = string
  default = "gp2"
}
