
variable "name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = "aurora-postgress"
}

variable "use_name_prefix" {
  description = "Determines whether to use `name` as is or create a unique name beginning with `name` as the specified prefix"
  type        = bool
  default     = true
}

variable "cluster_identifier" {
  type    = string
  default = "sp-aurora-postgres-cluster"
}

variable "engine" {
  type    = string
  default = "aurora-postgresql"
}
variable "engine_version" {
  type    = string
  default = "11.9"
}

variable "instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "database_name" {
  type    = string
  default = "mydatabase123"
}

variable "master_username" {
  type    = string
  default = "admin123"
}
variable "publicly_accessible" {
  type    = bool
  default = false
}
variable "master_password" {
  type    = string
  default = "Admin12345!"
}

# variable "preferred_backup_window" {
#   type    = string
#   default = "23:00-00:00"
# }

variable "skip_final_snapshot" {
  type    = bool
  default = true
}
variable "storage_encrypted" {
  type    = bool
  default = true
}
variable "deletion_protection" {
  type    = bool
  default = false
}
# variable "backup_retention_period" {
#   type    = number
#   default = 5
# }

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "aurora-postgresql11"
}
variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}
variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = false
}
variable "db_subnet_group_name" {
  description = "The name of the subnet group name (existing or created)"
  type        = string
  default     = ""
}
variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default = [
    "subnet-0feb05a4f4bd8d1f6",
    "subnet-046ae17597a6a0df2",
    "subnet-03d92784533510402"
  ]
}
variable "availability_zones" {
  description = "List of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply"
  type        = list(string)
  default     = null
}
variable "create_cluster" {
  description = "Whether cluster should be created (it affects almost all resources)"
  type        = bool
  default     = true
}
variable "replica_count" {
  description = "Number of reader nodes to create.  If `replica_scale_enable` is `true`, the value of `replica_scale_min` is used instead."
  type        = number
  default     = 1
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