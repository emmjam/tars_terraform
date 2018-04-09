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
  default     = "ctrl"
}

variable "default_tags" {
  type        = "map"
  description = ""

  default = {
    Component = "ctrl"
  }
}

variable "tf_state_bucket_prefix" {
  type        = "string"
  description = ""
}

variable "private_domain_name" {
  type        = "string"
  description = ""
}

variable "ctrl_vpc_cidr" {
  type        = "string"
  description = ""
}

variable "ctrl_nat_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "mgmt" {
  type        = "map"
  description = ""
}

variable "mgmt_account_id" {
  type = "string"
}

variable "jenkinsctrl" {
  type        = "map"
  description = ""
}

variable "jenkinsctrl_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "bastion" {
  type        = "map"
  description = ""
}

variable "ctrl_bastion_subnets" {
  type        = "list"
  description = ""
}

variable "bastion_elb_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "bastion_whitelist" {
  type        = "list"
  description = ""
  default     = []
}
