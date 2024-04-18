variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cidr_block" {
  type        = string
  description = "The vpc cidr-block"
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type        = string
  description = "default Makes your instances shared on the host. the other option is dedicated which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch"
  default     = "default"
}

variable "enable_dns_support" {
  type        = bool
  description = "Required for EKS. Enable/disable DNS support in the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Required for EKS. Enable/disable DNS hostnames in the VPC."
  default     = true
}

variable "enable_classiclink_dns_support" {
  type        = bool
  description = "Enable/disable ClassicLink DNS Support for the VPC."
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC."
  default     = false
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Enable EC2 to have public IP at launch time."
  default     = true
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "nat_gateway" {
  type    = number
  default = 1
}

variable "eips" {
  type    = number
  default = 1
}

variable "cluster_name" {
  type    = string
  default = "500-SP-cluster"
}

variable "common_tags" {
  type        = map(any)
  description = "# A map of tags to assign to the resource."
  default = {
    "id"             = "500"
    "owner"          = "SP"
    "teams"          = "cloud-ops"
    "environment"    = "sandbox"
    "project"        = "deix"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
