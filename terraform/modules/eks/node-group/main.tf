resource "aws_eks_node_group" "nodes_general" {
  cluster_name         = format("%s-%s-%s-cluster", var.common_tags["id"], var.common_tags["owner"], var.common_tags["environment"])
  node_group_name      = format("%s-%s-%s-node-group", var.common_tags["id"], var.common_tags["owner"], var.common_tags["environment"])
  node_role_arn        = aws_iam_role.nodes_general.arn
  version              = var.eks_version
  subnet_ids           = values(var.private_subnets)
  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size_gb
  force_update_version = var.force_update_version
  instance_types       = [var.instance_types]

  labels = {
    role = "nodes-general"
  }
  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy_general,
    aws_iam_role_policy_attachment.eks_cni_policy_general,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only
  ]
}


