##
# Variables relating to naming and structure
##

variable "project" {
  type        = "string"
  description = "The name of the project being deployed for"
}

variable "environment" {
  type        = "string"
  description = "The name of the environment being deployed in"
}

variable "component" {
  type        = "string"
  description = "The name of the component calling this module"
}

variable "default_tags" {
  type        = "map"
  description = "A map of default tags to apply to all taggable resources within the module"
}

variable "asg_default_tags" {
  type        = "list"
  description = "A map of default tags to apply to all taggable resources within the module"
}

variable "aws_account_id" {
  type        = "string"
  description = "The AWS Account ID (numeric)"
}

variable "region" {
  type        = "string"
  description = "The AWS Region"
}

variable "account_environment" {
  type        = "string"
  description = "The environment name for the account level scope for the account in which this component is deployed"
}

variable "lifecycle_hook_launching_default_result" {
  type    = "string"
  default = "CONTINUE"
}

variable "lifecycle_hook_launching_enabled" {
  type = "string"
}

variable "lifecycle_hook_launching_timeout" {
  type = "string"
}

variable "failed_lifecycle_action_sns_topic" {
  type = "string"
}

# This is only used in the account component to set the AWS Account Alias,
# however we also consume this here so that we can provide it to Amazon Linux instances
# as a custom facter fact for use in the Amazon Linux puppet and hiera code.
variable "aws_account_alias" {
  type        = "string"
  description = "The IAM AWS Account Alias for this AWS Account"
}

variable "squidnat_asg_size_desired_on_create_per_az" {
  type        = "string"
  description = ""
  default     = "1"
}

variable "squidnat_asg_size_min_per_az" {
  type        = "string"
  description = ""
  default     = "0"
}

variable "squidnat_asg_size_max_per_az" {
  type        = "string"
  description = ""
  default     = "1"
}

##
# CloudWatch logs
##

variable "cwl_names" {
  type        = "map"
  description = "List of log file names to create Cloudwatch Logs Log Groups for for this microservice"
  default     = { "101" = "empty"}
}

variable "cwl_retention_days" {
  type        = "string"
  description = "Retention period in days for Cloudwatch Logs Log Groups for microservices in this module"
}


##
# Module self-identification
##

variable "module" {
  type        = "string"
  description = "The name of this module. This is a special variable, it should be set only here and never overridden."
  default     = "squidnat"
}

variable "cloudwatch_policy_arn" {
  type = "string"
}

##
# KMS
##

variable "kms_hiera_user_policy_arn" {
  type = "string"
}

variable "hiera_kms_key_id" {
  type        = "string"
  description = "Variable that determines the kms key id for encryption"
}

##
# Amazon Linux Base AMI
##

variable "ami_id" {
  type        = "string"
  description = "AMI ID for Amazon Linux"
}

##
# Variables relating to function and resource parameters
##

variable "spot_price" {
  type        = "string"
  description = ""
  default     = ""
}

variable "additional_sg_ids" {
  type        = "list"
  description = "Additional security group ids to pass to the squidnat instances"
  default     = []
}

variable "egress_whitelist" {
  type        = "list"
  description = "List of CIDR blocks squidnat nodes may egress to for http and https protocols. Usually fine to default to 0.0.0.0/0"

  default = [
    "0.0.0.0/0",
  ]
}

variable "instance_type" {
  type        = "string"
  description = "Squid node instance size"
}

variable "root_domain_name" {
  type        = "string"
  description = "Root of the domain name"
}

variable "route_tables" {
  type        = "list"
  description = "The route table to attach to the squid nodes"
}

variable "subnets_cidrs" {
  type        = "list"
  description = "List of CIDR blocks to use for the subnets"
}

variable "vpc_id" {
  type        = "string"
  description = "The ID of the VPC"
}

variable "whitelist_cidrs" {
  type        = "list"
  description = "list of CIDR blocks that are allowed out to all sites via squid proxy"
}

variable "squid_bypass_cidrs" {
  type        = "list"
  description = "list of CIDR blocks that are not redirected though squid proxy"
}

variable "zone_id" {
  type        = "string"
  description = "Zone ID for the route53 zone"
}


