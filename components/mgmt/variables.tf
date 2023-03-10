variable "aws_region" {
  type        = string
  description = ""
}

variable "project" {
  type        = string
  description = ""
}

variable "environment" {
  type        = string
  description = ""
}

variable "component" {
  type        = string
  description = ""
  default     = "mgmt"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "default_tags" {
  type        = map(string)
  description = ""

  default = {
    Component = "mgmt"
  }
}

variable "jenkinsctrl_ami_build_id" {
  type        = string
  description = ""
}

variable "builder_subnets_cidrs" {
  type        = list(string)
  description = "Jenkins Builder node subnet cidr ranges"
  default     = []
}

variable "builder" {
  type        = map(string)
  description = ""
}

variable "spot_pricing" {
  type        = map(string)
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "builder_executors" {
  type        = string
  description = ""
  default     = "10"
}

variable "mgmt_aws_account_id" {
  type        = string
  description = ""
}

variable "s3_yum_ro_principals" {
  type        = list(string)
  description = "The list of AWS Account IDs that we grant delegated read access to for the yum bucket"
  default     = []
}

variable "asg_default_tags" {
  type = list(object({
    key                 = string
    value               = string
    propagate_at_launch = string
  }))
  description = ""
}

variable "aws_account_alias" {
  type        = string
  description = "The IAM AWS Account alias"
}

variable "aws_account_ids" {
  type        = list(string)
  description = "List of aws account ids in use"
}

variable "account_environment" {
  type        = string
  description = "Test shortname of current AWS account"
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID of current account"
}

variable "tf_state_bucket_prefix" {
  type        = string
  description = ""
}

variable "sonarqube" {
  type        = map(string)
  description = "Sonarqube Configuration"
}

variable "vpc_cidr" {
  type        = string
  description = ""
}

variable "private_domain_name" {
  type        = string
  description = ""
}

variable "nat_subnets_cidr" {
  type        = list(string)
  description = ""
}

variable "natgw_subnets_cidr" {
  type        = list(string)
  description = ""
}

variable "whitelist" {
  type        = list(string)
  description = ""
  default     = []
}

variable "jenkins_blue_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "jenkins_blue_version" {
  type        = string
  description = ""
}

variable "jenkins_green_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "jenkins_green_version" {
  type        = string
  description = ""
  default     = "latest"
}

variable "jenkins_elb_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "jenkinsnode_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gitlab_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gitlab_elb_private_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gitlab_elb_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gitlab_db_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "gitlab_redis_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "alb_public_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "deployer_pub_key" {
  type        = string
  description = "Pub SSH ky for deployer"
}

variable "ctrl_peers_xacct" {
  type = list(object({
    vpc_id     = string
    cidr_block = string
    account_id = string
  }))
  description = ""
}

variable "ctrl_peers_local" {
  type = list(object({
    vpc_id     = string
    cidr_block = string
    account_id = string
  }))
  description = ""
  default     = []
}

variable "base_peers_xacct" {
  type = list(object({
    vpc_id     = string
    cidr_block = string
    account_id = string
  }))
  description = ""
}

variable "base_peers_local" {
  type = list(object({
    vpc_id     = string
    cidr_block = string
    account_id = string
  }))
  description = ""
}

# EBS Snapshots

variable "ebs_snapshot_cleanup_cloudwatch_log_retention_in_days" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_cw_metric_log_error_pattern" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_cw_rule_schedule_expression" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_memory_size" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_min_num_of_snapshots_to_retain" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_min_retention_days" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_publish" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_s3_key" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cleanup_timeout" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cloudwatch_log_retention_in_days" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cw_metric_log_error_pattern" {
  type        = string
  description = ""
}

variable "ebs_snapshot_cw_rule_schedule_expression" {
  type        = string
  description = ""
}

variable "ebs_snapshot_is_enabled" {
  type        = string
  description = ""
}

variable "ebs_snapshot_memory_size" {
  type        = string
  description = ""
}

variable "ebs_snapshot_publish" {
  type        = string
  description = ""
}

variable "ebs_snapshot_s3_key" {
  type        = string
  description = ""
}

variable "ebs_snapshot_timeout" {
  type        = string
  description = ""
}

#### Gitlab

variable "gitlab_ami_build_id" {
  type        = string
  description = ""
}

