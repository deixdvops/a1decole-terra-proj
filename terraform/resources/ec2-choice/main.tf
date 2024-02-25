terraform {
  required_version = "~> 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

# terraform {
#   backend "s3" {
#     bucket         = ""
#     dynamodb_table = ""
#     key            = ""
#     region         = ""
#   }
# }

locals {
  aws_region             = "us-east-1"
  hardcoded_ami          = false
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "ec2-key"
  vpc_security_group_ids = ["sg-0c51540c60857b7ed"]
  subnet_id              = "subnet-096d45c28d9fb4c14"
  volume_size            = "30"
  tags = {
    "id"             = "500"
    "owner"          = "SP"
    "teams"          = "cloud-ops"
    "environment"    = "sandbox"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

module "ec2" {
  source                 = "../../modules/ec2"
  aws_region             = local.aws_region
  hardcoded_ami          = local.hardcoded_ami
  instance_type          = local.instance_type
  key_name               = local.key_name
  vpc_security_group_ids = local.vpc_security_group_ids
  subnet_id              = local.subnet_id
  volume_size            = local.volume_size
  tags                   = local.tags
}