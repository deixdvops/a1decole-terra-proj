resource "aws_eks_node_group" "green-nodes" {
  cluster_name         = var.cluster_name
  node_group_name      = format("eks-%s-%s-green-group", var.common_tags["id"], var.common_tags["environment"])
  node_role_arn        = aws_iam_role.nodes_general.arn
  version              = var.eks_version
  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size_gb
  force_update_version = var.force_update_version
  instance_types       = [var.instance_types]
  subnet_ids = [
    data.aws_subnet.sub_priv1.id,
    data.aws_subnet.sub_priv2.id,
    data.aws_subnet.sub_priv3.id
  ]
  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.green_node_color == "green" && var.green ? var.desired_node : 0
    min_size     = var.green_node_color == "green" && var.green ? var.node_min : 0
    max_size     = var.green_node_color == "green" && var.green ? var.node_max : var.node_max
  }
  # labels = {
  #   deployment_nodegroup = var.deployment_nodegroup
  # }
  tags = merge(var.common_tags, {
    Name                                = format("eks-%s-%s-node-group", var.common_tags["id"], var.common_tags["environment"])
    "k8s.io/cluster-autoscaler/enabled" = "${var.enable_cluster_autoscaler}"
    },
  )

}

resource "aws_eks_node_group" "blue-nodes" {
  cluster_name         = var.cluster_name
  node_group_name      = format("eks-%s-%s-blue-group", var.common_tags["id"], var.common_tags["environment"])
  node_role_arn        = aws_iam_role.nodes_general.arn
  version              = var.eks_version
  ami_type             = var.ami_type
  capacity_type        = var.capacity_type
  disk_size            = var.disk_size_gb
  force_update_version = var.force_update_version
  instance_types       = [var.instance_types]
  subnet_ids = [
    data.aws_subnet.sub_priv1.id,
    data.aws_subnet.sub_priv2.id,
    data.aws_subnet.sub_priv3.id
  ]
  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.green_node_color == "blue" && var.green ? var.desired_node : 0
    min_size     = var.green_node_color == "blue" && var.green ? var.node_min : 0
    max_size     = var.green_node_color == "blue" && var.green ? var.node_max : var.node_max
  }
  # labels = {
  #   deployment_nodegroup = var.deployment_nodegroup
  # }
  tags = merge(var.common_tags, {
    Name                                                  = format("%s-%s-node-group", var.common_tags["id"], var.common_tags["environment"])
    "k8s.io/cluster-autoscaler/${var.control_plane_name}" = "${var.shared_owned}"
    "k8s.io/cluster-autoscaler/enabled"                   = "${var.enable_cluster_autoscaler}"
    },
  )

}
