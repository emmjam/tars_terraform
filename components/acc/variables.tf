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

variable "capita_perf_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users from Capita, that have rights to view CloudWatch events"
  default     = []
}

variable "capita_support_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users from Capita, that have Read Only access"
  default     = []
}

variable "logs_list" {
  type = "list"
  description = "List of log files to send to elasticsearch"
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

variable "ithc_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users for the ITHC, that have Read Only access"
  default     = []
}

variable "dvsa_ro_users" {
  type        = "list"
  description = "List of read-only IAM Users for the DVSA IMS, that have Read Only access"
  default     = []
}
##
#  EBS Snapshot Backup and Cleanup
##

# EBS Snapshot
variable "ebs_snapshot" {
  type        = "map"
  description = "Map of variables for configuring the EBS snapshot Lambda and associated resources"
  default     = {}
}

variable "ebs_snapshot_node_types" {
  type        = "list"
  description = "List of nodetypes to backup"
  default     = []
}

variable "ebs_snapshot_environments" {
  type        = "list"
  description = "List of environments in which ebs_snapshot_node_types will be backedup"
  default     = []
}

# EBS Snapshot Cleanup
variable "ebs_snapshot_cleanup" {
  type        = "map"
  description = "Map of variables for configuring the EBS snapshot cleanup Lambda and associated resources"
  default     = {}
}

##
# SNS Alert Integration
##

variable "alerts_sns_topic_external_subscribers" {
  type        = "list"
  description = "A list of maps of subscriptions to create to the alerts sns topic. Maps contain protocol and endpoint. Only for external subscribers that are not terraform-defined or data-source supported"
  default     = []
}

# Lambda Cloudwatch Slack
##

variable "lambda_cloudwatch_slack_config" {
  type        = "map"
  description = "Map of config information for Lambda Cloudwatch Slack"
  default     = {}
}

## Mgmt

variable "mgmt_component" {
  type = "string"
  description = ""
}

variable "mgmt_vpc_cidr_block" {
  type = "string"
  description = "CIDR Block range of MGMT account/comp"
}

variable "mgmt_jenkins_elb_subnet" {
  type = "string"
  description = "Jenkins Master subnet"
}

variable "mgmt_vpc_id" {
  type = "string"
  description = "MGMT account vpc cidr"
}

variable "mgmt_gitlab_subnet" {
  type = "string"
  description = "MGMT gitlab subent cidr"
}

variable "mgmt_aws_region" {
  type = "string"
  description = ""
}

variable "mgmt_aws_account_id" {
  type = "string"
  description = ""
}

variable "mgmt_project" {
  type = "string"
  description = ""
}

variable "mgmt_environment" {
  type = "string"
  description = ""
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

