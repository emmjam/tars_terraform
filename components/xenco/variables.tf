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
    Component = "xenco"
  }
}

variable "xenco_whitelist" {
  type        = "list"
  description = "Xenco dev box inbound whitelisted IP's"
  default     = []
}

variable "xenconode" {
  type        = "map"
  description = "Xenco dev server config"
}

variable "xenco_subnets_cidrs" {
  type        = "list"
  description = "Xenco dev subnet CIDR's"
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}