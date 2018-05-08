##
# terraformscaffold key variables
##

variable "project" {
  type        = "string"
  description = "The name of the terraformscaffold project"
}

variable "environment" {
  type        = "string"
  description = "The name of the terraformscaffold environment"
}

variable "component" {
  type        = "string"
  description = "The name of the terraformscaffold component"
}

##
# Variables specific to this module
##

variable "aws_account_id" {
  type        = "string"
  description = "The AWS Account ID"
}

variable "es_domain_suffix" {
  type        = "string"
  description = "The naming suffix for the Elasticsearch Domain"
  default     = "cwl"
}

variable "es_cidr_whitelist" {
  type        = "list"
  description = "A list of CIDR blocks permitted to access the Elasticsearch Domain from the Internet"
  default     = []
}

variable "es_metric_alarm_actions" {
  type        = "list"
  description = "List of actions to provide to Elasticsearch's Cloudwatch Metric Alarms, e.g. SNS topics"
  default     = []
}

##
# Lambda Curator configuration
##

variable "curator_max_age" {
  type        = "string"
  description = "The maximum age of Elasticsearch indices before they are curated by the Curator lambda function"
  default     = "30"
}

variable "curator_excluded_indices" {
  type        = "string"
  description = "A comma separated list of Elasticsearch indices that are excluded from the curation process"
  default     = ".kibana,kibana-int"
}

##
# Elasticsearch Domain configuration
##

variable "data_instance_type" {
  type        = "string"
  description = "Instance type for Elasticsearch domain data nodes"
}

variable "data_instance_count" {
  type        = "string"
  description = "Number of Elasticsearch domain data nodes"
}

variable "data_volume_size" {
  type        = "string"
  description = "EBS GP2 volume size for each of the Elasticsearech domain data nodes"
}

variable "master_instance_type" {
  type        = "string"
  description = "Instance type for Elasticsearch domain master nodes"
}

variable "master_instance_count" {
  type        = "string"
  description = "Number of Elasticsearch domain master nodes"
}
