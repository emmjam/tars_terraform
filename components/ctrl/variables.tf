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

variable "ctrl_bastion_subnets" {
  type        = "list"
  description = ""
}

variable "whitelist" {
  type        = "list"
  description = ""
}

variable "public_domain_name" {
  type = "string"
  description = "public domain name for the hosted zone"
}

## Jenkinsctrl

variable "jenkinsctrl_ami_build_id" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_scaledown_desired" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "jenkinsctrl_scaledown_recurrence" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_executors" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_instance_type" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_asg_min_size" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_asg_max_size" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_scaleup_desired" {
  type = "string"
  description = ""
}

variable "jenkinsctrl_scaleup_recurrence" {
  type = "string"
  description = ""
}

variable "mgmt_aws_account_id" {
  type = "string"
  description = ""
}

## Bastion

variable "bastion_scaleup_desired" {
  type = "string"
  description = ""
}

variable "bastion_scaledown_desired" {
  type = "string"
  description = ""
}

variable "bastion_scaledown_recurrence" {
  type = "string"
  description = ""
}

variable "bastion_ami_build_id" {
  type = "string"
  description = ""
}

variable "bastion_asg_max_size" {
  type = "string"
  description = ""
}

variable "bastion_instance_type" {
  type = "string"
  description = ""
}

variable "bastion_asg_min_size" {
  type = "string"
  description = ""
}

variable "bastion_scaleup_recurrence" {
  type = "string"
  description = ""
}

variable "bastion_elb_subnets_cidrs" {
  type        = "list"
  description = ""
}


# Grafana

variable "grafana_ami_build_id" {
  type = "string"
  description = ""
}

variable "grafana_asg_max_size" {
  type = "string"
  description = ""
}

variable "grafana_instance_type" {
  type = "string"
  description = ""
}

variable "grafana_asg_min_size" {
  type = "string"
  description = ""
}

variable "grafana_scaleup_desired" {
  type = "string"
  description = ""
}

variable "grafana_scaledown_desired" {
  type = "string"
  description = ""
}

variable "grafana_scaledown_recurrence" {
  type = "string"
  description = ""
}

variable "grafana_scaleup_recurrence" {
  type = "string"
  description = ""
}

variable "grafana_alb_subnets_cidrs" {
  type        = "list"
  description = ""
}

variable "ctrl_grafana_subnets" {
  type        = "list"
  description = ""
}

variable "cert_name" {
  type = "string"
  description = "ACM cert name"
}