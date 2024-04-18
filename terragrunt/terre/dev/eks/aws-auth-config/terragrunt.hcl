terraform {
  source = "../../../../../terraform/modules//eks/aws-auth-config"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}
# dependencies {
#   paths = [ 
#     "${get_terragrunt_dir()}/../control-plane",
#     ]
# }

inputs = {
  aws_region         = "us-east-1"
  control_plane_name = "sandbox-deix"
}
