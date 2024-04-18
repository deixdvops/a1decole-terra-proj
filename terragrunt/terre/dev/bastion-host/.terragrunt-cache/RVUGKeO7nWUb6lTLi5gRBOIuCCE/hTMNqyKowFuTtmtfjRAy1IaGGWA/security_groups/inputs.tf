variable "aws_region" {
  type    = string
  default = "us-east-1"
}



variable "ports" {
  type = list(number)
  default = [
    22,
    80,
    8080
  ]
}
variable "tags" {
  type = map(any)
  default = {
    "id"             = "2560"
    "owner"          = "DevOps Easy Learning"
    "teams"          = "DEL"
    "environment"    = "development"
    "project"        = "a1"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