variable "gitlab_name" {
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

variable "gitlab_db_allocated_storage" {
  type        = string
  description = ""
}

variable "gitlab_db_backup_retention_period" {
  type        = string
  description = ""
}

variable "gitlab_db_backup_window" {
  type        = string
  description = ""
}

variable "gitlab_db_db_name" {
  type        = string
  description = ""
}

variable "gitlab_db_snapshot_id" {
  type        = string
  description = ""
}

variable "gitlab_db_engine_version" {
  type        = string
  description = ""
}

variable "gitlab_db_instance_class" {
  type        = string
  description = ""
}

variable "gitlab_db_maintenance_window" {
  type        = string
  description = ""
}

variable "gitlab_db_multi_az" {
  type        = string
  description = ""
}

variable "gitlab_db_password" {
  type        = string
  description = ""
}

variable "gitlab_db_pg_family" {
  type        = string
  description = ""
}

variable "gitlab_db_skip_final_snapshot" {
  type        = string
  description = ""
}

variable "gitlab_db_storage_type" {
  type        = string
  description = ""
}

variable "gitlab_db_username" {
  type        = string
  description = ""
}

variable "gitlab_ebs_volume_size" {
  type        = string
  description = ""
}

variable "gitlab_ebs_volume_type" {
  type        = string
  description = ""
}

variable "gitlab_elb_public_public_port" {
  type        = string
  description = ""
}

variable "gitlab_elb_public_public_protocol" {
  type        = string
  description = ""
}

variable "gitlab_instance_type" {
  type        = string
  description = ""
}

variable "gitlab_redis_endpoint_address" {
  type        = string
  description = ""
}

variable "gitlab_redis_engine_version" {
  type        = string
  description = ""
}

variable "gitlab_redis_maintenance_window" {
  type        = string
  description = ""
}

variable "gitlab_redis_node_type" {
  type        = string
  description = ""
}

variable "gitlab_redis_parameter_group_name" {
  type        = string
  description = ""
}

variable "gitlab_redis_snapshot_retention_limit" {
  type        = string
  description = ""
}

variable "gitlab_redis_snapshot_window" {
  type        = string
  description = ""
}

variable "gitlab_cw_alarm_failure_actions" {
  type        = list(string)
  description = "The action to execute when this alarm transitions into an ALARM state from any other state."
  default     = []
}

## GuardDuty Notify

variable "guardduty_notify" {
  type        = map(string)
  description = "Guardduty Notifications configuration"
}

## Jenkins

variable "jenkins_asg_max_size" {
  type        = string
  description = ""
}

variable "jenkins_asg_min_size" {
  type        = string
  description = ""
}

variable "jenkins_ami_build_id" {
  type        = string
  description = ""
}

variable "jenkins_blue_nodes_number" {
  type        = string
  description = ""
}

variable "jenkins_ebs_volume_size" {
  type        = string
  description = ""
}

variable "jenkins_ebs_volume_type" {
  type        = string
  description = ""
}

variable "jenkins_instance_type" {
  type        = string
  description = ""
}

variable "jenkins_scaledown_desired" {
  type        = string
  description = ""
}

variable "jenkins_scaledown_recurrence" {
  type        = string
  description = ""
}

variable "jenkins_scaleup_desired" {
  type        = string
  description = ""
}

variable "jenkins_scaleup_recurrence" {
  type        = string
  description = ""
}

variable "mgmt_vpc_id" {
  type        = string
  description = ""
}

variable "prod_public_domain_name" {
  type        = string
  description = "The fully-qualified domain name for the Prod Public Hosted Zone, if undefined, no zone will be created"
  default     = ""
}

variable "prod_subdomains_name_servers" {
  type        = map(string)
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}


###########
# SonarQube
###########
variable "sonarqube_ami_build_id" {
  type        = string
  description = "Internal ID of the AMI to use - https://wiki.dvsacloud.uk/display/TSS/TARS+-+Base+AMI+Update"
}
variable "sonarqube_base_ami" {
  type        = string
  description = "Base AMI name to use - https://wiki.dvsacloud.uk/display/TSS/TARS+-+Non-App+Base+AMIs"
}

##
# ECR
##

##
# Trusted Principals for Pulling Docker Images
#
# We can merge this into master list of "managed accounts" when we have a better
# grip on what categories of permission delegation we can centralise
##

variable "ecr_repository_ro_principals" {
  type        = list(string)
  description = "The list of AWS Account IDs that we grant delegated read access to for Amazon ECR Repositories"
  default     = []
}

##
# Nexus
##

variable "nexus_config" {
  type        = map(string)
  description = "Map of parameters describing the configuration of the nexus microservice"
  default     = {}
}

variable "nexus_subnets_cidrs" {
  type        = list(string)
  description = "List of subnet CIDRs for nexus"
}

variable "nexus_efs_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for provisioning Nexus Master EFS Mount Target subnets"
  default     = []
}

