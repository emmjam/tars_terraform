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
  default     = "tars-reporting"
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

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "default_tags" {
  type        = "map"
  description = "Default tags to use"

  default = {
    Component = "tars-reporting"
  }
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 private domain for MIS DB"
}

variable "mis_rds_allocated_storage" {
  type        = "string"
  description = "MIS RDS DB Allocated Storage"
}

variable "mis_rds_storage_type" {
  type        = "string"
  description = "MIS RDS DB Storage Type"
}

variable "mis_rds_engine" {
  type        = "string"
  description = "MIS RDS DB Engine"
}

variable "mis_rds_engine_version" {
  type        = "string"
  description = "MIS RDS DB Engine Version"
}

variable "mis_rds_instance_class" {
  type        = "string"
  description = "MIS RDS DB Instance Class"
}

variable "mis_rds_port" {
  type        = "string"
  description = "TMIS RDS DB Port"
}

variable "mis_rds_public" {
  type        = "string"
  description = "Is MIS RDS DB Publically Accessible"
}

variable "mis_rds_multi_az" {
  type        = "string"
  description = "MIS DB Multi AZ"
}

variable "mis_rds_backup_retention" {
  type        = "string"
  description = "MIS RDS Backup Rentention"
}

variable "mis_rds_backup_window" {
  type        = "string"
  description = "MIS RDS Backup Window"
}

variable "mis_rds_maint_window" {
  type        = "string"
  description = "MIS RDS Maintenance Window"
}

variable "mis_rds_skip_final_snapshot" {
  type        = "string"
  description = "MIS RDS Final Snapshot required"
}

variable "mis_rds_password" {
  type        = "string"
  description = "MIS RDS Password"
}

variable "mis_rds_username" {
  type        = "string"
  description = "MIS RDS Username"
}

variable "mis_rds_apply_immediately" {
  type        = "string"
  description = "MIS RDS Apply changes immediately"
  default = "false"
}

variable "mis_rds_license_model" {
  type        = "string"
  description = "MIS RDS License Model"
}

variable "mis_rds_snapshot" {
  type        = "string"
  description = "MIS RDS Snapshot to use to restore data"
}

variable "mis_rds_autoscale" {
  type        = "string"
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "mis_rds_sid_name" {
  type        = "string"
  description = "Oracle SID name"
}

variable "mis_rds_subnets_cidrs" {
  type        = "list"
  description = "MIS RDS Subnet CIDR's"
  default     = []
}

variable "mgmt_aws_account_id" {
  type = "string"
  description = ""
}

variable "rsis_rds_allocated_storage" {
  type        = "string"
  description = "MIS RDS DB Allocated Storage"
}

variable "rsis_rds_storage_type" {
  type        = "string"
  description = "MIS RDS DB Storage Type"
}

variable "rsis_rds_engine" {
  type        = "string"
  description = "MIS RDS DB Engine"
}

variable "rsis_rds_engine_version" {
  type        = "string"
  description = "MIS RDS DB Engine Version"
}

variable "rsis_rds_instance_class" {
  type        = "string"
  description = "MIS RDS DB Instance Class"
}

variable "rsis_rds_port" {
  type        = "string"
  description = "TMIS RDS DB Port"
}

variable "rsis_rds_public" {
  type        = "string"
  description = "Is MIS RDS DB Publically Accessible"
}

variable "rsis_rds_multi_az" {
  type        = "string"
  description = "MIS DB Multi AZ"
}

variable "rsis_rds_backup_retention" {
  type        = "string"
  description = "MIS RDS Backup Rentention"
}

variable "rsis_rds_backup_window" {
  type        = "string"
  description = "MIS RDS Backup Window"
}

variable "rsis_rds_maint_window" {
  type        = "string"
  description = "MIS RDS Maintenance Window"
}

variable "rsis_rds_skip_final_snapshot" {
  type        = "string"
  description = "MIS RDS Final Snapshot required"
}

variable "rsis_rds_password" {
  type        = "string"
  description = "MIS RDS Password"
}

variable "rsis_rds_username" {
  type        = "string"
  description = "MIS RDS Username"
}

variable "rsis_rds_apply_immediately" {
  type        = "string"
  description = "MIS RDS Apply changes immediately"
  default = "false"
}

variable "rsis_rds_license_model" {
  type        = "string"
  description = "MIS RDS License Model"
}

variable "rsis_rds_snapshot" {
  type        = "string"
  description = "MIS RDS Snapshot to use to restore data"
}

variable "rsis_rds_autoscale" {
  type        = "string"
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "rsis_rds_sid_name" {
  type        = "string"
  description = "Oracle SID name"
}

# Added by TS-4753
# To be removed by TS-4722 and TS-4756
# TEMP UAT DB's in Prod
variable "uat_dbs_in_prod" {
  type        = "string"
  description = "Temporarily have UAT DB's in prod to shakedown prod app"
}

variable "tmp_mis_rds_username" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_mis_rds_password" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_mis_rds_allocated_storage" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_mis_rds_snapshot" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_rsis_rds_username" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_rsis_rds_password" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_rsis_rds_allocated_storage" {
  type        = "string"
  description = "Temp UAT DB in prod"
}

variable "tmp_rsis_rds_snapshot" {
  type        = "string"
  description = "Temp UAT DB in prod"
}
