resource "aws_db_instance" "mysql_db" {
  allocated_storage    = var.allocated_storage
  engine               = var.db_engine
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  db_subnet_group_name = var.db_subnet_group_name
  publicly_accessible  = var.publicly_accessible
  storage_type         = var.storage_type
  skip_final_snapshot  = true

  tags = {
    Name = "ps-mysql-db"
  }
}
