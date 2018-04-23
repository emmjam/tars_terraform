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
  default     = "tars-messaging"
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

  default = {
    Component = "tars-messaging"
  }
}

variable "whitelist" {
  type        = "list"
  description = "TARS Servers inbound whitelisted IP's"
  default     = []
}

variable "mq_console_whitelist" {
  type        = "list"
  description = "TARS AWS MQ console inbound whitelisted IP's"
  default     = []
}

variable "wildfly-messaging" {
  type        = "map"
  description = "TARS Messaging server config"
}

variable "aws_mq" {
  type        = "map"
  description = "TARS AWS MQ Service config"
}

variable "aws_mq_users" {
  type        = "map"
  description = "TARS AWS MQ Users"
}

variable "aws_mq_config" {
  type        = "map"
  description = "TARS AWS MQ Service config"
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

variable "lc_key_name" {
  type        = "string"
  description = "The key name that should be used for the instance"
  default     = ""
}

variable "ami_build_id" {
  type        = "string"
  description = "TARS Messaging AMI build ID"
}

variable "mgmt" {
  type        = "map"
  description = "MGMT Account config"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}