variable "aws_region" {
  type        = "string"
  description = "eu-west-1"
}

variable "project" {
  type        = "string"
  description = "TF Scaffold project"
}

variable "environment" {
  type        = "string"
  description = "TF Scaffold environment"
}

variable "component" {
  type        = "string"
  description = "TF Scaffold component"
  default     = "ibs"
}

variable "whitelist" {
  type        = "list"
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
  description = "Default tags"

}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = "TARS VPC private R53 domain name"
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

variable "ami_build_id" {
  type        = "string"
  description = "OBS AMI build ID"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type = "string"
  description = ""
}

variable "ibs_asg_max_size" {
  type = "string"
  description = ""
}
variable "ibs_asg_min_size" {
  type = "string"
  description = ""
}
variable "ibs_scaledown_desired" {
  type = "string"
  description = ""
}
variable "ibs_scaledown_recurrence" {
  type = "string"
  description = ""
}
variable "ibs_scaleup_desired" {
  type = "string"
  description = ""
}
variable "ibs_scaleup_recurrence" {
  type = "string"
  description = ""
}

variable "ibs_subnets_cidrs" {
  type = "list"
  description = ""
}
variable "ibs_puppet_nodetype" {
  type = "string"
  description = ""
}

variable "ibs_rds_instance_class" {
  type        = "string"
  description = ""
}

variable "ibs_rds_username" {
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
}

variable "ibs_rds_password" {
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
}

variable "ibs_rds_snapshot" {
  description = "The DB snapshot to use for the IBS DB used for IBS / FYNDI"
}

variable "ibs_rds_backup_retention_period" {
  type        = "string"
  description = ""
}

variable "ibs_rds_maint_window" {
  type        = "string"
  description = ""
}
variable "ibs_rds_backup_window" {
  type        = "string"
  description = ""
}

variable "ibs_instance_type" {
  type = "string"
  description = ""
}

variable "cert_name" {
  type = "string"
  description = "ACM cert name"
}

