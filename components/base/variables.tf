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

variable "squidnat_subnets_cidrs" {
  type = "list"
  description = ""
}

variable "squidnat_instance_type" {
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

variable "transit_peering_enabled" {
  type        = "string"
  description = "Enable Transit VPC peering to West Malling"
  default     = false
}

variable "aws_account_id" {
  type        = "string"
  description = "Account ID"
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

## Jenkins

variable "jenkinsnode_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode subnet CIDR's"
}

variable "jenkins_nat_subnets_cidrs" {
  type        = "list"
  description = "Jenkinsnode NAT subnet CIDR's"
}

variable "jenkinsnode_ami_build_id" {
  type = "string"
  description = "Jenkinsnode AMI build nomber"
}

variable "jenkinsnode_executors" {
  type = "string"
  description = "executor count for jenkinsnodes"
}

variable "jenkinsnode_instance_type" {
  type = "string"
  description = "Jnekins instance size"
}

variable "jenkinsnode_asg_max_size" {
  type = "string"
  description = ""
}

variable "jenkinsnode_asg_min_size" {
  type = "string"
  description = ""
}

