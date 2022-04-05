resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier   = "${var.service}-rds-cluster"
  engine               = "aurora-mysql"
  engine_version       = "5.7.mysql_aurora.2.03.2"
  engine_mode          = "serverless"
  availability_zones   = [var.az]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  database_name        = "${var.service}db"
  master_username      = "root"
  master_password      = random_password.master_password.result

  scaling_configuration {
    auto_pause     = false
    min_capacity   = 1
    max_capacity   = 16
    timeout_action = "ForceApplyCapacityChange"
  }
}

resource "random_password" "master_password" {
  length  = 20
  special = false
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.service}-db-subnet-group"
  subnet_ids = [aws_subnet.data.id]
}
