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
  description = ""
  default     = "tars"
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
  description = ""

  default = {
    Component = "tars"
  }
}

variable "tars_core_whitelist" {
  type        = "list"
  description = ""
  default     = []
}

variable "wildfly-batch" {
  type        = "map"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "private_domain_name" {
  type        = "string"
  description = ""
}

variable "backend_subnets_cidrs" {
  type        = "list"
  description = ""
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

variable "lc_key_name" {
  type        = "string"
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "mgmt_bastion_subnets" {
  type        = "list"
  description = ""
  default     = []
}

variable "ami_build_id" {
  type        = "string"
  description = ""
}

variable "mgmt" {
  type        = "map"
  description = ""
}
