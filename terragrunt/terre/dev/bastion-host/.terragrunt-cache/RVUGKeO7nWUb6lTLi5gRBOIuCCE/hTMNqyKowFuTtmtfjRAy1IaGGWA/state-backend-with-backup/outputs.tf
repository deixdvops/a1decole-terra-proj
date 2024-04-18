output "state_bucket_name" {
    value = aws_s3_bucket.state.bucket
    description = "state_bucket_name"
  
}

output "backup_bucket_name" {
    value = aws_s3_bucket.backup.bucket
  
}
output "dynamodb_name" {
    value = aws_dynamodb_table.tf-state-lock.name
  
}