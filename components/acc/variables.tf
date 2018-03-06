variable "aws_region" {
  type        = "string"
  description = ""
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
  default     = "acc"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "acc"
  }
}

variable "aws_account_alias" {
  type        = "string"
  description = "The IAM AWS Account alias"
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = ""
}

variable "users" {
  type        = "list"
  description = "List of IAM Users"
  default     = []
}

variable "administrators" {
  type        = "list"
  description = "List of IAM Users from the 'users' list with Admin rights"
  default     = []
}

variable "power_users" {
  type        = "list"
  description = "List of IAM Users from the 'users' list with Power Users rights"
  default     = []
}

variable "public_domain_name" {
  type        = "string"
  description = "The fully-qualified domain name for the Public Hosted Zone, if undefined, no zone will be created"
  default     = ""
}

variable "subdomains_name_servers" {
  type        = "map"
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}
