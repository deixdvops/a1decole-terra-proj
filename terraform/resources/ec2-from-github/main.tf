locals {
  aws_region             = "us-east-1"
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t2.nano"
  key_name               = "my-ec2-key-pair"
  vpc_security_group_ids = ["sg-0474a6768fdb3d76b"]
  subnet_id              = "subnet-030fc79e9f98d2727"
  volume_size            = "10"
  tags = {
    "id"             = "300"
    "owner"          = "DevOps Deix"
    "teams"          = "test"
    "environment"    = "sandbox"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}


module "ec2-github" {
  source                 = "git@github.com:deixdvops/a1decole-terra-proj//terraform/modules/ec2?ref=main"
  aws_region             = local.aws_region
  ami                    = local.ami
  instance_type          = local.instance_type
  key_name               = local.key_name
  vpc_security_group_ids = local.vpc_security_group_ids
  subnet_id              = local.subnet_id
  volume_size            = local.volume_size
  tags                   = local.tags
}