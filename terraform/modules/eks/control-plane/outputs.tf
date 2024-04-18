output "cluster_name" {
  # value = "${aws_vpc.main.id}"
  value = aws_eks_cluster.eks.name
}

output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}
