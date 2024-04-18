resource "aws_db_subnet_group" "subnet_group" {
  name = format("pg-%s-%s-%s-db-subnet-group", var.tags["id"], var.tags["environment"], var.tags["project"])
  subnet_ids = [
    data.aws_subnet.private_1.id,
    data.aws_subnet.private_2.id
  ]
}