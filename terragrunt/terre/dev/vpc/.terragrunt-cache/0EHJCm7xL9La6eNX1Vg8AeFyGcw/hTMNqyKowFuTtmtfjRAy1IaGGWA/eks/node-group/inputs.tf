variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to resources"
  default = {
    "id"             = "500"
    "owner"          = "dp"
    "teams"          = "OPS"
    "environment"    = "sandbox"
    "project"        = "deix"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "force_update_version" {
  type        = bool
  description = "Force version update if existing pods are unable to be drained due to a pod disruption budget issue."
  default     = false
}

variable "eks_version" {
  type    = string
  default = "1.28"
}

variable "node_min" {
  type    = string
  default = "1"
}

variable "desired_node" {
  type    = string
  default = "2"
}

variable "node_max" {
  type    = string
  default = "6"
}

variable "blue_node_color" {
  type    = string
  default = "blue"
}

variable "green_node_color" {
  type    = string
  default = "green"
}

variable "blue" {
  type    = bool
  default = false
}

variable "green" {
  type    = bool
  default = false
}

variable "capacity_type" {
  type        = string
  description = "Valid values: ON_DEMAND, SPOT"
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = "Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64"
  default     = "AL2_x86_64"
}

variable "instance_types" {
  type        = string
  description = "t3.medium should be used at least"
  default     = "t2.micro"
}

variable "disk_size_gb" {
  type    = string
  default = "20"
}

variable "shared_owned" {
  type        = string
  description = "Valid values are shared or owned"
  default     = "shared"
}

variable "enable_cluster_autoscaler" {
  type        = string
  description = "Valid values are true or false"
  default     = "true"
}

variable "control_plane_name" {
  type    = string
  default = "sandbox-deix"
}

variable "cluster_name" {
  type    = string
  default = "sandbox-deix"
}

# variable "private_subnets" {
#   type = map(string)
#   default = {
#     us-east-1a = "subnet-0ccf3b7ab0673be56"
#     us-east-1b = "subnet-01035ba06546b54c8"
#     us-east-1c = "subnet-01a05406480f93067"
#   }
# }


variable "ec2_ssh_key" {
  type        = string
  description = "SSH key to connect to the node from bastion host"
  default     = "ec2"
}

