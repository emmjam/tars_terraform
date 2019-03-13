variable "aws_account_id" {
  type = "string"
}

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

variable "version" {
  type        = "string"
  default     = "Not provided"
  description = "Version of infrastructure deployed"
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

variable "whitelist" {
  type        = "list"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = ""
}

variable "all_users" {
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

variable "ops_users" {
  type        = "list"
  description = "List of IAM Users who can assume Admin rights"
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

variable "deployer_pub_key" {
  type        = "string"
  description = "Pub SSH ky for deployer"
}

variable "ops_team_email" {
  type        = "string"
  description = "Email for the ops team alerts"
}

variable "capita_users" {
  type        = "list"
  description = "List of IAM Users from Capita, that have rights to manage events/monitoring from Messaging server"
  default     = []
}

variable "capita_archive_users" {
  type        = "list"
  description = "List of IAM Users from Capita, that have rights to manage the S3 Legacy Tape Archive"
  default     = []
}

variable "capita_perf_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users from Capita, that have rights to view CloudWatch events"
  default     = []
}

variable "support_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users for Support functions, that have Read Only access"
  default     = []
}

variable "tss_billing_ro_users" {
  type        = "list"
  description = "List of billing read-only IAM Users for Support functions, that have Read Only access and Billing Read Only"
  default     = []
}

variable "billing_ro_users" {
  type        = "list"
  description = "List of billing read-only IAM Users for Support functions, that have Billing Read Only access"
  default     = []
}

# CWLES - CloudWatch Logs to Elasticsearch

variable "cwles_curator_max_age" {
  type        = "string"
  description = "The maximum age of an index in days before it's pruned by curator"
  default     = "30"                                                                # This is the module's default also
}

variable "cwles_data_instance_type" {
  type        = "string"
  description = "Instance type for Elasticsearch domain data nodes"
}

variable "cwles_data_instance_count" {
  type        = "string"
  description = "Number of Elasticsearch domain data nodes"
}

variable "cwles_data_volume_size" {
  type        = "string"
  description = "EBS GP2 volume size for each of the Elasticsearech domain data nodes"
}

variable "cwles_master_instance_type" {
  type        = "string"
  description = "Instance type for Elasticsearch domain master nodes"
}

variable "cwles_master_instance_count" {
  type        = "string"
  description = "Number of Elasticsearch domain master nodes"
}

variable "guardduty_member_enabled" {
  type        = "string"
  description = "Controls if this account is a guardduty member acount"
}

variable "guardduty_master_enabled" {
  type        = "string"
  description = "Controls if this account is the guardduty master acount"
}

variable "guardduty_member_list" {
  type        = "list"
  description = "Map of details of Guardduty member accounts for master account"
  default     = []
}

variable "dvsa_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users for the DVSA IMS, that have Read Only access"
  default     = []
}
