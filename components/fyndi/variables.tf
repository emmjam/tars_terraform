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
  default     = "fyndi"
}

variable "whitelist" {
  type        = "list"
  description = ""
  default     = []
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
  default     = {}
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

  default = [
    "OldestInstance",
    "OldestLaunchConfiguration",
    "ClosestToNextInstanceHour",
  ]
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
  description = "FYNDI Front AMI build ID"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "mgmt_aws_account_id" {
  type        = "string"
  description = ""
}

variable "fyndi-f_asg_max_size" {
  type        = "string"
  description = ""
}

variable "fyndi-f_asg_min_size" {
  type        = "string"
  description = ""
}

variable "fyndi-f_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "fyndi-f_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "fyndi-f_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "fyndi-f_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "fyndi-f_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "fyndi-f_puppet_nodetype" {
  type        = "string"
  description = ""
}

variable "fyndi-f_instance_type" {
  type        = "string"
  description = ""
}

variable "fyndi-b_asg_max_size" {
  type        = "string"
  description = ""
}

variable "fyndi-b_asg_min_size" {
  type        = "string"
  description = ""
}

variable "fyndi-b_scaledown_desired" {
  type        = "string"
  description = ""
}

variable "fyndi-b_scaledown_recurrence" {
  type        = "string"
  description = ""
}

variable "fyndi-b_scaleup_desired" {
  type        = "string"
  description = ""
}

variable "fyndi-b_scaleup_recurrence" {
  type        = "string"
  description = ""
}

variable "fyndi-b_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "fyndi-b_puppet_nodetype" {
  type        = "string"
  description = ""
}

variable "fyndi-b_instance_type" {
  type        = "string"
  description = ""
}

variable "cert_name" {
  type        = "string"
  description = "ACM cert name"
}

variable "fyndi_cert" {
  type        = "string"
  description = "CPC ACM cert name"
}
