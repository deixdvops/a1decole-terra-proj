resource "aws_s3_bucket" "state" {
  provider = aws.main
  bucket   = "${var.tags["environment"]}-${var.tags["project"]}-tf-state"
  tags     = var.tags
}

resource "aws_s3_bucket_versioning" "main_versioning" {
  provider = aws.main
  bucket   = aws_s3_bucket.state.id
  versioning_configuration {
    status = var.s3_versioning
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider   = aws.main
  depends_on = [aws_s3_bucket_versioning.main_versioning]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.state.id

  rule {
    id     = "StateReplicationAll"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
  }
}
resource "aws_s3_bucket" "backup" {
  provider      = aws.backup
  force_destroy = true
  bucket        = "${var.tags["environment"]}-${var.tags["project"]}-tf-state-backup"
  tags          = var.tags
}

resource "aws_s3_bucket_versioning" "replica-versioning" {
  provider = aws.backup
  bucket   = aws_s3_bucket.backup.id
  versioning_configuration {
    status = var.s3_versioning
  }
}

resource "aws_dynamodb_table" "tf-state-lock" {
  provider       = aws.main
  name           = "${var.tags["environment"]}-${var.tags["project"]}-tf-state-lock"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = var.tags
}