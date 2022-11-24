variable "account_component_name" {
  type        = string
  description = "The name of the account-level component as used in remote state"
  default     = "acc"
}

variable "account_environment" {
  type        = string
  description = "The environment name for the account level scope for the account in which this component is deployed"
}

variable "ami_build_id" {
  type        = string
  description = "AMI build ID"
  default     = ""
}

variable "fyndi_ami_id" {
  type        = string
  description = ""
}

variable "ibs_ami_id" {
  type        = string
  description = ""
}

variable "obs_ami_id" {
  type        = string
  description = ""
}

variable "asg_default_tags" {
  type        = map(string)
  description = "Default tag map"

  default = {
    Component = "apps"
  }
}

variable "asg_enabled_metrics" {
  type        = list(string)
  description = "A list of metrics to apply to the ASG"
  default     = ["GroupTerminatingInstances", "GroupMaxSize", "GroupDesiredCapacity", "GroupPendingInstances", "GroupInServiceInstances", "GroupMinSize", "GroupTotalInstances"]
}

variable "asg_termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  default     = ["OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour"]
}

variable "avarto_sftp_server" {
  type        = string
  description = "Avarto"
}

variable "avarto_aws_sftp_server" {
  type        = string
  description = "Avarto AWS"
}

variable "aws_account_id" {
  type        = string
  description = "Account ID"
}

variable "aws_autoscaling_enabled" {
  type        = string
  default     = "1"
  description = "Enable or not the built in AWS autocaling scaling group scheduled actions"
}

variable "aws_region" {
  type        = string
  description = "eu-west-1"
}

variable "batch_efs_subnets_cidrs" {
  type        = list(string)
  description = "Batch EFS subnets list"
  default     = []
}

variable "cert_name" {
  type        = string
  description = "ACM cert name"
}

variable "component" {
  type        = string
  description = "TF Scaffold component"
  default     = "apps"
}

variable "cpc-back_asg_max_size" {
  type        = string
  description = ""
}

variable "cpc-back_asg_min_size" {
  type        = string
  description = ""
}

variable "cpc-back_instance_type" {
  type        = string
  description = ""
}

variable "cpc-back_puppet_nodetype" {
  type        = string
  description = ""
}

variable "cpc-back_scaledown_desired" {
  type        = string
  description = ""
}

variable "cpc-back_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "cpc-back_scaleup_desired" {
  type        = string
  description = ""
}

variable "cpc-back_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "cpc-back_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "cpc-batch_asg_max_size" {
  type        = string
  description = ""
}

variable "cpc-batch_asg_min_size" {
  type        = string
  description = ""
}

variable "cpc-batch_instance_type" {
  type        = string
  description = ""
}

variable "cpc-batch_puppet_nodetype" {
  type        = string
  description = ""
}

variable "cpc_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "cpc_dvsa_internet_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "cpc_efs_subnets_cidrs" {
  type        = list(string)
  description = "CPC EFS subnets list"
}

variable "cpc-front_asg_max_size" {
  type        = string
  description = ""
}

variable "cpc-front_asg_min_size" {
  type        = string
  description = ""
}

variable "cpc-front_instance_type" {
  type        = string
  description = ""
}

variable "cpc-front_puppet_nodetype" {
  type        = string
  description = ""
}

variable "cpc-front_scaledown_desired" {
  type        = string
  description = ""
}

variable "cpc-front_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "cpc-front_scaleup_desired" {
  type        = string
  description = ""
}

variable "cpc-front_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "cpc-front_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "cpc_internet_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "cpc_private_cert" {
  type        = string
  description = "cpc private cert subdomain"
}

variable "cpc_rds_allocated_storage" {
  type        = string
  description = "cpc RDS DB Allocated Storage"
}

variable "cpc_rds_apply_immediately" {
  type        = string
  description = "cpc RDS Apply changes immediately"
  default     = "false"
}

variable "ibs_rds_apply_immediately" {
  type        = string
  description = "ibs RDS Apply changes immediately"
  default     = "false"
}

