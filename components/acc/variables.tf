variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  type        = string
  description = ""
}

variable "project" {
  type        = string
  description = ""
}

variable "environment" {
  type        = string
  description = ""
}

variable "component" {
  type        = string
  description = ""
  default     = "acc"
}

variable "release_version" {
  type        = string
  default     = "Not provided"
  description = "Version of infrastructure deployed"
}

variable "default_tags" {
  type        = map(string)
  description = ""

  default = {
    Component = "acc"
  }
}

variable "aws_account_alias" {
  type        = string
  description = "The IAM AWS Account alias"
}

variable "whitelist" {
  type        = list(string)
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = string
  description = ""
}

variable "all_users" {
  type        = list(string)
  description = "List of IAM Users"
  default     = []
}

variable "administrators" {
  type        = list(string)
  description = "List of IAM Users from the 'users' list with Admin rights"
  default     = []
}

variable "power_users" {
  type        = list(string)
  description = "List of IAM Users from the 'users' list with Power Users rights"
  default     = []
}

variable "ops_users" {
  type        = list(string)
  description = "List of IAM Users who can assume Admin rights"
  default     = []
}

variable "public_domain_name" {
  type        = string
  description = "The fully-qualified domain name for the Public Hosted Zone, if undefined, no zone will be created"
  default     = ""
}

variable "subdomains_name_servers" {
  type        = map(string)
  description = "Map of accounts with NS records in a form: '<record_name> = <comma seperated list of NS addresses>'"
  default     = {}
}

variable "deployer_pub_key" {
  type        = string
  description = "Pub SSH ky for deployer"
}

variable "ops_team_email" {
  type        = string
  description = "Email for the ops team alerts"
}

variable "support_ro_users" {
  type        = list(string)
  description = "List of read-only IAM Users for Support functions, that have Read Only access"
  default     = []
}

variable "tss_billing_ro_users" {
  type        = list(string)
  description = "List of billing read-only IAM Users for Support functions, that have Read Only access and Billing Read Only"
  default     = []
}

variable "db_cw_ro_users" {
  type        = list(string)
  description = "List of DB users that have read only access to RDS CW metrics"
  default     = []
}

variable "billing_users" {
  type        = list(string)
  description = "List of billing IAM Users for Support functions, that have Billing access"
  default     = []
}

variable "guardduty_member_enabled" {
  type        = string
  description = "Controls if this account is a guardduty member acount"
}

variable "guardduty_master_enabled" {
  type        = string
  description = "Controls if this account is the guardduty master acount"
}

variable "guardduty_member_list" {
  type        = list(object({
    account_id = string
    email = string
  }))
  description = "Map of details of Guardduty member accounts for master account"
  default     = []
}

variable "dvsa_ro_users" {
  type        = list(string)
  description = "List of read-only IAM Users for the DVSA IMS, that have Read Only access"
  default     = []
}

variable "cloudfront_enabled" {
  type        = string
  description = "flag to trigger deployment of cloudfront for holding/maintenance pages"

  default = "0"
}

##
# Cloudability Cross Account Access
##

variable "cloudability_xacct" {
  type        = map
  description = "The information needed to permit cross account access from Cloudability. Requires aws_account_id and external_id"
  default     = {}
}
