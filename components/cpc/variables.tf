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
  default     = "cpc"
}

variable "puppet_environment" {
  type        = "string"
  description = "Environment for puppet on boot"
}

variable "whitelist" {
  type        = "list"
}

variable "dva_whitelist" {
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
  description = "CPC AMI build ID"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type = "string"
  description = ""
}

variable "cpc-front_asg_max_size" {
  type = "string"
  description = ""
}
variable "cpc-front_asg_min_size" {
  type = "string"
  description = ""
}
variable "cpc-front_instance_type" {
  type = "string"
  description = ""
}

variable "cpc-front_puppet_nodetype" {
  type = "string"
  description = ""
}

variable "cpc-back_puppet_nodetype" {
  type = "string"
  description = ""
}

variable "cpc_rds_allocated_storage" {
  type        = "string"
  description = "cpc RDS DB Allocated Storage"
}

variable "cpc_rds_storage_type" {
  type        = "string"
  description = "cpc RDS DB Storage Type"
}

variable "cpc_rds_engine" {
  type        = "string"
  description = "cpc RDS DB Engine"
}

variable "cpc_rds_engine_version" {
  type        = "string"
  description = "cpc RDS DB Engine Version"
}

variable "cpc_rds_instance_class" {
  type        = "string"
  description = "cpc RDS DB Instance Class"
}

variable "cpc_rds_port" {
  type        = "string"
  description = "cpc RDS DB Port"
}

variable "cpc_rds_public" {
  type        = "string"
  description = "Is cpc RDS DB Publically Accessible"
}

variable "cpc_rds_multi_az" {
  type        = "string"
  description = "cpc DB Multi AZ"
}

variable "cpc_rds_backup_retention" {
  type        = "string"
  description = "cpc RDS Backup Rentention"
}

variable "cpc_rds_backup_window" {
  type        = "string"
  description = "cpc RDS Backup Window"
}

variable "cpc_rds_maint_window" {
  type        = "string"
  description = "cpc RDS Maintenance Window"
}

variable "cpc_rds_skip_final_snapshot" {
  type        = "string"
  description = "cpc RDS Final Snapshot required"
}

variable "cpc_rds_password" {
  type        = "string"
  description = "cpc RDS Password"
}

variable "cpc_rds_username" {
  type        = "string"
  description = "cpc RDS Username"
}

variable "cpc_rds_apply_immediately" {
  type        = "string"
  description = "cpc RDS Apply changes immediately"
  default = "false"
}

variable "cpc_rds_license_model" {
  type        = "string"
  description = "cpc RDS License Model"
}

variable "cpc_rds_snapshot" {
  type        = "string"
  description = "cpc RDS Snapshot to use to restore data"
}

variable "cpc_rds_autoscale" {
  type        = "string"
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "cpc-front_subnets_cidrs" {
  type = "list"
  description = ""
}

variable "cpc-back_asg_max_size" {
  type = "string"
  description = ""
}
variable "cpc-back_asg_min_size" {
  type = "string"
  description = ""
}
variable "cpc-back_instance_type" {
  type = "string"
  description = ""
}
variable "cpc-back_subnets_cidrs" {
  type = "list"
  description = ""
}

variable "cert_name" {
  type = "string"
  description = "ACM cert name"
}

variable "cpc_cert" {
  type = "string"
  description = "CPC ACM cert name"
}

variable "dvla_elise_server" {
  type = "string"
  description = "DVLA Elise"
}

variable "cpc-front_scaledown_desired" {
  type = "string"
  description = ""
}
variable "cpc-front_scaleup_desired" {
  type = "string"
  description = ""
}
variable "cpc-front_scaledown_recurrence" {
  type = "string"
  description = ""
}
variable "cpc-front_scaleup_recurrence" {
  type = "string"
  description = ""
}

variable "cpc-back_scaledown_desired" {
  type = "string"
  description = ""
}
variable "cpc-back_scaleup_desired" {
  type = "string"
  description = ""
}
variable "cpc-back_scaledown_recurrence" {
  type = "string"
  description = ""
}
variable "cpc-back_scaleup_recurrence" {
  type = "string"
  description = ""
}
