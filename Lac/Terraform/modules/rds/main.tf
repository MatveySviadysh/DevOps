resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "mydb" {
  identifier              = "mydb"
  engine                  = "postgres"
  engine_version          = "15"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name  # Reference the subnet group
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot     = true
  publicly_accessible     = true
}


output "rds_instance_id" {
  value = aws_db_instance.mydb.id
}
