terraform {
  source = "../../../../../terraform/modules//eks/node-group"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
dependencies {
  paths = [
    "${get_terragrunt_dir()}/../../vpc", 
    "${get_terragrunt_dir()}/../control-plane",
    ]
}

inputs = {
  aws_region              = "us-east-1"
  cluster_name            = "sandbox-deix"
  eks_version             = 1.28
  endpoint_private_access = false
  endpoint_public_access  = true
  common_tags = {
    "id"             = "500"
    "owner"          = "Deix-Devops"
    "teams"          = "OPS"
    "environment"    = "sandbox"
    "project"        = "Deix"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
