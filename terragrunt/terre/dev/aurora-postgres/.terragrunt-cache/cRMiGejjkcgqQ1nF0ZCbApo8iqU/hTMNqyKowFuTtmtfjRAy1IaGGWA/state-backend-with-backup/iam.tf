resource "aws_iam_policy_attachment" "replication" {
  provider   = aws.main
  name       = "backend-iam-role-attachment-replication"
  roles      = ["${aws_iam_role.replication.name}"]
  policy_arn = aws_iam_policy.replica_policy.arn
}

resource "aws_iam_role" "replication" {
  provider = aws.main
  name     = "backend-iam-role-replication"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
  tags               = var.tags
}


data "aws_iam_policy_document" "replica_policy" {
  provider = aws.main
  statement {
    effect = "Allow"
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]
    resources = [aws_s3_bucket.state.arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]
    resources = ["${aws_s3_bucket.state.arn}/*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:ReplicateObject",
      //"s3:ReplicateDelete",  # If you don't want to replicate delete from the main bucket
      "s3:ReplicateTags",
    ]
    resources = ["${aws_s3_bucket.backup.arn}/*"]
  }
}

resource "aws_iam_policy" "replica_policy" {
  provider = aws.main
  name     = "replica_policy"
  policy   = data.aws_iam_policy_document.replica_policy.json
}