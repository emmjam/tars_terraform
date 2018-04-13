variable "aws_region" {
  type        = "string"
  description = "eu-west-1"
}

variable "project" {
  type        = "string"
  description = ""
}

variable "environment" {
  type        = "string"
  description = ""
}

variable "component" {
  type        = "string"
  description = "TF Scaffold component"
  default     = "tars-core"
}

variable "account_component_name" {
  type        = "string"
  description = "The name of the account-level component as used in remote state"
  default     = "acc"
}

variable "account_environment" {
  type        = "string"
  description = "The environment name for the account level scope for the account in which this component is deployed"
}

variable "default_tags" {
  type        = "map"
  description = "Defautl tags to use"

  default = {
    Component = "tars-core"
  }
}

variable "tars_core_whitelist" {
  type        = "list"
  description = "TARS Core Servers inbound whitelisted IP's"
  default     = []
}

variable "wildfly-back" {
  type        = "map"
  description = "TARS Core backend configuration"
}

variable "wildfly-front" {
  type        = "map"
  description = "TARS Core frontend configuration"
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 private domain for TARS"
}

variable "tars_rds_allocated_storage" {
  type        = "string"
  description = "TARS RDS DB Allocated Storage"
}

variable "tars_rds_storage_type" {
  type        = "string"
  description = "TARS RDS DB Storage Type"
}

variable "tars_rds_engine" {
  type        = "string"
  description = "TARS RDS DB Engine"
}

variable "tars_rds_engine_version" {
  type        = "string"
  description = "TARS RDS DB Engine Version"
}

variable "tars_rds_instance_class" {
  type        = "string"
  description = "TARS RDS DB Instance Class"
}

variable "tars_rds_port" {
  type        = "string"
  description = "TARS RDS DB Port"
}

variable "tars_rds_public" {
  type        = "string"
  description = "Is TARS RDS DB Publically Accessible"
}

variable "tars_rds_multi_az" {
  type        = "string"
  description = "TARS DB Multi AZ"
}

variable "tars_rds_backup_retention" {
  type        = "string"
  description = "TARS RDS Backup Rentention"
}

variable "tars_rds_backup_window" {
  type        = "string"
  description = "TARS RDS Backup Window"
}

variable "tars_rds_maint_window" {
  type        = "string"
  description = "TARS RDS Maintenance Window"
}

variable "tars_rds_skip_final_snapshot" {
  type        = "string"
  description = "TARS RDS Final Snapshot required"
}

variable "tars_rds_password" {
  type        = "string"
  description = "TARS RDS Password"
}

variable "tars_rds_username" {
  type        = "string"
  description = "TARS RDS Username"
}

variable "tars_rds_apply_immediately" {
  type        = "string"
  description = "TARS RDS Apply changes immediately"
  default = "false"
}

variable "tars_rds_license_model" {
  type        = "string"
  description = "TARS RDS License Model"
}

variable "tars_rds_snapshot" {
  type        = "string"
  description = "TARS RDS Snapshot to use to restore data"
}

variable "tars_rds_autoscale" {
  type        = "string"
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "rds_subnets_cidrs" {
  type        = "list"
  description = "TARS RDS Subnet CIDR's"
}

variable "asg_termination_policies" {
  type        = "list"
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  default     = ["OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour"]
}

variable "asg_enabled_metrics" {
  type        = "list"
  description = "A list of metrics to apply to the ASG"

  default = [
    "GroupTerminatingInstances",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupPendingInstances",
    "GroupInServiceInstances",
    "GroupMinSize",
    "GroupTotalInstances",
  ]
}

variable "asg_default_tags" {
  type        = "list"
  description = "See code comments"
  default     = []
}

variable "lc_spot_price" {
  type        = "string"
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "lc_key_name" {
  type        = "string"
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "ami_build_id" {
  type        = "string"
  description = "TARS Core AMI build ID"
}

variable "mgmt" {
  type        = "map"
  description = "MGMT Account config"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}