/*
variable "nexus_ami_build_id" {
  type        = string
  description = ""
}
*/

variable "efs_backup_env" {
  type        = list(string)
  description = ""
  default     = []
}

variable "nexus_domain_name" {
  type        = string
  description = "Domain name for the Nexus Instance, if undefined, no zone will be created"
  default     = ""
}

##
# IAM
##

variable "users" {
  type        = list
  description = "List of IAM Users"
  default     = []
}

variable "administrators" {
  type        = list
  description = "List of IAM Users from the 'users' list with Admin rights"
  default     = []
}

variable "new_all_users" {
  type        = list
  description = "List of All IAM Users"
  default     = []
}

variable "administrators_tssops_users" {
  type        = list
  description = "List of administrator IAM Users for the TSSOps, that have Admin access"
  default     = []
}

variable "administrators_platform_users" {
  type        = list
  description = "List of administrator IAM Users for the Platform team, that have Admin access"
  default     = []
}

variable "administrators_platform_nonprod_users" {
  type        = list
  description = "List of administrator IAM Users for the Platform team, that have Admin access"
  default     = []
}

variable "readonly_tssops_users" {
  type        = list
  description = "List of RO IAM Users for TSSOps, that have RO access"
  default     = []
}

variable "readonly_platform_users" {
  type        = list
  description = "List of RO IAM Users for Platform Team, that have full RO access"
  default     = []
}

variable "readonly_developer_users" {
  type        = list
  description = "List of RO IAM Users for developers, that have RO access"
  default     = []
}

variable "readonly_appsupport_users" {
  type        = list
  description = "List of RO IAM Users for App Support, that have RO access"
  default     = []
}

variable "readonly_qaengineer_users" {
  type        = list
  description = "List of qaengineer IAM Users for testing, that have RO access"
  default     = []
}

variable "readonly_dvsa_users" {
  type        = list
  description = "List of dvsa IAM Users for POs, that have RO access"
  default     = []
}

variable "qaengineer_users" {
  type        = list
  description = "List of qaengineer IAM Users for testing, that have specific access"
  default     = []
}

variable "db_cw_users" {
  type        = list
  description = "List of DB CW Access IAM Users for Support functions, that have DB CW access"
  default     = []
}

variable "tss_cw_users" {
  type        = list
  description = "List of DB CW Access IAM Users for Support functions, that have TSS CW access"
  default     = []
}

variable "billing_users" {
  type        = list
  description = "List of billing IAM Users for Support functions, that have Billing access"
  default     = []
}

variable "readonly_no_secrets_nonprod_users" {
  type        = list
  description = "List of IAM Users, that have Non Prod RO no secrets access"
  default     = []
}

variable "rsis_tif_access_users" {
  type        = list
  description = "List of IAM Users, that have RSIS TIF bucket access"
  default     = []
}

variable "non_prod_jenkins_cidrs" {
  type        = list(string)
  description = "NonProd base cidr for jenkins access to Nexus"
  default     = []
}

variable "enable_bounced_email_report" {
  description = "Enable bounced email reporting or not"
  default     = "0"
}

variable "bounced_email_domain" {
  type        = string
  description = "bounced email idenity"
}

# Lambda Access Key Rotation
variable "lambda_access_key_rotation_config" {
  description = "Map of config information for lambda access_key_rotation"
  type        = map
}

variable "non_prod_ctrl_jenkins_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "opsgenie_endpoint" {
  type        = string
  description = "The opsgenie endpoint to send alerts to TSS"
}

variable "prep_public_domain_name" {
  type        = string
  description = "Prep Domain name"
}

variable "prep_domains_name_servers" {
  type        = map(string)
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}

variable "prod_public_dvsa_domain_name" {
  type        = string
  description = "Prod Domain name"
}

variable "prod_domains_name_servers" {
  type        = map(string)
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}