variable "cpc_rds_autoscale" {
  type        = string
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "cpc_rds_backup_retention" {
  type        = string
  description = "cpc RDS Backup Rentention"
}

variable "cpc_rds_backup_window" {
  type        = string
  description = "cpc RDS Backup Window"
}

variable "cpc_rds_engine" {
  type        = string
  description = "cpc RDS DB Engine"
}

variable "cpc_rds_engine_version" {
  type        = string
  description = "cpc RDS DB Engine Version"
}

variable "cpc_rds_instance_class" {
  type        = string
  description = "cpc RDS DB Instance Class"
}

variable "cpc_rds_license_model" {
  type        = string
  description = "cpc RDS License Model"
}

variable "cpc_rds_maint_window" {
  type        = string
  description = "cpc RDS Maintenance Window"
}

variable "cpc_rds_multi_az" {
  type        = string
  description = "cpc DB Multi AZ"
}

variable "cpc_rds_port" {
  type        = string
  description = "cpc RDS DB Port"
}

variable "cpc_rds_public" {
  type        = string
  description = "Is cpc RDS DB Publically Accessible"
}

variable "cpc_rds_sid_name" {
  type        = string
  description = "Oracle SID name"
}

variable "cpc_rds_skip_final_snapshot" {
  type        = string
  description = "cpc RDS Final Snapshot required"
}

variable "cpc_rds_snapshot" {
  type        = string
  description = "cpc RDS Snapshot to use to restore data"
}

variable "cpc_rds_storage_type" {
  type        = string
  description = "cpc RDS DB Storage Type"
}

variable "cpc_rds_username" {
  type        = string
  description = "cpc RDS Username"
}

variable "cpc_sftp_subnets_cidrs" {
  type        = list(string)
  description = ""
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags"
}

variable "dva_whitelist" {
  type        = list(string)
  description = ""
  default     = []
}

variable "dvla_adli_server" {
  type        = string
  description = "ADLI"
}

variable "dvla_elise_server" {
  type        = string
  description = "DVLA Elise"
}

variable "dvsa_dns_servers" {
  type        = list(string)
  description = "DVSA Azure DNS Servers"
  default     = []
}

variable "dvsa_ldap_server" {
  type        = string
  description = "DVSA LDAP server for priter lookup"
}

variable "environment" {
  type        = string
  description = "TF Scaffold environment"
}

variable "fyndi-b_asg_max_size" {
  type        = string
  description = ""
}

variable "fyndi-b_asg_min_size" {
  type        = string
  description = ""
}

variable "fyndi-b_instance_type" {
  type        = string
  description = ""
}

variable "fyndi-b_puppet_nodetype" {
  type        = string
  description = ""
}

variable "fyndi-b_scaledown_desired" {
  type        = string
  description = ""
}

variable "fyndi-b_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "fyndi-b_scaleup_desired" {
  type        = string
  description = ""
}

variable "fyndi-b_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "fyndi-b_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "fyndi_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "fyndi-f_asg_max_size" {
  type        = string
  description = ""
}

variable "fyndi-f_asg_min_size" {
  type        = string
  description = ""
}

variable "fyndi-f_instance_type" {
  type        = string
  description = ""
}

variable "fyndi-f_puppet_nodetype" {
  type        = string
  description = ""
}

variable "fyndi-f_scaledown_desired" {
  type        = string
  description = ""
}

variable "fyndi-f_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "fyndi-f_scaleup_desired" {
  type        = string
  description = ""
}

variable "fyndi-f_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "fyndi-f_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "ibs_asg_max_size" {
  type        = string
  description = ""
}

variable "ibs_asg_min_size" {
  type        = string
  description = ""
}

variable "ibsdb_cluster_delete_protect" {
  type        = string
  description = "IBS cluster deletion protection"
}

variable "ibs_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "ibs_instance_type" {
  type        = string
  description = ""
}

variable "ibs_puppet_nodetype" {
  type        = string
  description = ""
}

variable "ibs_rds_backup_retention_period" {
  type        = string
  description = ""
}

variable "ibs_rds_backup_window" {
  type        = string
  description = ""
}

variable "ibs_rds_instance_class" {
  type        = string
  description = ""
}

