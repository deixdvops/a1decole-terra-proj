terraform {
  source = "../../../../terraform/modules//vpc"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  region       = "us-east-1"
  cluster_name = "501-dev-deix"
  # cidr_block   = "10.0.0.0/16"
  cidr_block = "10.10.0.0/16"
  nat_number = "1"
  availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]

  tags = {
    "id"             = "5001"
    "owner"          = "Deix-devops"
    "environment"    = "dev"
    "project"        = "deix"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
