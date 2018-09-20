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
  default     = "tars-dms"
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
    Component = "tars-dms"
  }
}

variable "whitelist" {
  type        = "list"
  description = "TARS Servers inbound whitelisted IP's"
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "dms_users" {
  type        = "list"
  description = "List of IAM Users from the 'users' list with DMS rights"
  default     = []
}

variable "tars_dms_allocated_storage" {
  type        = "string"
  description = "DMS instance storage size"
}

variable "tars_dms_apply_immediately" {
  type        = "string"
  description = "DMS instance when to apply changes"
}

variable "tars_dms_auto_minor_version_upgrade" {
  type        = "string"
  description = "DMS instance apply minor version upgrades"
}

variable "tars_dms_engine_version" {
  type        = "string"
  description = "DMS instance DMS engine version"
}

variable "tars_dms_multi_az" {
  type        = "string"
  description = "DMS instance multi AZ"
}

variable "tars_dms_maint_window" {
  type        = "string"
  description = "DMS instance maintanance windows"
}

variable "tars_dms_publicly_accessible" {
  type        = "string"
  description = "DMS instance publicly accessible"
}

variable "tars_dms_replication_instance_class" {
  type        = "string"
  description = "DMS instance type"
}

variable "capita_db_subnets" {
  type        = "string"
  description = "Capita DB subnets on-premise"
}

variable "capita_db_from_port" {
  type        = "string"
  description = "Start of DB port range"
}
variable "capita_db_to_port" {
  type        = "string"
  description = "End of DB port range"
}

variable "test_database_subnets_cidrs" {
  type        = "list"
  description = "RDS test subnets"
}

variable "transit_peering_enabled" {
  type        = "string"
  description = "Transit VPC flag"
}


variable "source_dms_tars_rds_skip_final_snapshot" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_allocated_storage" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_storage_type" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_engine" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_engine_version" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_instance_class" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_username" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_password" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_port" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_public" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_multi_az" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_backup_retention" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_backup_window" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_maint_window" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_apply_immediately" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_license_model" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_autoscale" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_name" {
  type        = "string"
  description = "tars dms"
}
variable "source_dms_tars_rds_snapshot" {
  type        = "string"
  description = "tars dms"
}


variable "target_dms_tars_rds_skip_final_snapshot" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_allocated_storage" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_storage_type" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_engine" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_engine_version" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_instance_class" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_username" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_password" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_port" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_public" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_multi_az" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_backup_retention" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_backup_window" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_maint_window" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_apply_immediately" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_license_model" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_autoscale" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_name" {
  type        = "string"
  description = "tars dms"
}
variable "target_dms_tars_rds_snapshot" {
  type        = "string"
  description = "tars dms"
}


variable "target_dms_on_prem_tars_rds_snapshot" {
  type        = "string"
  description = "tars dms"
}



variable "source_dms_cpc_rds_skip_final_snapshot" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_allocated_storage" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_storage_type" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_engine" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_engine_version" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_instance_class" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_username" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_password" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_port" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_public" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_multi_az" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_backup_retention" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_backup_window" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_maint_window" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_apply_immediately" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_license_model" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_autoscale" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_name" {
  type        = "string"
  description = "cpc dms"
}
variable "source_dms_cpc_rds_snapshot" {
  type        = "string"
  description = "cpc dms"
}


variable "target_dms_cpc_rds_skip_final_snapshot" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_allocated_storage" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_storage_type" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_engine" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_engine_version" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_instance_class" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_username" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_password" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_port" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_public" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_multi_az" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_backup_retention" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_backup_window" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_maint_window" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_apply_immediately" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_license_model" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_autoscale" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_name" {
  type        = "string"
  description = "cpc dms"
}
variable "target_dms_cpc_rds_snapshot" {
  type        = "string"
  description = "cpc dms"
}


variable "target_dms_on_prem_cpc_rds_snapshot" {
  type        = "string"
  description = "cpc dms"
}



variable "source_dms_rsis_rds_skip_final_snapshot" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_allocated_storage" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_storage_type" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_engine" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_engine_version" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_instance_class" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_username" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_password" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_port" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_public" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_multi_az" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_backup_retention" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_backup_window" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_maint_window" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_apply_immediately" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_license_model" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_autoscale" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_name" {
  type        = "string"
  description = "rsis dms"
}
variable "source_dms_rsis_rds_snapshot" {
  type        = "string"
  description = "rsis dms"
}



variable "target_dms_rsis_rds_skip_final_snapshot" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_allocated_storage" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_storage_type" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_engine" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_engine_version" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_instance_class" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_username" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_password" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_port" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_public" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_multi_az" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_backup_retention" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_backup_window" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_maint_window" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_apply_immediately" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_license_model" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_autoscale" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_name" {
  type        = "string"
  description = "rsis dms"
}
variable "target_dms_rsis_rds_snapshot" {
  type        = "string"
  description = "rsis dms"
}


variable "target_dms_on_prem_rsis_rds_snapshot" {
  type        = "string"
  description = "rsis dms"
}




variable "source_dms_mis_rds_skip_final_snapshot" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_allocated_storage" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_storage_type" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_engine" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_engine_version" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_instance_class" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_username" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_password" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_port" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_public" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_multi_az" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_backup_retention" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_backup_window" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_maint_window" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_apply_immediately" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_license_model" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_autoscale" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_name" {
  type        = "string"
  description = "mis dms"
}
variable "source_dms_mis_rds_snapshot" {
  type        = "string"
  description = "mis dms"
}



variable "target_dms_mis_rds_skip_final_snapshot" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_allocated_storage" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_storage_type" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_engine" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_engine_version" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_instance_class" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_username" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_password" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_port" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_public" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_multi_az" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_backup_retention" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_backup_window" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_maint_window" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_apply_immediately" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_license_model" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_autoscale" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_name" {
  type        = "string"
  description = "mis dms"
}
variable "target_dms_mis_rds_snapshot" {
  type        = "string"
  description = "mis dms"
}

variable "target_dms_on_prem_mis_rds_snapshot" {
  type        = "string"
  description = "mis dms"
}


variable "xe_role_name" {
  type = "string"
  description = ""
}

variable "dsa-drora-db-rac01" {
  type = "string"
  description = ""
}

variable "dsa-drora-db-rac02" {
  type = "string"
  description = ""
}

variable "dsa-drora-db-rac03" {
  type = "string"
  description = ""
}