variable "ibs_rds_maint_window" {
  type        = string
  description = ""
}

variable "ibs_rds_snapshot" {
  type        = string
  description = "The DB snapshot to use for the IBS DB used for IBS / FYNDI"
}

variable "ibs_rds_username" {
  type        = string
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
}

variable "ibs_rds_engine_version" {
  type        = string
  description = "Version of Mysql used for IBSDB RDS Cluster"
}

variable "ibs_aurora_engine" {
  type        = string
  description = "Version of Mysql used for IBSDB RDS Cluster"
}

variable "ibs_rds_major_version_upgrade" {
  type        = string
  description = "Allow DB Version Update"
}

variable "ibs_rds_parameter_group_name" {
  type        = string
  description = "Parameter group name date"
}

variable "ibs_rdswriter_group_name" {
  type        = string
  description = "Writer group name date"
}

variable "ibs_scaledown_desired" {
  type        = string
  description = ""
}

variable "ibs_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "ibs_scaleup_desired" {
  type        = string
  description = ""
}

variable "ibs_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "ibs_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "irdt_cert" {
  type        = string
  description = "ACM cert name"
}

variable "lc_key_name" {
  type        = string
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "lc_spot_price" {
  type        = string
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "mes_cidr_block" {
  type        = list(string)
  description = "MES CIDR block for DB SG connection"
  default     = []
}

variable "mgmt_aws_account_id" {
  type        = string
  description = ""
}

variable "obs_asg_max_size" {
  type        = string
  description = ""
}

variable "obs_asg_min_size" {
  type        = string
  description = ""
}

variable "obs_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "obs_instance_type" {
  type        = string
  description = ""
}

variable "obs_puppet_nodetype" {
  type        = string
  description = ""
}

variable "obs_scaledown_desired" {
  type        = string
  description = ""
}

variable "obs_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "obs_scaleup_desired" {
  type        = string
  description = ""
}

variable "obs_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "obs_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "private_cert_domain_name" {
  type        = string
  description = "R53 private domain for CPC"
}

variable "private_domain_name" {
  type        = string
  description = "TARS VPC private R53 domain name"
}

variable "project" {
  type        = string
  description = "TF Scaffold project"
}

variable "rds_subnets_cidrs" {
  type        = list(string)
  description = "TARS RDS Subnet CIDR's"
  default     = []
}

