terraform {
  source = "../../../../terraform/modules//aurora-postgres"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "${get_terragrunt_dir()}/../vpc", 
    "${get_terragrunt_dir()}/../secret-manager",
    ]
}

inputs = {
  aws_region = "us-east-1"

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

cluster_family          = "aurora-postgresql11"
engine                  = "aurora-postgresql"
engine_version          = "11.9"
database_name           = "artifactory"
storage_encrypted       = true
backup_retention_period = "7"
preferred_backup_window = "07:00-09:00"
deletion_protection     = false
db_count                = "2"
instance_class          = "db.r5.large"
publicly_accessible     = false

tags = {
  "id"             = "500"
  "owner"          = "Deix-devops"
  "teams"          = "OPS"
  "environment"    = "dev"
  "project"        = "deix"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}

}
