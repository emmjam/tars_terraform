##
# Basic Required Variables for terraformscaffold Components
##

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "The terraformscaffold terraform state S3 bucket name"
}

variable "project" {
  type        = "string"
  description = "The terraformscaffold project"
}

variable "aws_account_id" {
  type        = "string"
  description = "The AWS Account ID (numeric)"
}

variable "region" {
  type        = "string"
  description = "The AWS Region"
}

variable "environment" {
  type        = "string"
  description = "The environment variables are being inherited from"
}

##
# terraformscaffold variables specific to this component
##

# This is the only primary variable to have its value defined as
# a default within its declaration in this file, because the variables
# purpose is as an identifier unique to this component, rather
# then to the environment from where all other variables come.
variable "component" {
  type        = "string"
  description = "The variable encapsulating the name of this component"
  default     = "base"
}

variable "default_tags" {
  type        = "map"
  description = "A map of default tags to apply to all taggable resources within the component"
  default     = {}
}

##
# Variables specific to the "base" Component
##

variable "vpc_cidr" {
  type        = "string"
  description = "The CIDR block for the primary VPC"
}


variable "oem_db_name" {
  type        = "string"
  description = "DB name for the mot replica DB"
  default     = "oem"
}

variable "rds_oem_subnets_cidrs" {
  type        = "list"
  description = "CIDRs for subnets for motdb RDS"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 Private Domain Name"
}

variable "whitelist" {
  type = "list"
}

