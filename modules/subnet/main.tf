resource "aws_subnet" "public_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name = "ps-public-subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name = "ps-public-subnet-2"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_1_cidr_block
  availability_zone = var.availability_zone_1

  tags = {
    Name = "ps-private-subnet-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.private_subnet_2_cidr_block
  availability_zone = var.availability_zone_2

  tags = {
    Name = "ps-private-subnet-2"
  }
}

resource "aws_db_subnet_group" "ps_db_subnet_group" {
  name       = "ps-db-subnet-group"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "ps-db-subnet-group"
  }
}

