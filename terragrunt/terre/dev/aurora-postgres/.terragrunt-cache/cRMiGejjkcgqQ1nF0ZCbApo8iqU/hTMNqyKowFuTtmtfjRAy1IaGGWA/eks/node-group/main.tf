resource "aws_eks_node_group" "nodes_general" {
  cluster_name         = format("%s-%s-%s", var.common_tags["id"], var.common_tags["environment"], var.common_tags["owner"])
  node_group_name      = format("%s-%s-%s-node-group", var.common_tags["id"], var.common_tags["environment"], var.common_tags["owner"])
  node_role_arn        = aws_iam_role.nodes_general.arn
  version              = var.eks_version
  subnet_ids           = values(var.private_subnets)
  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size_gb
  force_update_version = var.force_update_version
  instance_types       = [var.instance_types]
  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }
  labels = {
    deployment_nodegroup = var.deployment_nodegroup
  }
  tags = merge(var.common_tags, {
    Name                                                  = format("%s-%s-%s-node-group", var.common_tags["id"], var.common_tags["environment"], var.common_tags["project"])
    "k8s.io/cluster-autoscaler/${var.control_plane_name}" = "${var.shared_owned}"
    "k8s.io/cluster-autoscaler/enabled"                   = "${var.enable_cluster_autoscaler}"
    },
  )
  depends_on = [
    aws_iam_role_policy_attachment.worker_node_policy_general,
    aws_iam_role_policy_attachment.eks_cni_policy_general,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only
  ]
}


