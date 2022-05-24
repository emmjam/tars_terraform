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
  default     = "tars-messaging"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
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
    Component = "tars-messaging"
  }
}

variable "whitelist" {
  type        = list(string)
  description = "TARS Servers inbound whitelisted IP's"
  default     = []
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
  type = list(object({
    key                 = string
    value               = string
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

variable "lc_key_name" {
  type        = string
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "ami_build_id" {
  type        = string
  description = "TARS Messaging AMI build ID"
  default     = ""
}

variable "aws_account_id" {
  type        = string
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type        = string
  description = ""
}

variable "wildfly-messaging_asg_max_size" {
  type        = string
  description = ""
}

variable "wildfly-messaging_asg_min_size" {
  type        = string
  description = ""
}

variable "wildfly-messaging_instance_type" {
  type        = string
  description = ""
}

variable "wildfly-messaging_puppet_nodetype" {
  type        = string
  description = ""
}

variable "wildfly-messaging_scaleup_desired" {
  type        = string
  description = ""
}

variable "dvsa_dc_whitelist" {
  type        = list(string)
  description = "DVSA DC whitelist"
  default     = []
}

variable "dvsa_mgmt_inbound" {
  type        = string
  description = "DVSA mgmt servers inbound"
}

variable "dvsa_icmp_monitoring" {
  type        = list(string)
  description = "DVSA ICMP for Monitoring Messaging"
}

variable "dvsa_win_monitoring" {
  type        = list(string)
  description = "DVSA ports for Monitoring Messaging"
}

variable "cert_name" {
  type        = string
  description = "ACM cert name"
}

variable "dvsa_irdt_printers" {
  type        = string
  description = "IRDT Printer range"
}

variable "tars_pdf_cert" {
  type        = string
  description = "tars pdf cert subdomain"
}

variable "private_cert_domain_name" {
  type        = string
  description = "private tars cert root domain"
}

variable "dvsa_printers" {
  type        = list(string)
  description = "DVSA print servers"
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

variable "wms_host_alarm_count" {
  type        = string
  description = "Number of alarms to have in this account"
  default     = "0"
}

variable "wildfly_messaging_id" {
  type        = string
  description = "Messaging AMI build ID"
}

variable "cpu_utilization_threshold" {
  type        = string
  description = "Max CPU utilization threshold"
  default     = 99
}

variable "cpu_utilization_period" {
  type        = string
  description = "CPU utilization alarm period"
  default     = 60
}

variable "cpu_utilization_evaluation_periods" {
  type        = string
  description = "CPU utilization alarm evaluation periods"
  default     = 5
}

variable "messaging_print" {
  type        = string
  description = "Enable DVSA printers for messgaing"
}

variable "wildfly-messaging_ebs_vol" {
  type        = string
  description = "EBS Volumes size for messaging instances"
  default     = 50
}
