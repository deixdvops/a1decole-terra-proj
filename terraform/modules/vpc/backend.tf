#terraform {
#   backend "s3" {
#     bucket         = "sandbox-a1-tf-state"
#     dynamodb_table = "sandbox-a1-tf-state-lock"
#     key            = "vpc/terraform.tf"
#     region         = "us-east-1"
#   }
# }