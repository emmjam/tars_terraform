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

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

# TODO: peacheym: This value is incorrect.
# It is not intentionally incorrect.
# However due to current pressures, it is intentional
# not to correct this at this time.
variable "component" {
  type        = string
  description = "TF Scaffold component"
  default     = "cpc"
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

variable "lc_spot_price" {
  type        = string
  description = "The price to use for reserving spot instances"
  default     = ""
}

variable "spot_pricing" {
  type        = map(string)
  description = "A map containing the the spot instance price (USD) for each instance type"
  default     = {}
}

variable "ami_build_id" {
  type        = string
  description = "AMI build ID"
  default = ""
}

variable "cpc_ami_id" {
  type        = string
  description = "CPC AMI build ID"
}

variable "aws_account_id" {
  type        = string
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type        = string
  description = ""
}

variable "cpc-batch_puppet_nodetype" {
  type        = string
  description = ""
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

variable "cpc-back_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "cpc_efs_subnets_cidrs" {
  type        = list(string)
  description = "CPC EFS subnets list"
  default     = []
}

variable "cpc_sftp_subnets_cidrs" {
  type        = list(string)
  description = ""
  default     = []
}

variable "dvla_elise_server" {
  type        = string
  description = "DVLA Elise"
}

variable "cpc-batch-efs-arn" {
  type    = string
  default = ""
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

variable "unhealthy_host_alarm_count" {
  type        = string
  description = "Number of alarms to have in this account"
  default = "0"
}
