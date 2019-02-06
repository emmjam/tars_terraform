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
  default     = "xenco"
}

variable "version" {
  type        = "string"
  default     = "Not provided"
  description = "Version of infrastructure deployed"
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

variable "private_domain_name" {
  type        = "string"
  description = "TARS VPC private R53 domain name"
}

variable "default_tags" {
  type        = "map"
  description = "Default tags"

  default = {
    Component = "xenco"
  }
}

variable "asg_default_tags" {
  type        = "list"
  description = "See code comments"
  default     = []
}

variable "xenco_whitelist" {
  type        = "list"
  description = "Xenco dev box inbound whitelisted IP's"
  default     = []
}

variable "xenco_subnets_cidrs" {
  type        = "list"
  description = "Xenco dev subnet CIDR's"
  default     = []
}

variable "xenco_lb_subnets_cidrs" {
  type        = "list"
  description = ""
  default     = []
}

variable "xenco_instance_type" {
  type        = "string"
  description = ""
}

variable "xenco_key_name" {
  type        = "string"
  description = ""
}

variable "xenco_asg_max_size" {
  type        = "string"
  description = ""
}

variable "xenco_asg_min_size" {
  type        = "string"
  description = ""
}

variable "mgmt_aws_account_id" {
  type        = "string"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}

variable "ami_build_id" {
  type        = "string"
  description = ""
}
