resource "aws_db_subnet_group" "main" {
  name       = "${local.name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-subnet-group", var.tags["owner"], var.tags["teams"], var.tags["environment"])
  })
}


