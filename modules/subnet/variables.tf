variable "vpc_id" { 
  type = string 
}

variable "subnet_1_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_2_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1_cidr_block" {
  type    = string
  default = "10.0.3.0/24"
}

variable "private_subnet_2_cidr_block" {
  type    = string
  default = "10.0.4.0/24"
}


variable "availability_zone_1" { 
  type    = string 
  default = "us-east-1a"
}

variable "availability_zone_2" { 
  type    = string 
  default = "us-east-1b"
}
