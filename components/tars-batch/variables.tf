variable "aws_region" {
  type        = string
  description = "eu-west-1"
}

variable "project" {
  type        = string
  description = "TF Scaffold project"
}

variable "environment" {
  type        = string
  description = "TF Scaffold environment"
}

variable "component" {
  type        = string
  description = "TF Scaffold component"
  default     = "tars-batch"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "rhel_spot_pricing" {
  type        = map(string)
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "aws_autoscaling_enabled" {
  type        = string
  default     = "1"
  description = "Enable or not the built in AWS autocaling scaling group scheduled actions"
}

variable "account_component_name" {
  type        = string
  description = "The name of the account-level component as used in remote state"
  default     = "acc"
}

variable "account_environment" {
  type        = string
  description = "The environment name for the account level scope for the account in which this component is deployed"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags"

  default = {
    Component = "tars-batch"
  }
}

variable "tf_state_bucket_prefix" {
  type        = string
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = string
  description = "TARS VPC private R53 domain name"
}

variable "asg_termination_policies" {
  type        = list(string)
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"

  default = [
    "OldestInstance",
    "OldestLaunchConfiguration",
    "ClosestToNextInstanceHour",
  ]
}

variable "asg_enabled_metrics" {
  type        = list(string)
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
  type        = list(object({
    key = string
    value = string
    propagate_at_launch = string
  }))
  description = "See code comments"
  default     = []
}

variable "ami_build_id" {
  type        = string
  description = "AMI build ID"
  default = ""
}

variable "tars_ami_id" {
  type        = string
  description = "TARS AMI build ID"
}

variable "aws_account_id" {
  type        = string
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
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

variable "batch_efs_subnets_cidrs" {
  type        = list(string)
  description = "Batch EFS subnets list"
  default     = []
}

variable "cert_name" {
  type        = string
  description = "ACM cert name"
}

variable "avarto_sftp_server" {
  type        = string
  description = "Avarto"
}

variable "avarto_aws_sftp_server" {
  type        = string
  description = "Avarto AWS"
}

variable "sweda_samba_server" {
  type        = string
  description = "Sweda"
}

variable "dvla_adli_server" {
  type        = string
  description = "ADLI"
}

variable "rsis_samba_server_archive" {
  type        = string
  description = "RSIS"
}

variable "dvsa_ldap_server" {
  type        = string
  description = "DVSA LDAP server for priter lookup"
}

variable "dvsa_dns_servers" {
  type        = list(string)
  description = "DVSA Azure DNS Servers"
  default     = []
}

variable "efs_backup_env" {
  type        = list(string)
  description = ""
  default     = []
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

variable "opsgenie_endpoint" {
  type        = string
  description = "The opsgenie endpoint to send alerts to TSS"
}

variable "sftpplus_client_log_group_name" {
  type        = string
  description = "Log group name for SFTPPlus-client"
}

variable "sftpplus_alarm_count" {
  type        = string
  description = "Number of alarms to have in this account"
}

variable "sftpplus_topic_count" {
  type        = string
  description = "Number of topics to have in this account"
}

variable "lc_spot_price" {
  type        = string
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "lc_key_name" {
  type        = string
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "rsisbucket_env" {
  type        = list(string)
  description = ""
  default     = []
}

variable "unhealthy_host_alarm_count" {
  type        = string
  description = "Number of alarms to have in this account"
  default = "0"
}

variable "ftts_elig_port" {
  type        = string
  description = "Port for FTTS eligibility instance"
}

variable "domain_name" {
  type        = string
  description = "TARS VPC private R53 domain name"
}

variable "dbu_maxrecordsprocessed" {
  type        = string
  description = "DocumentBatchUpdate - maximum records processed in the Job Polling"
}