output "rds_cluster_id" {
  description = "The ID of the cluster"
  value       = aws_rds_cluster.aurora-cluster.id

}
output "rds_cluster_endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.aurora-cluster.endpoint
}

output "rds_cluster_engine_version" {
  description = "The cluster engine version"
  value       = aws_rds_cluster.aurora-cluster.engine_version
}

output "rds_cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = var.database_name
}
output "cluster_master_user" {
  description = "The master user"
  value       = aws_rds_cluster.aurora-cluster.master_username
  sensitive   = true
}
output "cluster_master_password" {
  description = "The master password"
  value       = aws_rds_cluster.aurora-cluster.master_password
  sensitive   = true
}

output "rds_cluster_port" {
  description = "The port"
  value       = aws_rds_cluster.aurora-cluster.port
}

output "rds_cluster_instance_endpoints" {
  description = "A list of all cluster instance endpoints"
  value       = aws_rds_cluster_instance.cluster_instances.*.endpoint
}
output "rds_cluster_instance_ids" {
  description = "A list of all cluster instance ids"
  value       = aws_rds_cluster_instance.cluster_instances.*.id
}