variable "spot_pricing" {
  type        = map(string)
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "sweda_samba_server" {
  type        = string
  description = "Sweda"
}

variable "tars_cert" {
  type        = string
  description = "CPC ACM cert name"
}

variable "tars_private_cert" {
  type        = string
  description = "TARS Private ACM cert name"
}

variable "tars_rds_allocated_storage" {
  type        = string
  description = "TARS RDS DB Allocated Storage"
}

variable "tars_rds_apply_immediately" {
  type        = string
  description = "TARS RDS Apply changes immediately"
  default     = "false"
}

variable "tars_rds_autoscale" {
  type        = string
  description = "Auto shutdown/restart RDS Instances tag"
}

variable "tars_rds_backup_retention" {
  type        = string
  description = "TARS RDS Backup Rentention"
}

variable "tars_rds_backup_window" {
  type        = string
  description = "TARS RDS Backup Window"
}

variable "tars_rds_engine" {
  type        = string
  description = "TARS RDS DB Engine"
}

variable "tars_rds_engine_version" {
  type        = string
  description = "TARS RDS DB Engine Version"
}

variable "tars_rds_allow_major_engine_version_upgrade" {
  type        = string
  description = "TARS RDS DB Major Engine Version Upgrade"
}

variable "tars_rds_parameter_group_name" {
  type        = string
  description = "TARS RDS DB Parameter Group Name"
}

variable "tars_rds_option_group_name" {
  type        = string
  description = "TARS RDS DB Option Group Name"
}

variable "tars_rds_instance_class" {
  type        = string
  description = "TARS RDS DB Instance Class"
}

variable "tars_rds_license_model" {
  type        = string
  description = "TARS RDS License Model"
}

variable "tars_rds_maint_window" {
  type        = string
  description = "TARS RDS Maintenance Window"
}

variable "tars_rds_multi_az" {
  type        = string
  description = "TARS DB Multi AZ"
}

variable "tars_rds_port" {
  type        = string
  description = "TARS RDS DB Port"
}

variable "tars_rds_public" {
  type        = string
  description = "Is TARS RDS DB Publically Accessible"
}

variable "tars_rds_sid_name" {
  type        = string
  description = "Oracle SID name"
}

variable "tars_rds_skip_final_snapshot" {
  type        = string
  description = "TARS RDS Final Snapshot required"
}

variable "tars_rds_snapshot" {
  type        = string
  description = "TARS RDS Snapshot to use to restore data"
}

variable "tars_rds_storage_type" {
  type        = string
  description = "TARS RDS DB Storage Type"
}

variable "tars_rds_username" {
  type        = string
  description = "TARS RDS Username"
}

variable "tf_state_bucket_prefix" {
  type        = string
  description = "TF State bucket prefix"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "whitelist" {
  type        = list(string)
  description = "TARS Core Servers inbound whitelisted IPs"
  default     = []
}

variable "wildfly-back_asg_max_size" {
  type        = string
  description = ""
}

variable "wildfly-back_asg_min_size" {
  type        = string
  description = ""
}

variable "wildfly-back_instance_type" {
  type        = string
  description = ""
}

variable "wildfly-back_puppet_nodetype" {
  type        = string
  description = ""
}

variable "wildfly-back_scaledown_desired" {
  type        = string
  description = ""
}

variable "wildfly-back_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "wildfly-back_scaleup_desired" {
  type        = string
  description = ""
}

variable "wildfly-back_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "wildfly-batch_asg_max_size" {
  type        = string
  description = ""
}

variable "wildfly-batch_asg_min_size" {
  type        = string
  description = ""
}

variable "wildfly-batch_instance_type" {
  type        = string
  description = ""
}

variable "wildfly-batch_puppet_nodetype" {
  type        = string
  description = ""
}

variable "wildfly-batch_scaledown_desired" {
  type        = string
  description = ""
}

variable "wildfly-batch_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "wildfly-batch_scaleup_desired" {
  type        = string
  description = ""
}

variable "wildfly-batch_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "wildfly-front_asg_max_size" {
  type        = string
  description = ""
}

variable "wildfly-front_asg_min_size" {
  type        = string
  description = ""
}

variable "wildfly-front_instance_type" {
  type        = string
  description = ""
}

variable "wildfly-front_puppet_nodetype" {
  type        = string
  description = ""
}

variable "wildfly-front_scaledown_desired" {
  type        = string
  description = ""
}

variable "wildfly-front_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "wildfly-front_scaleup_desired" {
  type        = string
  description = ""
}

variable "wildfly-front_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "ebs_backup_env" {
  type        = list(string)
  description = ""
  default     = []
}

variable "dlm_time" {
  type        = string
  description = "dlm start time"
}

variable "dlm_interval" {
  type        = string
  description = "how often dlm runs"
}

variable "dlm_state" {
  type        = string
  description = "enable or disable policy"
}

variable "dlm_retain_rule" {
  type        = string
  description = "How many backups to retain"
}

variable "ibs1_ibs2_redirect_env" {
  type        = list(string)
  description = ""
  default     = []
}

variable "ibsdb_monitoring_enabled" {
  type        = string
  description = "Whether to monitor IBSDB for concurrent users"
  default     = "false"
}

variable "unhealthy_host_alarm_count" {
  type        = string
  description = "Number of alarms to have in this account"
  default     = "0"
}

variable "opsgenie_endpoint" {
  type        = string
  description = "The opsgenie endpoint to send alerts to TSS"
}

variable "cwl_retention_days" {
  type        = string
  description = "Retention period in days for Cloudwatch Logs Log Groups for this component"
  default     = "731"
}
variable "ibs_high_cpu_cw_metric_alarm_enabled" {
  type        = string
  description = "Enable or disable cpuutilisation CloudWatch Metrics alarm"

}

