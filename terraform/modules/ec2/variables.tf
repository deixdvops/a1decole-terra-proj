variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "hardcoded_ami" {
  type = bool
  description = "Set to true to use a hardcoded AMI, false to dynamically fetch"
  default     = false
}
variable "ami" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = ""
}

# variable "vpc_security_group_ids" {
#   type    = list(string)
#   default = ["sg-0c51540c60857b7ed"]
# }
variable "vpc_id" {
  type = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "volume_size" {
  type    = string
  default = "10"
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
