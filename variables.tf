variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
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
  default = "10.0.5.0/24"
}

variable "private_subnet_2_cidr_block" {
  type    = string
  default = "10.0.6.0/24"
}


variable "availability_zone_1" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_2" {
  type    = string
  default = "us-east-1b"
}

variable "ssh_ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
  type    = string
  default = "ami-06b21ccaeff8cd686"  # Replace with a suitable AMI ID
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "user_data" {
  type    = string
  default = <<-EOF
            #!/bin/bash
            sudo yum update -y
            sudo yum install -y httpd
            sudo systemctl start httpd
            sudo systemctl enable httpd
            echo "Hello from EC2 instance" > /var/www/html/index.html
            EOF
}

variable "instance_count" {
  type    = number
  default = 2
}

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
  default = "password123"
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "storage_type" {
  type    = string
  default = "gp2"
}

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

variable "target_group_name" {
  type    = string
  default = "ps-ec2-target-group"
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
