variable "aws_region" {
  type        = "string"
  description = "AWS Region"
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
  default     = "base"
}

variable "default_tags" {
  type        = "map"
  description = "Default tag map"

  default = {
    Component = "base"
  }
}

variable "vpc_cidr" {
  type        = "string"
  description = "VPC CIDR Range"
}

variable "private_domain_name" {
  type        = "string"
  description = "R53 Private Domain Name"
}

variable "jenkinsnode_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode subnet CIDR's"
}

variable "jenkins_nat_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode NAT subnet CIDR's"
}

variable "tars_backend_subnets_cidrs" {
  type        = "list"
  description = "TARS backend tier subnet CIDR's"
}

variable "tars_web_subnets_cidrs" {
  type        = "list"
  description = "TARS web tier subnet CIDR's"
}

variable "tars_messaging_subnets_cidrs" {
  type        = "list"
  description = "TARS messaging tier subnet CIDR's"
}

variable "awsmq_subnets_cidrs" {
  type        = "list"
  description = "AWS MQ Subnet CIDR's"
}

variable "alb_public_subnets_cidrs" {
  type        = "list"
  description = "TARS Public Facing ALB Subnet CIDR's"
}

variable "rds_subnets_cidrs" {
  type        = "list"
  description = "TARS RDS Subnet CIDR's"
}

variable "mgmt" {
  type        = "map"
  description = "MGMT Account Subnets"
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

variable "squidnat_subnets_cidrs" {
  type = "list"
  description = ""
}

variable "squidnat_instance_type" {
  type = "string"
  description = ""
}

variable "mgmt_component" {
  type = "string"
  description = ""
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = "TF State bucket prefix"
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

variable "jenkinsnode" {
  type        = "map"
  description = "Jenkinsnode configuration"
}

variable "transit_peering_enabled" {
  type        = "string"
  description = "Enable Transit VPC peering to West Malling"
  default     = false
}

variable "ctrl_mgmt" {
  type        = "map"
  description = "CTRL MGMT Account Subnets"
}

variable "ctrl_nonprod" {
  type        = "map"
  description = "CTRL Nonprod Account Subnets"
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
}
