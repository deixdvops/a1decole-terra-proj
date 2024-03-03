data "aws_security_group" "aurora_sg" {
  id = "sg-0948a46ccda9792ba"
}

resource "aws_rds_cluster" "aurora-cluster" {
  cluster_identifier              = var.cluster_identifier
  engine                          = var.engine
  engine_version                  = var.engine_version
  database_name                   = var.database_name
  master_username                 = var.master_username
  master_password                 = var.master_password
  db_subnet_group_name            = aws_db_subnet_group.main.name
  vpc_security_group_ids          = [data.aws_security_group.aurora_sg.id]
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.main.name
  skip_final_snapshot             = var.skip_final_snapshot
  storage_encrypted               = var.storage_encrypted
  apply_immediately               = var.apply_immediately
  deletion_protection             = var.deletion_protection
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-aurora-cluster", var.tags["owner"], var.tags["teams"], var.tags["environment"])
  })
}

resource "aws_rds_cluster_instance" "main" {
  count                  = var.create_cluster ? var.replica_count : 0
  identifier             = "instance-name-${var.name}-${count.index + 1}"
  cluster_identifier     = var.cluster_identifier
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  publicly_accessible    = var.publicly_accessible
  db_subnet_group_name   = aws_db_subnet_group.main.name
  depends_on = [aws_rds_cluster.aurora-cluster]
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }

  tags = var.tags
}
