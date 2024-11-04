output "private_subnet_1_cidr_block" {
  value = aws_subnet.private_1.cidr_block
}

output "private_subnet_2_cidr_block" {
  value = aws_subnet.private_2.cidr_block
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.ps_db_subnet_group.name
}
