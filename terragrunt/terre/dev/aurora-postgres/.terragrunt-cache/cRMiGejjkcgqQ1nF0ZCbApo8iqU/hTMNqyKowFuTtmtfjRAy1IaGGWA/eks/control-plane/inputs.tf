variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
  default = {
    "id"             = "500"
    "owner"          = "DP"
    "teams"          = "OPS"
    "environment"    = "sandbox"
    "project"        = "rain"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "cluster_name" {
  type    = string
  default = "500-sandbox-dp"
}

variable "eks_version" {
  type    = string
  default = "1.28"
}

variable "endpoint_private_access" {
  type    = bool
  default = false
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "public_subnets" {
  type = map(string)
  default = {
    us-east-1a = "subnet-09add942d6b6b416b"
    us-east-1b = "subnet-0fc6c00211c26be38"
    us-east-1c = "subnet-0e1fadb059166416c"
  }
}