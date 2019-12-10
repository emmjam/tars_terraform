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
  description = "TF Scaffold component"
  default     = "xe"
}

variable "release_version" {
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

variable "aws_account_id" {
  type        = "string"
  description = "AWS Account ID"
}

variable "default_tags" {
  type        = "map"
  description = "Default tags to use"

  default = {
    Component = "xe"
  }
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
}

variable "xe_ami_name" {
  type        = "string"
  description = ""
}
