terraform {
  source = "../../../../terraform/modules//secret-manager"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  aws_region = "us-east-1"
aws-secret-string = [
  "artifactory-db-username",
  "artifactory-db-password"
]
}
