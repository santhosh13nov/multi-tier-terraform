variable "ami_id" {
  type    = string
  default = "ami-06b21ccaeff8cd686"  # Replace with an appropriate AMI ID
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
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
  default = 2  # Set default to 2 for two instances
}
