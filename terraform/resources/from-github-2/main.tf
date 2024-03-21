locals {
  aws_region             = "us-east-1"
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.micro"
  key_name               = "my-ec2-key-pair"
  vpc_security_group_ids = ["sg-09514d6768197ddf4"]
  subnet_id              = "subnet-030fc79e9f98d2727"
  volume_size            = "8"
  aws_vpc   = "vpc-065582b41d6847915"
  tags = {
    "id"             = "301"
    "owner"          = "DevOps Deix"
    "teams"          = "dev"
    "environment"    = "dev"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
terraform {
  backend "s3" {
    bucket = "sandbox-a1-tf-state"
    dynamodb_table = "sandbox-a1-tf-state-lock"
    key    = "ec2"
    region = "us-east-1"
  }
}

module "my-ec2" {
  source                 = "git@github.com:deixdvops/a1decole-terra-proj//terraform/modules/ec2?ref=main"
  aws_region             = local.aws_region
  ami                    = local.ami
  instance_type          = local.instance_type
  key_name               = local.key_name
  #vpc_security_group_ids = local.vpc_security_group_ids
  subnet_id              = local.subnet_id
  volume_size            = local.volume_size
  tags                   = local.tags
}