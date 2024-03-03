resource "aws_rds_cluster_parameter_group" "main" {
  name   = "${local.name}-param-group"
  family = var.family
  tags = merge(var.tags, {
    Name = format("%s-%s-%s-cluster-parm-group", var.tags["owner"], var.tags["teams"], var.tags["environment"])
  })

  lifecycle {
    create_before_destroy = true
  }
}