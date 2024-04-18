resource "aws_rds_cluster_parameter_group" "cluster_parameter_group" {
  name        = format("pd-%s-%s-%s-cluster-parameter-group", var.tags["id"], var.tags["environment"], var.tags["project"])
  family      = var.cluster_family
  description = format("%s-%s-%s-cluster-parameter-group", var.tags["id"], var.tags["environment"], var.tags["project"])
}