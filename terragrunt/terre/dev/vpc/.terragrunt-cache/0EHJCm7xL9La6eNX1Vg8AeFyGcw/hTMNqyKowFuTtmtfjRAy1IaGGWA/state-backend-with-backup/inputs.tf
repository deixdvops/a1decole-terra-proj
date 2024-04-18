variable "aws_region_main" {
  type    = string
  default = "us-east-1"
}

variable "aws_region_backup" {
  type    = string
  default = "us-east-2"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default = {
    "id"             = "500"
    "owner"          = "SP"
    "teams"          = "cloud-ops"
    "environment"    = "sandbox"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "s3_versioning" {
  type    = string
  default = "Enabled"

}
